-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2020 a las 12:25:26
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vueling`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avions`
--

CREATE TABLE `avions` (
  `id_avio` int(11) NOT NULL,
  `capacitat` int(11) NOT NULL,
  `model` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `avions`
--

INSERT INTO `avions` (`id_avio`, `capacitat`, `model`) VALUES
(1, 180, 'Airbus A320');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `passatgers`
--

CREATE TABLE `passatgers` (
  `id_passatger` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `cognoms` varchar(30) NOT NULL,
  `dni` varchar(9) NOT NULL,
  `edat` tinyint(4) NOT NULL,
  `avio_id` int(11) NOT NULL,
  `seient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `passatgers`
--

INSERT INTO `passatgers` (`id_passatger`, `nom`, `cognoms`, `dni`, `edat`, `avio_id`, `seient_id`) VALUES
(1, 'Joan', 'Margarit Rovira', '12345678F', 45, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seients`
--

CREATE TABLE `seients` (
  `id_seient` int(11) NOT NULL,
  `avio_id` int(11) DEFAULT NULL,
  `passatger_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avions`
--
ALTER TABLE `avions`
  ADD PRIMARY KEY (`id_avio`),
  ADD UNIQUE KEY `id_avio` (`id_avio`);

--
-- Indices de la tabla `passatgers`
--
ALTER TABLE `passatgers`
  ADD PRIMARY KEY (`id_passatger`);

--
-- Indices de la tabla `seients`
--
ALTER TABLE `seients`
  ADD PRIMARY KEY (`id_seient`),
  ADD KEY `avio_id` (`avio_id`),
  ADD KEY `passatger_id` (`passatger_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avions`
--
ALTER TABLE `avions`
  MODIFY `id_avio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `passatgers`
--
ALTER TABLE `passatgers`
  MODIFY `id_passatger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `seients`
--
ALTER TABLE `seients`
  MODIFY `id_seient` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `seients`
--
ALTER TABLE `seients`
  ADD CONSTRAINT `seients_ibfk_1` FOREIGN KEY (`avio_id`) REFERENCES `avions` (`id_avio`),
  ADD CONSTRAINT `seients_ibfk_2` FOREIGN KEY (`passatger_id`) REFERENCES `passatgers` (`id_passatger`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
