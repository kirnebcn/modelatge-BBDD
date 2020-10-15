-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2020 a las 12:29:24
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
-- Base de datos: `instagramlike`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amistat`
--

CREATE TABLE `amistat` (
  `id_amistat` int(11) NOT NULL,
  `amic1_id` int(11) DEFAULT NULL,
  `amic2_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `amistat`
--

INSERT INTO `amistat` (`id_amistat`, `amic1_id`, `amic2_id`) VALUES
(1, 1, 3),
(2, 3, 1),
(3, 2, 3),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fotografies`
--

CREATE TABLE `fotografies` (
  `id_fotografia` int(11) NOT NULL,
  `usuari_id` int(11) DEFAULT NULL,
  `lloc` varchar(60) NOT NULL,
  `url` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fotografies`
--

INSERT INTO `fotografies` (`id_fotografia`, `usuari_id`, `lloc`, `url`) VALUES
(1, 1, 'Budapest', 'https://instagramlike.com/Palomasala/34739h34rgfeduft678dfghdsf783rghdjfjdsg342dSADFAS'),
(2, 1, 'Stockholm', 'https://instagramlike.com/Palomasala/423fFsdGSFSF45324rweDCdsfdsFvfT$dsrf34tr'),
(3, 2, 'Roma', 'https://instagramlike.com/PepitoRodriguez/kbkG&G&FGghJRf4%6g6GghikNTY67gHB6'),
(4, 3, 'Barcelona', 'https://instagramlike.com/MariaGonzalez/csdf$feD43ewfd$%43fsdfDvdtrfy45'),
(5, 3, 'Sant Cugat del Vallès', 'https://instagramlike.com/MariaGonzalez/nnb3423nmbJKJKJHf56&7ffV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE `usuaris` (
  `id_usuari` int(11) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `contrasenya` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`id_usuari`, `nom`, `email`, `contrasenya`) VALUES
(1, 'Paloma Sala', 'palomasala@outlook.com', 'paloma2324KK^^'),
(2, 'Pepito Rodríguez', 'pepito.rodriguez@molamazo.com', 'Pepito_molamazo34'),
(3, 'María González', 'maria.gonzalez.l@gmail.com', 'maria_stube*2020');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amistat`
--
ALTER TABLE `amistat`
  ADD PRIMARY KEY (`id_amistat`),
  ADD KEY `amic1_id` (`amic1_id`),
  ADD KEY `amic2_id` (`amic2_id`);

--
-- Indices de la tabla `fotografies`
--
ALTER TABLE `fotografies`
  ADD PRIMARY KEY (`id_fotografia`),
  ADD KEY `usuari_id` (`usuari_id`);

--
-- Indices de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  ADD PRIMARY KEY (`id_usuari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amistat`
--
ALTER TABLE `amistat`
  MODIFY `id_amistat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `fotografies`
--
ALTER TABLE `fotografies`
  MODIFY `id_fotografia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amistat`
--
ALTER TABLE `amistat`
  ADD CONSTRAINT `amistat_ibfk_1` FOREIGN KEY (`amic1_id`) REFERENCES `usuaris` (`id_usuari`),
  ADD CONSTRAINT `amistat_ibfk_2` FOREIGN KEY (`amic2_id`) REFERENCES `usuaris` (`id_usuari`);

--
-- Filtros para la tabla `fotografies`
--
ALTER TABLE `fotografies`
  ADD CONSTRAINT `fotografies_ibfk_1` FOREIGN KEY (`usuari_id`) REFERENCES `usuaris` (`id_usuari`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
