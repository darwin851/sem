<?php

	class cargar_datos{

		private $arrErr=array();

		public function cargarListado($sheet,$tablaDestino,$tablaDestinoPk,$configTablaDestino){

			include('parts-admin/conexion.php');
			$lnk=database_connect();

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
							if (isset($configTablaDestino[$col])){
								if (isset($configTablaDestino[$col]['columna'])){
									if(!isset($configTablaDestino[$col]['tablaFk'])){
										$nValue=$value;
										if($configTablaDestino[$col]['comilla']==true){
											$nValue="\"" . trim(str_replace('"','\'',$value)) . "\"";
										}
									}
									elseif(isset($configTablaDestino[$col]['tablaFk'])){
										$id=($configTablaDestino[$col]['columnaFkId']?
											$configTablaDestino[$col]['columnaFkId']:
											$configTablaDestino[$col]['columna']);
										$tabla=$configTablaDestino[$col]['tablaFk'];
										$cod=$configTablaDestino[$col]['columnaFkCod'];
										$res=mysqli_query($lnk,"SELECT $id
											FROM $tabla
											WHERE $cod='$value'") or die(mysqli_error($lnk));
										$reg=mysqli_fetch_assoc($res);
										if(isset($reg[$id])){
											$nValue=$reg[$id];
										}
										else{
											$rowErr=true;
											$textoFk=(isset($configTablaDestino[$col]['textoFk'])?
												$configTablaDestino[$col]['textoFk']:
												$configTablaDestino[$col]['columna']);
											$err="- No se encontró el $textoFk correspondiente ($value)";
											$this->arrErr[]=$err;
											error_log($err);
										}
									}
									$colsFila[]=$configTablaDestino[$col]['columna'];
									$valuesFila[$configTablaDestino[$col]['columna']]=$nValue;
								}
								elseif (isset($configTablaDestino[$col]['tablaHija'])){
									$ids=explode(',',$value);
									foreach ($ids as $k => $v) {
										$ids[$k]="'$v'";
									}
									$ids=implode(',', $ids);
									foreach ($configTablaDestino[$col]['sql'] as $sql) {
										$arrSql[]=str_replace('{pk}',$valuesFila[$tablaDestinoPk],str_replace('{ids}',$ids,$sql));
									}
									reset($configTablaDestino[$col]['sql']);
								}
							}
							elseif($rowErr==false){
								$res=mysqli_query($lnk,"SELECT IF(
									EXISTS(
										SELECT 1
										FROM $tablaDestino
										WHERE $tablaDestinoPk=$valuesFila[$tablaDestinoPk]
									),'S','N') AS EXISTE") or die(mysqli_error($lnk));
								$reg=mysqli_fetch_assoc($res);
								if($reg['EXISTE']=='N'){
									$colsIns=implode(', ', $colsFila);
									$valsIns=implode(', ', $valuesFila);
									mysqli_query($lnk,"INSERT INTO $tablaDestino ($colsIns)
										VALUES ($valsIns)") or die(mysqli_error($lnk));
								}
								else{
									$colsSet=array();
									foreach ($valuesFila as $key => $value) {
										$colsSet[]="$key=$value";
									}
									$colsSet=implode(', ', $colsSet);
									mysqli_query($lnk,"UPDATE $tablaDestino
										SET $colsSet
										WHERE $tablaDestinoPk=$valuesFila[$tablaDestinoPk]") or die(mysqli_error($lnk));
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

	}
?>