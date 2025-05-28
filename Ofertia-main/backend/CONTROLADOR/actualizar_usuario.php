<!DOCTYPE html>
<html lang="en">
<head>
    <title>Actualizar</title>
</head>
<body>
<?php
    include '../MODELO/base_de_datos.php';
    $ID_USUARIO = $_GET['ID_USUARIO'];
    
    $consulta = "SELECT * FROM usuario WHERE ID_USUARIO='$ID_USUARIO'";
    $resultado = $mysqli->query($consulta);
    $row = $resultado->fetch_assoc();
?>
    <form method="post">
        <input type="hidden" name="ID_USUARIO" value="<?php echo $ID_USUARIO; ?>" readonly>
        <table>
            <tr>
                <td>Nombre:</td>
                <td><input type="text" name="NOMBRE_USUARIO" value="<?php echo $row['NOMBRE_USUARIO']; ?>"></td>
            </tr>
            <tr>
                <td>Contraseña:</td>
                <td><input type="text" name="CONTRASEÑA" value="<?php echo $row['CONTRASEÑA']; ?>"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="EMAIL" value="<?php echo $row['EMAIL']; ?>"></td>
            </tr>
            <tr>
                <td>Teléfono:</td>
                <td><input type="text" name="TELEFONO" value="<?php echo $row['TELEFONO']; ?>"></td>
            </tr>
        </table>
        <input type="submit" name="actualizar" value="Actualizar">
    </form>
<?php
if(isset($_POST['actualizar'])) {
    $ID_USUARIO = $_POST['ID_USUARIO'];
    $NOMBRE_USUARIO = $_POST['NOMBRE_USUARIO'];
    $CONTRASEÑA = $_POST['CONTRASEÑA'];
    $EMAIL = $_POST['EMAIL'];
    $TELEFONO = $_POST['TELEFONO'];

    $actualizar = "UPDATE usuario SET NOMBRE_USUARIO='$NOMBRE_USUARIO', CONTRASEÑA='$CONTRASEÑA', EMAIL='$EMAIL', TELEFONO='$TELEFONO' WHERE ID_USUARIO='$ID_USUARIO'";

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