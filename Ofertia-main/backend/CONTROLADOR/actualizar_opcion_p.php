<!DOCTYPE html>
<html lang="en">
<head>
    <title>Actualizar</title>
</head>
<body>
<?php
    include '../MODELO/base_de_datos.php';
    $ID_PRODUCTO = $_GET['ID_PRODUCTO'];
 
    $consulta = "SELECT * FROM opciones_del_producto WHERE ID_PRODUCTO='$ID_PRODUCTO'";
    $resultado = $mysqli->query($consulta);
    $row = $resultado->fetch_assoc();
?>
    <form method="post">
        <table>

  
  

    <tr>
        <td>ID_PRODUCTO</td>               
    <td><input type="number" name="ID_PRODUCTO" value="<?php echo $row['ID_PRODUCTO']; ?>"readonly></td><!--ID_PRODUCTO-->
    </tr>

      <tr> 
          <td>PRECIO</td>                 
    <td><input type="number" name="PRECIO" value="<?php echo $row['PRECIO']; ?>"><!--PRECIO--></td>
    </tr> 
     
      <tr> 
        <td>NOMBRE_TIENDA</td>    
    <td><input type="text" name="NOMBRE_TIENDA" value="<?php echo $row['NOMBRE_TIENDA']; ?>"><!--NOMBRE_TIENDA--></td>
    </tr>               
             
      <tr>   
        <td>ID_TIENDA</td>  
    <td><input type="number" name="ID_TIENDA" value="<?php echo $row['ID_TIENDA']; ?>"><!--ID_TIENDA--></td>
    </tr> 
             
      <tr>   
        <td>ID_PROD2</td>  
    <td><input type="number" name="ID_PROD2" value="<?php echo $row['ID_PROD2']; ?>"readonly><!--ID_PROD2--></td>
    </tr> 
             
      <tr>   
        <td>NOMBRE_P</td>  
    <td><input type="text" name="NOMBRE_P" value="<?php echo $row['NOMBRE_P']; ?>"><!--NOMBRE_P--></td>
    </tr> 
    
        </table>
        <input type="submit" name="actualizar" value="Actualizar">
    </form>
<?php
if(isset($_POST['actualizar'])) {

    $ID_PRODUCTO=$_POST["ID_PRODUCTO"];
        $PRECIO=$_POST["PRECIO"];
            $NOMBRE_TIENDA=$_POST["NOMBRE_TIENDA"];
                 $ID_TIENDA=$_POST["ID_TIENDA"];
                    $ID_PROD2=$_POST["ID_PROD2"];
                         $NOMBRE_P=$_POST["NOMBRE_P"];


    $actualizar = "UPDATE opciones_del_producto SET ID_PRODUCTO='$ID_PRODUCTO', PRECIO='$PRECIO', NOMBRE_TIENDA='$NOMBRE_TIENDA', ID_TIENDA='$ID_TIENDA', ID_PROD2='$ID_PROD2', NOMBRE_P='$NOMBRE_P'  WHERE ID_PRODUCTO='$ID_PRODUCTO'";


    if($mysqli->query($actualizar)) {
        echo "<script>\n";
        echo "    alert('Se actualizó :D')\n";
        echo "    window.location='buscar_opciones_p.php'\n";
        echo "</script>\n";
    } else {
        echo "<script>\n";
        echo "    alert('No se actualizó :C')\n";
        echo "    window.location='buscar_opciones_p.php'\n";
        echo "</script>\n";
    }
}
?>
</body>
</html>
<?php
?><!DOCTYPE html>
<html lang="en">
<head>
    <title>Actualizar</title>
</head>
<body>
<?php
    include '../MODELO/base_de_datos.php';
    $ID_PRODUCTO = $_GET['ID_PRODUCTO'];
 
    $consulta = "SELECT * FROM opciones_del_producto WHERE ID_PRODUCTO='$ID_PRODUCTO'";
    $resultado = $mysqli->query($consulta);
    $row = $resultado->fetch_assoc();
?>
    <form method="post">
        <table>

  
  

    <tr>
        <td>ID_PRODUCTO</td>               
    <td><input type="number" name="ID_PRODUCTO" value="<?php echo $row['ID_PRODUCTO']; ?>"readonly></td><!--ID_PRODUCTO-->
    </tr>

      <tr> 
          <td>PRECIO</td>                 
    <td><input type="number" name="PRECIO" value="<?php echo $row['PRECIO']; ?>"><!--PRECIO--></td>
    </tr> 
     
      <tr> 
        <td>NOMBRE_TIENDA</td>    
    <td><input type="text" name="NOMBRE_TIENDA" value="<?php echo $row['NOMBRE_TIENDA']; ?>"><!--NOMBRE_TIENDA--></td>
    </tr>               
             
      <tr>   
        <td>ID_TIENDA</td>  
    <td><input type="number" name="ID_TIENDA" value="<?php echo $row['ID_TIENDA']; ?>"><!--ID_TIENDA--></td>
    </tr> 
             
      <tr>   
        <td>ID_PROD2</td>  
    <td><input type="number" name="ID_PROD2" value="<?php echo $row['ID_PROD2']; ?>"readonly><!--ID_PROD2--></td>
    </tr> 
             
      <tr>   
        <td>NOMBRE_P</td>  
    <td><input type="text" name="NOMBRE_P" value="<?php echo $row['NOMBRE_P']; ?>"><!--NOMBRE_P--></td>
    </tr> 
    
        </table>
        <input type="submit" name="actualizar" value="Actualizar">
    </form>
<?php
if(isset($_POST['actualizar'])) {

    $ID_PRODUCTO=$_POST["ID_PRODUCTO"];
        $PRECIO=$_POST["PRECIO"];
            $NOMBRE_TIENDA=$_POST["NOMBRE_TIENDA"];
                 $ID_TIENDA=$_POST["ID_TIENDA"];
                    $ID_PROD2=$_POST["ID_PROD2"];
                         $NOMBRE_P=$_POST["NOMBRE_P"];


    $actualizar = "UPDATE opciones_del_producto SET ID_PRODUCTO='$ID_PRODUCTO', PRECIO='$PRECIO', NOMBRE_TIENDA='$NOMBRE_TIENDA', ID_TIENDA='$ID_TIENDA', ID_PROD2='$ID_PROD2', NOMBRE_P='$NOMBRE_P'  WHERE ID_PRODUCTO='$ID_PRODUCTO'";


    if($mysqli->query($actualizar)) {
        echo "<script>\n";
        echo "    alert('Se actualizó :D')\n";
        echo "    window.location='buscar_opciones_p.php'\n";
        echo "</script>\n";
    } else {
        echo "<script>\n";
        echo "    alert('No se actualizó :C')\n";
        echo "    window.location='buscar_opciones_p.php'\n";
        echo "</script>\n";
    }
}
?>
</body>
</html>
<?php
?>