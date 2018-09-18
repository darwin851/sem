<?php
include "conexion.php"; database_connect();

$id_ce = $_POST['id_municipio'];



$sql = "SELECT * FROM centro_educativo WHERE id_municipio=$id_ce";

$result = mysql_query($sql) or die(mysql_error());

$validar_result = mysql_num_rows($result);

var_dump($validar_result);

echo "<option disabled selected>Seleccinar Centro Educativo</option>";

if($validar_result > 1){

		while($row = mysql_fetch_assoc($result)){
			echo "<option value='" . $row['ID_CENTRO_EDUCATIVO'] . "'>" . utf8_encode($row['NBR_CENTRO_EDUCATIVO']) ."</option>";
		}

}
		 
?>