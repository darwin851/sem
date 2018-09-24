<?php 

	include('parts-admin/header.php');
	
	include('parts-admin/menu.php');

	$titulo='Carga de asistencia por jornada';
	$lnk=database_connect();
	$res=mysqli_query($lnk,"SELECT P.NBR_PROGRAMA_FORMACION, T.ID_TALLER_CURSO, T.COD_TALLER_CURSO, T.NBR_TALLER_CURSO, S.NBR_SEDE
		FROM programa_formacion P, taller_curso T, sede S
		WHERE 1=1
		AND P.ACTIVO=1
		AND T.ACTIVO=1
		AND S.ACTIVO=1
		AND P.ID_PROGRAMA_FORMACION=T.ID_PROGRAMA_FORMACION
		AND T.ID_SEDE=S.ID_SEDE
		ORDER BY P.NBR_PROGRAMA_FORMACION, T.COD_TALLER_CURSO") or die(mysqli_error($lnk));
	$optCursos='';
	while($reg=mysqli_fetch_assoc($res)){
		$value=$reg['ID_TALLER_CURSO'];
		$label=$reg['NBR_PROGRAMA_FORMACION'] . ': ' . $reg['COD_TALLER_CURSO'] . ' - ' . $reg['NBR_TALLER_CURSO'] . ' (' . $reg['NBR_SEDE'] . ')';
		$optCursos.="<option value=\"$value\">$label</option>";
	}

	include('parts-admin/form_cargar_asistencia.php');
		
	include('parts-admin/footer_without_grafs.php');

?>