-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2020 a las 12:26:28
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
-- Base de datos: `botiga_quadres`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compradors`
--

CREATE TABLE `compradors` (
  `id_comprador` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `cognom` varchar(30) NOT NULL,
  `dni` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compradors`
--

INSERT INTO `compradors` (`id_comprador`, `nom`, `cognom`, `dni`) VALUES
(1, 'Pere', 'Roda', '12345234G'),
(2, 'Marina', 'Romeo', '43523699C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quadres`
--

CREATE TABLE `quadres` (
  `id_quadre` int(11) NOT NULL,
  `preu` int(11) NOT NULL,
  `autor` varchar(60) DEFAULT NULL,
  `id_comprador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `quadres`
--

INSERT INTO `quadres` (`id_quadre`, `preu`, `autor`, `id_comprador`) VALUES
(1, 1200, 'Philip Mondrian', 1),
(2, 1500, 'Mariano Barroso', 1),
(3, 10000, 'Leslie Brown', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compradors`
--
ALTER TABLE `compradors`
  ADD PRIMARY KEY (`id_comprador`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `quadres`
--
ALTER TABLE `quadres`
  ADD PRIMARY KEY (`id_quadre`),
  ADD KEY `id_comprador` (`id_comprador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compradors`
--
ALTER TABLE `compradors`
  MODIFY `id_comprador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `quadres`
--
ALTER TABLE `quadres`
  MODIFY `id_quadre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `quadres`
--
ALTER TABLE `quadres`
  ADD CONSTRAINT `quadres_ibfk_1` FOREIGN KEY (`id_comprador`) REFERENCES `compradors` (`id_comprador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
