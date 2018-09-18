<?php
require('conexion.php'); database_connect();

if(!empty($_POST)){
		if($_POST['guardar']=='nuevo_recurso_humano'){
				if(isset($_POST['documento_identificacion'])){
						if($_POST["documento_identificacion"]!=""){
						$found=false;

							
						$select = "SELECT * FROM recurso_humano where documento_identificacion='$_POST[documento_identificacion]'";
						$query = 		mysql_query($select);
						$encontrado=    mysql_num_rows($query);

						if ($encontrado) {
							$found=true;
							
						}					
						if($found){

							print "<script>alert(\"El Documento Identificacion ya se encuentra registrado.\");window.location='../participante.php';</script>";
						}else{
							$ultimo_id = mysql_insert_id();
							$insert = "INSERT INTO recurso_humano (id_recurso_humano, documento_identificacion, nombres, apellidos, fecha_hora_creacion, id_centro_educativo, telefono, celular, correo_electronico, genero , id_municipio_residencia)
							VALUES ($ultimo_id,'$_POST[documento_identificacion]', '$_POST[nombres]','$_POST[apellidos]','$_POST[fecha_registro]', '$_POST[departamento_centro_educativo_select]','$_POST[telefono]','$_POST[celular]', '$_POST[email]', '$_POST[genero]','$_POST[id_municipio_residencia]')"; 
							mysql_query($insert) or die(mysql_error());
							
							
						}

					}/*Cuarto if*/
		}/*tercer if*/
		else{
			print "<script>alert(\"Falta campos por completar.\");window.location='../participante.php';</script>";
		}/*find del else*/

	}/*segundo if*/
	
} /*Primer If*/
?>