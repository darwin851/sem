<?php
	require('conexion.php');

	$lnk=database_connect();

	switch ($_POST['accion']) {
		case 'previsualizar_recurso_humano':
			$preview=true;
		case 'cargar_recurso_humano':
			if(!isset($preview)){
				$preview=false;
			}
			require('../recurso_humano.php');
			$tipoArchivo=$_POST['tipoArchivo'];
			$json='';
			$rh = new recurso_humano();
			foreach ($_FILES as $file) {
				switch ($tipoArchivo) {
					case 'list_rrhh':
						$json=$rh->cargarArchivoRecursoHumano($file['tmp_name'],$preview);
						break;
					case 'matr_asig':
						$json=$rh->cargarArchivoAsignaturasImpartidas($file['tmp_name'],$preview);
						break;
				}
			}
			break;
	}

	if(isset($output)){
		header("Content-Type: text/html; charset=UTF-8\r\n");
		echo $output;
	}

	if(isset($json)){
		header('Content-Type: application/json');
		echo json_encode($json);
	}
?>