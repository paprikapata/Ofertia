<!DOCTYPE html>
<html lang="en">
<head>
    <title>Actualizar</title>
</head>
<body>
<?php
    include '../MODELO/base_de_datos.php';
    
    if(isset($_POST['actualizar'])) {
        $id_producto = $_POST['id_producto'];
        $nombre = $_POST['nombre'];
        $precio = $_POST['precio'];
        $tienda = $_POST['tienda'];
        $id_categoria = $_POST['id_categoria'];
        
  
        if(isset($_FILES['imagen']) && $_FILES['imagen']['size'] > 0) {
            $imagen = file_get_contents($_FILES['imagen']['tmp_name']);
            $actualizar = "UPDATE productos SET nombre='$nombre', precio='$precio', imagen_url=?, tienda='$tienda', id_categoria='$id_categoria' WHERE id_producto='$id_producto'";
            $stmt = $mysqli->prepare($actualizar);
            $stmt->bind_param('s', $imagen);
            $resultado = $stmt->execute();
        } else {
            $actualizar = "UPDATE productos SET nombre='$nombre', precio='$precio', tienda='$tienda', id_categoria='$id_categoria' WHERE id_producto='$id_producto'";
            $resultado = $mysqli->query($actualizar);
        }
        
        if($resultado) {
            echo "<script>\n";
            echo "    alert('Producto actualizado exitosamente')\n";
            echo "    window.location='admin.php'\n";
            echo "</script>\n";
        } else {
            echo "<script>\n";
            echo "    alert('Error al actualizar el producto')\n";
            echo "    window.location='admin.php'\n";
            echo "</script>\n";
        }
    } else {
        // Obtener datos del producto
        $id_producto = $_GET['id_producto'];
        $consulta = "SELECT * FROM productos WHERE id_producto='$id_producto'";
        $resultado = $mysqli->query($consulta);
        $producto = $resultado->fetch_assoc();
?>
        <form method="POST" enctype="multipart/form-data">
            <table>
                <tr>
                    <th>Campo</th>
                    <th>Valor</th>
                </tr>
                <tr>
                    <td>ID Producto:</td>
                    <td>
                        <?php echo $producto['id_producto']; ?>
                        <input type="hidden" name="id_producto" value="<?php echo $producto['id_producto']; ?>" readonly>
                    </td>
                </tr>
                <tr>
                    <td>Nombre del Producto:</td>
                    <td><input type="text" name="nombre" value="<?php echo $producto['nombre']; ?>" required></td>
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input type="number" step="0.01" name="precio" value="<?php echo $producto['precio']; ?>" required></td>
                </tr>
                <tr>
                    <td>Imagen Actual:</td>
                    <td>
                        <img src="data:image/jpg;base64,<?php echo base64_encode($producto['imagen_url']); ?>" width="100">
                        <br>Nueva Imagen (opcional):<br>
                        <input type="file" name="imagen">
                    </td>
                </tr>
                <tr>
                    <td>Tienda:</td>
                    <td><input type="text" name="tienda" value="<?php echo $producto['tienda']; ?>" required></td>
                </tr>
                <tr>
                    <td>Categoría:</td>
                    <td><input type="text" name="id_categoria" value="<?php echo $producto['id_categoria']; ?>" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="actualizar" value="Actualizar Producto">
                    </td>
                </tr>
            </table>
        </form>
<?php
    }
?>
</body>
</html>


