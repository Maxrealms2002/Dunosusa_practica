-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2023 a las 05:32:26
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `ruc`, `nombre`, `direccion`, `telefono`, `estado`) VALUES
(1, '7134726', 'Cliente Frecuente', 'Lima - Perú', '925491523', 0),
(4, '23456', 'Cliente de prueba', 'editado', '92541456', 1),
(5, '6543', 'car', '654676', '5467dd', 0),
(6, '1', 'Carlos', 'Calle los alpes 210', '5631789876', 1),
(7, '234', 'car', '345', '5467854', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `total`, `estado`, `fecha`) VALUES
(4, 30.00, 1, '2023-11-16 10:57:42'),
(5, 1.00, 1, '2023-11-16 11:00:54'),
(6, 100.00, 1, '2023-11-16 14:20:21'),
(7, 100.00, 1, '2023-11-17 20:53:56'),
(8, 7.00, 1, '2023-11-18 14:04:43'),
(9, 550.00, 1, '2023-11-18 14:06:00'),
(10, 40.00, 1, '2023-11-18 14:10:21'),
(11, 1.00, 1, '2023-11-19 15:04:33'),
(12, 9.00, 1, '2023-11-19 15:47:31'),
(13, 1.00, 1, '2023-11-20 10:24:46'),
(14, 100.00, 1, '2023-11-21 13:36:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` text NOT NULL,
  `razon` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `ruc`, `nombre`, `telefono`, `direccion`, `razon`) VALUES
(1, '3', 'Dunosusa Felipe carrillo 3', '999 940 6060', ' Lázaro Cárdenas 877, 77240', 'empresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `producto` varchar(200) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`id`, `id_compra`, `producto`, `id_producto`, `cantidad`, `precio`, `id_usuario`, `fecha`) VALUES
(1, 4, 'LECHE NIDO', 3, 300, 100.00, 1, '2023-11-16 10:57:42'),
(2, 5, 'LECHE NIDO', 3, 12, 100.00, 1, '2023-11-16 11:00:54'),
(3, 6, 'LECHE NIDO', 3, 1000, 100.00, 1, '2023-11-16 14:20:21'),
(4, 7, 'LECHE NIDO', 3, 1000, 100.00, 1, '2023-11-17 20:53:56'),
(5, 8, 'frutas', 2, 9000, 810.00, 1, '2023-11-18 14:04:43'),
(6, 9, 'Gaseosa', 1, 1000, 550.00, 1, '2023-11-18 14:06:00'),
(7, 10, 'frutas', 2, 50, 810.00, 1, '2023-11-18 14:10:21'),
(8, 11, 'LECHE NIDO', 3, 10, 100.00, 1, '2023-11-19 15:04:33'),
(9, 12, 'frutas', 2, 12, 810.00, 1, '2023-11-19 15:47:31'),
(10, 13, 'LECHE NIDO', 3, 15, 100.00, 1, '2023-11-20 10:24:46'),
(11, 14, 'LECHE NIDO', 3, 1, 100.00, 3, '2023-11-21 13:36:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_usuario` varchar(100) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `producto` varchar(200) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `id_venta`, `producto`, `id_producto`, `cantidad`, `precio`, `id_usuario`, `fecha`) VALUES
(1, 1, 'Gaseosa', 1, 4, 550.00, 1, '2023-11-15 15:35:18'),
(2, 2, 'frutas', 2, 2, 810.00, 1, '2023-11-15 16:26:25'),
(3, 3, 'frutas', 2, 3, 810.00, 1, '2023-11-15 16:46:51'),
(4, 4, 'LECHE NIDO', 3, 2, 100.00, 1, '2023-11-15 16:48:10'),
(5, 5, 'LECHE NIDO', 3, 15, 100.00, 1, '2023-11-16 10:58:27'),
(6, 6, 'LECHE NIDO', 3, 19, 100.00, 1, '2023-11-16 14:07:56'),
(7, 7, 'LECHE NIDO', 3, 16, 100.00, 1, '2023-11-16 14:22:51'),
(8, 8, 'frutas', 2, 3, 810.00, 1, '2023-11-16 23:39:43'),
(9, 9, 'frutas', 2, 3, 810.00, 1, '2023-11-16 23:40:26'),
(10, 10, 'LECHE NIDO', 3, 14, 100.00, 1, '2023-11-17 15:51:31'),
(11, 11, 'LECHE NIDO', 3, 4, 100.00, 1, '2023-11-17 20:53:24'),
(12, 12, 'frutas', 2, 300, 810.00, 1, '2023-11-18 14:05:20'),
(13, 13, 'Gaseosa', 1, 400, 550.00, 1, '2023-11-18 14:06:18'),
(14, 14, 'frutas', 2, 6, 810.00, 1, '2023-11-18 14:07:40'),
(15, 15, 'frutas', 2, 1, 810.00, 1, '2023-11-18 14:08:55'),
(16, 16, 'frutas', 2, 12, 810.00, 1, '2023-11-18 14:11:25'),
(17, 17, 'frutas', 2, 17, 810.00, 1, '2023-11-18 14:12:03'),
(18, 18, 'LECHE NIDO', 3, 16, 100.00, 1, '2023-11-20 10:24:03'),
(19, 19, 'frutas', 2, 15, 810.00, 1, '2023-11-21 00:09:41'),
(20, 20, 'LECHE NIDO', 3, 13, 100.00, 2, '2023-11-21 00:49:44'),
(21, 20, 'frutas', 2, 12, 810.00, 2, '2023-11-21 00:49:44'),
(22, 21, 'frutas', 2, 2, 810.00, 3, '2023-11-21 13:21:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `precio` decimal(10,2) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `cantidad`, `precio`, `estado`) VALUES
(1, '2580', 'Gaseosa', 2, 550.00, 1),
(2, '12345', 'frutas', 3, 810.00, 1),
(3, '12', 'LECHE NIDO', 2, 100.00, 1),
(4, '100', 'aceite canola', 1, 234.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(150) NOT NULL,
  `rol` varchar(20) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `correo`, `clave`, `rol`, `estado`) VALUES
(1, 'admin', 'Administrador', 'admin@itscarrillopuerto.edu.mx', 'fbe10beedf9d29cf53137ba38859ffd1dbe7642cedb7ef0a102a3ab109b47842', 'Administrador', 1),
(2, 'Carlos', 'vendedor', 'carlosfkr@gmail.com', 'fbe10beedf9d29cf53137ba38859ffd1dbe7642cedb7ef0a102a3ab109b47842', 'Vendedor', 1),
(3, 'Ricardo', 'Ricardo', 'ricki@gmail-com', '164aa45617252b34fea2b92355db17be504585381546ba3ed86443e33caa7ef2', 'Vendedor', 1),
(4, 'Edwin', 'edi', 'edi@.com', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'Vendedor', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `total`, `estado`, `fecha`) VALUES
(3, 1, 2.00, 1, '2023-11-15 16:46:51'),
(4, 1, 200.00, 1, '2023-11-15 16:48:10'),
(5, 1, 1.00, 1, '2023-11-16 10:58:27'),
(12, 1, 243.00, 1, '2023-11-18 14:05:20'),
(13, 1, 220.00, 1, '2023-11-18 14:06:18'),
(14, 6, 4.00, 1, '2023-11-18 14:07:40'),
(15, 6, 810.00, 1, '2023-11-18 14:08:55'),
(16, 1, 9.00, 1, '2023-11-18 14:11:25'),
(17, 4, 13.00, 1, '2023-11-18 14:12:02'),
(18, 4, 1.00, 1, '2023-11-20 10:24:03'),
(19, 6, 12.00, 1, '2023-11-21 00:09:41'),
(20, 6, 11.00, 1, '2023-11-21 00:49:44'),
(21, 1, 1.00, 1, '2023-11-21 13:21:01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
