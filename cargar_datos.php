<?php

	class cargar_datos{

		private $arrErr=array();
		private $preview='';

		private $arrTablasIds=array();
		private $dimHorizontalIds=array();

		public $valoresPermitidosMarca=array(
			'X',
			'Si',
			'Sí',
			'1',
		);

		public function __construct(){
			foreach ($this->valoresPermitidosMarca as $key => $value) {
				$this->valoresPermitidosMarca[$key]=strtoupper(trim($value));
			}
		}

		private function funcionUtf8($v){
			return utf8_decode($v);
		}

		private function encontrarId($lnk,$tabla,$colId,$colCod,$valor){
			if (isset($this->arrTablasIds[$tabla][$valor])) {
				$nValue=$this->arrTablasIds[$tabla][$valor];
			}
			else{
				$res=mysqli_query($lnk,"SELECT $colId
					FROM $tabla
					WHERE $colCod='" . $this->funcionUtf8($valor) . "'") or die(mysqli_error($lnk));
				$reg=mysqli_fetch_assoc($res);
				if(isset($reg[$colId])){
					$nValue=$reg[$colId];
					$this->arrTablasIds[$tabla][$valor]=$nValue;
				}
				else{
					$err="No se encontró el registro correspondiente en \"$tabla\" ($valor)";
					$this->arrErr[]=$err;
					error_log($err);
					$nValue=false;
				}
			}
			return $nValue;
		}

		private function generarPreview($configHoja,$sheetArr){
			$previewTable='<table>';
			$previewTable.='<tr>';
			foreach ($configHoja as $value) {
				if(!isset($value['valorFijo'])){
					$previewTable.='<th>' . ($value['dimensionVertHuman']?$value['dimensionVertHuman']:
						($value['dimensionHorizHuman']?$value['dimensionHorizHuman']:
						($value['columnaHuman']?$value['columnaHuman']:$value['columna']))) . '</th>';
				}
			}
			$previewTable.='</tr>';
			foreach ($sheetArr as $fila) {
				$previewTable.='<tr>';
				foreach ($fila as $columna) {
					$previewTable.='<td>' . $columna . '</td>';
				}
				$previewTable.='</tr>';
			}
			$previewTable.='</table>';
			$this->preview=$previewTable;
		}

		public function getArrErr(){
			return $this->arrErr;
		}

		public function getPreview(){
			return $this->preview;
		}

		public function cargarListado($sheet,$tablaDestino,$tablaDestinoKey,$configHoja,$hacerUpdate=true,$permitirDuplicados=false,$preview=false){

			require_once('parts-admin/conexion.php');
			$lnk=database_connect();

			if($permitirDuplicados==false){
				$this->datosCargados[$tablaDestino]=array();
			}

			$sheetArr=array();
			foreach ($sheet->getRowIterator() as $row){
				$cellIterator = $row->getCellIterator();
				$cellIterator->setIterateOnlyExistingCells(false);
				$rowErr=false;
				$arrSql=$colsFila=$valuesFila=$rowArr=array();
				foreach ($cellIterator as $cell){
					$nValue='';
					if (!is_null($cell)){
						$col=$cell->getColumn();
						$row=$cell->getRow();
						$value=$cell->getCalculatedValue();

						if ($row==1) {
							break;
						}
						else{
							if (isset($configHoja[$col])){
								if($configHoja[$col]['columna']!=''){
									$rowArr[$configHoja[$col]['columna']]=$value;
								}
								elseif($configHoja[$col]['tablaHija']!=''){
									$rowArr[$configHoja[$col]['tablaHija']]=$value;
								}
								if (isset($configHoja[$col]['columna'])){
									if(!isset($configHoja[$col]['tablaFk'])){
										if(isset($configHoja[$col]['arrConvertir'])){
											$value=$configHoja[$col]['arrConvertir'][$value];
										}
										$nValue=$value;
										if($configHoja[$col]['comilla']==true){
											$nValue="\"" . trim(str_replace('"','\'',$value)) . "\"";
										}
									}
									elseif(isset($configHoja[$col]['tablaFk'])){
										$id=(isset($configHoja[$col]['columnaFkId'])?
											$configHoja[$col]['columnaFkId']:
											$configHoja[$col]['columna']);
										$tabla=$configHoja[$col]['tablaFk'];
										$cod=$configHoja[$col]['columnaFkCod'];
										$nValue=$this->encontrarId($lnk,$tabla,$id,$cod,$value);
										if ($nValue===false) {
											$rowErr=true;
										}
										else{
											$rowArr[$configHoja[$col]['columna']]=$value;
										}
									}
									$colsFila[]=$configHoja[$col]['columna'];
									$valuesFila[$configHoja[$col]['columna']]=$this->funcionUtf8($nValue);
								}
								elseif (isset($configHoja[$col]['tablaHija'])){
									$ids=explode(',',$value);
									foreach ($ids as $k => $v) {
										$ids[$k]="'$v'";
									}
									$ids=implode(',', $ids);
									if(!$preview){
										foreach ($configHoja[$col]['sql'] as $sql) {
											$arrSql[]=str_replace('{pk}',$valuesFila[$tablaDestinoKey],str_replace('{ids}',$ids,$sql));
										}
									}
									reset($configHoja[$col]['sql']);
								}
								elseif (isset($configHoja[$col]['valorFijo'])){
									$colsFila[]=$configHoja[$col]['valorFijoColumna'];
									$valuesFila[$configHoja[$col]['valorFijoColumna']]=$configHoja[$col]['valorFijo'];
								}
							}
							elseif($rowErr==false){
								if($permitirDuplicados==false){
									if($valuesFila[$tablaDestinoKey]!='' && in_array($valuesFila[$tablaDestinoKey], $this->datosCargados[$tablaDestino])){
										$err='Registro repetido: ' . $rowArr[$tablaDestinoKey];
										$this->arrErr[]=$err;
										error_log($err);
										break;
									}
								}

								if($hacerUpdate){
									$res=mysqli_query($lnk,"SELECT IF(
										EXISTS(
											SELECT 1
											FROM $tablaDestino
											WHERE $tablaDestinoKey=$valuesFila[$tablaDestinoKey]
										),'S','N') AS EXISTE") or die(mysqli_error($lnk));
									$reg=mysqli_fetch_assoc($res);
								}
								else{
									$reg['EXISTE']='N';
								}

								if($permitirDuplicados==false){
									$this->datosCargados[$tablaDestino][]=$valuesFila[$tablaDestinoKey];
								}

								if($reg['EXISTE']=='N'){
									$colsIns=implode(', ', $colsFila);
									$valsIns=implode(', ', $valuesFila);
									if(!$preview){
										mysqli_query($lnk,"INSERT INTO $tablaDestino ($colsIns)
											VALUES ($valsIns)") or die(mysqli_error($lnk));
									}
								}
								else{
									$colsSet=array();
									foreach ($valuesFila as $kf => $vf) {
										$colsSet[]="$kf=$vf";
									}
									$colsSet=implode(', ', $colsSet);
									if(!$preview){
										mysqli_query($lnk,"UPDATE $tablaDestino
											SET $colsSet
											WHERE $tablaDestinoKey=$valuesFila[$tablaDestinoKey]") or die(mysqli_error($lnk));
									}
								}
								foreach ($arrSql as $sql) {
									mysqli_query($lnk,$sql) or die(mysqli_error($lnk));
								}
								break;
							}
						}

					}
				}
				$sheetArr[]=$rowArr;
			}

			if($preview){
				$this->generarPreview($configHoja,$sheetArr);
			}

			if(count($this->arrErr)>0){
				$estado=false;
			}
			else{
				$estado=true;
			}
			return array(
				'estado' => $estado,
				'preliminar' => $this->preview,
				'errores' => implode('<br />', array_unique($this->arrErr)),
			);

		}

		public function cargarMatrizDimensiones($sheet,$tablaDestino,$tablaDestinoKey,$configHoja,$preview){

			require_once('parts-admin/conexion.php');
			$lnk=database_connect();

			$sheetArr=array();
			$idTablaDestino=-1;
			foreach ($sheet->getRowIterator() as $row){
				$cellIterator = $row->getCellIterator();
				$cellIterator->setIterateOnlyExistingCells(false);
				$rowErr=false;
				$arrSql=$colsFila=$valuesFila=$rowArr=array();
				foreach ($cellIterator as $cell){
					$nValue='';
					if (!is_null($cell)){
						$col=$cell->getColumn();
						$row=$cell->getRow();
						$value=$cell->getCalculatedValue();

						if ($row==1) {
							if (isset($configHoja[$col]['dimensionHoriz'])) {
								foreach ($configHoja as $keyCol => $confCol) {
									if($keyCol==$col){
										$id=$confCol['dimensionHorizId'];
										$tabla=$confCol['dimensionHoriz'];
										$cod=$confCol['dimensionHorizCod'];
										$nValue=$this->encontrarId($lnk,$tabla,$id,$cod,$value);
										if ($nValue===false) {
											$rowErr=true;
										}
										$configHoja[$keyCol]['dimensionHorizHuman']=$value;
										$this->dimHorizontalIds[$col]=$nValue;
										break;
									}
								}
								reset($configHoja);
							}
						}
						else{
							if (isset($configHoja[$col])){
								if($configHoja[$col]['dimensionHoriz']!=''){
									$rowArr[$configHoja[$col]['dimensionHorizHuman']]=$value;
								}
								elseif($configHoja[$col]['dimensionVert']!=''){
									$rowArr[$configHoja[$col]['dimensionVert']]=$value;
								}
								if (isset($configHoja[$col]['dimensionVert'])) {
									$tabla=$configHoja[$col]['dimensionVert'];
									$id=$configHoja[$col]['dimensionVertId'];
									$cod=$configHoja[$col]['dimensionVertCod'];
									$nValue=$this->encontrarId($lnk,$tabla,$id,$cod,$value);
									if ($nValue===false) {
										$rowErr=true;
									}
									else{
										$colsFila[]=$id;
										$valuesFila[]=$nValue;
										if($id==$tablaDestinoKey){
											$idTablaDestino=$nValue;
										}
									}
								}
								elseif (isset($configHoja[$col]['dimensionHoriz'])) {
									if(in_array(strtoupper(trim($value)), $this->valoresPermitidosMarca)){
										$colsFilaTmp=$colsFila;
										$valuesFilaTmp=$valuesFila;
										$colsFilaTmp[]=$configHoja[$col]['dimensionHorizId'];
										$valuesFilaTmp[]=$this->dimHorizontalIds[$col];
										$colsIns=implode(', ', $colsFilaTmp);
										$valsIns=implode(', ', $valuesFilaTmp);
										if(!$preview){
											$arrSql[]="INSERT INTO $tablaDestino ($colsIns)
												VALUES ($valsIns)";
										}
									}
								}
							}
							elseif($rowErr==false){
								if($idTablaDestino!=$idTablaDestinoAnt){
									if(!$preview){
										mysqli_query($lnk,"DELETE FROM $tablaDestino
											WHERE $tablaDestinoKey=$idTablaDestino") or die(mysqli_error($lnk));
									}
								}
								foreach ($arrSql as $sql) {
									mysqli_query($lnk,$sql) or die(mysqli_error($lnk));
								}
								$idTablaDestinoAnt=$idTablaDestino;
								break;
							}
						}
					}
				}
				$sheetArr[]=$rowArr;
			}

			if($preview){
				$this->generarPreview($configHoja,$sheetArr);
			}

			if(count($this->arrErr)>0){
				$estado=false;
			}
			else{
				$estado=true;
			}
			return array(
				'estado' => $estado,
				'preliminar' => $this->preview,
				'errores' => implode('<br />', array_unique($this->arrErr)),
			);

		}

	}
?>