<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Administrador - Ofertia</title>
    <link rel="stylesheet" href="../../frontend/CSS/admin.css">
</head>
<?php
    include '../MODELO/base_de_datos.php';
 ?>
<body>
    <div class="admin-container">
        <nav class="admin-sidebar">
            <div class="admin-logo">
            <a href="../../frontend/index.html"><img src="../../frontend/IMG/logo.png" alt="Ofertia Logo" ></a>
          
                <h2>Panel Admin</h2>
            </div>
            <ul class="admin-menu">
                <li class="active" data-section="dashboard">Dashboard</li>
                <li data-section="users">Usuarios</li>
                <li data-section="comments">Comentarios</li>
                <li data-section="products">Productos</li>
                <li data-section="product-options">Opciones de Producto</li>
                <li data-section="stores">Tiendas</li>
            </ul>
        </nav>

        <main class="admin-main">
            <header class="admin-header">
                <div class="admin-search">
                    <input type="text" placeholder="Buscar...">
                </div>
                <div class="admin-profile">
                    <span class="admin-role">Super Admin</span>
                    <img src="../../frontend/IMG/circulo-de-usuario.png" alt="Admin Profile">
                </div>
            </header>

            <div class="admin-content">
                <!-- Dashboard Section -->
                <section id="dashboard" class="active">
                    <h2>Dashboard</h2>
                    <div class="stats-grid">
                        <div class="stat-card">
                            <h3>Total Usuarios</h3>
                            <p class="stat-number">0</p>
                        </div>
                        <div class="stat-card">
                            <h3>Productos Activos</h3>
                            <p class="stat-number">0</p>
                        </div>
                        <div class="stat-card">
                            <h3>Comentarios Nuevos</h3>
                            <p class="stat-number">0</p>
                        </div>
                        <div class="stat-card">
                            <h3>Tiendas Activas</h3>
                            <p class="stat-number">0</p>
                        </div>
                    </div>
                </section>

                <!-- Users Section -->
                <section id="users">
                    <h2>Gestión de Usuarios</h2>
                    <div class="table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID_USUARIO</th>
                                    <th>NOMBRE_USUARIO</th>
                                    <th>CONTRASEÑA</th>
                                    <th>EMAIL</th>
                                    <th>TELEFONO</th>
                                </tr>
                            </thead>
                            <tbody id="users-table-body">

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
                            </tbody>
                        </table>
                    </div>
                </section>

                <!-- Other sections with similar structure -->
                <section id="comments">
                   
                <h2>Gestión de Comentarios</h2>
                    <div class="table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID_COMENTARIO</th>
                                    <th>TIPO_DE_COMENTARIO</th>
                                    <th>Explicacion</th>
                                    <th>ID_USUARIO</th>

                                </tr>
                            </thead>
                            <tbody id="comments-table-body"></tbody>
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
                    </div>
                </section>

                <!-- Products Section -->
                <section id="products">
                    <h2>Gestión de Productos</h2>
                    <div class="table-actions">
                        <a href="../../frontend/AGREGAR_PRODUCTO.html"><button>Agregar Producto</button></a>
                    </div>
                    <div class="table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>id_producto</th>
                                    <th>Nombre</th>
                                    <th>precio</th>
                                    <th>imagen_url</th>
                                    <th>id_categoria</th>

                                </tr>
                            </thead>
                            <tbody id="products-table-body"></tbody>
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
                    </div>
                </section>

                <!-- Product Options Section -->
                <section id="product-options">
                    <h2>Gestión de Opciones de Producto</h2>
                    <div class="table-actions">
                        <a href="../../frontend/AGREGAR_OPCION_DE_PRODUCTO.html"><button>Agregar Opción de Producto</button></a>
                    </div>
                    <div class="table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID_PRODUCTO</th>
                                    <th>PRECIO</th>
                                    <th>NOMBRE_TIENDA</th>
                                    <th>ID_TIENDA</th>
                                    <th>ID_PROD2</th>
                                    <th>NOMBRE_P</th>
                                </tr>
                            </thead>
                            <tbody id="product-options-table-body"></tbody>
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
                    </div>
                </section>

                <!-- Stores Section -->
                <section id="stores">
                    <h2>Gestión de Tiendas</h2>
                    <div class="table-actions">

                    </div>
                    <div class="table-container">
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>NUMER_DE_TIENDA</th>
                                    <th>NOMBRE</th>
                                    <th>ID_PRODUCTOS</th>
                                    <th>URL</th>

                                </tr>
                            </thead>
                            <tbody id="stores-table-body"></tbody>
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
                    </div>
                </section>
            </div>
        </main>
    </div>

    <script src="../../frontend/js/admin.js"></script>
</body>
</html>