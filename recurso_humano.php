<?php

	use PhpOffice\PhpSpreadsheet\IOFactory;

	class recurso_humano{

		private $arrErr=array();

		public function cargarArchivoRecursoHumano($nbrArchivo){

			require 'vendor/autoload.php';
			include('parts-admin/conexion.php');
			$lnk=database_connect();

			$inputFileName = $nbrArchivo;
			$reader = IOFactory::createReader('Xlsx');
			$spreadsheet = $reader->load($inputFileName);

			$spreadsheet->setActiveSheetIndex(0);
			$sheet = $spreadsheet->getActiveSheet();




			$tablaDestino='recurso_humano';
			$tablaDestinoPk='DOCUMENTO_IDENTIFICACION';
			$configTablaDestino=array(
				'A' => array(
					'columna' => 'DOCUMENTO_IDENTIFICACION',
					'comilla' => true,
				),
				'B' => array(
					'columna' => 'NOMBRES',
					'comilla' => true,
				),
				'C' => array(
					'columna' => 'APELLIDOS',
					'comilla' => true,
				),
				'D' => array(
					'columna' => 'DIRECCION',
					'comilla' => true,
				),
				'E' => array(
					'columna' => 'ID_CENTRO_EDUCATIVO',
					'comilla' => false,
					'tablaFk' => 'centro_educativo',
					'columnaFkCod' => 'COD_CENTRO_EDUCATIVO',
				),
				'F' => array(
					'columna' => 'TELEFONO',
					'comilla' => true,
				),
				'G' => array(
					'columna' => 'CELULAR',
					'comilla' => true,
				),
				'H' => array(
					'columna' => 'CORREO_ELECTRONICO',
					'comilla' => true,
				),
				'I' => array(
					'columna' => 'GENERO',
					'comilla' => true,
				),
				'J' => array(
					'columna' => 'TITULO_ACADEMICO',
					'comilla' => true,
				),
				'K' => array(
					'columna' => 'ID_MUNICIPIO_RESIDENCIA',
					'comilla' => false,
					'tablaFk' => 'municipio',
					'columnaFkCod' => 'COD_MUNICIPIO',
					'columnaFkId' => 'ID_MUNICIPIO',
				),
				'L' => array(
					'multiple' => true,
				),
				'M' => array(
					'multiple' => true,
				),
			);

			foreach ($sheet->getRowIterator() as $row){
				$cellIterator = $row->getCellIterator();
				$cellIterator->setIterateOnlyExistingCells(false);
				$rowErr=false;
				$colsFila=$valuesFila=array();
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
										WHERE $tablaDestinoPk=$valuesFila[$tablaDestinoPk]");
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

	$rh = new recurso_humano();
	$rh->cargarArchivoRecursoHumano('/tmp/cargaDeDatos.xlsx');
?>