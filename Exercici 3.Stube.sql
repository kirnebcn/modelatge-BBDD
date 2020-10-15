-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2020 a las 12:27:57
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
-- Base de datos: `stube`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE `usuaris` (
  `id_usuari` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `contrasenya` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`id_usuari`, `email`, `contrasenya`) VALUES
(1, 'pepito.rodriguez@molamazo.com', 'Pepito_molamazo34'),
(2, 'maria.gonzalez.l@gmail.com', 'maria_stube*2020'),
(3, 'palomasala@outlook.com', 'paloma2324KK^^');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videos`
--

CREATE TABLE `videos` (
  `id_video` int(11) NOT NULL,
  `titol` varchar(60) NOT NULL,
  `descripcio` text DEFAULT NULL,
  `identificador` char(12) NOT NULL,
  `url` char(44) GENERATED ALWAYS AS ('https://www.youtube.com/watch?v=' + `identificador`) VIRTUAL,
  `id_usuari` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `videos`
--

INSERT INTO `videos` (`id_video`, `titol`, `descripcio`, `identificador`, `id_usuari`) VALUES
(1, 'TÉCNICA DE CARRERA para correr mejor y más rápido', 'En este vídeo os enseño una rutina de ejercicios de técnica de carrera que podéis hacer ;)\\r\\n\\r\\nEl entrenamiento de técnica de carrera es muy importante para correr bien y de una manera más económica para realizar un menor gasto de energía mientras corremos, ya que con esto conseguimos hacer el gesto de una manera más coordinada y eficaz de nuestros brazos y piernas.', 'QLAida67Ymk', 3),
(2, 'RECORD MUNDIAL cubo rubik 3x3 *robot y personas*', 'este es un vídeo de recopilaciones de los récords de cubos de rubik\\r\\n\\r\\n*gmail de contacto* (solo temas de importancia): marcubecontacto@gmail.com', 'DCrwfBfE4ao', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  ADD PRIMARY KEY (`id_usuari`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `contrasenya` (`contrasenya`);

--
-- Indices de la tabla `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `id_usuari` (`id_usuari`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  MODIFY `id_usuari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`id_usuari`) REFERENCES `usuaris` (`id_usuari`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
