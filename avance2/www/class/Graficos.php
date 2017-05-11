<?php 
	class Graficos
	{

		function estilos($carpeta=null)
		{
			$salida="";

			$salida=" <link rel='stylesheet'  type='text/css' href='$carpeta/css/bootstrap.css'>";
					 
			return $salida;		 
		}
		
		

	}


 ?>