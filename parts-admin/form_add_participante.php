
<div id="content-wrapper" class="content-wrapper view projects-view">
	<div class="container-fluid">
		<h2 class="view-title">Registro de participantes</h2>
		<div class="row">
			<div class="col-wrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="module-wrapper">
				  <section class="module alto_general module-has-footer module-projects-overview">
						<div class="module-inner">
							<div class="module-heading">
								<h3 class="module-title">Dashboard Principal-Registro de participantes</h3>
								<ul class="actions list-inline">
									
									<li><a class="collapse-module" data-toggle="collapse" href="#content-overview" aria-expanded="false" aria-controls="content-overview"><span aria-hidden="true" class="icon arrow_carrot-up"></span></a></li>
									
								</ul>
								
							</div>
							<form role="form" name="registro_recurso_humano" action="parts-admin/registro.php" method="post">
								 <input name="guardar" type="hidden" id="guardar" value="nuevo_recurso_humano" />
							<div class="module-content collapse in" id="content-overview">
								<div class="module-content-inner sectionone col-md-6">
																		
											<div class="form-group row">
												  <label for="example-number-input" class="col-2 col-form-label">DUI</label>
												  <div class="col-10">
													<input class="form-control" type="text" name="documento_identificacion"   id="documento_identificacion" placeholder="Documento de Identificación">
												  </div>
											</div>
											
											<div class="form-group row">
												  <label for="example-date-input" class="col-2 col-form-label">Fecha de Registro</label>
												  <div class="col-10">
													<input class="form-control" name="fecha_registro" type="date" value="" id="fecha_registro" placeholder="dd/mm/año">
												  </div>
											</div>			
												
											<div class="form-group row">
												  <label for="example-text-input" class="col-2 col-form-label">Nombres</label>
												  <div class="col-10">
													<input class="form-control" type="text" value="" name="nombres" id="nombres" placeholder="Nombres">
												  </div>
								  </div>
												<div class="form-group row">
												  <label for="example-search-input" class="col-2 col-form-label">Apellidos</label>
												  <div class="col-10">
													<input class="form-control" type="text" name="apellidos"  value="" id="apellidos" placeholder="Apellidos">
												  </div>
												</div>
												
												<div class="form-group row">
												  <label for="example-search-input" class="col-2 col-form-label">Departamento Centro Educativo</label>
												  <div class="col-10">
													<select class="departments form-control" type="text" value=""  name="departamento_centro_educativo_select" id="departamento_centro_educativo_select" onchange="getMunicipio(this.value);">
														<option disabled selected>Seleccionar el Departamento</option>
														<?php
															$sql = "SELECT * FROM departamento";
															$result = mysql_query($sql);
															while($row = mysql_fetch_assoc($result)){
														?>
												<option value="<?php echo $row['ID_DEPARTAMENTO'] ?>"><?php echo utf8_encode( $row['NBR_DEPARTAMENTO']) ?></option>
												<?php } ?>

													
												    </select>
												  </div>
												</div>
												<!--PARA EL MUNICIPIO-->
												<div class="form-group row">
												  <label for="example-search-input" class="col-2 col-form-label">Municipio del Centro Educativo</label>
												  <div class="col-10">
													<select class="municipios_sv form-control" type="text" value="" name="municipios-centro-educativo-select" id="municipios" onchange="getce(this.value);">

													</select>
															
												  </div>
												</div>
												
												<!--PARA EL CENTRO EDUCATIVO-->
												<div class="form-group row">
												  <label for="example-search-input" class="col-2 col-form-label">Centro Escolar</label>
												  <div class="col-10">
													  <select class="myselect centro_educativo form-control" type="text" value="" name="centro_educativo" id="centro_educativo" >
													  </select>
												</div>
												</div>
												
																				
												
												<div class="form-group row">
												  <label for="example-email-input" class="col-2 col-form-label">Dirección de residencia</label>
												  <div class="col-10">
													<input class="form-control" name="id_municipio_residencia" type="text" value="" id="id_municipio_residencia" placeholder="Dirección de residencia">
												  </div>
												</div>
												
												
												<div class="form-group row">
												  <label for="example-email-input" class="col-2 col-form-label">Email</label>
												  <div class="col-10">
													<input class="form-control" value="" type="email" name="email" id="email" placeholder="name@email.com">
												  </div>
												</div>
												<div class="form-group row">
												  <label for="example-tel-input" class="col-2 col-form-label">Tel&eacute;fono</label>
												  <div class="col-10">
													<input class="form-control bfh-phone" type="tel" data-format="+503 (dddd)-dddd" value="" name="telefono" id="telefono" placeholder="5555-5555">
												  </div>
												</div>

												<div class="form-group row">
												  <label for="example-tel-input" class="col-2 col-form-label">Tel&eacute;fono Celular</label>
												  <div class="col-10">
													<input class="form-control bfh-phone" type="tel" data-format="+503 (dddd)-dddd" value="" name="celular" id="celular" placeholder="5555-5555">
												  </div>
												</div>
									
										
								</div>
								
								<div class="module-content-inner sectiontwo col-md-5">
										<div class="form-group row">
											<label for="example-tel-input" class="col-2 col-form-label">G&eacute;nero</label>
												  <div class="col-10">
													<select class="form-control" type="text" value="" name="genero" id="genero">
														<option value="1">Masculino</option>
														<option value="2">Femenino</option>

													</select>


												  </div>
												</div>

										<div class="form-group row">
											<label for="example-email-input" class="col-2 col-form-label">¿Cuál es su cargo/rol? Marque con una equis “x” la opción que le corresponde: </label>
												  <div class="col-10">
													<p>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_0">
											  Director</label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_1">
											  Sub-director</label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_2">
											  Alumna o Alumno</label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_3">
											  Docente</label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_4">
											  Institución u organización de Apoyo a la escuela </label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_5">
											  Madre/padre de familia</label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_6">
											  FOMILENIO II</label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_7">
											  Oficial del Ministerio de Educación</label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_8">
											  Comités del centro escolar</label>
											<br>
											<label>
											  <input type="checkbox" name="CheckboxGroup1" value="checkbox" id="CheckboxGroup1_9">
											  Otros</label>
											<br>
										  </p>
										  </div>
										</div>
										
											<div class="form-group row">
												  <label for="example-tel-input" class="col-2 col-form-label">[SI USTED MARCÓ DIRECTOR – Y TIENE GRADO A GARGO - O ES DOCENTE PASE A LA SIGUIENTE PREGUNTA (9); EN CASO DIFERENTE PASE A LA PREGUNTA 10]</label>
											</div>
											<div class="form-group row">
												  <label for="example-tel-input" class="col-2 col-form-label">Asignatura que imparte</label>
												  <div class="col-10">
													<input class="form-control bfh-phone" type="tel" data-format="+503 (dddd)-dddd" value="" id="asignatura-imparte-input" placeholder="Asignatura que imparte">
												  </div>
												</div>
										
										<div class="form-group row">
												  <label for="example-tel-input" class="col-2 col-form-label">¿Cuenta con formación en esa especialidad?</label>
												  <div class="col-10">
													<p>
													  <label>
													    <input type="radio" name="RadioGroup1" value="1" id="RadioGroup1_0">
													    Si</label>
													  <br>
													  <label>
													    <input type="radio" name="RadioGroup1" value="0" id="RadioGroup1_1">
													    No</label>
													  <br>
												    </p>
                                                  </div>
											</div>
											
											<div class="form-group row">
												<label for="sel2">¿En qué especialidad cuenta con formación?</label>
												  <select multiple class="form-control" id="sel2">
													<option>BIOLOGIA</option>
													<option>FÍSICA</option>
													<option>LENGUAJE</option>
													<option>MATEMÁTICA</option>
													<option>QUÍMICA</option>
													<option>SOCIALES</option>
													<option>CIENCIAS NATURALES</option>
												  </select>
												<label for="sel2">Puedes seleccionar varias especialidades, manter precionada la tecla Ctrl</label>
									 	 </div>
									 	 
									 	 

									</div>
								
								<div class="module-content-inner col-md-12">
									<div class="form-group row">
												  <label for="example-number-input" class="col-2 col-form-label">En la matriz siguiente indique clos grados en los que imparte clase y las
asignaturas que imparte en cada uno:</label>
												  <div class="col-10">
													<table class="responsive-table-input-matrix">
		<thead>
		<tr>
			<th>Asignatura/grado</th>
			<th>Lenguaje</th>
			<th>Sociales</th>
			<th>Biología</th>
			<th>Química</th>
			<th>Física</th>
			<th>Matemática</th>
			<th>Ciencias Naturales</th>
		</tr>
		</thead>
		<tbody>

		<tr>
			<td>Parvularia</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
		</tr>
		<tr>
			<td>1ro</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
		</tr>
		<tr>
		<td>2do</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
		</tr>
		<tr>
			<td>3ro</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>

		</tr>
		<tr>
			<td>4to</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>

		</tr>
		<tr>
			<td>5to</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>

		</tr>
		<tr>
			<td>7mo</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>

		</tr>
		<tr>
			<td>8vo</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>

		</tr>
		<tr>
			<td>9no</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>

		</tr>
		<tr>
			<td>Bachillerato General</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>

		</tr>
		<tr>
			<td>Bachillerato Técnico</td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>
			<td><input type="checkbox"></td>

		</tr>
		</tbody>
	</table>
												  </div>
											</div>
								</div><!--fin de la tercera columna -->
								<button type="submit" class="btn btn-primary">Registrar</button>
								
							</div>
								
						
						  </form>
					</div>
						
				  </section>
				</div>
			</div>
	  </div>
  </div>
</div>