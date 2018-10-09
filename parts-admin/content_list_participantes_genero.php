<div id="content-wrapper" class="content-wrapper view projects-view">
	<div class="container-fluid">
		<h2 class="view-title">Listado de participantes por género</h2>
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
									 $query_participantes_M= "SELECT * FROM recurso_humano WHERE activo=1 AND genero='M'";

										if($results_m=mysqli_prepare($lnk,$query_participantes_M)){
													
													mysqli_stmt_execute($results_m);
													mysqli_stmt_store_result($results_m);
													
													$valor_participantes_m=mysqli_stmt_num_rows($results_m);
													
													mysqli_stmt_close($results_m);
													
												}

										?>
										<div class="col-md-2">

											<img src="images/hombres.png" alt="">	

										</div>

										<div class="col-md-3">
										
											<div class="num_total_genero align-middle"><?php echo $valor_participantes_m;?></div>

										</div>

										
										<div class="col-md-2">

											<img src="images/mujeres.png" alt="">	

										</div>

										<div class="col-md-3">
											<?php 
									 $query_participantes_F= "SELECT * FROM recurso_humano WHERE activo=1 AND genero='F'";

										if($results_f=mysqli_prepare($lnk,$query_participantes_F)){
													
													mysqli_stmt_execute($results_f);
													mysqli_stmt_store_result($results_f);
													
													$valor_participantes_f=mysqli_stmt_num_rows($results_f);
													
													mysqli_stmt_close($results_f);
													
												}

										?>
										
												<div class="num_total_genero align-middle"><?php echo $valor_participantes_f; ?></div>

										</div>
										<div class="col-md-2">
											<div class="num_total_genero">
												<?php echo $valor_participantes_f+$valor_participantes_m; ?>

											</div>

										</div>
									
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