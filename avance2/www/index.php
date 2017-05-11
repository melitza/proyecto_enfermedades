<!--
  *Melitza Mondragon
  *YEison Murillo
 -->
<!DOCTYPE html>
<html lang="ES">
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<head>
	<title>enfermedades</title>
	<link rel="stylesheet" type="text/css" href="css/estilo.css">
	<meta charset="utf-8">


	<?php 
		include 'class/BD.php'; //trae las funciones de la pagina BD.php
		$nuevo_obj=new BD();	// llama la clase BD
		echo $nuevo_obj->estilos("bootstrap"); //trae la función estilos de bootstrap de la clase
	?>

</head>
<body>

	<div class="container-fluid">





		<div class="row">
			<div class="col-xs-12 col-md-3 col-lg-3 ">
				<div class="panel panel-default">
				  <div class="panel-body"  style="max-height: 10;overflow-y: scroll;">
				
				<?php 

					echo $nuevo_obj->traer_informacion("sintoma","tb_sintomas","id_sintomas","sintoma","get","ver.php"); // trae la información a mostrar.
				?>
				  </div>
				 </div>
			</div>	
			<div class="col-xs-12 col-md-3 col-lg-5 ">


			</div>
		</div>
	</div>



<!--
<div id="caja"></div>
<div id="caja1"></div>
<div id="caja2"></div>-->


<div id="imagen">
  <img src="img/descarga (1).jpg" width="80%" height="200" />
</div>









</body>
</html>