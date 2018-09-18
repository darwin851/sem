<?php include "conexion.php"; database_connect(); ?>

<html>
<head>
<title>test</title>
</head>

<body>

<div class="form-group row">
 <label for="example-search-input" class="col-2 col-form-label">Municipio del Centro Educativo</label>
 <div class="col-10">
	<select class="municipios_sv form-control" type="text" value="" name="municipios-centro-educativo-select" id="municipios">
	<?php 
		$id_departamento = 5;
		$sql = "SELECT * FROM municipio WHERE id_departamento=$id_departamento";
		$result = mysql_query($sql);

		while ($row = mysql_fetch_assoc($result)) {
	?>
	<option value="<?php echo $row['ID_MUNICIPIO'] ?>"><?php echo utf8_encode( $row['NBR_MUNICIPIO']) ?></option>
	
	<?php }; ?>	

	</select>
			
 </div>
</div>
</body>
</html>