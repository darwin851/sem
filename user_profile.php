<?php 

	include('parts-admin/header.php');
	
	include('parts-admin/menu.php');

	if (isset($_GET['update'])) {
    	include('parts-admin/update_password.php');
	
	}else{
		include('parts-admin/profile.php');
		
	}

	include('parts-admin/footer_without_grafs.php');

?>