<html>

<head>

</head>
  
    <body>
    <?php
        include '../MODELO/base_de_datos.php'; /*include es para incluir una conexcion ya creada*/ 

    ?>
           <table id="Tabla">
            <tr>
                <th>ID_USUARIO</th><!--el th es para nombrar una columna en la tabla-->
                <th>NOMBRE_USUARIO</th>
                <th>CONTRASEÑA</th>
                <th>EMAIL</th>
                <th>TELEFONO</th>
              

            </tr>
            <?php
               /*Se pone el select*/ 
               $consultar ="SELECT * FROM usuario";   
               $resultado =$mysqli ->query($consultar);
                if($resultado -> num_rows>0){
                    while($row= $resultado-> fetch_assoc()){?><!--Mientras aya contenido por revisar -->
                    <tr>
                        <td><?php echo $row['ID_USUARIO']?></td>
                        <td><?php echo $row['NOMBRE_USUARIO']?></td>
                        <td><?php echo $row['CONTRASEÑA']?></td>
                        <td><?php echo $row['EMAIL']?></td>
                        <td><?php echo $row['TELEFONO']?></td>
                        <td><a href="actualizar_usuario.php?ID_USUARIO=<?php echo $row['ID_USUARIO'] ?>"><button>Actualizar</button></a></td>
                        <td><a href="eliminar_usuario.php?ID_USUARIO=<?php echo $row['ID_USUARIO'] ?>"><button>Borrar</a></button></td> <!--se agrega la llave primaria dentro del php-->
                    </tr>
                    <?php

                    }
                        
                }
           
           ?>
    </table>
  </body>

</html>