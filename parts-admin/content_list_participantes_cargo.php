<div id="content-wrapper" class="content-wrapper view projects-view">
	<div class="container-fluid">
		<h2 class="view-title">Listado de participantes por Cargos</h2>
		<div class="row">
			<div class="col-wrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="module-wrapper">
					<section class="module  alto_general module-has-footer module-projects-overview">
						<div class="module-inner">
							<div class="module-heading">
								<h3 class="module-title">Dashboard Principal</h3>
								<ul class="actions list-inline">
									
									<li><a class="collapse-module" data-toggle="collapse" href="#content-overview" aria-expanded="false" aria-controls="content-overview"><span aria-hidden="true" class="icon arrow_carrot-up"></span></a></li>
									
								</ul>
								
							</div>
							
							<div class="module-content collapse in" id="content-overview">
								<div class="module-content-inner ">
								<!--campos query buscar-->



								<div class="row">
									<div class="col-wrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<?php 
										$i=0;
									 $query_participantes_cargo= "SELECT cargo.nbr_cargo_rol AS CARGO, count(cargoxrh.id_cargo_rol) AS TOTAL FROM cargo_rol cargo 
										INNER JOIN cargo_rol_x_recurso_humano cargoxrh ON cargo.id_cargo_rol=cargoxrh.id_cargo_rol GROUP BY cargo.nbr_cargo_rol";

											$result_cargo=mysqli_query($lnk,$query_participantes_cargo);
											$array = array();
											while ($row=mysqli_fetch_array($result_cargo,MYSQLI_ASSOC)) {
													
													
													$array[$i] = array();
													$array[$i]['CARGO'] = $row['CARGO'];
													$array[$i]['TOTAL'] = $row['TOTAL'];



													$i=$i+1;
												
											}

										
											
											mysqli_free_result($result_cargo);


										?>
					

											<div class="col-md-6">
												<table class="table table-hover" width="100%" border="1" cellspacing="0" cellpadding="0">
												  <tbody>
													<tr>
													  <td width="54%">Director(a)</td>
													  <td width="9%"><?php echo $array[1]['TOTAL']; ?></td>
													  <td width="29%">Madre o padre de familia</td>
													  <td width="8%"><?php echo $array[4]['TOTAL'];  ?></td>
									
													</tr>
													<tr>
													  <td>Sub-director(a)</td>
													  <td><?php echo $array[7]['TOTAL'];  ?></td>
													  <td>FOMILENIO II</td>
													  <td><?php echo $array[3]['TOTAL'];  ?></td>
													  
													</tr>
													<tr>
													  <td>Docente</td>
													  <td><?php echo $array[2]['TOTAL'];  ?></td>
													  <td>Oficial del MINED</td>
													  <td><?php echo $array[5]['TOTAL'];  ?></td>
													</tr>
													<tr>
													  <td>Estudiante</td>
													  <td><p>0</p></td>
													  <td>Comités del centro escolar</td>
													  <td><?php echo $array[0]['TOTAL'];?></td>
													</tr>
													<tr>
													  <td>Institución u organización de apoyo a la escuela</td>
													  <td><p>0</p></td>
													  <td>Otros</td>
													  <td><?php echo $array[6]['TOTAL'];  ?></td>
													</tr>
												  </tbody>
												</table>
											</div>
		
											


										</div>
										 <div class="col-md-3">
									 <fieldset class="form-group">
								  			<label for="cargo">FILTRAR POR CARGO</label>
										 	<select class="form-control" id="cargo" name="cargo" onchange="loadxCargo(1,this.value);">
										 	 <option disabled selected>Seleccionar el Cargo</option>
										 	 <?php

										 	 	$query_cargo="SELECT cargo.id_cargo_rol, cargo.nbr_cargo_rol AS CARGO FROM cargo_rol cargo 
										INNER JOIN cargo_rol_x_recurso_humano cargoxrh ON cargo.id_cargo_rol=cargoxrh.id_cargo_rol GROUP BY cargo.nbr_cargo_rol";

											if($sentencia = mysqli_prepare($lnk, $query_cargo)) {
														 /* ejecutar la sentencia */
													    mysqli_stmt_execute($sentencia);

													    /* vincular las variables de resultados */
													    mysqli_stmt_bind_result($sentencia,$id_cargo_rol,$CARGO);

													    /* obtener los valores */
													    while (mysqli_stmt_fetch($sentencia)) {
													      echo '<option value='.$id_cargo_rol.' name=cargo>'.$CARGO.'</option>';

													    }

													    /* cerrar la sentencia */
													    mysqli_stmt_close($sentencia);

											}



										 	  ?>
											</select>
									 </fieldset>
									 </div>
								</div>

								<!--Cargamos los datos desde AJAX-->
								<div id="loader" class="text-center"> <img src="images/loader.gif"></div>
								<div class="outer_div"></div>
																		
								<!--fin cargamos los datos AJAX-->
								
								
												
																			
								</div>
								
							</div>
							
						</div>
						
						
						
					</section>
					
				</div>
			
			</div>
			
		
			
		</div>
		
	</div>
	
</div>