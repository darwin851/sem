<?php
include "conexion.php"; database_connect();

$id =  $_POST['id_departamento'];

$sql = "SELECT * FROM municipio WHERE id_departamento=$id";

$result = mysql_query($sql) or die(mysql_error());

$valida_resultado = mysql_num_rows($result);

echo "<option disabled selected>Seleccione el municipio</option>";

if($valida_resultado > 1){

	while ($row_result = mysql_fetch_assoc($result)) {

	?>
	<option value="<?php echo $row_result['ID_MUNICIPIO'] ?>"><?php echo utf8_encode( $row_result['NBR_MUNICIPIO']) ?></option>	
	<?php
	}


}else{echo "<option disabled selected>No hay datos</option>";}







?>
