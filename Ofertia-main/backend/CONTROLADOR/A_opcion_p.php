
?>
<?php 
        include '../MODELO/base_de_datos.php';

    $ID_PRODUCTO=$_POST["ID_PRODUCTO"];
        $PRECIO=$_POST["PRECIO"];
            $NOMBRE_TIENDA=$_POST["NOMBRE_TIENDA"];
                 $ID_TIENDA=$_POST["ID_TIENDA"];
                    $ID_PROD2=$_POST["ID_PROD2"];
                         $NOMBRE_P=$_POST["NOMBRE_P"];

                $insert="INSERT INTO opciones_del_producto(ID_PRODUCTO, PRECIO, NOMBRE_TIENDA, ID_TIENDA, ID_PROD2, NOMBRE_P)VALUES ('$ID_PRODUCTO','$PRECIO','$NOMBRE_TIENDA','$ID_TIENDA','$ID_PROD2','$NOMBRE_P')";

if($mysqli ->query($insert)) {?>
<script>
    alert("agregado con exito")
    window.location="../vista/html/principal_MS.html"
</script>
<?php
} else{?>
<script>
    alert("no se guardo el producto")
    window.location="../VISTA/HTML/Opcion_de_p.html"
</script>
<?php
}

?>