<!DOCTYPE html>
<html lang="en">
<head>
    <title>Actualizar</title>
</head>
<body>
<?php
    include '../MODELO/base_de_datos.php';
    $ID_COMENTARIO = $_GET['ID_COMENTARIO'];
    
    $consulta = "SELECT * FROM comentarios WHERE ID_COMENTARIO='$ID_COMENTARIO'";
    $resultado = $mysqli->query($consulta);
    $row = $resultado->fetch_assoc();
?>
    <form method="post">

    <td>ID_COMENTARIO:</td>
  

    <td><input type="number" name="ID_COMENTARIO" value="<?php echo $row['ID_COMENTARIO']; ?>" readonly></td><!--ID_COMENTARIO-->
    
                    <input type="text" name="TIPO_DE_COMENTARIO" id="TIPO_DE_COMENTARIO" placeholder="RECLAMO,VALORACION,QUEJA"><!--TIPO_DE_COMENTARIO-->

                        <input type="text" name="Explicacion" id="Explicacion" placeholder="Explicacion "><!--Explicacion-->

                        <td><input type="number" name="ID_USUARIO" value="<?php echo $row['ID_USUARIO']; ?>"readonly></td><!--ID_USUARIO-->
            </tr>
        </table>
        <input type="submit" name="actualizar" value="Actualizar">
    </form>
<?php
if(isset($_POST['actualizar'])) {
    $ID_COMENTARIO=$_POST["ID_COMENTARIO"];
    $TIPO_DE_COMENTARIO=$_POST["TIPO_DE_COMENTARIO"];
        $Explicacion=$_POST["Explicacion"];
        $ID_USUARIO=$_POST["ID_USUARIO"];

    $actualizar = "UPDATE comentarios SET ID_COMENTARIO='$ID_COMENTARIO', TIPO_DE_COMENTARIO='$TIPO_DE_COMENTARIO', Explicacion='$Explicacion', ID_USUARIO='$ID_USUARIO' WHERE ID_COMENTARIO='$ID_COMENTARIO'";


    if($mysqli->query($actualizar)) {
        echo "<script>\n";
        echo "    alert('Se actualizó :D')\n";
        echo "    window.location='admin.php'\n";
        echo "</script>\n";
    } else {
        echo "<script>\n";
        echo "    alert('No se actualizó :C')\n";
        echo "    window.location='admin.php'\n";
        echo "</script>\n";
    }
}
?>
</body>
</html>
<?php
?>