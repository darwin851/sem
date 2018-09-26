<div id="content-wrapper" class="content-wrapper view projects-view">
	<div class="container-fluid">
		<h2 class="view-title"><?php echo $titulo; ?></h2>
		<div class="row">
			<div class="col-wrapper col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="module-wrapper">
					<section class="module alto_general module-has-footer module-projects-overview">
						<div class="module-inner">
							<div class="module-heading">
								<h3 class="module-title"><?php echo $titulo; ?></h3>
								<ul class="actions list-inline">									
									<li><a class="collapse-module" data-toggle="collapse" href="#content-overview" aria-expanded="false" aria-controls="content-overview"><span aria-hidden="true" class="icon arrow_carrot-up"></span></a></li>
								</ul>
							</div>
							<form role="form" name="cargar_recurso_humano" action="#" method="post">
								<div class="module-content collapse in" id="content-overview">
									<div class="module-content-inner sectionone col-md-6">
										<div id="exito_form" class="alert alert-success" role="alert"></div>
										<div id="alerta_form" class="alert alert-warning" role="alert"></div>
										<div id="error_form" class="alert alert-danger" role="alert"></div>
										<div class="form-group row">
											<label for="tipo_archivo_select" class="col-2 col-form-label">Tipo de archivo</label>
											<div class="col-10">
												<select class="cursos form-control" name="tipo_archivo_select" id="tipo_archivo_select">
													<option disabled selected value="">Seleccionar un tipo de archivo</option>
													<option value="list_rrhh">Listado de recurso humano</option>
													<option value="matr_asig">Matriz de asignaturas por grado por recurso humano</option>
												</select>
											</div>
										</div>
										<div class="form-group row">
											<label for="archivo_recurso_huamno" class="col-2 col-form-label">Seleccionar un archivo</label>
											<div class="col-10">
												<input type="file" class="form-control-file" id="archivo_recurso_huamno">
											</div>
										</div>
									</div>
									<div class="module-content-inner sectiontwo col-md-5">
									</div>
									<div id="preview" class="module-content-inner col-md-12">
									</div>
<!-- estos botones se muestran hasta abajo -->
									<button type="submit" class="btn btn-primary" onclick="procesarFormularioCarga('previsualizar_recurso_humano'); return false;">Previsualizar</button>
									<button type="submit" class="btn btn-primary" onclick="procesarFormularioCarga('cargar_recurso_humano'); return false;">Cargar archivo</button>
<!-- estos botones se muestran sin margen inferior -->
									<div><br /></div>
								</div>
							</form>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('#exito_form,#alerta_form,#error_form').hide();

///aquí voy
///aquí voy
///aquí voy
	function procesarFormularioCarga(modo){
		var msg='';

		$('#exito_form,#alerta_form,#error_form').hide();

		if($('#tipo_archivo_select').val()==null){
			msg+='Debe seleccionar un tipo de archivo<br />';
		}
		if($('#archivo_recurso_huamno').val()=='' || $('#archivo_recurso_huamno').val().substr(-5).toLowerCase()!='.xlsx'){
			msg+='Debe seleccionar un archivo Excel (con formato formato .xlsx)<br />';
		}

		if(msg!=''){
			$('#error_form').html(msg);
			$('#error_form').show();
			$('html,body').scrollTop(0);
		}
		else{
//no me agrada esta forma de cargar el archivo
			var formData = new FormData();

			formData.append("accion",modo);
			formData.append("tipoArchivo",$('#tipo_archivo_select').val());
			formData.append("userfile", document.getElementById('archivo_recurso_huamno').files[0]);

			var request = new XMLHttpRequest();
			request.open("POST", "parts-admin/cargar_recurso_humano.php");
			request.send(formData);

			request.onload = function(oEvent) {
				var jsonArr = JSON.parse(request.responseText);
				if(jsonArr.estado==false){
					$('#error_form').html(jsonArr.errores);
					$('#error_form').show();
				}
				else{
					$('#exito_form').html('Archivo cargado con éxito');
					$('#exito_form').show();
				}
				$('#preview').html(jsonArr.preliminar);
				$('html,body').scrollTop(0);

				if(modo=='cargar_recurso_humano'){
					$('#tipo_archivo_select').val('');
					$('#archivo_recurso_huamno').val('');
				}
			};

		}
	}
</script>