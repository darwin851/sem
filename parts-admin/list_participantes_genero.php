<?php
require('connection.php');  
$lnk=database_connect();

$query= '';

	$action = (isset($_REQUEST['action'])&& $_REQUEST['action'] !=NULL)?$_REQUEST['action']:'';


	if($action == 'ajax'){
		include 'pagination.php';  
	
		$page = (isset($_REQUEST['page']) && !empty($_REQUEST['page']))?$_REQUEST['page']:1;
		$per_page = 40; //la cantidad de registros que desea mostrar
		$adjacents  = 4; //brecha entre páginas después de varios adyacentes
		$offset = ($page - 1) * $per_page;

		//Cuenta el número total de filas de la tabla*/
	
		
		$count_query  = mysqli_query($lnk,"SELECT count(*) AS numrows FROM recurso_humano ");
		if ($row= mysqli_fetch_array($count_query)){$numrows = $row['numrows'];}
		$total_pages = ceil($numrows/$per_page);
		$reload = 'list_participantes_genero.php';
		$num=0;
		//consulta principal para recuperar los datos
		
		$query = mysqli_query($lnk,"SELECT rh.documento_identificacion, rh.nombres, rh.apellidos, rh.genero ,ce.nbr_centro_educativo,depto.nbr_departamento,mun.nbr_municipio FROM recurso_humano rh
INNER JOIN centro_educativo ce ON rh.id_centro_educativo=ce.id_centro_educativo
INNER JOIN municipio mun ON rh.id_municipio_residencia=mun.id_municipio
INNER JOIN departamento depto ON mun.id_departamento=depto.id_departamento
WHERE rh.activo=1  ORDER BY rh.nombres ASC LIMIT $offset,$per_page");


	
		
		if ($numrows>0){
			?>

		<div style="float: right;">
		<form action="export_data_genero.php" method="post">
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
				  <th>GENERO</th>
				  <th>CENTOR EDUCATIVO</th>
				   <th>DEPARTAMENTO</th>
				  <th>MUNICIPIO DE RESIDENCIA</th>
				</tr>
			</thead>
			<tbody>
			<?php
			while($row = mysqli_fetch_array($query)){
				$num=$num+1;

				$GENERO_TEMP = $row['genero'];

				if($GENERO_TEMP=='F'){
					$GENERO = "FEMININO";
				}
				if($GENERO_TEMP=='M'){
					$GENERO = "MASCULINO";
				}
				
				?>
				<tr>
					<td style="text-align: left;"><?php echo $num;?></td>
					<td style="text-align: left;"><?php echo $row['documento_identificacion'];?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nombres'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['apellidos'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo $GENERO;?></td>
					<td style="text-align: left;"><?php echo mb_strtoupper($row['nbr_centro_educativo'],'utf-8');?></td>
					<td style="text-align: left;"><?php echo $row['nbr_departamento']; ?></td>
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
