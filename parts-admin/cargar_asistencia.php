<?php
	require('conexion.php');

	$lnk=database_connect();

	switch ($_POST['accion']) {
		case 'cargar_jornadas':
			$idCurso=$_POST['idCurso'];
			$res=mysqli_query($lnk,"SELECT J.ID_JORNADA, J.COD_JORNADA, DATE_FORMAT(J.FECHA,'%d/%m/%Y') AS FECHA, T.NBR_TIPO_JORNADA, DATE_FORMAT(T.HORA_INICIO,'%H:%i') AS HORA_INICIO, DATE_FORMAT(T.HORA_FIN,'%H:%i') AS HORA_FIN
				FROM jornada J, tipo_jornada T
				WHERE 1=1
				AND J.ACTIVO=1
				AND T.ACTIVO=1
				AND J.ID_TALLER_CURSO=$idCurso
				AND J.ID_TIPO_JORNADA=T.ID_TIPO_JORNADA
				ORDER BY J.COD_JORNADA") or die(mysqli_error($lnk));
			$output='<option disabled selected value="">Seleccionar una Jornada</option>';
			while($reg=mysqli_fetch_assoc($res)){
				$value=$reg['ID_JORNADA'];
				$label=$reg['COD_JORNADA'] . ' - ' . $reg['FECHA'] . ' ' . $reg['NBR_TIPO_JORNADA'] . ' (' . $reg['HORA_INICIO'] . ' - ' . $reg['HORA_FIN'] . ')';
				$output.="<option value=\"$value\">$label</option>";
			}
			break;
		case 'previsualizar_asistencia':
			$preview=true;
		case 'cargar_asistencia':
			if(!isset($preview)){
				$preview=false;
			}
			require('../recurso_humano.php');
			$idJornada=$_POST['idJornada'];
			$json='';
			$rh = new recurso_humano();
			foreach ($_FILES as $file) {
				$json=$rh->cargarArchivoAsistencia($idJornada,$file['tmp_name'],$preview);
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