<?php

	use PhpOffice\PhpSpreadsheet\IOFactory;

	class recurso_humano{

		private $arrErr=array();

		public function cargarArchivoRecursoHumano($nbrArchivo,$preview){

			require_once 'vendor/autoload.php';
			require_once 'cargar_datos.php';

			$inputFileName = $nbrArchivo;
			$reader = IOFactory::createReader('Xlsx');
			$spreadsheet = $reader->load($inputFileName);

			$spreadsheet->setActiveSheetIndex(0);
			$sheet = $spreadsheet->getActiveSheet();

			$tablaDestino='recurso_humano';
			$tablaDestinoKey='DOCUMENTO_IDENTIFICACION';
			$configHoja=array(
				'A' => array(
					'columna' => 'DOCUMENTO_IDENTIFICACION',
					'columnaHuman' => 'Documento',
					'comilla' => true,
				),
				'B' => array(
					'columna' => 'NOMBRES',
					'columnaHuman' => 'Nombres',
					'comilla' => true,
				),
				'C' => array(
					'columna' => 'APELLIDOS',
					'columnaHuman' => 'Apellidos',
					'comilla' => true,
				),
				'D' => array(
					'columna' => 'DIRECCION',
					'columnaHuman' => 'Dirección',
					'comilla' => true,
				),
				'E' => array(
					'columna' => 'ID_CENTRO_EDUCATIVO',
					'columnaHuman' => 'Centro educativo',
					'comilla' => false,
					'tablaFk' => 'centro_educativo',
					'columnaFkCod' => 'COD_CENTRO_EDUCATIVO',
				),
				'F' => array(
					'columna' => 'TELEFONO',
					'columnaHuman' => 'Teléfono',
					'comilla' => true,
				),
				'G' => array(
					'columna' => 'CELULAR',
					'columnaHuman' => 'Celular',
					'comilla' => true,
				),
				'H' => array(
					'columna' => 'CORREO_ELECTRONICO',
					'columnaHuman' => 'Correo electrónico',
					'comilla' => true,
				),
				'I' => array(
					'columna' => 'GENERO',
					'columnaHuman' => 'Género',
					'comilla' => true,
				),
				'J' => array(
					'columna' => 'TITULO_ACADEMICO',
					'columnaHuman' => 'Título académico',
					'comilla' => true,
				),
				'K' => array(
					'columna' => 'ID_MUNICIPIO_RESIDENCIA',
					'columnaHuman' => 'Municipio residencia',
					'comilla' => false,
					'tablaFk' => 'municipio',
					'columnaFkCod' => 'COD_MUNICIPIO',
					'columnaFkId' => 'ID_MUNICIPIO',
				),
				'L' => array(
					'tablaHija' => 'cargo_rol_x_recurso_humano',
					'columnaHuman' => 'Cargos/roles',
					'sql' => array(
						"DELETE cargo_rol_x_recurso_humano
							FROM cargo_rol_x_recurso_humano, recurso_humano rh, cargo_rol cr
							WHERE 1=1
							AND rh.DOCUMENTO_IDENTIFICACION={pk}
							AND cr.COD_CARGO_ROL NOT IN ({ids})
							AND cargo_rol_x_recurso_humano.ID_RECURSO_HUMANO=rh.ID_RECURSO_HUMANO
							AND cargo_rol_x_recurso_humano.ID_CARGO_ROL=cr.ID_CARGO_ROL",
						"INSERT INTO cargo_rol_x_recurso_humano (ID_RECURSO_HUMANO, ID_CARGO_ROL)
							SELECT rh.ID_RECURSO_HUMANO, cr.ID_CARGO_ROL
							FROM recurso_humano rh, cargo_rol cr
							WHERE 1=1
							AND rh.DOCUMENTO_IDENTIFICACION={pk}
							AND cr.COD_CARGO_ROL IN ({ids})
							AND NOT EXISTS (
								SELECT 1
								FROM cargo_rol_x_recurso_humano crrh
								WHERE crrh.ID_RECURSO_HUMANO=rh.ID_RECURSO_HUMANO
								AND crrh.ID_CARGO_ROL=cr.ID_CARGO_ROL
							)",
					),
				),
				'M' => array(
					'tablaHija' => 'especialidad_x_recurso_humano',
					'columnaHuman' => 'Especialidades',
					'sql' => array(
						"DELETE especialidad_x_recurso_humano
							FROM especialidad_x_recurso_humano, recurso_humano rh, asignatura a
							WHERE 1=1
							AND rh.DOCUMENTO_IDENTIFICACION={pk}
							AND a.COD_ASIGNATURA NOT IN ({ids})
							AND especialidad_x_recurso_humano.ID_RECURSO_HUMANO=rh.ID_RECURSO_HUMANO
							AND especialidad_x_recurso_humano.ID_ASIGNATURA=a.ID_ASIGNATURA",
						"INSERT INTO especialidad_x_recurso_humano (ID_RECURSO_HUMANO, ID_ASIGNATURA, TITULO_ACADEMICO)
							SELECT rh.ID_RECURSO_HUMANO, a.ID_ASIGNATURA, ''
							FROM recurso_humano rh, asignatura a
							WHERE 1=1
							AND rh.DOCUMENTO_IDENTIFICACION={pk}
							AND a.COD_ASIGNATURA IN ({ids})
							AND NOT EXISTS (
								SELECT 1
								FROM especialidad_x_recurso_humano erh
								WHERE erh.ID_RECURSO_HUMANO=rh.ID_RECURSO_HUMANO
								AND erh.ID_ASIGNATURA=a.ID_ASIGNATURA
							)",
					),
				),
			);

			$cargarDatos = new cargar_datos();
			$ret=$cargarDatos->cargarListado($sheet,$tablaDestino,$tablaDestinoKey,$configHoja,true,false,$preview);

			return $ret;

		}

		public function cargarArchivoAsignaturasImpartidas($nbrArchivo,$preview){

			require_once 'vendor/autoload.php';
			require_once 'cargar_datos.php';

			$inputFileName = $nbrArchivo;
			$reader = IOFactory::createReader('Xlsx');
			$spreadsheet = $reader->load($inputFileName);

			$spreadsheet->setActiveSheetIndex(0);
			$sheet = $spreadsheet->getActiveSheet();

			$tablaDestino='asignatura_x_grado_x_recurso_humano';
			$tablaDestinoKey='ID_RECURSO_HUMANO';
			$dimHoriz=array(
				'dimensionHoriz' => 'asignatura',
				'dimensionHorizId' => 'ID_ASIGNATURA',
				'dimensionHorizCod' => 'NBR_ASIGNATURA',
			);
			$configHoja=array(
				'A' => array(
					'dimensionVert' => 'recurso_humano',
					'dimensionVertHuman' => 'Documento',
					'dimensionVertId' => 'ID_RECURSO_HUMANO',
					'dimensionVertCod' => 'DOCUMENTO_IDENTIFICACION',
				),
				'B' => array(
					'dimensionVert' => 'grado',
					'dimensionVertHuman' => 'Grado',
					'dimensionVertId' => 'ID_GRADO',
					'dimensionVertCod' => 'NBR_GRADO',
				),
				'C' => $dimHoriz,
				'D' => $dimHoriz,
				'E' => $dimHoriz,
				'F' => $dimHoriz,
				'G' => $dimHoriz,
				'H' => $dimHoriz,
				'I' => $dimHoriz,
			);

			$cargarDatos = new cargar_datos();
			$ret=$cargarDatos->cargarMatrizDimensiones($sheet,$tablaDestino,$tablaDestinoKey,$configHoja,$preview);

			return $ret;

		}

		public function cargarArchivoAsistencia($idJornada,$nbrArchivo,$preview){

			require_once('parts-admin/conexion.php');
			require_once 'vendor/autoload.php';
			require_once 'cargar_datos.php';

			$inputFileName = $nbrArchivo;
			$reader = IOFactory::createReader('Xlsx');
			$spreadsheet = $reader->load($inputFileName);

			$spreadsheet->setActiveSheetIndex(0);
			$sheet = $spreadsheet->getActiveSheet();

			$lnk=database_connect();

			$res=mysqli_query($lnk,"SELECT J.ID_JORNADA, T.CANTIDAD_HORAS_MANNANA, T.CANTIDAD_HORAS_TARDE
				FROM jornada J, tipo_jornada T
				WHERE J.ID_JORNADA=$idJornada
				AND J.ID_TIPO_JORNADA=T.ID_TIPO_JORNADA") or die(mysqli_error($lnk));
			if($reg=mysqli_fetch_assoc($res)){
				$cargarDatos = new cargar_datos();

				$tablaDestino='recurso_humano_x_jornada';
				$tablaDestinoKey='ID_RECURSO_HUMANO_PARTICIPANTE';
				$configHoja=array(
					'A' => array(
						'columna' => 'ID_RECURSO_HUMANO_PARTICIPANTE',
						'columnaHuman' => 'Documento',
						'comilla' => false,
						'tablaFk' => 'recurso_humano',
						'columnaFkCod' => 'DOCUMENTO_IDENTIFICACION',
						'columnaFkId' => 'ID_RECURSO_HUMANO',
					),
				);
				$colSig='B';
				$arrConvertir=array(
					'' => 0,
				);
				foreach ($cargarDatos->valoresPermitidosMarca as $key => $value) {
					$arrConvertir[trim($value)]=1;
				}

				foreach (array(
					'CANTIDAD_HORAS_MANNANA' => array('col' => 'PARTICIPACION_MANNANA', 'colH' => 'Participación mañana'),
					'CANTIDAD_HORAS_TARDE' => array('col' => 'PARTICIPACION_TARDE', 'colH' => 'Participación tarde'),
				) as $key => $value) {
					if($reg[$key]>0){
						$configHoja[$colSig]=array(
							'columna' =>  $value['col'],
							'columnaHuman' => $value['colH'],
							'comilla' => false,
							'arrConvertir' => $arrConvertir,
						);
						$colSig=chr(ord($colSig)+1);
					}
				}
				$configHoja[$colSig]=array(
					'valorFijo' => $idJornada,
					'valorFijoColumna' => 'ID_JORNADA',
					'comilla' => false,
				);

				mysqli_query($lnk,"DELETE FROM recurso_humano_x_jornada
					WHERE ID_JORNADA=$idJornada") or die(mysqli_error($lnk));
				$ret=$cargarDatos->cargarListado($sheet,$tablaDestino,$tablaDestinoKey,$configHoja,false,false,$preview);

				return $ret;
			}

		}

	}

	//$rh = new recurso_humano();
	//$rh->cargarArchivoRecursoHumano('/tmp/cargaDeDatos.xlsx');
	//$rh->cargarArchivoAsignaturasImpartidas('/tmp/cargaDeDatos.xlsx');
	//$rh->cargarArchivoAsistencia(1,'/tmp/asistencia.xlsx');
	//$rh->cargarArchivoAsistencia(2,'/tmp/asistencia.xlsx');
	//$rh->cargarArchivoAsistencia(3,'/tmp/asistencia.xlsx');
?>