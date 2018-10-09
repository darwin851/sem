<?php
require('connection.php');  
$lnk=database_connect();

$query= '';

	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';
	$cargo = (isset($_REQUEST['cargo'])&& $_REQUEST['cargo'] !=NULL)?$_REQUEST['cargo']:'';


	if($action == 'ajax'){
		include 'pagination.php';  
	
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 200; //la cantidad de registros que desea mostrar
		$adjacents  = 4; //brecha entre páginas después de varios adyacentes
		$offset = ($page - 1) * $per_page;

		//Cuenta el número total de filas de la tabla*/
	
		
		$count_query  = mysqli_query($lnk,"SELECT count(cargoxrh.id_cargo_rol) AS numrows FROM cargo_rol cargo INNER JOIN cargo_rol_x_recurso_humano cargoxrh ON cargo.id_cargo_rol=cargoxrh.id_cargo_rol");

		if ($row= mysqli_fetch_array($count_query)){$numrows = $row['numrows'];}
		$total_pages = ceil($numrows/$per_page);
		$reload = 'list_participantes_x_cargo.php';
		$num=0;
		//consulta principal para recuperar los datos
		
		$query = mysqli_query($lnk,"SELECT rh.documento_identificacion, rh.nombres, rh.apellidos,cargo.nbr_cargo_rol,ce.nbr_centro_educativo, mun.nbr_municipio  FROM cargo_rol cargo 
INNER JOIN cargo_rol_x_recurso_humano cargoxrh ON cargo.id_cargo_rol=cargoxrh.id_cargo_rol
INNER JOIN recurso_humano rh ON rh.id_recurso_humano=cargoxrh.id_recurso_humano
INNER JOIN municipio mun ON rh.id_municipio_residencia=mun.id_municipio
INNER JOIN centro_educativo ce ON ce.id_centro_educativo=rh.id_centro_educativo
WHERE cargo.id_cargo_rol=$cargo AND rh.activo=1 ORDER BY rh.nombres ASC LIMIT $offset,$per_page");


		
		if ($numrows>0){
			?>

		<div style="float: right;">
		<form action="export_data_x_cargo.php" method="post">
		<input type="hidden" name="cargo" value="<?php echo $cargo; ?>">
<button type="submit" id="export_data" name='export_data' value="Export to excel" class="btn btn-info">Exportar a Excel</button>
</form>


</div>
		<table class="table table-hover">
			  <thead>
				<tr>
				   <th>#</th>
				  <th>DOCUMENTO IDENTIFICACION</th>
				  <th>NOMBRES</th>
				  <th>APELLIDOS</th>
				  <th>CARGO</th>
				  <th>CENTRO EDUCATIVO</th>
				  <th>MUNICIPIO RESIDENCIA</th>
				  
				</tr>
			</thead>
			<tbody>
			<?php
			while($row = mysqli_fetch_array($query)){
				$num=$num+1;
				
				?>
				<tr>
					<td style="text-align: left;"><?php echo $num;?></td>
					<td style="text-align: left;"><?php echo $row['documento_identificacion'];?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nombres'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['apellidos'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nbr_cargo_rol'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nbr_centro_educativo'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nbr_municipio'],'utf-8');?></td>
					
				</tr>
				<?php
			}

			?>
			</tbody>
		</table>
		<div class="table-pagination pull-right">
			
	
		</div>
		
			<?php
			
		} else {
			?>
			<div class="alert alert-warning alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <h4>Aviso!!!</h4> No hay datos para mostrar
            </div>
			<?php
		}
	}
?>
