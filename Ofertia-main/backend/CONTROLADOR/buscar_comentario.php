<head>
        
<head>
</head>
</head>
   
    <body>
    <?php
        include '../MODELO/base_de_datos.php'; /*include es para incluir una conexcion ya creada*/ 

    ?>
        <table id="Tabla">
            <tr>
                <th>ID_COMENTARIO</th><!--el th es para nombrar una columna en la tabla-->
                <th>TIPO_DE_COMENTARIO</th>
                <th>Explicacion</th>
                <th>ID USUARIO</th>
            </tr>
            <?php
               /*Se pone el select*/ 
               $consultar ="SELECT * FROM comentarios";   
               $resultado =$mysqli ->query($consultar);
                if($resultado -> num_rows>0){
                    while($row= $resultado-> fetch_assoc()){?><!--Mientras aya contenido por revisar -->
                    <tr>
                        <td><?php echo $row['ID_COMENTARIO']?></td>
                        <td><?php echo $row['TIPO_DE_COMENTARIO']?></td>
                        <td><?php echo $row['Explicacion']?></td>
                        <td><?php echo $row['ID_USUARIO']?></td>
                        <td><a href="Actualizar_comentario.php?ID_COMENTARIO=<?php echo $row['ID_COMENTARIO'] ?>"><button>Actualizar</button></a></td>
                       <td><a href="eliminar_comentario.php?ID_COMENTARIO=<?php echo $row['ID_COMENTARIO'] ?>"><button >Borrar</a></button></td> <!--se agrega la llave primaria dentro del php-->
                    </tr>
                    <?php

                    }
                        
                }
           
           ?>
    </table>
  </body>

</html>