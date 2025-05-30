-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2025 a las 21:07:28
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE ofertia;
USE ofertia;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ofertia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Tecnología'),
(2, 'Electrodomésticos'),
(3, 'Moda'),
(4, 'Juguetes'),
(5, 'Hogar y muebles'),
(6, 'Libros y papelería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `ID_COMENTARIO` varchar(50) NOT NULL,
  `TIPO_DE_COMENTARIO` mediumtext NOT NULL,
  `Explicacion` mediumtext NOT NULL,
  `ID_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`ID_COMENTARIO`, `TIPO_DE_COMENTARIO`, `Explicacion`, `ID_USUARIO`) VALUES
('2', 'VALORACION', 'muy buenos tiempos de entrega', 2),
('3', 'QUEJA', 'No funciona mi contraseña y no me deja cambiarla', 3),
('55', 'cxzcxzcxzcxzcxz', '', 3),
('58', '5545454', '', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_del_producto`
--

CREATE TABLE `opciones_del_producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `NOMBRE_TIENDA` varchar(110) NOT NULL,
  `ID_TIENDA` int(11) NOT NULL,
  `ID_PROD2` int(11) NOT NULL,
  `NOMBRE_P` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `opciones_del_producto`
--

INSERT INTO `opciones_del_producto` (`ID_PRODUCTO`, `PRECIO`, `NOMBRE_TIENDA`, `ID_TIENDA`, `ID_PROD2`, `NOMBRE_P`) VALUES
(1, '3200000.00', 'Samsung', 1, 1, 'Samsung Galaxy S23 128GB'),
(2, '1100000.00', 'Linio', 2, 2, 'Apple AirPods Pro 2da Gen'),
(3, '2200000.00', 'Éxito', 3, 3, 'Portátil Lenovo 15.6\" Ryzen 5 8GB 512GB SSD'),
(4, '850000.00', 'Falabella', 4, 4, 'Xiaomi Redmi Note 12 128GB'),
(5, '120000.00', 'JBL', 5, 5, 'Audífonos Bluetooth JBL Tune 510BT'),
(6, '220000.00', 'Linio', 2, 6, 'Smartwatch Amazfit Bip U'),
(7, '750000.00', 'Samsung', 1, 7, 'Tablet Samsung Galaxy Tab A8 64GB'),
(8, '520000.00', 'LG', 6, 8, 'Monitor LG 24\" Full HD IPS'),
(9, '210000.00', 'Seagate', 7, 9, 'Disco Duro Externo Seagate 1TB'),
(10, '150000.00', 'Redragon', 8, 10, 'Teclado Mecánico Redragon Kumara'),
(11, '45000.00', 'Logitech', 9, 11, 'Mouse Inalámbrico Logitech M185'),
(12, '230000.00', 'Logitech', 9, 12, 'Cámara Web Logitech C920 HD'),
(13, '520000.00', 'HP', 10, 13, 'Impresora HP Ink Tank 315'),
(14, '1499000.00', 'LG', 6, 14, 'Smart TV LG 50\" 4K UHD'),
(15, '250000.00', 'Google', 11, 15, 'Google Chromecast 4K con Google TV'),
(16, '1200000.00', 'Éxito', 3, 16, 'Nevera Mabe 300L'),
(17, '180000.00', 'Falabella', 4, 17, 'Cafetera Oster'),
(18, '350000.00', 'Alkosto', 12, 18, 'Microondas Samsung 23L'),
(19, '1600000.00', 'HomeCenter', 13, 19, 'Lavadora LG 17kg'),
(20, '320000.00', 'Falabella', 4, 20, 'Aspiradora Electrolux'),
(21, '280000.00', 'Alkosto', 12, 21, 'Licuadora Oster Pro'),
(22, '420000.00', 'HomeCenter', 13, 22, 'Horno Eléctrico Black+Decker'),
(23, '250000.00', 'Éxito', 3, 23, 'Freidora de Aire Imusa'),
(24, '89000.00', 'Falabella', 4, 24, 'Plancha a Vapor Samurai'),
(25, '890000.00', 'Ktronix', 39, 25, 'Batidora KitchenAid'),
(26, '75000.00', 'Alkosto', 12, 26, 'Sandwichera Oster'),
(27, '320000.00', 'HomeCenter', 13, 27, 'Ventilador de Techo Industrial'),
(28, '780000.00', 'Haceb', 14, 28, 'Calentador de Agua Haceb'),
(29, '1200000.00', 'Falabella', 4, 29, 'Robot Aspirador iRobot'),
(30, '890000.00', 'Samsung', 1, 30, 'Purificador de Aire Samsung'),
(31, '250000.00', 'Falabella', 4, 31, 'Chaqueta de Cuero para Hombre'),
(32, '120000.00', 'Éxito', 3, 32, 'Vestido Floral para Mujer'),
(33, '280000.00', 'Nike', 15, 33, 'Zapatos Deportivos Nike Air'),
(34, '180000.00', 'Levis', 16, 34, 'Jeans Levis 501'),
(35, '150000.00', 'Zara', 17, 35, 'Bolso de Cuero para Dama'),
(36, '89000.00', 'Arturo Calle', 18, 36, 'Camisa de Lino para Hombre'),
(37, '350000.00', 'Studio F', 19, 37, 'Vestido de Noche Elegante'),
(38, '220000.00', 'Adidas', 20, 38, 'Tenis Adidas Superstar'),
(39, '180000.00', 'Zara', 17, 39, 'Blazer Formal para Mujer'),
(40, '450000.00', 'Fossil', 21, 40, 'Reloj Fossil para Hombre'),
(41, '95000.00', 'Vélez', 22, 41, 'Sandalias de Cuero'),
(42, '380000.00', 'Ray-Ban', 23, 42, 'Gafas de Sol Ray-Ban'),
(43, '140000.00', 'Nike', 15, 43, 'Mochila Nike Sportswear'),
(44, '65000.00', 'Tennis', 24, 44, 'Bufanda de Lana'),
(45, '85000.00', 'Vélez', 22, 45, 'Cinturón de Cuero'),
(46, '250000.00', 'LEGO Store', 25, 46, 'LEGO City Police Station'),
(47, '320000.00', 'Mattel', 26, 47, 'Barbie Dreamhouse'),
(48, '80000.00', 'Mattel', 26, 48, 'Hot Wheels Pack 10 Carros'),
(49, '60000.00', 'Disney Store', 27, 49, 'Peluche Disney Mickey Mouse'),
(50, '85000.00', 'Hasbro', 28, 50, 'Juego de Mesa Monopoly'),
(51, '120000.00', 'Hasbro', 28, 51, 'Nerf Ultra One'),
(52, '180000.00', 'Playmobil', 29, 52, 'Playmobil City Life'),
(53, '45000.00', 'Ravensburger', 30, 53, 'Rompecabezas 1000 Piezas'),
(54, '1200000.00', 'Nintendo', 31, 54, 'Consola Nintendo Switch'),
(55, '25000.00', 'Mattel', 26, 55, 'Juego UNO Cartas'),
(56, '65000.00', 'Adidas', 20, 56, 'Pelota de Fútbol Adidas'),
(57, '90000.00', 'LOL', 32, 57, 'Muñeca LOL Surprise'),
(58, '150000.00', 'Pepe Ganga', 33, 58, 'Drone para Niños'),
(59, '70000.00', 'Faber-Castell', 34, 59, 'Set de Arte Infantil'),
(60, '200000.00', 'Pepe Ganga', 33, 60, 'Robot Educativo'),
(61, '2500000.00', 'HomeCenter', 13, 61, 'Sofá Esquinero Moderno'),
(62, '1800000.00', 'Tugó', 35, 62, 'Cama Queen Size con Cabecera'),
(63, '1200000.00', 'HomeCenter', 13, 63, 'Mesa de Comedor 6 Puestos'),
(64, '450000.00', 'Falabella', 4, 64, 'Escritorio de Oficina'),
(65, '180000.00', 'HomeCenter', 13, 65, 'Lámpara de Pie Moderna'),
(66, '3500000.00', 'Tugó', 35, 66, 'Juego de Sala Completo'),
(67, '890000.00', 'HomeCenter', 13, 67, 'Closet Modular'),
(68, '420000.00', 'Falabella', 4, 68, 'Biblioteca Estantería'),
(69, '1500000.00', 'HomeCenter', 13, 69, 'Juego de Terraza'),
(70, '250000.00', 'Tugó', 35, 70, 'Espejo Decorativo Grande'),
(71, '380000.00', 'HomeCenter', 13, 71, 'Mesa de Centro'),
(72, '550000.00', 'Falabella', 4, 72, 'Silla de Oficina Ergonómica'),
(73, '2200000.00', 'Tugó', 35, 73, 'Juego de Comedor 8 Puestos'),
(74, '980000.00', 'HomeCenter', 13, 74, 'Cama Nido Infantil'),
(75, '150000.00', 'Falabella', 4, 75, 'Mesa Auxiliar'),
(76, '45000.00', 'Panamericana', 36, 76, 'Cien Años de Soledad'),
(77, '35000.00', 'Norma', 37, 77, 'Set de Cuadernos Universitarios'),
(78, '28000.00', 'Panamericana', 36, 78, 'Colores Faber Castell x24'),
(79, '42000.00', 'Norma', 37, 79, 'Agenda 2024 Premium'),
(80, '32000.00', 'Office Depot', 38, 80, 'Kit de Marcadores Sharpie'),
(81, '38000.00', 'Panamericana', 36, 81, 'El Principito Edición Especial'),
(82, '25000.00', 'Office Depot', 38, 82, 'Resma Papel Carta'),
(83, '85000.00', 'Panamericana', 36, 83, 'Set Plumas Estilográficas'),
(84, '55000.00', 'Norma', 37, 84, 'Diccionario Español Premium'),
(85, '28000.00', 'Panamericana', 36, 85, 'Block de Dibujo Profesional'),
(86, '22000.00', 'Panamericana', 36, 86, 'Set Geometría Faber Castell'),
(87, '280000.00', 'Panamericana', 36, 87, 'Harry Potter Saga Completa'),
(88, '35000.00', 'Norma', 37, 88, 'Carpetas Organizadoras x5'),
(89, '95000.00', 'Office Depot', 38, 89, 'Calculadora Científica Casio'),
(90, '150000.00', 'Panamericana', 36, 90, 'Set Arte Profesional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen_url` varchar(500) NOT NULL,
  `tienda` varchar(100) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `precio`, `imagen_url`, `tienda`, `id_categoria`) VALUES
(1, 'Samsung Galaxy S23 128GB', '3200000.00', 'https://images.samsung.com/is/image/samsung/p6pim/co/2302/gallery/co-galaxy-s23-s911-sm-s911bzadeco-thumb-534172010', 'Samsung', 1),
(2, 'Apple AirPods Pro 3da Gen', '1100000.00', 'https://i.linio.com/p/2b8e2b8e2b8e2b8e2b8e2b8e2b8e2b8e-product.jpg', 'Linio', 1),
(3, 'Portátil Lenovo 15.6\" Ryzen 5 8GB 512GB SSD', '2200000.00', 'https://exitocol.vtexassets.com/arquivos/ids/15572825-800-auto', 'Éxito', 1),
(4, 'Xiaomi Redmi Note 12 128GB', '850000.00', 'https://falabella.scene7.com/is/image/FalabellaCO/8812311_1', 'Falabella', 1),
(5, 'Audífonos Bluetooth JBL Tune 510BT', '120000.00', 'https://i.pinimg.com/736x/68/9c/9b/689c9b23e5254514197b9b209310e34d.jpg', 'JBL', 1),
(6, 'Smartwatch Amazfit Bip U', '220000.00', 'https://i.linio.com/p/1b2e3b4e5b6e7b8e9b0e1b2e3b4e5b6e-product.jpg', 'Linio', 1),
(7, 'Tablet Samsung Galaxy Tab A8 64GB', '750000.00', 'https://i.linio.com/p/3b4e5b6e7b8e9b0e1b2e3b4e5b6e7b8e-product.jpg', 'Samsung', 1),
(8, 'Monitor LG 24\" Full HD IPS', '520000.00', 'https://i.linio.com/p/4b5e6b7e8b9e0b1e2b3e4b5e6b7e8b9e-product.jpg', 'LG', 1),
(9, 'Disco Duro Externo Seagate 1TB', '210000.00', 'https://i.linio.com/p/5b6e7b8e9b0e1b2e3b4e5b6e7b8e9b0e-product.jpg', 'Seagate', 1),
(10, 'Teclado Mecánico Redragon Kumara', '150000.00', 'https://i.linio.com/p/6b7e8b9e0b1e2b3e4b5e6b7e8b9e0b1e-product.jpg', 'Redragon', 1),
(11, 'Mouse Inalámbrico Logitech M185', '45000.00', 'https://i.linio.com/p/7b8e9b0e1b2e3b4e5b6e7b8e9b0e1b2e-product.jpg', 'Logitech', 1),
(12, 'Cámara Web Logitech C920 HD', '230000.00', 'https://i.linio.com/p/8b9e0b1e2b3e4b5e6b7e8b9e0b1e2b3e-product.jpg', 'Logitech', 1),
(13, 'Impresora HP Ink Tank 315', '520000.00', 'https://i.linio.com/p/9b0e1b2e3b4e5b6e7b8e9b0e1b2e3b4e-product.jpg', 'HP', 1),
(14, 'Smart TV LG 50\" 4K UHD', '1499000.00', 'https://i.linio.com/p/0b1e2b3e4b5e6b7e8b9e0b1e2b3e4b5e-product.jpg', 'LG', 1),
(15, 'Google Chromecast 4K con Google TV', '250000.00', 'https://i.linio.com/p/1c2d3e4f5g6h7i8j9k0l1m2n3o4p5q6r-product.jpg', 'Google', 1),
(16, 'Nevera Mabe 300L', '1200000.00', 'https://exitocol.vtexassets.com/arquivos/ids/15572825-800-auto', 'Éxito', 2),
(17, 'Cafetera Oster', '180000.00', 'https://falabella.scene7.com/is/image/FalabellaCO/8812311_1', 'Falabella', 2),
(18, 'Microondas Samsung 23L', '350000.00', 'https://alkosto.vteximg.com.br/arquivos/ids/213634-1000-1000/7704353364683.jpg', 'Alkosto', 2),
(19, 'Lavadora LG 17kg', '1600000.00', 'https://homecenterco.scene7.com/is/image/SodimacCO/307829', 'HomeCenter', 2),
(20, 'Aspiradora Electrolux', '320000.00', 'https://falabella.scene7.com/is/image/FalabellaCO/11500381_1', 'Falabella', 2),
(21, 'Licuadora Oster Pro', '280000.00', 'https://alkosto.vteximg.com.br/licuadora-oster', 'Alkosto', 2),
(22, 'Horno Eléctrico Black+Decker', '420000.00', 'https://homecenter.com.co/horno-electrico', 'HomeCenter', 2),
(23, 'Freidora de Aire Imusa', '250000.00', 'https://exito.com/freidora-aire', 'Éxito', 2),
(24, 'Plancha a Vapor Samurai', '89000.00', 'https://falabella.com/plancha-vapor', 'Falabella', 2),
(25, 'Batidora KitchenAid', '890000.00', 'https://ktronix.com/batidora-kitchenaid', 'Ktronix', 2),
(26, 'Sandwichera Oster', '75000.00', 'https://alkosto.com/sandwichera', 'Alkosto', 2),
(27, 'Ventilador de Techo Industrial', '320000.00', 'https://homecenter.com/ventilador', 'HomeCenter', 2),
(28, 'Calentador de Agua Haceb', '780000.00', 'https://haceb.com/calentador', 'Haceb', 2),
(29, 'Robot Aspirador iRobot', '1200000.00', 'https://falabella.com/robot-aspirador', 'Falabella', 2),
(30, 'Purificador de Aire Samsung', '890000.00', 'https://samsung.com/purificador', 'Samsung', 2),
(31, 'Chaqueta de Cuero para Hombre', '250000.00', 'https://falabella.com/chaqueta-cuero', 'Falabella', 3),
(32, 'Vestido Floral para Mujer', '120000.00', 'https://exito.com/vestido-floral', 'Éxito', 3),
(33, 'Zapatos Deportivos Nike Air', '280000.00', 'https://nike.com/air-max', 'Nike', 3),
(34, 'Jeans Levis 501', '180000.00', 'https://levis.com/501-jeans', 'Levis', 3),
(35, 'Bolso de Cuero para Dama', '150000.00', 'https://zara.com/bolso-cuero', 'Zara', 3),
(36, 'Camisa de Lino para Hombre', '89000.00', 'https://arturo-calle.com/camisa-lino', 'Arturo Calle', 3),
(37, 'Vestido de Noche Elegante', '350000.00', 'https://studio-f.com/vestido-noche', 'Studio F', 3),
(38, 'Tenis Adidas Superstar', '220000.00', 'https://adidas.com/superstar', 'Adidas', 3),
(39, 'Blazer Formal para Mujer', '180000.00', 'https://zara.com/blazer', 'Zara', 3),
(40, 'Reloj Fossil para Hombre', '450000.00', 'https://fossil.com/reloj', 'Fossil', 3),
(41, 'Sandalias de Cuero', '95000.00', 'https://velez.com/sandalias', 'Vélez', 3),
(42, 'Gafas de Sol Ray-Ban', '380000.00', 'https://rayban.com/gafas', 'Ray-Ban', 3),
(43, 'Mochila Nike Sportswear', '140000.00', 'https://nike.com/mochila', 'Nike', 3),
(44, 'Bufanda de Lana', '65000.00', 'https://tennis.com/bufanda', 'Tennis', 3),
(45, 'Cinturón de Cuero', '85000.00', 'https://velez.com/cinturon', 'Vélez', 3),
(46, 'LEGO City Police Station', '250000.00', 'https://lego.com/city-police', 'LEGO Store', 4),
(47, 'Barbie Dreamhouse', '320000.00', 'https://mattel.com/barbie-house', 'Mattel', 4),
(48, 'Hot Wheels Pack 10 Carros', '80000.00', 'https://hotwheels.com/pack', 'Mattel', 4),
(49, 'Peluche Disney Mickey Mouse', '60000.00', 'https://disney.com/mickey-peluche', 'Disney Store', 4),
(50, 'Juego de Mesa Monopoly', '85000.00', 'https://hasbro.com/monopoly', 'Hasbro', 4),
(51, 'Nerf Ultra One', '120000.00', 'https://hasbro.com/nerf', 'Hasbro', 4),
(52, 'Playmobil City Life', '180000.00', 'https://playmobil.com/city', 'Playmobil', 4),
(53, 'Rompecabezas 1000 Piezas', '45000.00', 'https://ravensburger.com/puzzle', 'Ravensburger', 4),
(54, 'Consola Nintendo Switch', '1200000.00', 'https://nintendo.com/switch', 'Nintendo', 4),
(55, 'Juego UNO Cartas', '25000.00', 'https://mattel.com/uno', 'Mattel', 4),
(56, 'Pelota de Fútbol Adidas', '65000.00', 'https://adidas.com/pelota', 'Adidas', 4),
(57, 'Muñeca LOL Surprise', '90000.00', 'https://lol-surprise.com', 'LOL', 4),
(58, 'Drone para Niños', '150000.00', 'https://pepe-ganga.com/drone', 'Pepe Ganga', 4),
(59, 'Set de Arte Infantil', '70000.00', 'https://faber-castell.com/arte', 'Faber-Castell', 4),
(60, 'Robot Educativo', '200000.00', 'https://pepe-ganga.com/robot', 'Pepe Ganga', 4),
(61, 'Sofá Esquinero Moderno', '2500000.00', 'https://homecenter.com/sofa-esquinero', 'HomeCenter', 5),
(62, 'Cama Queen Size con Cabecera', '1800000.00', 'https://tugo.co/cama-queen', 'Tugó', 5),
(63, 'Mesa de Comedor 6 Puestos', '1200000.00', 'https://homecenter.com/mesa-comedor', 'HomeCenter', 5),
(64, 'Escritorio de Oficina', '450000.00', 'https://falabella.com/escritorio', 'Falabella', 5),
(65, 'Lámpara de Pie Moderna', '180000.00', 'https://homecenter.com/lampara', 'HomeCenter', 5),
(66, 'Juego de Sala Completo', '3500000.00', 'https://tugo.co/sala', 'Tugó', 5),
(67, 'Closet Modular', '890000.00', 'https://homecenter.com/closet', 'HomeCenter', 5),
(68, 'Biblioteca Estantería', '420000.00', 'https://falabella.com/biblioteca', 'Falabella', 5),
(69, 'Juego de Terraza', '1500000.00', 'https://homecenter.com/terraza', 'HomeCenter', 5),
(70, 'Espejo Decorativo Grande', '250000.00', 'https://tugo.co/espejo', 'Tugó', 5),
(71, 'Mesa de Centro', '380000.00', 'https://homecenter.com/mesa-centro', 'HomeCenter', 5),
(72, 'Silla de Oficina Ergonómica', '550000.00', 'https://falabella.com/silla', 'Falabella', 5),
(73, 'Juego de Comedor 8 Puestos', '2200000.00', 'https://tugo.co/comedor', 'Tugó', 5),
(74, 'Cama Nido Infantil', '980000.00', 'https://homecenter.com/cama-nido', 'HomeCenter', 5),
(75, 'Mesa Auxiliar', '150000.00', 'https://falabella.com/mesa-auxiliar', 'Falabella', 5),
(76, 'Cien Años de Soledad', '45000.00', 'https://panamericana.com/cien-anos', 'Panamericana', 6),
(77, 'Set de Cuadernos Universitarios', '35000.00', 'https://norma.com/cuadernos', 'Norma', 6),
(78, 'Colores Faber Castell x24', '28000.00', 'https://faber-castell.com/colores', 'Panamericana', 6),
(79, 'Agenda 2024 Premium', '42000.00', 'https://norma.com/agenda', 'Norma', 6),
(80, 'Kit de Marcadores Sharpie', '32000.00', 'https://sharpie.com/marcadores', 'Office Depot', 6),
(81, 'El Principito Edición Especial', '38000.00', 'https://panamericana.com/principito', 'Panamericana', 6),
(82, 'Resma Papel Carta', '25000.00', 'https://office-depot.com/resma', 'Office Depot', 6),
(83, 'Set Plumas Estilográficas', '85000.00', 'https://panamericana.com/plumas', 'Panamericana', 6),
(84, 'Diccionario Español Premium', '55000.00', 'https://norma.com/diccionario', 'Norma', 6),
(85, 'Block de Dibujo Profesional', '28000.00', 'https://panamericana.com/block', 'Panamericana', 6),
(86, 'Set Geometría Faber Castell', '22000.00', 'https://faber-castell.com/geometria', 'Panamericana', 6),
(87, 'Harry Potter Saga Completa', '280000.00', 'https://panamericana.com/harry-potter', 'Panamericana', 6),
(88, 'Carpetas Organizadoras x5', '35000.00', 'https://norma.com/carpetas', 'Norma', 6),
(89, 'Calculadora Científica Casio', '95000.00', 'https://office-depot.com/calculadora', 'Office Depot', 6),
(90, 'Set Arte Profesional', '150000.00', 'https://panamericana.com/arte', 'Panamericana', 6),
(120, 'ghhg', '555.00', '????\0JFIF\0\0\0\0\0\0??\0?\0\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||?\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||???\0?@\"\0??\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0??\0\0\0\0?iЩ	0E !?!?Bc$`??Kl??T	?C0??*?hd?a-??`??!?!??Bc$`?	?C?$???$l@ĩ`?	???F`?R??0?ЊB!?`\0Ę!?!? 0C4!?!?T?R?\0\0`??M?0C4	?`&\0?$??\r6????I?)\05@ 0CCM????!?!?l??% T??!?!?!?&!?!??$`?B`	?\0l@\0\0\0!?!?!?!?L??\r\0?\r`?	PK\0!', 'hjkhjk', 1),
(1200, 'ghhg', '555.00', '????\0JFIF\0\0\0\0\0\0??\0?\0\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||?\n\n\n\"\"$$6*&&*6>424>LDDL_Z_||???\0?@\"\0??\01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0??\0\0\0\0?iЩ	0E !?!?Bc$`??Kl??T	?C0??*?hd?a-??`??!?!??Bc$`?	?C?$???$l@ĩ`?	???F`?R??0?ЊB!?`\0Ę!?!? 0C4!?!?T?R?\0\0`??M?0C4	?`&\0?$??\r6????I?)\05@ 0CCM????!?!?l??% T??!?!?!?&!?!??$`?B`	?\0l@\0\0\0!?!?!?!?L??\r\0?\r`?	PK\0!', 'hjkhjk', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `NUMER_DE_TIENDA` int(11) NOT NULL,
  `NOMBRE` varchar(110) NOT NULL,
  `ID_PRODUCTOS` int(11) NOT NULL,
  `URL` varchar(700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tienda`
--

INSERT INTO `tienda` (`NUMER_DE_TIENDA`, `NOMBRE`, `ID_PRODUCTOS`, `URL`) VALUES
(1, 'Samsung', 1, 'https://www.samsung.com/co/'),
(2, 'Linio', 2, 'https://www.linio.com.co/'),
(3, 'Éxito', 3, 'https://www.exito.com/'),
(4, 'Falabella', 4, 'https://www.falabella.com.co/'),
(5, 'JBL', 5, 'https://co.jbl.com/'),
(6, 'LG', 8, 'https://www.lg.com/co'),
(7, 'Seagate', 9, 'https://www.seagate.com/'),
(8, 'Redragon', 10, 'https://www.redragon.com/'),
(9, 'Logitech', 11, 'https://www.logitech.com/es-co'),
(10, 'HP', 13, 'https://www.hp.com/co-es/'),
(11, 'Google', 15, 'https://store.google.com/'),
(12, 'Alkosto', 18, 'https://www.alkosto.com/'),
(13, 'HomeCenter', 19, 'https://www.homecenter.com.co/'),
(14, 'Haceb', 28, 'https://www.haceb.com/'),
(15, 'Nike', 33, 'https://www.nike.com/co/'),
(16, 'Levis', 34, 'https://www.levi.com.co/'),
(17, 'Zara', 35, 'https://www.zara.com/co/'),
(18, 'Arturo Calle', 36, 'https://www.arturocalle.com/'),
(19, 'Studio F', 37, 'https://www.studiof.com.co/'),
(20, 'Adidas', 38, 'https://www.adidas.co/'),
(21, 'Fossil', 40, 'https://www.fossil.com/'),
(22, 'Vélez', 41, 'https://www.velez.com.co/'),
(23, 'Ray-Ban', 42, 'https://www.ray-ban.com/colombia'),
(24, 'Tennis', 44, 'https://www.tennis.com.co/'),
(25, 'LEGO Store', 46, 'https://www.lego.com/es-co'),
(26, 'Mattel', 47, 'https://www.mattel.com/'),
(27, 'Disney Store', 49, 'https://www.shopdisney.com/'),
(28, 'Hasbro', 50, 'https://shop.hasbro.com/'),
(29, 'Playmobil', 52, 'https://www.playmobil.co/'),
(30, 'Ravensburger', 53, 'https://www.ravensburger.org/'),
(31, 'Nintendo', 54, 'https://www.nintendo.com/'),
(32, 'LOL', 57, 'https://www.lolsurprise.com/'),
(33, 'Pepe Ganga', 58, 'https://www.pepeganga.com/'),
(34, 'Faber-Castell', 59, 'https://www.faber-castell.com/'),
(35, 'Tugó', 62, 'https://www.tugo.co/'),
(36, 'Panamericana', 76, 'https://www.panamericana.com.co/'),
(37, 'Norma', 77, 'https://www.norma.com/'),
(38, 'Office Depot', 80, 'https://www.officedepot.com.co/'),
(39, 'Ktronix', 25, 'https://www.ktronix.com/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRE_USUARIO` varchar(80) NOT NULL,
  `CONTRASEÑA` varchar(50) NOT NULL,
  `EMAIL` varchar(30) NOT NULL,
  `TELEFONO` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `NOMBRE_USUARIO`, `CONTRASEÑA`, `EMAIL`, `TELEFONO`) VALUES
(1, 'Ado', 'Ado', 'beltranblaze28@gmail.com', 554856),
(2, 'JOHAN', '1234', 'joahnvega@gmail.com', 55428),
(3, 'ANGEL', '4321', 'angelv@gmail.com', 511472),
(1555842, 'carro', 'carro12234', 'arrozp2@gmail.com', 1224842);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ID_COMENTARIO`),
  ADD KEY `ID_comentarios` (`ID_USUARIO`);

--
-- Indices de la tabla `opciones_del_producto`
--
ALTER TABLE `opciones_del_producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `ID_TIENDA` (`ID_TIENDA`),
  ADD KEY `NOMBRE_TIENDA` (`NOMBRE_TIENDA`),
  ADD KEY `ID_PROD2` (`ID_PROD2`),
  ADD KEY `idx_nombre_tienda` (`NOMBRE_TIENDA`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`NUMER_DE_TIENDA`),
  ADD UNIQUE KEY `NOMBRE_UNIQUE` (`NOMBRE`),
  ADD KEY `NOMBRE` (`NOMBRE`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9556;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `ID_comentarios` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE CASCADE;

--
-- Filtros para la tabla `opciones_del_producto`
--
ALTER TABLE `opciones_del_producto`
  ADD CONSTRAINT `opciones_producto_productos` FOREIGN KEY (`ID_PROD2`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE,
  ADD CONSTRAINT `opciones_producto_tienda` FOREIGN KEY (`NOMBRE_TIENDA`) REFERENCES `tienda` (`NOMBRE`) ON DELETE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
