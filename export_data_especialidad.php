<?php 

require('parts-admin/connection.php');  
$lnk=database_connect();
									
if(isset($_POST["export_data"])) {
$filename = "SIEM-FHI360-LISTADO_PARTICIPANTES-ESPECIALIDAD-".date('Y-m-d H:i:s'). ".xls";
header("Content-Type: application/vnd.ms-excel; charset=UTF-8");
header("Content-Disposition: attachment; filename='".$filename."'");
header("Pragma: no-cache"); 
header("Expires: 0");
$show_coloumn = false;
$num=0;

$query_export_data = mysqli_query($lnk,"SELECT rh.documento_identificacion,rh.nombres,rh.apellidos, especialidad.nbr_asignatura,depto.nbr_departamento, mun.nbr_municipio FROM asignatura especialidad
INNER JOIN especialidad_x_recurso_humano rh_e ON especialidad.id_asignatura=rh_e.id_especialidad
INNER JOIN recurso_humano rh ON rh_e.id_recurso_humano=rh.id_recurso_humano
INNER JOIN municipio mun ON mun.id_municipio=rh.id_municipio_residencia
INNER JOIN departamento depto ON depto.id_departamento=mun.id_departamento
GROUP BY mun.nbr_municipio");

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
				  <th>ESPECIALIDAD</th>
				  <th>DEPARTAMENTO</th>
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
				$especialidad = utf8_decode($row['nbr_asignatura']);
				$departamento = utf8_decode($row['nbr_departamento']);
				$municipio = utf8_decode($row['nbr_municipio']);

				$nombres_dos = pasarMayusculas($nombres);
				$apellidos_dos=pasarMayusculas($apellidos);
				$municipio_dos = pasarMayusculas($municipio);


				
				?>
				<tr>
					<td style="text-align: left;"><?php echo $num;?></td>
					<td style="text-align: left;"><?php echo $documento_identificacion; ?></td>
					<td style="text-align: left;"><?php echo $nombres_dos; ?></td>
					<td style="text-align: left;"><?php echo $apellidos_dos; ?></td>
					<td style="text-align: left;"><?php echo $especialidad;?></td>
					<td style="text-align: left;"><?php echo $departamento; ?></td>
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