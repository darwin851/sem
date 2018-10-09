<?php 

require('parts-admin/connection.php');  
$lnk=database_connect();
									
if(isset($_POST["export_data"])) {
$filename = "SIEM-FHI360-LISTADO_PARTICIPANTES-CARGOS-".date('Y-m-d H:i:s'). ".xls";
header("Content-Type: application/vnd.ms-excel; charset=UTF-8");
header("Content-Disposition: attachment; filename='".$filename."'");
header("Pragma: no-cache"); 
header("Expires: 0");
$show_coloumn = false;
$num=0;

$query_export_data = mysqli_query($lnk,"SELECT rh.documento_identificacion, rh.nombres, rh.apellidos,cargo.nbr_cargo_rol,ce.nbr_centro_educativo, mun.nbr_municipio  FROM cargo_rol cargo 
INNER JOIN cargo_rol_x_recurso_humano cargoxrh ON cargo.id_cargo_rol=cargoxrh.id_cargo_rol
INNER JOIN recurso_humano rh ON rh.id_recurso_humano=cargoxrh.id_recurso_humano
INNER JOIN municipio mun ON rh.id_municipio_residencia=mun.id_municipio
INNER JOIN centro_educativo ce ON ce.id_centro_educativo=rh.id_centro_educativo
WHERE rh.activo=1  ORDER BY rh.nombres");

function pasarMayusculas($cadena) { 
$cadena = strtoupper($cadena); 
$cadena = str_replace("á", "Á", $cadena); 
$cadena = str_replace("é", "É", $cadena); 
$cadena = str_replace("í", "Í", $cadena); 
$cadena = str_replace("ó", "Ó", $cadena); 
$cadena = str_replace("ú", "Ú", $cadena); 
return ($cadena); 
}  



?>



<h4>LISTADO DE PARTICIPANTES</h4>
			<table class="table table-hover">
			  <thead>
				<tr>
				  <th>#</th>
				  <th>DOCUMENTO IDENTIFICACION</th>
				  <th>NOMBRES</th>
				  <th>APELLIDOS</th>
				  <th>CARGO</th>
				  <th>CENTOR EDUCATIVO</th>
				  <th>MUNICIPIO DE RESIDENCIA</th>
				</tr>
			</thead>
			<tbody>
			<?php
			while($row = mysqli_fetch_array($query_export_data)){
				$num=$num+1;

			

				$documento_identificacion = $row['documento_identificacion'];
				$nombres = utf8_decode($row['nombres']);
				$apellidos = utf8_decode($row['apellidos']);
				$cargo = utf8_decode($row['nbr_cargo_rol']);
				$centro_educativo = utf8_decode($row['nbr_centro_educativo']);
				$municipio = utf8_decode($row['nbr_municipio']);

				$nombres_dos = pasarMayusculas($nombres);
				$apellidos_dos=pasarMayusculas($apellidos);
				$centro_educativo_dos = pasarMayusculas($centro_educativo);
				$municipio_dos = pasarMayusculas($municipio);


				
				?>
				<tr>
					<td style="text-align: left;"><?php echo $num;?></td>
					<td style="text-align: left;"><?php echo $documento_identificacion; ?></td>
					<td style="text-align: left;"><?php echo $nombres_dos; ?></td>
					<td style="text-align: left;"><?php echo $apellidos_dos; ?></td>
					<td style="text-align: left;"><?php echo $cargo;?></td>
					<td style="text-align: left;"><?php echo $centro_educativo_dos; ?></td>
					<td style="text-align: left;"><?php echo $municipio_dos; ?></td>
				</tr>
				<?php
			}

			?>
			</tbody>
		</table>

<?php


	exit;
}