-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2017 a las 18:11:07
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
(7, 'Campilobacteriosis', ''),
(8, 'Sarna sarcóptica', ''),
(9, 'Micobacteriosis', ''),
(10, 'Psitacosis', ''),
(11, 'Borreliosis ', ''),
(12, 'Toxoplasmosis', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_informacion`
--

CREATE TABLE `tb_informacion` (
  `id_informacion` int(20) NOT NULL,
  `informacion` varchar(300) NOT NULL,
  `texto` text NOT NULL,
  `Url` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tb_informacion`
--

INSERT INTO `tb_informacion` (`id_informacion`, `informacion`, `texto`, `Url`) VALUES
(1, 'caso de usos', 'Un caso de uso es una descripción de los pasos o las actividades que deberán realizarse para llevar a cabo algún proceso. Los personajes o entidades que participarán en un caso de uso se denominan actores. En el contexto de ingeniería del software, un caso de uso es una secuencia de interacciones que se desarrollarán entre un sistema y sus actores en respuesta a un evento que inicia un actor principal sobre el propio sistema. Los diagramas de casos de uso sirven para especificar la comunicación y el comportamiento de un sistema mediante su interacción con los usuarios y/u otros sistemas.', 'img/'),
(2, 'diagrama de distribución', 'En el diagrama de distribución es donde representamos la estructura de hardware donde estará nuestro sistema o software, para ello cada componente lo podemos representar como nodos, el nodo es cualquier elemento que sea un recurso de hardware, es decir, es nuestra denominación genérica para nuestros equipos.', 'img/'),
(3, 'clases de proyecto', 'Un proyecto es una herramienta o instrumento que busca recopilar, crear, analizar en forma sistemática un conjunto de datos y antecedentes, para la obtención de resultados esperados. Es de gran importancia porque permite organizar el entorno de trabajo.', 'img/image1.png'),
(4, 'diagramas de componentes', 'Un diagrama de componentes representa cómo un sistema de software es dividido en componentes y muestra las dependencias entre estos componentes. Los componentes físicos incluyen archivos, cabeceras, bibliotecas compartidas, módulos, ejecutables, o paquetes. Los diagramas de Componentes prevalecen en el campo de la arquitectura de software pero pueden ser usados para modelar y documentar cualquier arquitectura de sistema.', 'img/image.png');

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
(1, 'Pulgas'),
(2, 'Garrapatas'),
(3, 'Leishmaniosis'),
(4, 'Toxoplasmosis'),
(5, 'Tenias'),
(6, 'Gusanos'),
(7, 'Hepatitis'),
(8, 'Parvovirus'),
(9, 'Rabia'),
(10, 'Reumatismo'),
(11, 'Glaucoma');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_enfermedades`
--
ALTER TABLE `tb_enfermedades`
  ADD PRIMARY KEY (`id_enfermedad`);

--
-- Indices de la tabla `tb_informacion`
--
ALTER TABLE `tb_informacion`
  ADD PRIMARY KEY (`id_informacion`);

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
