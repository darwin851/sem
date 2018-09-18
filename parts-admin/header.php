<?php

include "conexion.php"; database_connect();

?>
<!DOCTYPE html>
<html>
	<head>
		<title>SIEM</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">    
		<link rel="shortcut icon" href="images/favicon.ico">  
		<link href="//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
				<link rel="stylesheet" href="css/bootstrap.css">
				<link rel="stylesheet" href="css/metisMenu.css">
				<link rel="stylesheet" href="css/font-awesome.css">
				<link rel="stylesheet" href="css/elegant-icons.css">
				<link rel="stylesheet" href="css/pe-7-icons.css">
				<link rel="stylesheet" href="css/pe-7-icons-helper.css">
				<link rel="stylesheet" href="css/styles2.css">
				<link rel="stylesheet" href="css/dashboard-projects.css">
				<link rel="stylesheet" href="css/profile_account.css">
				<script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>


<script>
function getMunicipio(val) {
	$.ajax({
	type: "POST",
	url: "parts-admin/municipio.php",
	data:'id_departamento='+val,
	success: function(data){		
		$("#municipios").html(data);
	}
	});
}


function getce(val) {
	$.ajax({
	type: "POST",
	url: "parts-admin/ce.php",
	data:'id_municipio='+val,
	success: function(data){
		console.log(data);
		$("#centro_educativo").html(data);
	}
	});
}
</script>



				
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		
		<?php 
$url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$path = parse_url($url, PHP_URL_PATH);
$path_two=explode('/',$path);
if ($path_two[3] == "participante.php"){
	echo '
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />';

}
if ($path_two[3] == "actividades.php"){
	echo '
<link rel="stylesheet" href="css/activities.css">';

}
?>



		
	</head>	
	
   	<body class="preload" data-trigger="tutorial">
    	<div id="top-alert" class="alert alert-promo alert-dismissible fade in text-center" role="alert" style="display:none">
    	  	</div>		<header class="header">
			<div class="branding float-left">
				<h1 class="logo text-center">
					<a href="index.html">
						<img class="logo-icon" src="images/logofhi.jpg" alt="icon" />
					</a>
				</h1>
			</div>
			<div class="topbar">
				<button id="main-nav-toggle" class="main-nav-toggle" type="button">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<i class="icon fa fa-caret-left"></i>
				</button>
				<div class="navbar-tools">
					<div class="user-container dropdown">
						<div class="dropdown-toggle" id="dropdownMenu-user" data-toggle="dropdown" aria-expanded="true" role="button">
							<img src="images/profiles/profile-3.png" alt="" />
							<i class="fa fa-caret-down"></i>
						</div>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu-user" >
							<li><span class="arrow"></span><a role="menuitem" href="user_profile.php"><span class="pe-icon pe-7s-user icon"></span>Mi Cuenta</a></li>
							<li><a role="menuitem" href="login.html"><span class="pe-icon pe-7s-power icon"></span>Salir</a></li>
						</ul>
					</div>
				</div>
			</div>
		</header>		