<?php
	require('conexion.php');

	$lnk=database_connect();

	switch ($_POST['accion']) {
		case 'cargar_recurso_humano':
			require('../recurso_humano.php');
			$tipoArchivo=$_POST['tipoArchivo'];
			$output='';
			$rh = new recurso_humano();
			foreach ($_FILES as $file) {
				switch ($tipoArchivo) {
					case 'list_rrhh':
						$carga=$rh->cargarArchivoRecursoHumano($file['tmp_name']);
						break;
					case 'matr_asig':
						$carga=$rh->cargarArchivoAsignaturasImpartidas($file['tmp_name']);
						break;
				}
				foreach ($carga as $cg) {
					$output.=$cg . '<br />';
				}
			}
			break;
	}

	if(isset($output)){
		header("Content-Type: text/html; charset=UTF-8\r\n");
		echo $output;
	}
?>