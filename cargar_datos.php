<?php

	class cargar_datos{

		private $arrErr=array();

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

		public function cargarListado($sheet,$tablaDestino,$tablaDestinoKey,$configHoja,$hacerUpdate=true,$permitirDuplicados=false){

			require_once('parts-admin/conexion.php');
			$lnk=database_connect();

			if($permitirDuplicados==false){
				$this->datosCargados[$tablaDestino]=array();
			}

			foreach ($sheet->getRowIterator() as $row){
				$cellIterator = $row->getCellIterator();
				$cellIterator->setIterateOnlyExistingCells(false);
				$rowErr=false;
				$arrSql=$colsFila=$valuesFila=array();
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
									foreach ($configHoja[$col]['sql'] as $sql) {
										$arrSql[]=str_replace('{pk}',$valuesFila[$tablaDestinoKey],str_replace('{ids}',$ids,$sql));
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
										$err="Registro repetido \"$tablaDestino\" (" . $valuesFila[$tablaDestinoKey] . ")";
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
									mysqli_query($lnk,"INSERT INTO $tablaDestino ($colsIns)
										VALUES ($valsIns)") or die(mysqli_error($lnk));
								}
								else{
									$colsSet=array();
									foreach ($valuesFila as $kf => $vf) {
										$colsSet[]="$kf=$vf";
									}
									$colsSet=implode(', ', $colsSet);
									mysqli_query($lnk,"UPDATE $tablaDestino
										SET $colsSet
										WHERE $tablaDestinoKey=$valuesFila[$tablaDestinoKey]") or die(mysqli_error($lnk));
								}
								foreach ($arrSql as $sql) {
									mysqli_query($lnk,$sql) or die(mysqli_error($lnk));
								}
								break;
							}
						}

					}
				}
			}

			if(count($this->arrErr)>0){
				return false;
			}
			return true;

		}

		public function cargarMatrizDimensiones($sheet,$tablaDestino,$tablaDestinoKey,$configHoja){

			require_once('parts-admin/conexion.php');
			$lnk=database_connect();

			$idTablaDestino=-1;
			foreach ($sheet->getRowIterator() as $row){
				$cellIterator = $row->getCellIterator();
				$cellIterator->setIterateOnlyExistingCells(false);
				$rowErr=false;
				$arrSql=$colsFila=$valuesFila=array();
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
										$this->dimHorizontalIds[$col]=$nValue;
										break;
									}
								}
								reset($configHoja);
							}
						}
						else{
							if (isset($configHoja[$col])){
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
										$arrSql[]="INSERT INTO $tablaDestino ($colsIns)
											VALUES ($valsIns)";
									}
								}
							}
							elseif($rowErr==false){
								if($idTablaDestino!=$idTablaDestinoAnt){
									mysqli_query($lnk,"DELETE FROM $tablaDestino
										WHERE $tablaDestinoKey=$idTablaDestino") or die(mysqli_error($lnk));
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
			}

			if(count($this->arrErr)>0){
				return false;
			}
			return true;

		}

	}
?>