<?php

    /*Nombre de la variabel*/$mysqli =new mysqli("localhost","root","","ofertia");
    if($mysqli -> connect_errno){
    echo "error de conexion" . $mysqli -> connect_error;
    exit();
    }
else{

echo"conexion exitosa";
    }
/**CREATE VIEW ver_productos as SELECT * FROM productos INNER JOIN opciones_del_producto ON productos.id_producto=opciones_del_producto.ID_PROD2 INNER JOIN tienda on opciones_del_producto.NOMBRE_TIENDA=tienda.NOMBRE WHERE tienda.NOMBRE= 'Falabella'; */
?>
