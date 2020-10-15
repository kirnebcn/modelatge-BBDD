-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2020 a las 20:02:12
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
-- Base de datos: `culdampolla`
--
CREATE DATABASE IF NOT EXISTS `culdampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `culdampolla`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `adreça` varchar(200) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `email` varchar(60) NOT NULL,
  `datareg` date NOT NULL,
  `referencia` enum('SI','NO') DEFAULT NULL,
  `client_ref` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `adreça`, `telefon`, `email`, `datareg`, `referencia`, `client_ref`) VALUES
(1, 'Paloma Sala', 'Gran Via de les Corts Catalanes 89, 2on 1a\r\n08014 Barcelona\r\n', '937684597', 'palomasala@outlook.com', '2020-10-04', 'NO', NULL),
(2, 'Pepito Rodríguez', 'Les Corts 23, 1er 1a\r\n08014 Barcelona', '934906547', 'pepito.rodriguez@molamazo.com', '2020-10-07', 'SI', 1),
(3, 'María González', 'Primer de Maig 23, 4rt 2a\r\n08120 La Llagosta\r\n\r\n', '935456722', 'maria.gonzalez.l@gmail.com', '2020-10-13', 'NO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleats`
--

CREATE TABLE `empleats` (
  `id_empleat` int(11) NOT NULL,
  `Nom_empleat` varchar(20) DEFAULT NULL,
  `Cognoms_empleat` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleats`
--

INSERT INTO `empleats` (`id_empleat`, `Nom_empleat`, `Cognoms_empleat`) VALUES
(1, 'Marta', 'Rodríguez'),
(2, 'Pere', 'Gimferrer Palau'),
(3, 'Pep', 'Freixes López'),
(4, 'Mireia', 'Plans Fresco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `carrer` varchar(30) NOT NULL,
  `numero` smallint(6) NOT NULL,
  `pis` tinyint(4) DEFAULT NULL,
  `porta` tinyint(4) DEFAULT NULL,
  `ciutat` varchar(30) NOT NULL,
  `cp` decimal(5,0) NOT NULL,
  `pais` varchar(30) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `fax` varchar(9) DEFAULT NULL,
  `CIF` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id_proveidor`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `cp`, `pais`, `telefon`, `fax`, `CIF`) VALUES
(1, 'Etnia Barcelona SL', 'Enric Morera', 42, 2, NULL, 'Esplugues de Llobregat', '8950', 'España', '933722453', '934735085', 'B63680573'),
(2, 'Sep Eyewear SL', 'Corredera alta de san Pablo', 2, NULL, NULL, 'Madrid', '28004', 'España', '912222222', NULL, 'B87363867'),
(3, 'VISION 2010 SL', 'Pol. Maskuribai, Z-8', 0, NULL, NULL, 'Amurrio', '1470', 'España', '945890041', '945890806', 'B01427368');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencies`
--

CREATE TABLE `referencies` (
  `id_referencia` int(11) NOT NULL,
  `client1` int(11) DEFAULT NULL,
  `client2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `referencies`
--

INSERT INTO `referencies` (`id_referencia`, `client1`, `client2`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(11) NOT NULL,
  `marca` varchar(60) NOT NULL,
  `grad_UD` varchar(10) NOT NULL,
  `grad_UE` varchar(10) NOT NULL,
  `muntura` enum('flotant','pasta','metàl·lica') DEFAULT NULL,
  `color_muntura` varchar(10) DEFAULT NULL,
  `color_UD` varchar(10) DEFAULT NULL,
  `color_UE` varchar(10) DEFAULT NULL,
  `preu` decimal(5,2) NOT NULL,
  `proveidor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca`, `grad_UD`, `grad_UE`, `muntura`, `color_muntura`, `color_UD`, `color_UE`, `preu`, `proveidor_id`) VALUES
(1, 'Etnia BKRD Mississippi', '+3.75', '+1.25', 'pasta', 'vermell', 'transp', 'transp', '120.00', 1),
(2, 'Kypers sol', '0', '0', 'metàl·lica', 'plata', 'gris 2', 'gris 2', '175.00', 3),
(3, 'M&M Finch', '+1.25', '+1.75', 'pasta', 'blau 23', 'transp', 'transp', '94.00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendes`
--

CREATE TABLE `vendes` (
  `id_venda` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `ulleres_id` int(11) DEFAULT NULL,
  `empleat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vendes`
--

INSERT INTO `vendes` (`id_venda`, `client_id`, `ulleres_id`, `empleat_id`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `empleats`
--
ALTER TABLE `empleats`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id_proveidor`);

--
-- Indices de la tabla `referencies`
--
ALTER TABLE `referencies`
  ADD PRIMARY KEY (`id_referencia`),
  ADD KEY `client1` (`client1`),
  ADD KEY `client2` (`client2`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- Indices de la tabla `vendes`
--
ALTER TABLE `vendes`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `ulleres_id` (`ulleres_id`),
  ADD KEY `empleat_id` (`empleat_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleats`
--
ALTER TABLE `empleats`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `referencies`
--
ALTER TABLE `referencies`
  MODIFY `id_referencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vendes`
--
ALTER TABLE `vendes`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `referencies`
--
ALTER TABLE `referencies`
  ADD CONSTRAINT `referencies_ibfk_1` FOREIGN KEY (`client1`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `referencies_ibfk_2` FOREIGN KEY (`client2`) REFERENCES `clients` (`id_client`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id_proveidor`);

--
-- Filtros para la tabla `vendes`
--
ALTER TABLE `vendes`
  ADD CONSTRAINT `vendes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `vendes_ibfk_2` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`id_ulleres`),
  ADD CONSTRAINT `vendes_ibfk_3` FOREIGN KEY (`empleat_id`) REFERENCES `empleats` (`id_empleat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
