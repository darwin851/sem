<footer id="footer" class="site-footer" style="display:none">
		
		</footer>		
	    
		
				<!--script src="js/jquery.js"></script-->
				<script src="js/bootstrap.js"></script>
				<script src="js/metisMenu.js"></script>
				<script src="js/imagesloaded.js"></script>
				<script src="js/masonry.js"></script>
				<script src="js/pace.js"></script>
				<script src="js/numeral.js"></script>
				<script src="js/main.js"></script>

<?php 
$url = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$path = parse_url($url, PHP_URL_PATH);
$path_two=explode('/',$path);
if ($path_two[3] == "participante.php"){
	echo '
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script type="text/javascript">
      $(".myselect").select2();
	$(".municipios_sv").select2();
	$(".departments").select2();
</script>';

};



?>
				
	</body>
</html>