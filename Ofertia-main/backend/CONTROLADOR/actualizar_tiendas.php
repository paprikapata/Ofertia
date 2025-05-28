<!DOCTYPE html>
<html lang="en">
<head>
    <title>Actualizar</title>
</head>
<body>
<?php
    include '../MODELO/base_de_datos.php';
    $NUMER_DE_TIENDA = $_GET['NUMER_DE_TIENDA'];
 
    $consulta = "SELECT * FROM tienda WHERE NUMER_DE_TIENDA='$NUMER_DE_TIENDA'";
    $resultado = $mysqli->query($consulta);
    $row = $resultado->fetch_assoc();
?>
    <form method="post">
        <table>

  
  

    <tr>
        <td>NUMER_DE_TIENDA</td>               
    <td><input type="number" name="NUMER_DE_TIENDA" value="<?php echo $row['NUMER_DE_TIENDA']; ?>"readonly ></td><!--NUMER_DE_TIENDA-->
    </tr>

      <tr> 
          <td>NOMBRE</td>                 
    <td><input type="text" name="NOMBRE" value="<?php echo $row['NOMBRE']; ?>"><!--NOMBRE--></td>
    </tr> 
     
      <tr> 
        <td>ID_PRODUCTOS</td>    
    <td><input type="number" name="ID_PRODUCTOS" value="<?php echo $row['ID_PRODUCTOS']; ?>" readonly><!--ID_PRODUCTOS--></td>
    </tr>               
             
      <tr>   
        <td>URL</td>  
    <td><input type="text" name="URL" value="<?php echo $row['URL']; ?>"><!--URL--></td>
    </tr> 
             
      <tr>   

    
        </table>
        <input type="submit" name="actualizar" value="Actualizar">
    </form>
<?php
if(isset($_POST['actualizar'])) {

    $NUMER_DE_TIENDA=$_POST["NUMER_DE_TIENDA"];
        $NOMBRE=$_POST["NOMBRE"];
            $ID_PRODUCTOS=$_POST["ID_PRODUCTOS"];
                 $URL=$_POST["URL"];

    $actualizar = "UPDATE tienda SET NUMER_DE_TIENDA='$NUMER_DE_TIENDA', NOMBRE='$NOMBRE', ID_PRODUCTOS='$ID_PRODUCTOS', URL='$URL'  WHERE NUMER_DE_TIENDA='$NUMER_DE_TIENDA'";


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