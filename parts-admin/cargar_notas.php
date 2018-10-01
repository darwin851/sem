<?php
	require('conexion.php');

	$lnk=database_connect();

	switch ($_POST['accion']) {
		case 'previsualizar_notas':
			$preview=true;
		case 'cargar_notas':
			if(!isset($preview)){
				$preview=false;
			}
			require('../recurso_humano.php');
			$idTallerCurso=$_POST['idTallerCurso'];
			$json='';
			$rh = new recurso_humano();
			foreach ($_FILES as $file) {
				$json=$rh->cargarArchivoNotas($idTallerCurso,$file['tmp_name'],$preview);
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