
<!--registrar un usuario-->
<?php 
        include '../MODELO/base_de_datos.php';

    $ID_USUARIO=$_POST["ID_USUARIO"];
        $NOMBRE_USUARIO=$_POST["NOMBRE_USUARIO"];
            $password=$_POST["password"];
            $email=$_POST["email"];
                $TELEFONO=$_POST["TELEFONO"];

                $insert="INSERT INTO usuario(ID_USUARIO, NOMBRE_USUARIO, CONTRASEÑA, EMAIL, TELEFONO)VALUES ('$ID_USUARIO','$NOMBRE_USUARIO','$password','$email','$TELEFONO')";

if($mysqli ->query($insert)) {?>
<script>
    alert("Registrado con exito")
    window.location="../../frontend/REGISTRARSE.html"
</script>
<?php
} else{?>
<script>
    alert("no se guardo el ususario")
    window.location="../VISTA/HTML/Registrarse.html"
</script>
<?php
}

?>


