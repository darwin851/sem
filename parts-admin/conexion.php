<?php

	$host = "localhost";    
	$user = "root";        
	$password = "";   
	$database = "bd_siem"; 

	function database_connect(){

	    global $host, $database, $user, $password;

	    $link = @mysql_connect($host,$user,$password); 
		$sql_error = mysql_error();
	    if (!$link) { 
	        echo "Connection with the database couldn't be made.<br>";
			echo "$sql_error"; 
	        exit;
		 }
	  
	   if (!@mysql_select_db($database)) {
	        echo "The database couldn't be selected.";
	        exit;
		};

		
	   return $link;
	   mysql_close($link);
	}
?>