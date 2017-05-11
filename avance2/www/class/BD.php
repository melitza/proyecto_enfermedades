<?php 
/**
	*Melitza Mondragon
	*Yeison Murillo
*/

include 'Graficos.php';
class BD extends Graficos

	{

		public $conexion; //variable publica


		function BD ()
			{//esta funcion es la constructora.
				$this->conexion=$this->crear_conexion();
			}//fin de la funcion


		 function crear_conexion ()
			 {//esta funcion es la que crea la conexion con el servidor
			 	include('config.php');
			 	return mysqli_connect($servidor,$usuario,$clave,$bd);
			 }//fin de la funcion crear conexion


		 function consultar_tablas($campo_a_mostrar,$sql_antes=null)
				 {//funcion consulta de tablas
				 	echo "<center>";
				 	$sql = "SELECT $sql_antes $campo_a_mostrar from tb_enfermedades ,tb_sintomas , tb_informe where tb_informe.id_enfermedad=tb_enfermedades.id_enfermedad and tb_informe.id_sintomas=tb_sintomas.id_sintomas";
				 	$resultado = $this->conexion->query( $sql );	
				 	return $resultado;
				 }//fin de la funcion cosultar tabla
		  


		 function leer_campo ($resultado,$th)

		 {//funcion encargada de tarer datos de la tabla
		 	echo "<center><br><br>";
				 	$salida = 
				 "<table class='table-bordered table-striped'>
				<thead>
		      <tr>
		       $th
		      </tr>
		    </thead>";
		    $salida .= "<tr>";
		 	while( $fila = mysqli_fetch_array( $resultado ) )

			{

				for( $i = 0; $i < mysqli_num_fields( $resultado ); $i ++ )
				$salida .="<td>".$fila[ $i ]."</td>";
				$salida .= "</tr>";

			}
			$salida .= "</table>";

		return $salida;	

		 }


		 function traer_informacion( $nombre_lista, $tabla, $campo_llave_primaria, $campo_a_mostrar,$method,$action )
	{//esta funcion se encarga de traer la informacion en pantalla
		
	    
		$salida = "";
echo "<center>";
		$sql = "SELECT * FROM  $tabla ";	
		$resultado = $this->conexion->query( $sql );
	    

		$salida = "
				
				   <form action='$action' method='$method'>
					<table class='table table-fixed'>
						<thead>
						 <tr>
						 <center>
						        <h1>Sintomas</h1>
						        </center>						      
						      </tr>
						</thead>
						<tbody>";
								$contador=0;
							while( $fila = mysqli_fetch_assoc( $resultado ) )
							{
									$contador ++;
								
								$salida .=
								//lista de obcion multiple
									 "
									 <tr>
									 	<td>
									 	
											<input type='checkbox' name='$nombre_lista$contador' value='".$fila[ $campo_llave_primaria ]."'>".$fila[ $campo_a_mostrar ]."

										</td>
									 </tr>";
									
							}
							
							
		$salida .=" </tbody>
					</table>
					
					<input type='hidden' name='contador' value='".$contador."'>
					<br><center>
					<input class='btn btn-info' type='submit' value='enviar'>
				 </form>";

		return $salida;	


	}


		 function consultar($valores)

		 {//esta funcion se encarga realizar la consulta en la tabla.

			

		 	$sql="";
			$sql = "SELECT tb_enfermedades.enfermedad , COUNT(tb_informe.id_enfermedad) as conteo_sintomas , (SELECT COUNT(tb_informe.id_enfermedad) conteo_total FROM tb_informe where tb_enfermedades.id_enfermedad = tb_informe.id_enfermedad GROUP BY id_enfermedad) as conteo_total FROM tb_informe , tb_enfermedades WHERE tb_informe.id_enfermedad = tb_enfermedades.id_enfermedad AND tb_informe.id_sintomas in ($valores) GROUP BY tb_informe.id_enfermedad";

		 	
		 	$resultado = $this->conexion->query( $sql );	
		 	return $resultado;
		 }





	}

 ?>
 <html>
 <head>



 	<title></title>
 </head>
 <body>
 	
 

 </body>
 </html>