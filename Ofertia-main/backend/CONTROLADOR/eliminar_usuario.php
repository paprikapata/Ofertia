<!DOCTYPE html>
<html lang="en">
<head>

    <title>Eliminar</title>
</head>
<body>
 

<?php
            include '../MODELO/base_de_datos.php'; /*include es para incluir una conexcion ya creada*/ 
            $ID_USUARIO=$_GET['ID_USUARIO'];
  $eliminar="delete from usuario where ID_USUARIO='$ID_USUARIO' ";
 
 
 
 
if($mysqli ->query($eliminar)) {?>
<script>
    alert("Se elimino:D")
    window.location="admin.php"
</script>
<?php
} else{?>
<script>
    alert("No se elimino:C")
    window.location="admin.php"
</script>
<?php
}



?>


</body>
</html>