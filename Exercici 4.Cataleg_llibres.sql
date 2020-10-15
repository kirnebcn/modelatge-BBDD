-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2020 a las 12:28:43
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
-- Base de datos: `cataleg_llibres`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autors`
--

CREATE TABLE `autors` (
  `id_autor` int(11) NOT NULL,
  `nom_autor` varchar(60) NOT NULL,
  `direccio` varchar(120) DEFAULT NULL,
  `llibre_unic` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autors`
--

INSERT INTO `autors` (`id_autor`, `nom_autor`, `direccio`, `llibre_unic`) VALUES
(1, 'Pedro García', 'Gran Via de les Corts Catalanes 299\r\n08014 Barcelona\r\n', 1),
(2, 'Jeroni Macià', 'Carrer de Girona, 10\r\n08500 Vic', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compres`
--

CREATE TABLE `compres` (
  `id_compra` int(11) NOT NULL,
  `llibre_id` int(11) DEFAULT NULL,
  `usuari_id` int(11) DEFAULT NULL,
  `data_compra` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compres`
--

INSERT INTO `compres` (`id_compra`, `llibre_id`, `usuari_id`, `data_compra`) VALUES
(1, 1, 1, '2020-10-01 10:18:38'),
(2, 2, 1, '2020-10-01 10:18:38'),
(3, 2, 2, '2020-10-05 17:26:17'),
(4, 3, 3, '2020-10-12 20:20:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llibres`
--

CREATE TABLE `llibres` (
  `id_llibre` int(11) NOT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `nom` varchar(120) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `unitats` smallint(6) NOT NULL,
  `preu` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `llibres`
--

INSERT INTO `llibres` (`id_llibre`, `autor_id`, `nom`, `isbn`, `unitats`, `preu`) VALUES
(1, 1, 'El laberinto de los argonautas', '978-84-606-9069-6', 15, '18.00'),
(2, 2, 'Aixè és l\'Havana', '978-84-87685-17-0 ', 2, '25.50'),
(3, 2, 'Aprenentatge llengua anglesa Menorca... període dominació br', '978-84-475-0087-1', 1, '14.70');

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
-- Indices de la tabla `autors`
--
ALTER TABLE `autors`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indices de la tabla `compres`
--
ALTER TABLE `compres`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `llibre_id` (`llibre_id`),
  ADD KEY `usuari_id` (`usuari_id`);

--
-- Indices de la tabla `llibres`
--
ALTER TABLE `llibres`
  ADD PRIMARY KEY (`id_llibre`),
  ADD KEY `autor_id` (`autor_id`);

--
-- Indices de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  ADD PRIMARY KEY (`id_usuari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autors`
--
ALTER TABLE `autors`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compres`
--
ALTER TABLE `compres`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `llibres`
--
ALTER TABLE `llibres`
  MODIFY `id_llibre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compres`
--
ALTER TABLE `compres`
  ADD CONSTRAINT `compres_ibfk_1` FOREIGN KEY (`llibre_id`) REFERENCES `llibres` (`id_llibre`),
  ADD CONSTRAINT `compres_ibfk_2` FOREIGN KEY (`usuari_id`) REFERENCES `usuaris` (`id_usuari`);

--
-- Filtros para la tabla `llibres`
--
ALTER TABLE `llibres`
  ADD CONSTRAINT `llibres_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autors` (`id_autor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
