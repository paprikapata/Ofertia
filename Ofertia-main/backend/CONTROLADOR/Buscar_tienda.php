<html>

<head>

</head>
    <body>
    <?php
        include '../MODELO/base_de_datos.php'; /*include es para incluir una conexcion ya creada*/ 

    ?>
          <table id="Tabla">
            <tr>
                <th>NUMER_DE_TIENDA</th><!--el th es para nombrar una columna en la tabla-->
                <th>NOMBRE</th>
                <th>ID_PRODUCTOS</th>
                <th>URL</th>
            </tr>
            <?php
               /*Se pone el select*/ 
               $consultar ="SELECT * FROM tienda";   
               $resultado =$mysqli ->query($consultar);
                if($resultado -> num_rows>0){
                    while($row= $resultado-> fetch_assoc()){?><!--Mientras aya contenido por revisar -->
                    <tr>
                        <td><?php echo $row['NUMER_DE_TIENDA']?></td>
                        <td><?php echo $row['NOMBRE']?></td>
                        <td><?php echo $row['ID_PRODUCTOS']?></td>
                        <td><?php echo $row['URL']?></td>
                        
<td><a href="actualizar_tiendas.php?NUMER_DE_TIENDA=<?php echo $row['NUMER_DE_TIENDA'] ?>"><button>actualizar</a></button></td> <!--se agrega la llave primaria dentro del php-->
                        <td><a href="eliminar_tienda.php?NUMER_DE_TIENDA=<?php echo $row['NUMER_DE_TIENDA'] ?>"><button>Borrar</a></button></td> <!--se agrega la llave primaria dentro del php-->
                    </tr>
                    <?php

                    }
                        
                }
           
           ?>
    </table>
  </body>

</html>