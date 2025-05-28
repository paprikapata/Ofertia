-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2025 a las 00:16:57
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arbol`
--
CREATE DATABASE IF NOT EXISTS `arbol` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `arbol`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `COD_CLIENTE` int(11) NOT NULL,
  `DNI` varchar(100) NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `APELLIDO1` varchar(50) NOT NULL,
  `APELLIDO2` varchar(50) NOT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `copias`
--

CREATE TABLE `copias` (
  `N_COPIA` varchar(100) NOT NULL,
  `DETERIORADA` varchar(30) DEFAULT NULL,
  `FORMATO` varchar(50) NOT NULL,
  `ID_PELICULA` int(11) NOT NULL,
  `PRECIO_ALQUILER` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `copias`
--

INSERT INTO `copias` (`N_COPIA`, `DETERIORADA`, `FORMATO`, `ID_PELICULA`, `PRECIO_ALQUILER`) VALUES
('1', 'bueno', 'digital', 3, 2000),
('2', 'malo', 'digital', 4, 4000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `ID_PELICULA` int(11) NOT NULL,
  `TITULO` varchar(100) NOT NULL,
  `AÑO` date DEFAULT NULL,
  `CRITICA` varchar(100) DEFAULT NULL,
  `CARATULA` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`ID_PELICULA`, `TITULO`, `AÑO`, `CRITICA`, `CARATULA`) VALUES
(3, 'cars', '2015-05-12', 'buena', 'aventura'),
(4, 'resplandor', '2020-05-02', 'buena', 'terror');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_PRESTAMOS` int(11) NOT NULL,
  `FECHA_PRESTAMO` date NOT NULL,
  `FECHA_TOPE` date DEFAULT NULL,
  `FECHA_ENTREGA` date DEFAULT NULL,
  `COD_CLIENTE` int(11) NOT NULL,
  `N_COPIA` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`COD_CLIENTE`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indices de la tabla `copias`
--
ALTER TABLE `copias`
  ADD PRIMARY KEY (`N_COPIA`),
  ADD KEY `FX_cosas` (`ID_PELICULA`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`ID_PELICULA`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_PRESTAMOS`),
  ADD UNIQUE KEY `COD_CLIENTE` (`COD_CLIENTE`),
  ADD KEY `FX_clase` (`N_COPIA`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `FX_casos` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `prestamos` (`COD_CLIENTE`);

--
-- Filtros para la tabla `copias`
--
ALTER TABLE `copias`
  ADD CONSTRAINT `FX_cosas` FOREIGN KEY (`ID_PELICULA`) REFERENCES `pelicula` (`ID_PELICULA`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `FX_clase` FOREIGN KEY (`N_COPIA`) REFERENCES `copias` (`N_COPIA`);
--
-- Base de datos: `evelyn`
--
CREATE DATABASE IF NOT EXISTS `evelyn` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `evelyn`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `AUT_CODIGO` int(11) NOT NULL,
  `AUT_NOMBRE` varchar(20) DEFAULT NULL,
  `AUT_APELLIDO` varchar(20) DEFAULT NULL,
  `AUT_NACIONALIDAD` varchar(30) DEFAULT NULL,
  `AUT_FECHA_NTO` date DEFAULT NULL,
  `UN_libro_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`AUT_CODIGO`, `AUT_NOMBRE`, `AUT_APELLIDO`, `AUT_NACIONALIDAD`, `AUT_FECHA_NTO`, `UN_libro_autor`) VALUES
(11, 'Antonio', 'cortez', 'venezolano', '1999-04-03', 1),
(12, 'sofia', 'contreras', 'colombiano', '1984-07-09', 2),
(13, 'Andres', 'castillo', 'chileno', '1985-07-07', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `CLI_ID` int(11) NOT NULL,
  `CLI_NOMBRE` varchar(30) DEFAULT NULL,
  `CLI_CIUDAD` varchar(30) DEFAULT NULL,
  `CLI_PAIS` varchar(30) DEFAULT NULL,
  `CLI_TELEFONO` bigint(20) DEFAULT NULL,
  `UN_libro_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`CLI_ID`, `CLI_NOMBRE`, `CLI_CIUDAD`, `CLI_PAIS`, `CLI_TELEFONO`, `UN_libro_cliente`) VALUES
(1, 'Santybelt', 'bogota', 'colombia', 6363737, 1),
(4, 'Santybelt', 'bogota', 'colombia', 6363737, 1),
(5, 'Mayra', 'boyaca', 'colombia', 636877, 2),
(6, 'Maria', 'cali', 'colombia', 636967, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `EDI_NOMBRE` varchar(20) NOT NULL,
  `EDI_TELEFONO` bigint(20) DEFAULT NULL,
  `EDI_CIUDAD` varchar(30) DEFAULT NULL,
  `EDI_PAIS` varchar(39) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`EDI_NOMBRE`, `EDI_TELEFONO`, `EDI_CIUDAD`, `EDI_PAIS`) VALUES
('Ado', 312345, 'bogota', 'colombia'),
('Mayra', 312356, 'cali', 'colombia'),
('vega', 3123425, 'boyaca', 'colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `LIB_ISBN` int(11) NOT NULL,
  `LIB_TITULO` varchar(20) DEFAULT NULL,
  `LIB_NUMERO_PAGINAS` int(11) DEFAULT NULL,
  `LIB_ANNO` year(4) DEFAULT NULL,
  `UN_EDITORIAL` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`LIB_ISBN`, `LIB_TITULO`, `LIB_NUMERO_PAGINAS`, `LIB_ANNO`, `UN_EDITORIAL`) VALUES
(1, 'Buda blues', 500, 2007, 'Ado'),
(2, 'El cielo', 500, 2005, 'Vega'),
(3, 'Sobreviviste', 500, 2009, 'Mayra');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`AUT_CODIGO`),
  ADD KEY `FK_autor` (`UN_libro_autor`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CLI_ID`),
  ADD KEY `FK_cliente` (`UN_libro_cliente`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`EDI_NOMBRE`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`LIB_ISBN`),
  ADD KEY `FK_EDITORIAL` (`UN_EDITORIAL`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autor`
--
ALTER TABLE `autor`
  ADD CONSTRAINT `FK_autor` FOREIGN KEY (`UN_libro_autor`) REFERENCES `libro` (`LIB_ISBN`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `FK_cliente` FOREIGN KEY (`UN_libro_cliente`) REFERENCES `libro` (`LIB_ISBN`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `FK_EDITORIAL` FOREIGN KEY (`UN_EDITORIAL`) REFERENCES `editorial` (`EDI_NOMBRE`);
--
-- Base de datos: `guia 23/04`
--
CREATE DATABASE IF NOT EXISTS `guia 23/04` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `guia 23/04`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `ID_articulo` bigint(20) NOT NULL,
  `MARCA` varchar(90) DEFAULT NULL,
  `DESCRIPCION` varchar(70) DEFAULT NULL,
  `TIENDA` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`ID_articulo`, `MARCA`, `DESCRIPCION`, `TIENDA`) VALUES
(1, 'XIAOMI', 'CELULAR', 'FALABELA'),
(2, 'LENOVO', 'AUDIFONOS', 'EXITO'),
(3, 'HP', 'COMPUTADOR', 'ALKOSTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `ID_TIENDA` bigint(20) NOT NULL,
  `NOMBRE_TIENDA` varchar(30) DEFAULT NULL,
  `Articulos` varchar(20) DEFAULT NULL,
  `ARTx` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_usuario` bigint(20) NOT NULL,
  `Nombre_usuario` varchar(90) DEFAULT NULL,
  `apellido_usuario` varchar(70) DEFAULT NULL,
  `Genero_usuario` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`ID_articulo`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`ID_TIENDA`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_usuario`);
--
-- Base de datos: `guia con mayra`
--
CREATE DATABASE IF NOT EXISTS `guia con mayra` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `guia con mayra`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Cedula` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL,
  `Correo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compra` int(11) NOT NULL,
  `fecha_compra` date NOT NULL,
  `valor_total` float NOT NULL,
  `cc_cliente` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_productos` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Precio` float NOT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Cedula`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `FK_CLIENTE` (`cc_cliente`),
  ADD KEY `FK_productos` (`id_producto`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_productos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_productos` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK_CLIENTE` FOREIGN KEY (`cc_cliente`) REFERENCES `clientes` (`Cedula`),
  ADD CONSTRAINT `FK_productos` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`Id_productos`);
--
-- Base de datos: `laboratorio`
--
CREATE DATABASE IF NOT EXISTS `laboratorio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laboratorio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `COD_AGENDA` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `DOMICILIO` varchar(30) DEFAULT NULL,
  `TELEFONO` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`COD_AGENDA`, `NOMBRE`, `DOMICILIO`, `TELEFONO`) VALUES
(1, 'ALBERTO MORES', 'Av.COLON 123', '4234567'),
(2, 'Juan Paez', 'Avellaneda 135', '4458787'),
(3, 'Mariana Lopez', 'Urquiza 33', '4545454'),
(4, 'Fernando Lopez', 'Urquiza 333', '4545454');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda2`
--

CREATE TABLE `agenda2` (
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DOMICILIO` varchar(30) DEFAULT NULL,
  `TELEFONO` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agenda2`
--

INSERT INTO `agenda2` (`NOMBRE`, `DOMICILIO`, `TELEFONO`) VALUES
('Alberto Mores', 'Colon 123', '4234567'),
('Juan Paez', 'Avellaneda 135', '4458787'),
('Mariana Lopez', 'Urquiza 333', '4545454'),
('Fernando Lopez', 'Urquiza 333', '4545454'),
('Alberto Mores', 'Colon 123', '4234567'),
('Juan Paez', 'Avellaneda 135', '4458787'),
('Mariana Lopez', 'Urquiza 333', '4545454'),
('Fernando Lopez', 'Urquiza 333', '4545454');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda3`
--

CREATE TABLE `agenda3` (
  `APELLIDO` varchar(30) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DOMICILIO` varchar(30) DEFAULT NULL,
  `TELEFONO` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agenda3`
--

INSERT INTO `agenda3` (`APELLIDO`, `NOMBRE`, `DOMICILIO`, `TELEFONO`) VALUES
('Mores', 'Alberto', 'Colon 123', '4234567'),
('Torres', 'Juan', 'Avellaneda 135', '4458787'),
('Lopez', 'Mariana', 'Urquiza 333', '4545454'),
('Lopez´', 'Jose', 'Urquiza 333', '4545454'),
('Peralta', 'Susana', 'Gral. Paz 1234', '4123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda_1`
--

CREATE TABLE `agenda_1` (
  `NOMBRE` varchar(25) DEFAULT NULL,
  `DOMICILIO` varchar(30) DEFAULT NULL,
  `TELEFONO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agenda_1`
--

INSERT INTO `agenda_1` (`NOMBRE`, `DOMICILIO`, `TELEFONO`) VALUES
('Alberto Mores', 'Cali 05', '7654321'),
('Juan Torres', 'Medellin 04', '4458787');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `COD_ARTICULO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`COD_ARTICULO`, `NOMBRE`, `DESCRIPCION`, `PRECIO`) VALUES
(1, 'IMPRESORA', 'Epson Stylus C45', 400.8),
(2, 'impresora', 'Epson Stylus C85', 500),
(3, 'MONITOR', 'Samsung 14', 800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos_1`
--

CREATE TABLE `articulos_1` (
  `CODIGO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos_1`
--

INSERT INTO `articulos_1` (`CODIGO`, `NOMBRE`, `DESCRIPCION`, `PRECIO`) VALUES
(1, 'impresora', 'Epson Stylus C45', 400.8),
(2, 'impresora', 'Epson Stylus C85', 500),
(3, 'monitor', 'Samsung 14', 800),
(4, 'teclado', 'ingles Biswal', 100),
(5, 'teclado', 'español Biswal', 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos_2`
--

CREATE TABLE `articulos_2` (
  `CODIGO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos_2`
--

INSERT INTO `articulos_2` (`CODIGO`, `NOMBRE`, `DESCRIPCION`, `PRECIO`, `CANTIDAD`) VALUES
(1, 'impresora', 'Epson Stylus C45', 400.8, 20),
(2, 'impresora', 'Epson Stylus C85', 500, 30),
(3, 'monitor', 'Samsung 14', 800, 10),
(4, 'teclado', 'ingles Biswal', 100, 50),
(5, 'teclado', 'español Biswal', 90, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos_3`
--

CREATE TABLE `articulos_3` (
  `CODIGO` int(11) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(30) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos_3`
--

INSERT INTO `articulos_3` (`CODIGO`, `NOMBRE`, `DESCRIPCION`, `PRECIO`, `CANTIDAD`) VALUES
(1, 'impresora', 'Epson Stylus C45', 400.8, 20),
(2, 'impresora', 'Epson Stylus C85', 550, 50),
(3, 'monitor', 'Samsung 14', 800, 10),
(4, 'teclado', 'ingles Biswal', 100, 50),
(5, 'teclado', 'español Biswal', 90, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `NOMBRE` varchar(20) DEFAULT NULL,
  `DOCUMENTO` varchar(8) DEFAULT NULL,
  `SEXO` varchar(1) DEFAULT NULL,
  `DOMICILIO` varchar(30) DEFAULT NULL,
  `SUELDOBASICO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`NOMBRE`, `DOCUMENTO`, `SEXO`, `DOMICILIO`, `SUELDOBASICO`) VALUES
('Juan perez', '22345678', 'm', 'Sarmiento 123', 200),
('Ana Melo', '24345678', 'f', 'Colon 134', 400),
('Marcos Torres', '27345678', 'm', 'Urquiza 479', 700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `TITULO` varchar(20) DEFAULT NULL,
  `AUTOR` varchar(30) DEFAULT NULL,
  `EDITORIAL` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`TITULO`, `AUTOR`, `EDITORIAL`) VALUES
('100 años de soledad', 'Garcia Marquez', 'Planeta'),
('El tunel', 'Ernesto Sabato', 'Emece'),
('50 sombras de grey', 'E.L.James', 'Emece');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_1`
--

CREATE TABLE `libros_1` (
  `TITULO` varchar(20) DEFAULT NULL,
  `AUTOR` varchar(30) DEFAULT NULL,
  `EDITORIAL` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros_1`
--

INSERT INTO `libros_1` (`TITULO`, `AUTOR`, `EDITORIAL`) VALUES
('El aleph', 'Borges', 'Planeta'),
('Martin Fierro', 'Jose Hernandez', 'Emece'),
('Aprenda PHP', 'Mario Molina', 'Emece'),
('Cervantes', 'Borges', 'Paidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_2`
--

CREATE TABLE `libros_2` (
  `TITULO` varchar(20) DEFAULT NULL,
  `AUTOR` varchar(30) DEFAULT NULL,
  `EDITORIAL` varchar(15) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros_2`
--

INSERT INTO `libros_2` (`TITULO`, `AUTOR`, `EDITORIAL`, `PRECIO`) VALUES
('El aleph', 'Borges', 'aneta', 15),
('Martin Fierro', 'Jose Hernandez', 'Emece S.A.', 25.5),
('Aprenda PHP', 'Mario Molina', 'Emece S.A.', 25),
('Cervantes y el quijo', 'Borges', 'Paidos', 25),
('Matematicas estas ah', 'Paenza', 'Paidos', 40.8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `CODIGO` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `LABORATORIO` varchar(20) DEFAULT NULL,
  `PRECIO` float(5,2) DEFAULT NULL,
  `CANTIDAD` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`CODIGO`, `NOMBRE`, `LABORATORIO`, `PRECIO`, `CANTIDAD`) VALUES
(1, 'Sertal', 'Roche', 5.20, 100),
(2, 'Buscapina', 'Roche', 4.10, 200),
(4, 'Paracetamol 500', 'Bago', 1.90, 200),
(7, 'Sertal gotas', 'Roche', 5.20, NULL),
(8, 'Buscapina', 'Roche', 4.10, NULL),
(10, 'Paracetamol 500', 'Bago', 1.90, NULL),
(14, 'Paracetamol 1000', 'Bago', 5.00, NULL),
(15, 'Amoxinil', 'Roche', 17.80, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos_1`
--

CREATE TABLE `medicamentos_1` (
  `CODIGO` int(10) UNSIGNED NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `LABORATORIO` varchar(20) DEFAULT NULL,
  `PRECIO` float(6,2) UNSIGNED DEFAULT NULL,
  `CANTIDAD` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `TITULO` varchar(25) DEFAULT NULL,
  `ACTOR` varchar(25) DEFAULT NULL,
  `DURACION` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`TITULO`, `ACTOR`, `DURACION`, `CANTIDAD`) VALUES
('Mision imposible', 'Tom Cruise', 120, 3),
('Mision imposible 2', 'Tom Cruise', 180, 2),
('Mujer bonita', 'Julian R.', 90, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas_1`
--

CREATE TABLE `peliculas_1` (
  `TITULO` varchar(20) DEFAULT NULL,
  `ACTOR` varchar(20) DEFAULT NULL,
  `DURACION` int(11) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas_1`
--

INSERT INTO `peliculas_1` (`TITULO`, `ACTOR`, `DURACION`, `CANTIDAD`) VALUES
('Mision imposible', 'Tom Cruise', 120, 3),
('Mision imposible 2', 'Tom Cruise', 180, 2),
('Mujer bonita', 'Julia R.', 90, 3),
('Elsa y Fred', 'China Zorrilla', 90, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`COD_AGENDA`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `medicamentos_1`
--
ALTER TABLE `medicamentos_1`
  ADD PRIMARY KEY (`CODIGO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agenda`
--
ALTER TABLE `agenda`
  MODIFY `COD_AGENDA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `CODIGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `medicamentos_1`
--
ALTER TABLE `medicamentos_1`
  MODIFY `CODIGO` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `maqueta`
--
CREATE DATABASE IF NOT EXISTS `maqueta` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `maqueta`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoria` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` int(11) NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `titulo`, `categoria`, `precio`, `imagen`) VALUES
(1, 'Samsung Galaxy S23 128GB', 'Tecnología', 3200000, 'https://www.alkosto.com/medias/8806094710625-001-750Wx750H?context=bWFzdGVyfGltYWdlc3wxMzY1MnxpbWFnZS93ZWJwfGFEQTRMMmhqWkM4eE5Ea3lOVFE0TWpjMU5EQTNPQzg0T0RBMk1EazBOekV3TmpJMVh6QXdNVjgzTlRCWGVEYzFNRWd8YjhjYWJkYWYyMzdlYWY3ZDE3NmQwZDExNWNkMmY3ZDUyMWZiMjkxN2Mx'),
(2, 'Apple AirPods Pro 2da Gen', 'Tecnología', 1100000, 'https://http2.mlstatic.com/D_NQ_NP_779146-MLA53778959612_022023-O.webp'),
(3, 'Portátil Lenovo 15.6\" Ryzen 5 8GB 512GB SSD', 'Tecnología', 2200000, 'https://http2.mlstatic.com/D_NQ_NP_897490-MLU77338586016_072024-O.webp'),
(4, 'Xiaomi Redmi Note 12 128GB', 'Tecnología', 850000, 'https://http2.mlstatic.com/D_NQ_NP_993572-MLA73980600102_012024-O.webp'),
(5, 'Audífonos Bluetooth JBL Tune 510BT', 'Tecnología', 120000, 'https://http2.mlstatic.com/D_NQ_NP_821721-MLU77335571890_072024-O.webp'),
(6, 'Smartwatch Amazfit Bip U', 'Tecnología', 220000, 'https://http2.mlstatic.com/D_NQ_NP_606167-MCO79431213854_092024-O.webp'),
(7, 'Tablet Samsung Galaxy Tab A8 64GB', 'Tecnología', 750000, 'https://http2.mlstatic.com/D_NQ_NP_687759-MLU78817843472_092024-O.webp'),
(8, 'Monitor LG 24\'\' Full HD IPS', 'Tecnología', 520000, 'https://http2.mlstatic.com/D_NQ_NP_612980-MLA76911848964_062024-O.webp'),
(9, 'Disco Duro Externo Seagate 1TB', 'Tecnología', 210000, 'https://http2.mlstatic.com/D_NQ_NP_907894-MCO31558532242_072019-O.webp'),
(10, 'Teclado Mecánico Redragon Kumara', 'Tecnología', 150000, 'https://http2.mlstatic.com/D_NQ_NP_864807-MLA77594879101_072024-O.webp'),
(11, 'Mouse Inalámbrico Logitech M185', 'Tecnología', 45000, 'https://http2.mlstatic.com/D_NQ_NP_848052-MLU72570326002_112023-O.webp'),
(12, 'Cámara Web Logitech C920 HD', 'Tecnología', 230000, 'https://http2.mlstatic.com/D_NQ_NP_760342-MLA49170463523_022022-O.webp'),
(13, 'Impresora HP Ink Tank 315', 'Tecnología', 520000, 'https://media.falabella.com/falabellaCO/5221613_1/w=800,h=800,fit=pad'),
(14, 'Smart TV LG 50\'\' 4K UHD', 'Tecnología', 1499000, 'https://exitocol.vtexassets.com/arquivos/ids/27169249/Televisor-LG-50-Pulgadas-LED-Uhd-4K-Smart-TV-50UR7800PSBAWC-3382700_a.jpg?v=638792026341870000'),
(15, 'Google Chromecast 4K con Google TV', 'Tecnología', 250000, 'https://www.alkosto.com/medias/193575007250-001-750Wx750H?context=bWFzdGVyfGltYWdlc3w0NDQ0fGltYWdlL3dlYnB8YUdVd0wyaGxNUzh4TkRNMk5EZ3hNekkyTWpnM09DOHhPVE0xTnpVd01EY3lOVEJmTURBeFh6YzFNRmQ0TnpVd1NBfDdlMTVjODcwMTJiYmZhODZjYjQ1NjJkOGY0NGRhMzAxMDI1NjY0ODNkM2IyY');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Base de datos: `markets`
--
CREATE DATABASE IF NOT EXISTS `markets` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `markets`;

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
('1', 'RECLAMO', 'No llego mi producto y aparece entregado', 1),
('2', 'VALORACION', 'muy buenos tiempos de entrega', 2),
('3', 'QUEJA', 'No funciona mi contraseña y no me deja cambiarla', 3),
('7', '', '', 2),
('8', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones_del_producto`
--

CREATE TABLE `opciones_del_producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `PRECIO` bigint(20) NOT NULL,
  `NOMBRE_TIENDA` varchar(110) NOT NULL,
  `ID_TIENDA` int(11) NOT NULL,
  `ID_PROD2` int(11) NOT NULL,
  `NOMBRE_P` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `opciones_del_producto`
--

INSERT INTO `opciones_del_producto` (`ID_PRODUCTO`, `PRECIO`, `NOMBRE_TIENDA`, `ID_TIENDA`, `ID_PROD2`, `NOMBRE_P`) VALUES
(1, 572051, 'MERCADO LIBRE', 1, 1, 'Galaxy Buds2 Pro SM-R510'),
(2, 692196, 'AMAZON', 2, 1, 'Galaxy Buds2 Pro SM-R510'),
(3, 955900, 'exito', 5, 2, 'Apple AirPods Pro 2 MagSafe Case USB-C'),
(4, 1204296, 'amazon', 2, 2, 'Apple AirPods Pro 2 MagSafe Case USB-C'),
(5, 1302740, 'Apple', 3, 2, 'Apple AirPods Pro 2 MagSafe Case USB-C'),
(6, 384900, 'MERCADO LIBRE\r\n', 1, 3, 'Parlante Portátil Inalámbrico Ult Field '),
(7, 423997, 'AMAZON', 2, 3, 'Parlante Portátil Inalámbrico Ult Field '),
(8, 649899, 'SONY', 4, 3, 'Parlante Portátil Inalámbrico Ult Field '),
(9, 94800, 'Mercado libre', 1, 4, 'Audífonos Kz Castor Improved Bass 2dd In Ear Tuning Switches\r\n'),
(10, 116900, 'amazon', 2, 4, 'Audífonos Kz Castor Improved Bass 2dd In Ear Tuning Switches\r\n'),
(11, 120000, 'FEMMTO', 6, 5, 'Hidrolavadora Electrica Trent HLT203 1400W\r\n'),
(12, 196000, 'MERCADO LIBRE', 1, 5, 'Hidrolavadora Electrica Trent HLT203 1400W\r\n'),
(13, 70000, 'MERCADO LIBRE', 1, 6, 'Xiaomi Redmi Buds 4 Active'),
(14, 86550, 'AMAZON', 2, 6, 'Xiaomi Redmi Buds 4 Active'),
(15, 0, '', 16, 2, ''),
(16, 17, '', 0, 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `PRECIO` bigint(20) NOT NULL,
  `NOMBRE_DEL_PRODUCTO` varchar(255) DEFAULT NULL,
  `FECHA_AGREGADO` date DEFAULT current_timestamp(),
  `Foto_producto` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_PRODUCTO`, `PRECIO`, `NOMBRE_DEL_PRODUCTO`, `FECHA_AGREGADO`, `Foto_producto`) VALUES
(1, 692196, 'Galaxy Buds2 Pro SM-R510', '2025-04-01', ''),
(2, 2707800, 'Apple AirPods Pro 2 MagSafe Case USB-C', '2025-04-01', ''),
(3, 384900, 'Parlante Portátil Inalámbrico Ult Field ', '2025-04-01', ''),
(4, 94800, 'Audífonos Kz Castor Improved Bass 2dd In Ear Tuning Switches\r\n', '2025-04-02', ''),
(5, 196000, 'Hidrolavadora Electrica Trent HLT203 1400W', '2025-04-09', ''),
(6, 86550, 'Xiaomi Redmi Buds 4 Active', '2025-04-02', ''),
(7, 555555, NULL, '2025-05-16', '');

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
(1, 'MERCADO LIBRE', 1, 'https://www.mercadolibre.com.co/'),
(2, 'AMAZON', 2, 'https://www.amazon.co.uk/ref=nav_logo'),
(3, 'APPLE', 5, 'https://www.apple.com/'),
(4, 'SONY', 8, 'https://www.sony.com.co/'),
(5, 'EXITO', 3, 'https://www.exito.com/'),
(6, 'FEMMTO', 5, 'FEMMTO.COM'),
(16, 'Apple', 111222, NULL);

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
(0, '', '', '', 0),
(1, 'Ado', 'Ado1911', 'beltranblaze28@gmail.com', 554856),
(2, 'JOHAN', '1234', 'joahnvega@gmail.com', 55428),
(3, 'ANGEL', '4321', 'angelv@gmail.com', 511472),
(4, 'kkkkkkkkk', '', '', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ID_COMENTARIO`),
  ADD KEY `ID_comentarios` (`ID_USUARIO`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `opciones_del_producto`
--
ALTER TABLE `opciones_del_producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `ID_OPCIONES` (`ID_PROD2`),
  ADD KEY `NOMBRE_TIENDA` (`NOMBRE_TIENDA`),
  ADD KEY `ID_TIENDA` (`ID_TIENDA`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `NOMBRE_DEL_PRODUCTO` (`NOMBRE_DEL_PRODUCTO`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`NUMER_DE_TIENDA`),
  ADD KEY `NUMER_DE_TIENDA` (`NUMER_DE_TIENDA`),
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
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_PRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4445;

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
  ADD CONSTRAINT `ID_OPCIONES` FOREIGN KEY (`ID_PROD2`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD CONSTRAINT `NOMBRE_TIENDA` FOREIGN KEY (`NUMER_DE_TIENDA`) REFERENCES `opciones_del_producto` (`ID_TIENDA`) ON DELETE CASCADE,
  ADD CONSTRAINT `tienda_ibfk_1` FOREIGN KEY (`NOMBRE`) REFERENCES `opciones_del_producto` (`NOMBRE_TIENDA`) ON DELETE CASCADE;
--
-- Base de datos: `neklin`
--
CREATE DATABASE IF NOT EXISTS `neklin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `neklin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `DPTO_COD` int(11) NOT NULL,
  `NOMBRE_DPTO` varchar(30) DEFAULT NULL,
  `DPTO_PADRE` int(11) DEFAULT NULL,
  `PRESUPUESTO` int(11) DEFAULT NULL,
  `PRES_ACTUAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dotacion`
--

CREATE TABLE `dotacion` (
  `CODIGO_ARTICULO` int(11) DEFAULT NULL,
  `NOMBRE_ARTICULO` varchar(50) DEFAULT NULL,
  `CANTIDAD_ARTICULOS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado8`
--

CREATE TABLE `empleado8` (
  `DNI_EMPLEADO` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `CARGO` enum('SEGURIDAD','CAMARERO','LIMPIEZA') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado9`
--

CREATE TABLE `empleado9` (
  `DNI_EMPLEADO` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `CARGO` enum('SEGURIDAD','CAMARERO','LIMPIEZA') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado11`
--

CREATE TABLE `empleado11` (
  `DNI_EMPLEADO` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `CARGO` enum('SEGURIDAD','CAMARERO','LIMPIEZA') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado12`
--

CREATE TABLE `empleado12` (
  `DNI_EMPLEADO` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `CARGO` enum('SEGURIDAD','CAMARERO','LIMPIEZA') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `DNI` varchar(8) NOT NULL,
  `NOMBRE` varchar(10) DEFAULT NULL,
  `APELLIDO1` varchar(15) DEFAULT NULL,
  `APELLIDO2` varchar(15) DEFAULT NULL,
  `DIRECC1` varchar(25) DEFAULT NULL,
  `DIRECC2` varchar(20) DEFAULT NULL,
  `CIUDAD` varchar(20) DEFAULT NULL,
  `PROVINCIA` varchar(20) DEFAULT NULL,
  `COD_POSTAL` varchar(5) DEFAULT NULL,
  `SEXO` enum('M','H') DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enseña`
--

CREATE TABLE `enseña` (
  `INSTRUCTOR` int(11) DEFAULT NULL,
  `APRENDIZ` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `CODIGO_APRENDIZ` int(11) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `APELLIDO` varchar(30) DEFAULT NULL,
  `PROG_FORMACION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudios`
--

CREATE TABLE `estudios` (
  `EMPLEADO_DNI` int(8) DEFAULT NULL,
  `UNIVERSIDAD` int(5) DEFAULT NULL,
  `AÑO` date DEFAULT NULL,
  `GRADO` varchar(3) DEFAULT NULL,
  `ESPECIALIDAD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `existencias12`
--

CREATE TABLE `existencias12` (
  `COD_ARTICULO` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PRECIO` int(11) NOT NULL CHECK (`PRECIO`),
  `COD_PUG` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_laboral`
--

CREATE TABLE `historial_laboral` (
  `EMPLEADO_DNI` int(11) DEFAULT NULL,
  `TRABAJO_COD` int(11) DEFAULT NULL,
  `FECHA_INICIO` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL,
  `DPTO_COD` int(11) DEFAULT NULL,
  `SUPERVISOR_DNI` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_salarial`
--

CREATE TABLE `historial_salarial` (
  `EMPLEADO_DNI` int(11) NOT NULL,
  `SALARIO` int(11) DEFAULT NULL,
  `FECHA_COMIENZO` date DEFAULT NULL,
  `FECHA_FIN` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `CODIGO_INST` int(11) DEFAULT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `APELLIDO` varchar(20) DEFAULT NULL,
  `DIRECCION` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad12`
--

CREATE TABLE `localidad12` (
  `COD_LOCALIDAD` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pub`
--

CREATE TABLE `pub` (
  `COD_PUB` varchar(100) NOT NULL,
  `NOMBRE` varchar(120) NOT NULL,
  `LICENCIA_FISCAL` varchar(50) NOT NULL,
  `DOMICILIO` varchar(80) DEFAULT NULL,
  `FECHA_APERTURA` varchar(130) NOT NULL,
  `HORARIO` enum('HOR1','HOR2','HOR3') DEFAULT NULL,
  `COD_LOCALIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pubpub_empleado12`
--

CREATE TABLE `pubpub_empleado12` (
  `COD_PUB` varchar(100) DEFAULT NULL,
  `DNI_EMPLEADO` varchar(255) DEFAULT NULL,
  `FUNCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldado`
--

CREATE TABLE `soldado` (
  `CODIGO_SOLDADO` int(11) DEFAULT NULL,
  `NOMBRE_SOLDADO` varchar(40) DEFAULT NULL,
  `APELLIDO_SOLDADO` varchar(20) DEFAULT NULL,
  `EDAD_SOLDADO` int(11) DEFAULT NULL,
  `ARMAMENTO` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titular8`
--

CREATE TABLE `titular8` (
  `DNI_TITULAR` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DOMICILIO` varchar(100) DEFAULT NULL,
  `COD_PUB` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titular9`
--

CREATE TABLE `titular9` (
  `DNI_TITULAR` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DOMICILIO` varchar(100) DEFAULT NULL,
  `COD_PUB` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titular10`
--

CREATE TABLE `titular10` (
  `DNI_TITULAR` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DOMICILIO` varchar(100) DEFAULT NULL,
  `COD_PUB` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titular11`
--

CREATE TABLE `titular11` (
  `DNI_TITULAR` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DOMICILIO` varchar(100) DEFAULT NULL,
  `COD_PUB` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titular12`
--

CREATE TABLE `titular12` (
  `DNI_TITULAR` varchar(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DOMICILIO` varchar(100) DEFAULT NULL,
  `COD_PUB` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `TRABAJO_COD` int(11) DEFAULT NULL,
  `NOMBRE_TRAB` varchar(20) DEFAULT NULL,
  `SALARIO_MIN` int(11) DEFAULT NULL,
  `SALARIO_MAX` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `universidades`
--

CREATE TABLE `universidades` (
  `UNIV_COD` int(11) DEFAULT NULL,
  `NOMBRE_UNIV` varchar(25) DEFAULT NULL,
  `CIUDAD` varchar(20) DEFAULT NULL,
  `COD_POSTAL` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`DPTO_COD`);

--
-- Indices de la tabla `empleado8`
--
ALTER TABLE `empleado8`
  ADD PRIMARY KEY (`DNI_EMPLEADO`);

--
-- Indices de la tabla `empleado9`
--
ALTER TABLE `empleado9`
  ADD PRIMARY KEY (`DNI_EMPLEADO`);

--
-- Indices de la tabla `empleado11`
--
ALTER TABLE `empleado11`
  ADD PRIMARY KEY (`DNI_EMPLEADO`);

--
-- Indices de la tabla `empleado12`
--
ALTER TABLE `empleado12`
  ADD PRIMARY KEY (`DNI_EMPLEADO`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`CODIGO_APRENDIZ`);

--
-- Indices de la tabla `existencias12`
--
ALTER TABLE `existencias12`
  ADD PRIMARY KEY (`COD_ARTICULO`);

--
-- Indices de la tabla `historial_salarial`
--
ALTER TABLE `historial_salarial`
  ADD PRIMARY KEY (`EMPLEADO_DNI`);

--
-- Indices de la tabla `localidad12`
--
ALTER TABLE `localidad12`
  ADD PRIMARY KEY (`COD_LOCALIDAD`);

--
-- Indices de la tabla `pub`
--
ALTER TABLE `pub`
  ADD PRIMARY KEY (`COD_PUB`);

--
-- Indices de la tabla `titular8`
--
ALTER TABLE `titular8`
  ADD PRIMARY KEY (`DNI_TITULAR`);

--
-- Indices de la tabla `titular9`
--
ALTER TABLE `titular9`
  ADD PRIMARY KEY (`DNI_TITULAR`);

--
-- Indices de la tabla `titular10`
--
ALTER TABLE `titular10`
  ADD PRIMARY KEY (`DNI_TITULAR`);

--
-- Indices de la tabla `titular11`
--
ALTER TABLE `titular11`
  ADD PRIMARY KEY (`DNI_TITULAR`);

--
-- Indices de la tabla `titular12`
--
ALTER TABLE `titular12`
  ADD PRIMARY KEY (`DNI_TITULAR`);
--
-- Base de datos: `ofertia`
--
CREATE DATABASE IF NOT EXISTS `ofertia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ofertia`;

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
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"full_screen\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', '5454545', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"agenda\",\"articulos\",\"empleados\",\"libros\",\"peliculas\"],\"table_structure[]\":[\"agenda\",\"articulos\",\"empleados\",\"libros\",\"peliculas\"],\"table_data[]\":[\"agenda\",\"articulos\",\"empleados\",\"libros\",\"peliculas\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'inner join', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"cliente\",\"copias\",\"peliculas\",\"prestamos\"],\"table_structure[]\":[\"cliente\",\"copias\",\"peliculas\",\"prestamos\"],\"table_data[]\":[\"cliente\",\"copias\",\"peliculas\",\"prestamos\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(3, 'root', 'database', 'MARKETSALE', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"table_structure[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"table_data[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(4, 'root', 'database', 'MARKETS', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"table_structure[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"table_data[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(5, 'root', 'database', 'market sale', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"table_structure[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"table_data[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(6, 'root', 'database', 'MARKET_SALE', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"table_structure[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"table_data[]\":[\"comentarios\",\"opciones_del_producto\",\"producto\",\"tienda\",\"usuario\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(7, 'root', 'server', 'aroooz ofetia', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"arbol\",\"evelyn\",\"guia 23/04\",\"guia con mayra\",\"laboratorio\",\"maqueta\",\"markets\",\"neklin\",\"ofertia\",\"phpmyadmin\",\"sena\",\"taller\",\"taller6\",\"taller 23/4/2025 ado\",\"test\",\"tienda\",\"tiendass\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Volcado de datos para la tabla `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'tables', 'group', 'mysql', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"ofertia\",\"table\":\"productos\"},{\"db\":\"ofertia\",\"table\":\"categorias\"},{\"db\":\"ofertia\",\"table\":\"usuario\"},{\"db\":\"sena\",\"table\":\"aprendiz\"},{\"db\":\"sena\",\"table\":\"instructor\"},{\"db\":\"sena\",\"table\":\"programa\"},{\"db\":\"ofertia\",\"table\":\"opciones_del_producto\"},{\"db\":\"ofertia\",\"table\":\"comentarios\"},{\"db\":\"markets\",\"table\":\"usuario\"},{\"db\":\"maqueta\",\"table\":\"producto\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('evelyn', 'autor', 'AUT_NOMBRE'),
('evelyn', 'cliente', 'CLI_NOMBRE'),
('market sale', 'comentarios', 'ID_COMENTARIO'),
('market sale', 'opciones_del_producto', 'NOMBRE_TIENDA'),
('market sale', 'tienda', 'NUMER_DE_TIENDA'),
('market sale', 'usuario', 'CONTRASEÑA'),
('markets', 'comentarios', 'ID_COMENTARIO'),
('markets', 'opciones_del_producto', 'NOMBRE_TIENDA'),
('markets', 'tienda', 'NOMBRE'),
('taller 23/4/2025 ado', 'copias', 'DETERIORADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'markets', 'producto', '{\"CREATE_TIME\":\"2025-05-09 15:09:24\",\"col_order\":[0,1,2,3,4],\"col_visib\":[1,1,1,1,1],\"sorted_col\":\"`producto`.`ID_PRODUCTO`  ASC\"}', '2025-05-14 19:46:58'),
('root', 'markets', 'usuario', '{\"sorted_col\":\"`EMAIL` ASC\"}', '2025-05-14 20:15:31'),
('root', 'ofertia', 'productos', '{\"sorted_col\":\"`productos`.`id_producto` ASC\"}', '2025-05-21 21:14:30'),
('root', 'ofertia', 'tienda', '{\"sorted_col\":\"`tienda`.`NUMER_DE_TIENDA` ASC\"}', '2025-05-21 19:35:24'),
('root', 'tiendass', 'compras', '{\"sorted_col\":\"`compras`.`VALOR_TOTAL` ASC\"}', '2025-04-09 20:57:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('taller6', 'agenda', 1, '2025-03-28 21:22:41', '2025-03-28 21:22:41', 'a:2:{s:7:\"COLUMNS\";a:3:{i:0;a:8:{s:5:\"Field\";s:6:\"nombre\";s:4:\"Type\";s:11:\"varchar(25)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:9:\"domicilio\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:8:\"telefono\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:3:\"YES\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:0:{}}', '# log 2025-03-28 21:22:41 root\nDROP TABLE IF EXISTS `agenda`;\n# log 2025-03-28 21:22:41 root\n\nCREATE TABLE `agenda` (\n  `nombre` varchar(25) DEFAULT NULL,\n  `domicilio` varchar(30) DEFAULT NULL,\n  `telefono` varchar(10) DEFAULT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-05-28 22:16:21', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `sena`
--
CREATE DATABASE IF NOT EXISTS `sena` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sena`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `NUMERO_DOCUMENTO` varchar(30) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `CORREO` varchar(30) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `CODIGO_PROGRAMA` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`NUMERO_DOCUMENTO`, `NOMBRE`, `CORREO`, `FECHA_NACIMIENTO`, `CODIGO_PROGRAMA`) VALUES
('0987654321', 'Ana Torres', 'ana.torres@Gmail.com', '1819-08-15', '2'),
('1122334455', 'Luis Gómez', 'luis.gomez@Gmail.com', '2021-11-20', '3'),
('1234567890', 'Juan Pérez', 'juan.perez@Gmail.com', '2020-06-10', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `NUMERO_DOCUMENTO` varchar(30) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `CODIGO_PROGRAMA` varchar(30) DEFAULT NULL,
  `DOC_ESTUDIANTE` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`NUMERO_DOCUMENTO`, `NOMBRE`, `CODIGO_PROGRAMA`, `DOC_ESTUDIANTE`) VALUES
('5558889111', 'Carlos Mendoza', '1', '1234567890'),
('6348773333', 'Jorge López', '1', '1122334455'),
('6456662222', 'Marta Ríos', '1', '0987654321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `CODIGO` varchar(30) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `FECHA_CREACION` date DEFAULT NULL,
  `CENTRO` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`CODIGO`, `NOMBRE`, `FECHA_CREACION`, `CENTRO`) VALUES
('1', 'Desarrollo de Software', '2022-01-15', 'Centro Industrial'),
('2', 'Diseño Gráfico', '2021-03-10', 'Centro de Diseño'),
('3', 'Electricidad Industrial', '2023-05-05', 'Centro Tecnológico');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`NUMERO_DOCUMENTO`),
  ADD KEY `CODIGO_PROGRAMA` (`CODIGO_PROGRAMA`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`NUMERO_DOCUMENTO`),
  ADD KEY `CODIGO_PROGRAMA` (`CODIGO_PROGRAMA`),
  ADD KEY `DOC_ESTUDIANTE` (`DOC_ESTUDIANTE`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD CONSTRAINT `aprendiz_ibfk_1` FOREIGN KEY (`CODIGO_PROGRAMA`) REFERENCES `programa` (`CODIGO`);

--
-- Filtros para la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`CODIGO_PROGRAMA`) REFERENCES `programa` (`CODIGO`),
  ADD CONSTRAINT `instructor_ibfk_2` FOREIGN KEY (`DOC_ESTUDIANTE`) REFERENCES `aprendiz` (`NUMERO_DOCUMENTO`);
--
-- Base de datos: `taller`
--
CREATE DATABASE IF NOT EXISTS `taller` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `taller`;
--
-- Base de datos: `taller6`
--
CREATE DATABASE IF NOT EXISTS `taller6` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `taller6`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agenda`
--

CREATE TABLE `agenda` (
  `nombre` varchar(25) DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agenda`
--

INSERT INTO `agenda` (`nombre`, `domicilio`, `telefono`) VALUES
('Alberto Mores', 'Cali 05', '7654321'),
('Juan Torres', 'Medellin 04', '4458787');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `código_del_articulo` int(11) DEFAULT NULL,
  `nombre_del_artículo` varchar(20) DEFAULT NULL,
  `descripción` varchar(30) DEFAULT NULL,
  `precio` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`código_del_articulo`, `nombre_del_artículo`, `descripción`, `precio`) VALUES
(1, 'impresora', 'Epson Stylus C45', 400.8),
(2, 'impresora', 'Epson Stylus C85', 500),
(3, 'monitor', 'Samsung 14', 800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `nombre` varchar(20) DEFAULT NULL,
  `documento` varchar(8) DEFAULT NULL,
  `sexo` enum('m','f') DEFAULT NULL,
  `domicilio` varchar(30) DEFAULT NULL,
  `sueldobasico` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`nombre`, `documento`, `sexo`, `domicilio`, `sueldobasico`) VALUES
('Juan Perez', '22345678', 'm', 'Sarmiento 123', 200),
('Ana Melo', '24345678', 'f', 'Colon 134', 400),
('Marcos Torres', '27345678', 'm', 'Urquiza 479', 700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `TITULO` varchar(20) DEFAULT NULL,
  `AUTOR` varchar(30) DEFAULT NULL,
  `EDITORIAL` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`TITULO`, `AUTOR`, `EDITORIAL`) VALUES
('100 años de Soledad', 'Garcia Marquez', 'Planeta'),
('100 años de Soledad', 'Garcia Marquez', 'Planeta'),
('El Tunel', 'Ernesto Sabato', 'Emece'),
('50 sombras de Grey', 'E. L. James', 'Emece');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `titulo` varchar(25) DEFAULT NULL,
  `actor` varchar(25) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`titulo`, `actor`, `duracion`, `cantidad`) VALUES
('Mision imposible', 'Tom Cruise', 120, 3),
('Mision imposible 2', 'Tom Cruise', 180, 2),
('Mujer bonita', 'Julia R.', 90, 3);
--
-- Base de datos: `taller 23/4/2025 ado`
--
CREATE DATABASE IF NOT EXISTS `taller 23/4/2025 ado` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `taller 23/4/2025 ado`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `COD_CLIENTE` int(11) NOT NULL,
  `DNI` bigint(20) DEFAULT NULL,
  `NOMBRE` varchar(70) DEFAULT NULL,
  `APELLIDO1` varchar(70) DEFAULT NULL,
  `APELLIDO2` varchar(70) DEFAULT NULL,
  `DIRECCION` varchar(80) DEFAULT NULL,
  `EMAIL` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`COD_CLIENTE`, `DNI`, `NOMBRE`, `APELLIDO1`, `APELLIDO2`, `DIRECCION`, `EMAIL`) VALUES
(1, 8001548, 'ADO', 'BELTRAN', 'RODRIGUEZ', 'CALLE88', 'BELTRAN@GMAIL.COM'),
(2, 7788454, 'JOHAN', 'VERNAL', 'VEGA', 'CALLE100', 'VEGA@GMAIL.COM'),
(3, 1200596649, 'ANGEL', 'VEGA', 'MAZA', 'CALLE40', 'ANGEL@GMAIL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `copias`
--

CREATE TABLE `copias` (
  `N_COPIAS` int(11) NOT NULL,
  `DETERIORADA` varchar(80) DEFAULT NULL,
  `FORMATO` varchar(70) DEFAULT NULL,
  `ID_PELICULA` int(11) DEFAULT NULL,
  `PRECIO_ALQUILER` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `copias`
--

INSERT INTO `copias` (`N_COPIAS`, `DETERIORADA`, `FORMATO`, `ID_PELICULA`, `PRECIO_ALQUILER`) VALUES
(1, 'DETALLE EN EL CD', 'CD', 1, 10000),
(2, 'SIN CARATULA', 'CD', 2, 10000),
(3, 'DETALLE EN LA PORTADA', 'VHS', 3, 8000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `ID_PELICULA` int(11) NOT NULL,
  `TITULO` varchar(80) DEFAULT NULL,
  `AÑO` date DEFAULT NULL,
  `CRITICA` varchar(8000) DEFAULT NULL,
  `CARATULA` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`ID_PELICULA`, `TITULO`, `AÑO`, `CRITICA`, `CARATULA`) VALUES
(1, 'BEGGIN', '2019-04-11', 'MUY MALA', 'BONITA:D'),
(2, 'HONEY', '2022-04-14', 'REGULAR', 'MUY LLAMATIVA'),
(3, 'SUPERMODEL', '2016-05-13', 'ALGO BUENA PERO MAL GUION', 'ALGO FEA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_PRESTAMOS` int(11) NOT NULL,
  `FECHA_PRESTAMO` date DEFAULT NULL,
  `FECHA_TOPE` date DEFAULT NULL,
  `FECHA_ENTREGA` date DEFAULT NULL,
  `COD_CLIENTE` int(11) DEFAULT NULL,
  `N_COPIA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_PRESTAMOS`, `FECHA_PRESTAMO`, `FECHA_TOPE`, `FECHA_ENTREGA`, `COD_CLIENTE`, `N_COPIA`) VALUES
(1, '2025-03-06', '2025-03-14', '2025-03-20', 1, 1),
(2, '2025-04-21', '2025-04-28', '2025-04-30', 2, 2),
(3, '2025-06-15', '2025-06-20', '2025-06-28', 3, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`COD_CLIENTE`);

--
-- Indices de la tabla `copias`
--
ALTER TABLE `copias`
  ADD PRIMARY KEY (`N_COPIAS`),
  ADD KEY `id_pelicula` (`ID_PELICULA`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`ID_PELICULA`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_PRESTAMOS`),
  ADD KEY `cod_cliente` (`COD_CLIENTE`),
  ADD KEY `n_copias` (`N_COPIA`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `copias`
--
ALTER TABLE `copias`
  ADD CONSTRAINT `id_pelicula` FOREIGN KEY (`ID_PELICULA`) REFERENCES `peliculas` (`ID_PELICULA`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `cod_cliente` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `cliente` (`COD_CLIENTE`),
  ADD CONSTRAINT `n_copias` FOREIGN KEY (`N_COPIA`) REFERENCES `copias` (`N_COPIAS`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Base de datos: `tienda`
--
CREATE DATABASE IF NOT EXISTS `tienda` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tienda`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `CORREO` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`, `NOMBRE`, `FECHA_NACIMIENTO`, `CORREO`) VALUES
(1, 'julian', '2000-11-03', 'juliproxd@hotma'),
(6, 'julian', '2000-11-03', 'juliproxd@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `PRECIO` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_PRODUCTO`, `NOMBRE`, `PRECIO`) VALUES
(2, 'cuaderno', 6000),
(4, 'Lapiz', 4000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_VENTAS` int(11) NOT NULL,
  `VALOR_TOTAL` float NOT NULL,
  `FECHA_VENTA` date NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID_VENTAS`, `VALOR_TOTAL`, `FECHA_VENTA`, `ID_PRODUCTO`, `ID_CLIENTE`) VALUES
(10, 10000, '2025-05-05', 2, 6),
(14, 16000, '2025-10-07', 4, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_PRODUCTO`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_VENTAS`),
  ADD KEY `FK_APPLE` (`ID_CLIENTE`),
  ADD KEY `FK_BANANA` (`ID_PRODUCTO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `FK_APPLE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`),
  ADD CONSTRAINT `FK_BANANA` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`);
--
-- Base de datos: `tiendass`
--
CREATE DATABASE IF NOT EXISTS `tiendass` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tiendass`;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cliente` (
`nombre` varchar(120)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `FECHA_NAC` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cedula`, `nombre`, `correo`, `FECHA_NAC`) VALUES
(7745955, 'CARLOS ', 'CARLOS@GMAIL.COM', '2015-04-09'),
(7784516, 'ADO', 'ADO@GMAIL.COM', '2011-04-09'),
(78887564, 'Mayra ', 'MAYRA@GMAIL.COM', '2015-04-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compras` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `VALOR_TOTAL` float NOT NULL,
  `cc_cliente` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compras`, `fecha`, `VALOR_TOTAL`, `cc_cliente`, `productos_id`) VALUES
(1, '2022-04-15', 600000, 7745955, 3),
(2, '2019-04-12', 15000000, 78887564, 1),
(3, '2025-04-01', 300000, 7784516, 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `compras1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `compras1` (
`fecha` date
,`cc_cliente` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_PRODUCTO`, `nombre`, `precio`, `stock`) VALUES
(1, 'CARRO', 15000000, 88),
(2, 'AUDIFONOS', 300000, 15),
(3, 'CELULAR', 600000, 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `productos2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `productos2` (
`nombre` varchar(120)
,`precio` float
);

-- --------------------------------------------------------

--
-- Estructura para la vista `cliente`
--
DROP TABLE IF EXISTS `cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cliente`  AS SELECT `clientes`.`nombre` AS `nombre` FROM `clientes` WHERE `clientes`.`cedula` = 7745955 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `compras1`
--
DROP TABLE IF EXISTS `compras1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `compras1`  AS SELECT `compras`.`fecha` AS `fecha`, `compras`.`cc_cliente` AS `cc_cliente` FROM `compras` WHERE `compras`.`id_compras` = 3 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `productos2`
--
DROP TABLE IF EXISTS `productos2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `productos2`  AS SELECT `productos`.`nombre` AS `nombre`, `productos`.`precio` AS `precio` FROM `productos` WHERE `productos`.`ID_PRODUCTO` = 2 ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `FK_CLIENTE` (`cc_cliente`),
  ADD KEY `fk_productos` (`productos_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_PRODUCTO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_PRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `FK_CLIENTE` FOREIGN KEY (`cc_cliente`) REFERENCES `clientes` (`cedula`),
  ADD CONSTRAINT `fk_productos` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`ID_PRODUCTO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
