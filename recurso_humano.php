<?php

	use PhpOffice\PhpSpreadsheet\IOFactory;

	class recurso_humano{

		private $arrErr=array();

		public function cargarArchivoRecursoHumano($nbrArchivo){

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
					'tablaHija' => true,
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
					'tablaHija' => true,
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
			$cargarDatos->cargarListado($sheet,$tablaDestino,$tablaDestinoKey,$configHoja);

		}

		public function cargarArchivoAsignaturasImpartidas($nbrArchivo){

			require_once 'vendor/autoload.php';
			require_once 'cargar_datos.php';

			$inputFileName = $nbrArchivo;
			$reader = IOFactory::createReader('Xlsx');
			$spreadsheet = $reader->load($inputFileName);

			$spreadsheet->setActiveSheetIndex(0);
///temporal
$spreadsheet->setActiveSheetIndex(1);
$spreadsheet->setActiveSheetIndex(1);
$spreadsheet->setActiveSheetIndex(1);
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
					'dimensionVertId' => 'ID_RECURSO_HUMANO',
					'dimensionVertCod' => 'DOCUMENTO_IDENTIFICACION',
				),
				'B' => array(
					'dimensionVert' => 'grado',
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
			$cargarDatos->cargarMatrizDimensiones($sheet,$tablaDestino,$tablaDestinoKey,$configHoja);

		}

	}

	$rh = new recurso_humano();
	$rh->cargarArchivoRecursoHumano('/tmp/cargaDeDatos.xlsx');
	$rh->cargarArchivoAsignaturasImpartidas('/tmp/cargaDeDatos.xlsx');
?>