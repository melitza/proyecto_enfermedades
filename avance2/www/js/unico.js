/* 
    *Melitza Katerine Mondragon
    *Yeison Daniel Murillo
*/

console.log( "Funcionando" );


function al_dar_clic_en_lista()
{
    var lista = document.getElementById( "lista-opciones" );
    var contenedor_salida = document.getElementById( "contenedor-salida" );
    var salida = "";
    var conteo = 0;

    salida =  " SELECT * FROM diarrea, dolor_de_estomago t2, tb_sintoma t1 <br>";
    salida += " WHERE t1.id_sintoma = t2.id_sintoma <br>";
    salida += " AND   t2.id_enfermedad = t3.t2.id_enfermedad <br>";
    salida += " AND ( <br>";
    console.log( "Total de elementos de la lista: " + lista.length );

    for( var i = 0; i < lista.length; i ++ )
    {
        console.log( lista.item( i ).value );

        if( lista.item( i ).selected )
        {
            if( conteo > 0 ) salida += "&nbsp;&nbsp; OR ";
            salida = salida + "&nbsp;&nbsp; t1.id_sintoma = " + lista.item( i ).value + " <br>";
            console.log( "Seleccionado " );
            conteo ++;
        }
    }   

    salida += " ) <br>";

    contenedor_salida.innerHTML = salida;
}

