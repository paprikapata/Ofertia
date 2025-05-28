
<?php 
        include '../MODELO/base_de_datos.php';

    $ID_COMENTARIO=$_POST["ID_COMENTARIO"];
        $TIPO_DE_COMENTARIO=$_POST["TIPO_DE_COMENTARIO"];
            $Explicacion=$_POST["Explicacion"];
            $ID_USUARIO=$_POST["ID_USUARIO"];

                $insert="INSERT INTO comentarios(ID_COMENTARIO,TIPO_DE_COMENTARIO,Explicacion,ID_USUARIO)VALUES ('$ID_COMENTARIO','$TIPO_DE_COMENTARIO','$Explicacion','$ID_USUARIO')";

if($mysqli ->query($insert)) {?>
<script>
    alert("Registrado con exito")
    window.location="../../frontend/AGREGAR_COMENTARIO.html"
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


