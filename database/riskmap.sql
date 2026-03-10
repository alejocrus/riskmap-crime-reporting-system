-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2025 a las 06:01:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `riskmap`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accion`
--

CREATE TABLE `accion` (
  `id_accion` int(11) NOT NULL,
  `tipo_accion` enum('agregar','modificar','eliminar') DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `id_empleador` int(11) DEFAULT NULL,
  `id_reporte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `accion`
--

INSERT INTO `accion` (`id_accion`, `tipo_accion`, `comentario`, `fecha_hora`, `id_empleador`, `id_reporte`) VALUES
(1, 'agregar', 'Reporte inicial creado por el sistema', '2025-05-01 18:35:00', 1, 1),
(2, 'modificar', 'Se agregó información adicional al reporte', '2025-05-02 16:00:00', 2, 2),
(3, 'agregar', 'Reporte inicial creado por el sistema', '2025-05-03 20:20:00', 1, 3),
(4, 'eliminar', 'Reporte duplicado, se elimina', '2025-05-04 13:00:00', 3, 4),
(5, 'modificar', 'Actualización del estado del caso', '2025-05-05 19:30:00', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id_contacto` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id_contacto`, `nombre`, `email`, `mensaje`) VALUES
(1, 'a', 'a@a.com', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_cuenta` int(11) NOT NULL,
  `rol` enum('admin','usuario') DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id_cuenta`, `rol`, `id_usuario`) VALUES
(1, 'admin', 1),
(2, 'usuario', 2),
(3, 'usuario', 3),
(4, 'usuario', 4),
(5, 'usuario', 5),
(6, 'usuario', 6),
(7, 'usuario', 7),
(8, 'usuario', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleador`
--

CREATE TABLE `empleador` (
  `id_empleador` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `empleador`
--

INSERT INTO `empleador` (`id_empleador`, `nombre`, `documento`, `email`, `direccion`, `telefono`) VALUES
(1, 'Seguridad Ciudadana Bogotá', '900123456-1', 'contacto@seguridadbogota.gov.co', 'Calle 12 #34-56', '6012345678'),
(2, 'Policía Nacional', '800987654-2', 'informacion@policia.gov.co', 'Av. Caracas #45-67', '6019876543'),
(3, 'Alcaldía Local Chapinero', '700456789-3', 'alcaldia@chapinero.gov.co', 'Carrera 7 #45-89', '6014567890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_prueba`
--

CREATE TABLE `estado_prueba` (
  `id_estado` int(11) NOT NULL,
  `estado` enum('activo','inactivo','en proceso') DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_reporte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `estado_prueba`
--

INSERT INTO `estado_prueba` (`id_estado`, `estado`, `fecha`, `id_reporte`) VALUES
(1, 'activo', '2025-05-01 08:00:00', 1),
(2, 'en proceso', '2025-05-02 10:30:00', 2),
(3, 'activo', '2025-05-03 14:15:00', 3),
(4, 'inactivo', '2025-05-04 16:45:00', 4),
(5, 'en proceso', '2025-05-05 09:20:00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `id_registro` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `contrasena` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`id_registro`, `nombre`, `correo`, `telefono`, `contrasena`) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', '3001234567', 'password123'),
(2, 'María García', 'maria.garcia@example.com', '3102345678', 'securepass'),
(3, 'Carlos López', 'carlos.lopez@example.com', '3203456789', 'mypassword'),
(4, 'Ana Martínez', 'ana.martinez@example.com', '3154567890', 'anapass123'),
(5, 'Pedro Rodríguez', 'pedro.rodriguez@example.com', '3185678901', 'pedro2023'),
(14, 'gambi', 'gambi@gmail.com', '345345345', '12345'),
(15, 'a', 'a@a.com', 'a', '12345'),
(16, 'dsadsadsadas', 'sadasda@gmail.com', '43534564', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `id_reporte` int(11) NOT NULL,
  `zona_reporte` varchar(100) DEFAULT NULL,
  `hora_reporte` time DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_ubicacion` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `reporte`
--

INSERT INTO `reporte` (`id_reporte`, `zona_reporte`, `hora_reporte`, `descripcion`, `id_usuario`, `id_estado`, `id_ubicacion`, `id_tipo`) VALUES
(1, 'Parque de la 93', '18:30:00', 'Robo de celular a mano armada', 2, 1, 2, 2),
(2, 'Centro Comercial Gran Estación', '15:45:00', 'Hurto de bicicleta del parqueadero', 3, 2, 5, 3),
(3, 'Calle 85 con Carrera 15', '20:15:00', 'Robo de motocicleta estacionada', 4, 3, 2, 4),
(4, 'Avenida Boyacá con Calle 80', '12:30:00', 'Hurto de bolso a transeúnte', 5, 4, 3, 1),
(5, 'Carrera 7 con Calle 72', '19:00:00', 'Intento de robo a residencia', 2, 5, 2, 5),
(6, 'Engativa', '12:00:00', 'nada', NULL, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_hurto`
--

CREATE TABLE `tipo_hurto` (
  `id_tipo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `tipo_hurto`
--

INSERT INTO `tipo_hurto` (`id_tipo`, `nombre`, `descripcion`) VALUES
(1, 'Hurto a personas', 'Robo directo a personas en espacios públicos'),
(2, 'Hurto de celulares', 'Robo específico de teléfonos móviles'),
(3, 'Hurto de bicicletas', 'Robo de bicicletas estacionadas o en uso'),
(4, 'Hurto de motocicletas', 'Robo de motocicletas estacionadas'),
(5, 'Hurto a residencias', 'Robo a viviendas o apartamentos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL,
  `barrio` varchar(100) DEFAULT NULL,
  `localidad` varchar(100) DEFAULT NULL,
  `latitud` decimal(10,7) DEFAULT NULL,
  `longitud` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubicacion`, `barrio`, `localidad`, `latitud`, `longitud`) VALUES
(1, 'La Candelaria', 'La Candelaria', 4.5970428, -74.0758333),
(2, 'Chapinero Alto', 'Chapinero', 4.6476189, -74.0601253),
(3, 'Usaquén', 'Usaquén', 4.6970198, -74.0327234),
(4, 'Bosa Centro', 'Bosa', 4.6124012, -74.1913215),
(5, 'Kennedy Central', 'Kennedy', 4.6833333, -74.1333333);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_registro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `id_registro`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 14),
(7, 15),
(8, 16);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`id_accion`),
  ADD KEY `id_empleador` (`id_empleador`),
  ADD KEY `id_reporte` (`id_reporte`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `empleador`
--
ALTER TABLE `empleador`
  ADD PRIMARY KEY (`id_empleador`);

--
-- Indices de la tabla `estado_prueba`
--
ALTER TABLE `estado_prueba`
  ADD PRIMARY KEY (`id_estado`),
  ADD KEY `fk_estado_reporte` (`id_reporte`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`id_registro`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`id_reporte`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_ubicacion` (`id_ubicacion`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `tipo_hurto`
--
ALTER TABLE `tipo_hurto`
  ADD PRIMARY KEY (`id_tipo`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_registro` (`id_registro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accion`
--
ALTER TABLE `accion`
  MODIFY `id_accion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id_contacto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `empleador`
--
ALTER TABLE `empleador`
  MODIFY `id_empleador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_prueba`
--
ALTER TABLE `estado_prueba`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `id_reporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_hurto`
--
ALTER TABLE `tipo_hurto`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accion`
--
ALTER TABLE `accion`
  ADD CONSTRAINT `accion_ibfk_1` FOREIGN KEY (`id_empleador`) REFERENCES `empleador` (`id_empleador`),
  ADD CONSTRAINT `accion_ibfk_2` FOREIGN KEY (`id_reporte`) REFERENCES `reporte` (`id_reporte`);

--
-- Filtros para la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD CONSTRAINT `cuenta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `estado_prueba`
--
ALTER TABLE `estado_prueba`
  ADD CONSTRAINT `fk_estado_reporte` FOREIGN KEY (`id_reporte`) REFERENCES `reporte` (`id_reporte`);

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `reporte_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado_prueba` (`id_estado`),
  ADD CONSTRAINT `reporte_ibfk_3` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicacion` (`id_ubicacion`),
  ADD CONSTRAINT `reporte_ibfk_4` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_hurto` (`id_tipo`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_registro`) REFERENCES `registro` (`id_registro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
