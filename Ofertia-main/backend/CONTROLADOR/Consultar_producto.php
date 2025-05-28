<html>

<head>

</head>


    <body>
    <?php
        include '../MODELO/base_de_datos.php'; /*include es para incluir una conexcion ya creada*/ 

    ?>
      <table id="Tabla">
            <tr>
                <th>ID PRODUCTO</th><!--el th es para nombrar una columna en la tabla-->
                <th>NOMBRE DEL PRODUCTO</th>
                <th>PRECIO</th>
                <th>FOTO</th>
                <th>TIENDA</th>
                <th>CATEGORIA</th>
            

            </tr>
            <?php
               /*Se pone el select*/ 
               $consultar ="SELECT * FROM productos";   
               $resultado =$mysqli ->query($consultar);
                if($resultado -> num_rows>0){
                    while($row= $resultado-> fetch_assoc()){?><!--Mientras aya contenido por revisar -->
                    <tr>
                        <td><?php echo $row['id_producto']?></td>
                        <td><?php echo $row['nombre']?></td>
                        <td><?php echo $row['precio']?></td>
                        <TD><img src="data:image/jpg;base64,<?php echo base64_encode ($row['imagen_url']) ?>"></TD>
                        <td><?php echo $row['tienda']?></td>
                        <td><?php echo $row['id_categoria']?></td>
                        <td><a href="actualizar_producto.php?id_producto=<?php echo $row['id_producto'] ?>"><button>Actualizar</button></a></td>
                        <td><a href="eliminar_producto.php?id_producto=<?php echo $row['id_producto'] ?>"><button>Borrar</a></button></td> <!--se agrega la llave primaria dentro del php-->
                    </tr>
                    <?php

                    }
                        
                }
           
           ?>
    </table>
  </body>
</html>