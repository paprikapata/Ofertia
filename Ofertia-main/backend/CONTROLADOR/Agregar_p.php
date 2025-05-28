<?php 
        include '../MODELO/base_de_datos.php';
    
    $id_producto=$_POST["id_producto"];
        $nombre=$_POST["nombre"];
            $precio=$_POST["precio"];
                     $imagen_url= addslashes(file_get_contents($_FILES['imagen_url']['tmp_name']));
                        $tienda=$_POST["tienda"];
                            $id_categoria=$_POST["id_categoria"];
                 
                $insert="INSERT INTO productos(id_producto, nombre, precio, imagen_url,tienda,id_categoria)VALUES ('$id_producto','$nombre','$precio','$imagen_url','$tienda','$id_categoria')";

if($mysqli ->query($insert)) {?>
<script>
    alert("agregado con exito")
    window.location="../../frontend/AGREGAR_PRODUCTO.html"
</script>
<?php
} else{?>
<script>
    alert("no se guardo el producto")
    window.location="../VISTA/HTML/Registrar_producto.html"
</script>
<?php
}
