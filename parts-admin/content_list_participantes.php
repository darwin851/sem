<div id="content-wrapper" class="content-wrapper view projects-view">
	<div class="container-fluid">
		<h2 class="view-title">Listado de participantes</h2>
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
									<div class="col-md-3">
									<fieldset class="form-group">
								  			<label for="departamento">Departamento</label>
										 	<select class="form-control" id="departamento" name="departamento" onchange="getMunicipios(this.value); loadDepto(1,this.value)">
										 	<option disabled selected>Seleccionar el Departamento</option>
										<?php
												$sql = "SELECT * FROM departamento";
												$result = mysqli_query($lnk,$sql);
												while($row = mysqli_fetch_assoc($result)){
											?>
										<option value="<?php echo $row['ID_DEPARTAMENTO'] ?>"><?php echo $row['NBR_DEPARTAMENTO'] ?></option>
										<?php } ?>

											</select>
									 </fieldset>
									 </div>

									 <div class="col-md-3">
									 <fieldset class="form-group">
								  			<label for="departamento">Municipio</label>
										 	<select class="form-control" id="municipios" name="municipios" onchange="getces(this.value); loadMun(1,this.value); ">
										 	 <option disabled selected>Seleccionar el Municipio</option>
											</select>
									 </fieldset>
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