<!--
  *Melitza Mondragon
  *Yeison Murillo
-->

<?php 
echo "<center>";
$valores            = "";
$caracter_separador = ",";
$total_campos=$_GET['contador'];
for( $i = 1; $i <= $total_campos; $i ++ )       

        {
                    if (isset($_GET['sintoma'.$i]))
                     {
            			$valores .= $_GET[ 'sintoma'.$i ].$caracter_separador;
            	 
         			 }
            
       }
       $valores = substr ($valores, 0,- 1);

       include 'class/BD.php';
       $nuevo_obj=new BD();
       echo $nuevo_obj->leer_campo( $nuevo_obj->consultar($valores)," <th>Enfermedad</th><th>Sintomas Seleccionados</th><th>Sintomas presentes</th>");
       echo $nuevo_obj->estilos("bootstrap"); //trae la función estilos de bootstrap de la clase
?>
<html>
  <head>
    <title></title>
  </head>
  <body>
    <br><br>
      <form action='index.php' method='POST'>
            <input type="button" value="aceptar" onClick="window.location = 'http://localhost/CAMILO%20FIGUEROA/proyectos/avance2/index.php';"> 
      </form>
  </body>
</html>