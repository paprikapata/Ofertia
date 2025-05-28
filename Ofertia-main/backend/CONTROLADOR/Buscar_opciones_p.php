<html>

<head>
</head>
  
    <body>
    <?php
        include '../MODELO/base_de_datos.php'; /*include es para incluir una conexcion ya creada*/ 

    ?>
       <table id="Tabla">
            <tr>
                <th>ID_PRODUCTO</th><!--el th es para nombrar una columna en la tabla-->
                <th>PRECIO</th>
                <th>NOMBRE_TIENDA</th>
                <th>ID_TIENDA</th>
                <th>ID_PROD2</th>
                <th>NOMBRE_P</th>
            </tr>
            <?php
               /*Se pone el select*/ 
               $consultar ="SELECT * FROM opciones_del_producto";   
               $resultado =$mysqli ->query($consultar);
                if($resultado -> num_rows>0){
                    while($row= $resultado-> fetch_assoc()){?><!--Mientras aya contenido por revisar -->
                    <tr>
                        <td><?php echo $row['ID_PRODUCTO']?></td>
                        <td><?php echo $row['PRECIO']?></td>
                        <td><?php echo $row['NOMBRE_TIENDA']?></td>
                        <td><?php echo $row['ID_TIENDA']?></td>
                        <td><?php echo $row['ID_PROD2']?></td>
                        <td><?php echo $row['NOMBRE_P']?></td>
                <td><a href="actualizar_opcion_p.php?ID_PRODUCTO=<?php echo $row['ID_PRODUCTO'] ?>"><button>Actualizar</button></a></td>
                  <td><a href="eliminar_o_p.php?ID_PRODUCTO=<?php echo $row['ID_PRODUCTO'] ?>"><button>Borrar</a></button></td> <!--se agrega la llave primaria dentro del php-->
                    </tr>
                    <?php

                    }
                        
                }
           
           ?>
    </table>
  </body>

</html>