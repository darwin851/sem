<?php
require('connection.php');  
$lnk=database_connect();

$query= '';

	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';


	if($action == 'ajax'){
		include 'pagination.php';  
	
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 100; //la cantidad de registros que desea mostrar
		$adjacents  = 4; //brecha entre páginas después de varios adyacentes
		$offset = ($page - 1) * $per_page;

		//Cuenta el número total de filas de la tabla*/
	
		
		$count_query  = mysqli_query($lnk,"SELECT count(rh.nombres) AS numrows ,rh.apellidos, especialidad.nbr_asignatura,depto.nbr_departamento, mun.nbr_municipio  FROM asignatura especialidad
INNER JOIN especialidad_x_recurso_humano rh_e ON especialidad.id_asignatura=rh_e.id_especialidad
INNER JOIN recurso_humano rh ON rh_e.id_recurso_humano=rh.id_recurso_humano
INNER JOIN municipio mun ON mun.id_municipio=rh.id_municipio_residencia
INNER JOIN departamento depto ON depto.id_departamento=mun.id_departamento
GROUP BY mun.nbr_municipio");

		if ($row= mysqli_fetch_array($count_query)){$numrows = $row['numrows'];}		
		$total_pages = ceil($numrows/$per_page);
		$reload = 'list_participantes_especialidad.php';
		$num=0;
		//consulta principal para recuperar los datos
		
		$query = mysqli_query($lnk,"SELECT rh.documento_identificacion,rh.nombres,rh.apellidos, especialidad.nbr_asignatura,depto.nbr_departamento, mun.nbr_municipio FROM asignatura especialidad
INNER JOIN especialidad_x_recurso_humano rh_e ON especialidad.id_asignatura=rh_e.id_especialidad
INNER JOIN recurso_humano rh ON rh_e.id_recurso_humano=rh.id_recurso_humano
INNER JOIN municipio mun ON mun.id_municipio=rh.id_municipio_residencia
INNER JOIN departamento depto ON depto.id_departamento=mun.id_departamento
GROUP BY mun.nbr_municipio ASC LIMIT $offset,$per_page");


		
		if ($numrows>0){
			?>

		<div style="float: right;">
		<form action="export_data_especialidad.php" method="post">
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
				  <th>ESPECIALIDAD</th>
				  <th>DEPARTAMENTO</th>
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
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nbr_asignatura'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nbr_departamento'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nbr_municipio'],'utf-8');?></td>
					
				</tr>
				<?php
			}

			?>
			</tbody>
		</table>
		<div class="table-pagination pull-right">
			
			<?php echo paginate($reload, $page, $total_pages, $adjacents);?>
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
