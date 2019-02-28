SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE DATABASE bbdd;

USE bbdd;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE `articulos` (
  `ART_NUM` int(11) NOT NULL,
  `ART_NOM` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `ART_PESO` int(11) DEFAULT NULL,
  `ART_COL` varchar(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ART_PC` int(11) NOT NULL,
  `ART_PV` int(11) NOT NULL,
  `ART_PRV` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `clientes` (
  `CLT_NUM` int(11) NOT NULL,
  `CLT_APELL` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `CLT_NOM` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CLT_PAIS` varchar(8) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CLT_POB` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `pesos` (
  `PESO_NOM` varchar(9) COLLATE utf8_spanish_ci NOT NULL,
  `PESO_MIN` int(11) NOT NULL,
  `PESO_MAX` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `proveedores` (
  `PRV_NUM` int(11) NOT NULL,
  `PRV_NOM` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `tiendas` (
  `TDA_NUM` int(11) NOT NULL,
  `TDA_POB` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `TDA_GER` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `ventas` (
  `VNT_CLT` int(11) NOT NULL,
  `VNT_TDA` int(11) NOT NULL,
  `VNT_ART` int(11) NOT NULL,
  `VNT_CANT` int(11) DEFAULT NULL,
  `VNT_PRECIO` int(11) DEFAULT NULL,
  `VNT_FCH` varchar(6) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

ALTER TABLE `articulos`
  ADD PRIMARY KEY (`ART_NUM`),
  ADD KEY `ART_PRV` (`ART_PRV`);

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CLT_NUM`);

ALTER TABLE `pesos`
  ADD PRIMARY KEY (`PESO_NOM`);

ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`PRV_NUM`);

ALTER TABLE `tiendas`
  ADD PRIMARY KEY (`TDA_NUM`);

ALTER TABLE `ventas`
  ADD KEY `VNT_CLT` (`VNT_CLT`),
  ADD KEY `VNT_TDA` (`VNT_TDA`),
  ADD KEY `VNT_ART` (`VNT_ART`);

ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`ART_PRV`) REFERENCES `proveedores` (`PRV_NUM`);

ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`VNT_CLT`) REFERENCES `clientes` (`CLT_NUM`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`VNT_TDA`) REFERENCES `tiendas` (`TDA_NUM`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`VNT_ART`) REFERENCES `articulos` (`ART_NUM`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

INSERT INTO `pesos` (`PESO_NOM`, `PESO_MIN`, `PESO_MAX`) VALUES
('leve', 1, 100),
('ligero', 101, 500),
('medio', 501, 2500),
('pesado', 2501, 5000),
('sin peso', 0, 0);

INSERT INTO `proveedores` (`PRV_NUM`, `PRV_NOM`) VALUES
(1, 'catio electronic'),
(2, 'estilografica reunidas'),
(3, 'mecanica de precision'),
(4, 'sanjita'),
(5, 'electrolamp'),
(6, 'copisteria'),
(7, 'el corte ingles'),
(8, 'Mercadiz'),
(9, 'El ahorramas'),
(10, 'zara hogar');

INSERT INTO `articulos` (`ART_NUM`, `ART_NOM`, `ART_PESO`, `ART_COL`, `ART_PC`, `ART_PV`, `ART_PRV`) VALUES
(1, 'impresora', 150, 'rojo', 400, 580, 4),
(2, 'calculadora', 150, 'negro', 4000, 4700, 1),
(3, 'calendario', 100, 'blanco', 420, 600, 4),
(4, 'lampara', 550, 'rojo', 2100, 2980, 5),
(5, 'lampara', 550, 'blanco', 2000, 2900, 5),
(6, 'lampara', 550, 'azul', 2100, 2980, 5),
(7, 'lampara', 550, 'verde', 2100, 2980, 5),
(8, 'pesacartas 1-500', NULL, NULL, 2400, 4000, 3),
(9, 'pesacartas 1-1000', NULL, NULL, 3000, 5000, 3),
(10, 'boligrafo', 20, 'rojo', 20, 40, 2),
(11, 'boligrafo', 20, 'azul', 20, 40, 2),
(12, 'boligrafo lujo', 20, 'rojo', 60, 100, 2),
(13, 'boligrafo lujo', 20, 'verde', 60, 100, 2),
(14, 'boligrafo lujo', 20, 'azul', 60, 100, 2),
(15, 'boligrafo lujo', 20, 'negro', 60, 100, 2),
(16, 'papel', 5000, 'rosa', 3500, 4000, 2),
(17, 'coche', 1000, 'verde', 5000, 6000, 3),
(18, 'impresora', 200, 'morado', 400, 800, 3),
(19, 'calendario', 110, 'negro', 420, 600, 4),
(20, 'manta', NULL, 'malva', 400, 600, 10),
(69, 'papel', NULL, 'rosa', 40, 50, NULL),
(99, 'papel', 800, 'morado', 90, 800, 1);

INSERT INTO `clientes` (`CLT_NUM`, `CLT_APELL`, `CLT_NOM`, `CLT_PAIS`, `CLT_POB`) VALUES
(1, 'borras', 'margarita', 'e', 'madrid'),
(2, 'perez', 'miguel', 'e', 'madrid'),
(3, 'dupont', 'jean', 'f', 'paris'),
(4, 'dupret', 'michel', 'f', 'lyon'),
(5, 'llopis', 'antoni', 'e', 'barcelona'),
(6, 'souris', 'marcel', 'f', 'paris'),
(7, 'go?i', 'pablo', 'e', 'pamplona'),
(8, 'courbon', 'gerad', 'f', 'lyon'),
(9, 'roman', 'consuelo', 'e', 'jaen'),
(10, 'roca', 'pau', 'e', 'gerona'),
(11, 'mancha', 'jorge', 'e', 'valencia'),
(12, 'curro', 'pablo', 'e', 'barcelona'),
(13, 'cortes', 'diego', 'e', 'madrid'),
(14, 'fernandez', 'joaquin', 'c', 'HADRID'),
(15, 'duran', 'jacinto', 'e', 'pamplona'),
(16, 'minguin', 'pedro', 'e', 'pamplona'),
(17, 'ubrique', 'jesus', 'e', 'pamplona'),
(18, 'mazapato', 'sophie', 'e', 'madrid'),
(19, 'bigote', 'jose mari', 'p', 'oporto'),
(20, 'dalima sorda', 'romualdo', 'b', 'san jose'),
(21, 'clavel rojo', 'paco', 'e', 'mala'),
(22, 'Alonso', 'Fernando', 'e', 'Gijon'),
(23, 'Rodriguez', 'Pedrito', 'e', 'Arico'),
(24, 'Florero', 'Mar', 'e', 'Madrid'),
(25, 'Florero', 'Mar', 'e', 'Barcelona'),
(26, 'Messi', 'Leo', 'a', 'Rosario');

INSERT INTO `tiendas` (`TDA_NUM`, `TDA_POB`, `TDA_GER`) VALUES
(1, 'madrid-batan', 'contesfosques, jordi'),
(2, 'madrid-centro', 'martinez, juan'),
(3, 'pamplona', 'dominguez, julian'),
(4, 'barcelona', 'pega, jose maria'),
(5, 'trujillo', 'mendez, pedro'),
(6, 'jaen', 'marin, raquel'),
(7, 'valencia', 'petit, joan'),
(8, 'requena', 'marcos, pilar'),
(9, 'palencia', 'castroviejo, lozano'),
(10, 'gerona', 'gomez, gabriel'),
(11, 'lyon', 'madoux, jean'),
(12, 'paris', 'fouet, paul'),
(13, 'Jerez', 'Messi, Leo');

INSERT INTO `ventas` (`VNT_CLT`, `VNT_TDA`, `VNT_ART`, `VNT_CANT`, `VNT_PRECIO`, `VNT_FCH`) VALUES
(22, 10, 17, 1, 6000, '991231'),
(5, 4, 4, 1, 2980, '910106'),
(7, 3, 10, 1, 40, '910106'),
(7, 3, 11, 2, 80, '910106'),
(7, 3, 14, 3, 300, '910106'),
(8, 11, 2, 1, 4700, '910109'),
(6, 12, 3, 2, 1200, '910109'),
(6, 12, 15, 2, 200, '910109'),
(13, 1, 4, 1, 2980, '910109'),
(13, 1, 3, 1, 600, '910110'),
(1, 2, 2, 1, 4700, '910110'),
(1, 2, 12, 1, 100, '910110'),
(1, 2, 13, 10, 1000, '910110'),
(4, 11, 1, 8, 4640, '910111'),
(4, 11, 10, 7, 280, '910111'),
(3, 7, 6, 1, 2980, '910111'),
(3, 7, 9, 2, 10000, '910111'),
(1, 2, 3, 3, 1800, '910120'),
(7, 8, 3, 1, 600, '910203'),
(4, 5, 3, 6, 3000, '910114'),
(10, 11, 3, 1, 600, '910116'),
(6, 7, 3, 1, 600, '910111'),
(3, 4, 3, 2, 1200, '910206'),
(9, 10, 3, 1, 600, '910201'),
(2, 3, 3, 4, 2400, '910102'),
(8, 9, 3, 1, 500, '910130'),
(5, 6, 3, 3, 1800, '910116'),
(26, 4, 17, 2, 12000, '990101'),
(19, 7, 3, 1, NULL, '960601'),
(17, 4, 3, 10, NULL, '961028'),
(18, 1, 3, 1, NULL, '961130'),
(10, 4, 2, NULL, NULL, '920822'),
(3, 13, 3, NULL, NULL, '940430');