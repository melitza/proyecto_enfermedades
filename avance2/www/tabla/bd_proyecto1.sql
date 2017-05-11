-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-03-2017 a las 13:38:03
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_enfermedades`
--

CREATE TABLE `tb_enfermedades` (
  `id_enfermedad` int(10) NOT NULL,
  `enfermedad` varchar(100) NOT NULL,
  `recomendaciones` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_enfermedades`
--

INSERT INTO `tb_enfermedades` (`id_enfermedad`, `enfermedad`, `recomendaciones`) VALUES
(7, 'Bronquitis', ''),
(8, 'Asma', ''),
(9, 'C&aacute;ncer', ''),
(10, 'Depresi&oacute;n', ''),
(11, 'Esquizofrenia', ''),
(12, 'Gonorrea', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_informe`
--

CREATE TABLE `tb_informe` (
  `id_informe` int(10) NOT NULL,
  `id_enfermedad` int(10) NOT NULL,
  `id_sintomas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_informe`
--

INSERT INTO `tb_informe` (`id_informe`, `id_enfermedad`, `id_sintomas`) VALUES
(2, 7, 3),
(3, 8, 10),
(4, 9, 5),
(5, 10, 6),
(6, 11, 7),
(7, 7, 1),
(8, 8, 4),
(9, 10, 8),
(10, 10, 2),
(11, 8, 11),
(12, 7, 8),
(13, 7, 9),
(14, 9, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_sintomas`
--

CREATE TABLE `tb_sintomas` (
  `id_sintomas` int(10) NOT NULL,
  `sintoma` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_sintomas`
--

INSERT INTO `tb_sintomas` (`id_sintomas`, `sintoma`) VALUES
(1, 'dolor_articular'),
(2, 'bomito'),
(3, 'fiebre'),
(4, 'ansiedad'),
(5, 'diarrea'),
(6, 'inflamacion'),
(7, 'dolor de cabeza'),
(8, 'debilidad'),
(9, 'Escalofrios'),
(10, 'Deshidratacion'),
(11, 'desaliento');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_enfermedades`
--
ALTER TABLE `tb_enfermedades`
  ADD PRIMARY KEY (`id_enfermedad`);

--
-- Indices de la tabla `tb_informe`
--
ALTER TABLE `tb_informe`
  ADD PRIMARY KEY (`id_informe`),
  ADD KEY `index_enfermdad` (`id_enfermedad`),
  ADD KEY `index_sintoma` (`id_sintomas`);

--
-- Indices de la tabla `tb_sintomas`
--
ALTER TABLE `tb_sintomas`
  ADD PRIMARY KEY (`id_sintomas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_enfermedades`
--
ALTER TABLE `tb_enfermedades`
  MODIFY `id_enfermedad` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `tb_informe`
--
ALTER TABLE `tb_informe`
  MODIFY `id_informe` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tb_sintomas`
--
ALTER TABLE `tb_sintomas`
  MODIFY `id_sintomas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_informe`
--
ALTER TABLE `tb_informe`
  ADD CONSTRAINT `tb_informe_ibfk_1` FOREIGN KEY (`id_enfermedad`) REFERENCES `tb_enfermedades` (`id_enfermedad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_informe_ibfk_2` FOREIGN KEY (`id_sintomas`) REFERENCES `tb_sintomas` (`id_sintomas`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
