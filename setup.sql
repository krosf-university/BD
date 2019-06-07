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
(3, 13, 3, NULL, NULL, '940430');create schema JUN17;
USE JUN17;
create table Area
(
	area_id int not null
		primary key,
	area_nombre varchar(100) not null
);

create table Enfermeros
(
	enf_id int not null
		primary key,
	enf_dni varchar(9) not null,
	enf_apellidos varchar(100) not null,
	enf_nombre varchar(50) not null
);

create table Habitaciones
(
	hab_id int not null
		primary key,
	hab_area int not null,
	hab_planta int not null,
	constraint Habitaciones_Area_area_id_fk
		foreign key (hab_area) references Area (area_id)
);

create table Asignaciones
(
	asig_enfermero int not null,
	asig_habitacion int not null,
	asig_responsable int null,
	constraint Asignaciones_Enfermeros_enf_id_fk
		foreign key (asig_enfermero) references Enfermeros (enf_id),
	constraint Asignaciones_Habitaciones_hab_id_fk
		foreign key (asig_habitacion) references Habitaciones (hab_id)
);

create table Medicos
(
	med_id int not null
		primary key,
	med_dni varchar(9) not null,
	med_apellidos varchar(100) not null,
	med_nombre varchar(50) not null,
	med_area int not null,
	med_fec_nac varchar(10) not null,
	med_nomina int not null,
	constraint Medicos_Area_area_id_fk
		foreign key (med_area) references Area (area_id)
);

create table Guardias
(
	gua_fecha varchar(10) not null,
	gua_med_A int not null,
	gua_med_B int null,
	gua_enf_A int not null,
	gua_enf_B int null,
	constraint Guardias_Enfermeros_enf_id_fk
		foreign key (gua_enf_A) references Enfermeros (enf_id),
	constraint Guardias_Enfermeros_enf_id_fk_2
		foreign key (gua_enf_B) references Enfermeros (enf_id),
	constraint Guardias_Medicos_med_id_fk
		foreign key (gua_med_A) references Medicos (med_id),
	constraint Guardias_Medicos_med_id_fk_2
		foreign key (gua_med_B) references Medicos (med_id)
);

INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3557, 'Idaho');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3558, 'Connecticut');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3559, 'Massachusetts');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3560, 'Louisiana');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3561, 'District of Columbia');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3562, 'Wyoming');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3563, 'Arizona');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3564, 'District of Columbia');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3565, 'Oregon');
INSERT INTO JUN17.Area (area_id, area_nombre) VALUES (3566, 'South Carolina');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3567, '23204580B', 'Sheppard Ciborowski', 'Shaun');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3568, '13944610B', 'Lill Yuan', 'Artina');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3569, '93038469Z', 'Stewart Wuertz', 'Brenda');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3570, '85923123M', 'Oshins Packard', 'Nakia');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3571, '38068528F', 'Patino Jeffery', 'Jackie');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3572, '93900335H', 'Gladue Caffrey', 'Milind');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3573, '35008774J', 'Arbeli Evert', 'Cleo');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3574, '58207067I', 'Atkins Davila', 'Quamika');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3575, '58366644N', 'Chaudary Noriega', 'Tobias');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3576, '79447750D', 'Gibson Sjaardema', 'Saim');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3577, '21494189R', 'Betts Derucher', 'Giuseppe');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3578, '16437078F', 'Griffeeney Hull', 'Charles');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3579, '69747412H', 'Wittcop Clayton', 'Dale');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3580, '46720011B', 'Burks Preston', 'Melissa');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3581, '85066167Z', 'Gover Atanasov', 'Lontay');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3582, '91509878E', 'Mauro Cross', 'Bonnie');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3583, '91447390X', 'Lenze Lopez', 'Russell');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3584, '88702437U', 'Higdon Norris', 'Annie');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3585, '41806041L', 'Speth Sundell', 'James');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3586, '38672886G', 'Gerela Glynn', 'Sherese');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3587, '80379398J', 'Myers Parsons', 'Elissa');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3588, '41530619C', 'Tadeu Parsons', 'Edward');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3589, '19349714K', 'Frame Nance', 'Kaiti');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3590, '78983529A', 'Jouglard Sweet', 'Bryon');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3591, '87599435T', 'Bartlett Haft', 'Irina');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3592, '64556051G', 'Ray Sabol', 'Marlene');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3593, '36119506S', 'Saadeh Meaney', 'Wyatra');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3594, '43715592Z', 'Rehrig Liao', 'Charlene');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3595, '71093585X', 'Elkins Wantland', 'Aubre');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3596, '75321360S', 'Piteo Christiansen', 'Darlene');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3597, '17737830F', 'Bommi Richards', 'Carmerlina');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3598, '35645821Z', 'Volz Coopr', 'Georgina');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3599, '25785712L', 'Lenze Lund', 'Stuart');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3600, '17054316M', 'Schwaderer Wyatt', 'Cristina');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3601, '18260290I', 'Mayne Dabbs', 'Dale');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3602, '13720321U', 'Partridge Frugal', 'Josh');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3603, '77265064A', 'Chambers Packard', 'Wyatra');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3604, '40402013J', 'Stone Willms', 'Majeed');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3605, '50797512Y', 'Mott Kish', 'Joann');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3606, '22407125B', 'Roth Galvez', 'Edward');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3607, '17984425Z', 'Christine Connor', 'Vivian');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3608, '35402659S', 'Park Wing', 'Constance');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3609, '39012292Z', 'Onatop Nance', 'Toya');
INSERT INTO JUN17.Enfermeros (enf_id, enf_dni, enf_apellidos, enf_nombre) VALUES (3610, '16083885W', 'Denton Peacock', 'Latasha');
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3611, 3558, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3612, 3565, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3613, 3561, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3614, 3563, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3615, 3564, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3616, 3562, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3617, 3566, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3618, 3561, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3619, 3561, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3620, 3562, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3621, 3557, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3622, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3623, 3563, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3624, 3558, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3625, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3626, 3563, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3627, 3559, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3628, 3559, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3629, 3566, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3630, 3560, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3631, 3557, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3632, 3559, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3633, 3565, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3634, 3561, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3635, 3564, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3636, 3566, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3637, 3563, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3638, 3560, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3639, 3563, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3640, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3641, 3559, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3642, 3566, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3643, 3566, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3644, 3557, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3645, 3560, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3646, 3561, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3647, 3564, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3648, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3649, 3559, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3650, 3559, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3651, 3563, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3652, 3564, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3653, 3562, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3654, 3561, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3655, 3563, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3656, 3565, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3657, 3566, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3658, 3564, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3659, 3564, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3660, 3561, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3661, 3561, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3662, 3559, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3663, 3564, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3664, 3566, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3665, 3565, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3666, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3667, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3668, 3559, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3669, 3563, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3670, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3671, 3561, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3672, 3558, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3673, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3674, 3560, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3675, 3561, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3676, 3566, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3677, 3563, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3678, 3566, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3679, 3558, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3680, 3566, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3681, 3563, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3682, 3559, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3683, 3565, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3684, 3564, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3685, 3561, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3686, 3566, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3687, 3562, 2);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3688, 3561, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3689, 3564, 1);
INSERT INTO JUN17.Habitaciones (hab_id, hab_area, hab_planta) VALUES (3690, 3558, 1);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4061, '47623769P', 'Faidley Diriwachter', 'Lauri', 3560, '1972/01/23', 5678);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4062, '66580500Y', 'Muroski Madison', 'Elida', 3559, '1975/04/30', 4135);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4063, '23344527L', 'Norris Post', 'Quincy', 3565, '1978/12/28', 3685);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4064, '67138467U', 'Clinger Settle', 'Sudershan', 3564, '1984/09/28', 3102);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4065, '27155381W', 'Buxton Tapia', 'Kathe', 3565, '1994/11/29', 3712);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4066, '88335925Z', 'Maurer Kohn', 'Pamela', 3557, '1972/04/14', 3903);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4067, '33734171E', 'Tobin Kachelmuss', 'Sharful', 3557, '1994/03/06', 5187);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4068, '65700722P', 'Kerkemeyer Sprague', 'Twyonna', 3566, '1990/02/25', 6086);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4069, '60500863F', 'Clay Keirns', 'Quamika', 3563, '1983/01/31', 2661);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4070, '81827359P', 'Corkett Clare', 'Geoff', 3558, '1988/01/29', 2583);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4071, '63212892Z', 'Josey Wiedenmann', 'Sanjay', 3562, '1971/05/13', 2690);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4072, '12048093S', 'Lilly Keaton', 'Gianfranco', 3563, '1982/05/24', 3802);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4073, '44938309Z', 'Vrtis Rende', 'Mikel', 3560, '1986/06/26', 2879);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4074, '98679549M', 'King Teixeira', 'Pauline', 3566, '1987/10/09', 3161);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4075, '25006611N', 'Mcmyne Kinnear', 'Ammon', 3566, '1994/10/26', 5107);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4076, '20001245I', 'Ingham Webster', 'Mariola', 3559, '1972/08/05', 2893);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4077, '49401137Q', 'Haglund Allshouse', 'Curtis', 3562, '1971/08/13', 4389);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4078, '73566099P', 'Mixon Griffeeney', 'Andrey', 3559, '1975/01/04', 2990);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4079, '12723782C', 'Barowsky Schaffer', 'Tefera', 3564, '1975/07/21', 2099);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4080, '66181831C', 'Hall Peltonen', 'Delena', 3566, '1983/12/31', 2371);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4081, '56951379C', 'Khan Bartleson', 'Xiaoyan', 3563, '1984/07/13', 5865);
INSERT INTO JUN17.Medicos (med_id, med_dni, med_apellidos, med_nombre, med_area, med_fec_nac, med_nomina) VALUES (4082, '28100008Y', 'Fergus Snow', 'Blair', 3561, '1980/05/12', 3240);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3581, 3622, 3567);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3568, 3638, 3600);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3610, 3619, 3587);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3597, 3678, 3582);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3570, 3670, 3572);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3589, 3621, 3606);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3576, 3680, 3604);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3594, 3635, 3604);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3588, 3625, 3597);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3568, 3686, 3586);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3590, 3630, 3577);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3598, 3647, 3589);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3599, 3666, 3568);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3581, 3679, 3596);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3609, 3669, 3589);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3594, 3661, 3569);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3588, 3664, 3581);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3601, 3666, 3580);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3584, 3634, 3607);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3602, 3621, 3588);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3584, 3618, 3608);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3585, 3616, 3592);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3578, 3667, 3603);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3580, 3663, 3593);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3608, 3674, 3604);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3606, 3643, 3578);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3576, 3672, 3574);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3572, 3675, 3595);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3571, 3678, 3577);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3581, 3634, 3593);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3589, 3630, 3586);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3570, 3645, 3599);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3610, 3620, 3595);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3596, 3648, 3594);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3601, 3680, 3583);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3594, 3644, 3600);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3602, 3642, 3610);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3593, 3678, 3567);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3591, 3638, 3603);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3601, 3681, 3594);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3608, 3640, 3608);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3599, 3680, 3581);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3592, 3615, 3590);
INSERT INTO JUN17.Asignaciones (asig_enfermero, asig_habitacion, asig_responsable) VALUES (3607, 3665, 3584);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2016/10/16', 4066, 4063, 3589, 3597);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2017/01/24', 4082, 4064, 3589, 3601);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2003/10/21', 4074, 4074, 3585, 3591);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2013/10/19', 4078, 4066, 3601, 3609);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2010/08/29', 4074, 4080, 3607, 3576);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2009/01/19', 4080, 4065, 3573, 3567);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/11/14', 4079, 4081, 3604, 3593);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2015/10/18', 4080, 4062, 3608, 3574);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2017/03/22', 4065, 4078, 3588, 3602);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2005/05/14', 4066, 4072, 3590, 3599);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/04/16', 4069, 4065, 3577, 3585);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2012/11/29', 4072, 4062, 3586, 3607);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2006/08/16', 4081, 4070, 3603, 3575);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2008/08/07', 4065, 4076, 3575, 3603);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2005/11/16', 4068, 4063, 3582, 3582);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/04/08', 4068, 4071, 3604, 3607);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/01/06', 4073, 4065, 3585, 3598);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2000/07/11', 4082, 4070, 3602, 3592);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2012/07/17', 4069, 4072, 3590, 3571);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2004/05/24', 4065, 4071, 3592, 3603);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2000/11/26', 4078, 4072, 3598, 3575);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2012/12/06', 4066, 4075, 3606, 3604);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2006/06/05', 4068, 4079, 3584, 3602);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/01/02', 4081, 4061, 3597, 3576);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2008/12/16', 4078, 4078, 3601, 3589);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2000/01/01', 4082, 4082, 3593, 3605);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2005/02/14', 4063, 4082, 3570, 3605);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2002/07/31', 4070, 4073, 3581, 3591);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2009/04/16', 4080, 4072, 3594, 3607);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/05/10', 4082, 4064, 3583, 3579);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2008/01/29', 4082, 4078, 3580, 3579);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2009/03/15', 4078, 4073, 3580, 3589);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2007/01/27', 4076, 4078, 3605, 3607);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2012/07/25', 4065, 4082, 3577, 3583);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2004/03/07', 4065, 4082, 3609, 3598);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2002/09/10', 4071, 4074, 3604, 3603);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2005/09/28', 4073, 4079, 3577, 3587);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2003/02/09', 4069, 4071, 3580, 3592);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2014/10/27', 4062, 4066, 3582, 3596);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2013/01/18', 4073, 4061, 3587, 3571);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/07/16', 4066, 4070, 3599, 3577);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2017/07/09', 4079, 4076, 3606, 3605);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2012/10/20', 4081, 4064, 3567, 3567);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2015/03/03', 4066, 4066, 3586, 3584);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2005/02/01', 4081, 4066, 3587, 3575);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2018/08/22', 4066, 4078, 3593, 3572);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2013/06/20', 4064, 4065, 3598, 3571);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2003/11/15', 4062, 4078, 3595, 3607);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/04/10', 4067, 4080, 3608, 3571);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2001/06/24', 4067, 4073, 3568, 3582);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2006/10/29', 4063, 4072, 3603, null);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2010/08/25', 4075, 4078, 3574, 3606);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2018/09/03', 4078, 4076, 3579, 3591);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2006/01/30', 4070, 4082, 3609, 3587);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2015/10/01', 4076, 4063, 3589, 3575);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2013/10/16', 4078, 4061, 3605, 3579);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2007/10/17', 4066, 4079, 3606, 3587);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2007/01/22', 4076, 4076, 3568, 3595);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2015/08/16', 4076, 4079, 3598, 3593);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2003/05/24', 4073, 4065, 3607, 3580);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2013/07/28', 4064, 4064, 3605, 3589);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2016/06/12', 4066, 4073, 3595, 3569);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2002/05/13', 4068, 4073, 3597, 3591);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2008/09/10', 4064, 4082, 3591, 3600);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2016/04/19', 4068, 4071, 3592, 3589);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2000/11/25', 4067, 4066, 3598, 3577);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2004/07/30', 4061, 4067, 3575, null);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2014/02/17', 4061, 4063, 3579, 3578);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2013/11/11', 4076, 4070, 3609, null);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2007/10/18', 4079, 4076, 3581, 3596);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2018/10/05', 4064, 4069, 3608, 3593);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2010/09/20', 4063, 4075, 3581, 3596);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2012/10/07', 4062, 4070, 3600, 3610);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2005/06/01', 4069, 4064, 3567, 3568);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2006/07/23', 4079, 4064, 3593, 3578);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2009/04/15', 4081, null, 3593, 3595);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2011/11/23', 4061, null, 3597, 3607);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2005/02/03', 4073, 4073, 3582, 3573);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2004/04/21', 4076, 4065, 3604, 3568);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2008/07/26', 4078, 4071, 3593, 3586);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2014/11/07', 4063, 4079, 3598, 3585);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2005/10/10', 4068, 4073, 3567, 3567);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2012/02/08', 4073, 4066, 3604, 3605);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2002/02/17', 4068, 4078, 3603, 3610);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2007/12/02', 4076, 4077, 3590, 3584);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2016/06/19', 4078, 4071, 3590, 3595);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2007/09/15', 4074, 4066, 3591, 3609);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2006/12/13', 4067, 4078, 3577, 3609);
INSERT INTO JUN17.Guardias (gua_fecha, gua_med_A, gua_med_B, gua_enf_A, gua_enf_B) VALUES ('2008/11/23', 4072, null, 3602, 3579);
CREATE SCHEMA JUN18;
USE JUN18;

CREATE TABLE estudiantes (
    est_id int(11) NOT NULL,
    est_dni varchar(9) NOT NULL,
    est_apellidos varchar(40) NOT NULL,
    est_nombre varchar(20) NOT NULL,
    est_direccion varchar(150) DEFAULT NULL,
    est_ciudad varchar(50) DEFAULT NULL,
    est_provincia varchar(50) DEFAULT NULL,
    PRIMARY KEY (est_id)
);

CREATE TABLE profesores (
    pro_id int(11) NOT NULL,
    pro_dni varchar(9) NOT NULL,
    pro_apell varchar(30) NOT NULL,
    pro_nombre varchar(30) NOT NULL,
    PRIMARY KEY (pro_id)
);

CREATE TABLE asignaturas (
    asi_id int(11) NOT NULL,
    asi_nombre varchar(20) DEFAULT NULL,
    asi_titulacion varchar(50) DEFAULT NULL,
    asi_semestre char(1) DEFAULT NULL,
    asi_profesor int(11) NOT NULL,
    PRIMARY KEY (asi_id),
    FOREIGN KEY (asi_profesor) REFERENCES profesores (pro_id)
);

CREATE TABLE matriculas (
    mat_estudiante int(11) NOT NULL,
    mat_asignatura int(11) NOT NULL,
    mat_curso varchar(6) NOT NULL,
    mat_nota_acta float DEFAULT NULL,
    PRIMARY KEY (mat_estudiante,mat_asignatura,mat_curso),
    FOREIGN KEY (mat_asignatura) REFERENCES asignaturas (asi_id),
    FOREIGN KEY (mat_estudiante) REFERENCES estudiantes (est_id)
);

INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (1, '18662701O', 'Arp Matthews', 'Halina');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (2, '88038580X', 'Robertd Welchert', 'Ghassan');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (3, '78246111W', 'Garner Demarse', 'Monique');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (4, '75396115U', 'Wuertz Stallone', 'Connie');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (5, '46181036O', 'Parker Knaus', 'Lynda');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (6, '22294558O', 'Robichaud Howell', 'Tasha');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (7, '28389066V', 'Heitzman Towers', 'Nate');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (8, '22393722Y', 'Yach Volz', 'Mallika');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (9, '19500625Q', 'Porter Cohn', 'Amalia');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (10, '95633879W', 'Whatley Klug', 'Shoba');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (11, '52590733C', 'Galvez Berin', 'Hector');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (12, '33076868H', 'Ghormley Holley', 'Michael');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (13, '46440246W', 'Salter Red', 'Connie');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (14, '56929864J', 'Tadeu Amacker', 'Ghaffar');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (15, '64333061Q', 'Ghormley Haaf', 'Morticia');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (16, '32496552G', 'Ibarrondo Rainwater', 'Peg');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (17, '16575884T', 'Cocolla Welchert', 'Noriess');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (18, '97971587R', 'Elmer Haglund', 'Elzbieta');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (19, '27595809G', 'Moudry Roman', 'Lolita');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (20, '40812826J', 'Cullen Arbeli', 'Francesca');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (21, '39414327S', 'Traverse Moroneso', 'Hae-Yong');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (22, '96436028X', 'Laventure Soto', 'Pelagija');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (23, '16125932L', 'Heppelmann Brennan', 'Melanciaa');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (24, '24911699G', 'Barnes Jaques', 'Peggy');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (25, '13547326I', 'Rahn Couturier', 'Steven');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (26, '22555930J', 'Galvez Landau', 'Narendra');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (27, '42400467M', 'Gould Wiedenmann', 'Jamie');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (28, '90412772N', 'Zazzara Kessel', 'Wanda');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (29, '61158812S', 'Wollf Cone', 'Yan');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (30, '87733420O', 'Cates Dedonato', 'Aminata');
INSERT INTO JUN18.profesores (pro_id, pro_dni, pro_apell, pro_nombre) VALUES (31, '63235275M', 'Hencmann Rogers', 'Miriam');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3768, '89917456V', 'Gershowitz Demarse', 'Samir', '8583 Id Ct', 'Georgetown', 'Huelva');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3769, '71425611P', 'Warner Jaques', 'Samuel', '3857 Mattis St', 'Conehatta', 'Malaga');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3770, '46312528C', 'Galligan Gilkerson', 'Ora', '1284 Sit Ave', 'Siloam Springs', 'Granada');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3771, '57175545L', 'Burkhardt Belleque', 'Brenda', '7628 Elementum St', 'San Antonio', 'Sevilla');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3772, '87998849H', 'Derryberry Rider', 'Colette', '159 Sagittis Ave', 'Rockville', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3773, '55530046J', 'Lindsay Charleston', 'Charlotte', '7897 Vestibulum St', 'Schaumburg', 'Sevilla');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3774, '37004458N', 'Needham Cripps', 'Pelagija', '3509 Tortor St', 'Orange County', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3775, '20657994G', 'Jokisch Bottone', 'Scort', '566 Facilisis Ct', 'Fort Campbell', 'Almeria');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3776, '97221162D', 'Rioux Willett', 'Agnes', '8397 Aenean St', 'Fort Bragg', 'Granada');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3777, '23514999N', 'Willett Baligian', 'Dorothy', '3881 Eros St', 'Sarasota', 'Granada');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3778, '96632863M', 'Malkewicz Sanchez', 'Cory', '2251 Vel Ct', 'Ashburn', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3779, '82369308K', 'Petroski Keen', 'Megan', '3260 Aenean Rd', 'Duck River', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3780, '15793002E', 'Pitts Kirchner', 'Majeed', '7057 Aliquam Ct', 'Hazel Park', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3781, '14073671G', 'Bombulie Orellana', 'Felicia', '3176 Morbi Ln', 'Quincy', 'Almeria');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3782, '21156757C', 'Allen Liu', 'Joel', '1634 Lacus Dr', 'Fort Myers', 'Granada');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3783, '89747728C', 'Gates Cowen', 'Katina', '9112 Lacus Ln', 'Littleton', 'Cordoba');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3784, '26248401L', 'Llc Rock', 'Alla', '8681 Odio Ct', 'Fort Mill', 'Huelva');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3785, '37910139D', 'Partridge Earls', 'Larry', '9754 Id Ave', 'North Bend', 'Malaga');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3786, '29776691Y', 'Doll Steuernagel', 'Humayun', '9425 Elementum Ave', 'Brodhead', 'Huelva');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3787, '48238456F', 'Dayton Almanza', 'Gene', '8294 Vestibulum St', 'Rolling Meadows', 'Cordoba');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3788, '69443362S', 'Gardner Holcombe', 'Lisbeth', '2323 Sit St', 'Bridgeport', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3789, '24118219V', 'Lencowski Hayes', 'Geraldine', '5237 Sed Ln', 'Monmouth Beach', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3790, '54260442P', 'Kliban Bryant', 'Diane', '7259 Mattis Ave', 'Rio Rancho', 'Sevilla');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3791, '69931055U', 'Clanton Rioux', 'Haytham', '2591 Tincidunt Ln', 'Brookville', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3792, '11403135F', 'Evert Longmire', 'Loyd', '9707 Massa St', 'Leesburg', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3793, '15746163M', 'Welch Chang', 'Brent', '7949 Magna Ct', 'Chester', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3794, '97559517W', 'Chelette Wilcox', 'Cory', '7486 Sed Ct', 'Swansea', 'Cordoba');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3795, '43494571I', 'Sluka Lang', 'Henry', '3559 Id Rd', 'Redwood City', 'Almeria');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3796, '97904210R', 'Blackwell Kerr', 'Ratikorn', '8216 Eget Dr', 'The Dalles', 'Almeria');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3797, '34608362P', 'Neff Espinosa', 'Geoffrey', '3209 Egestas Ln', 'Decatur', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3798, '99216210C', 'Pointelin Hesler', 'Jasmin', '416 Dolor Dr', 'Trinity', 'Granada');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3799, '95823305L', 'Boblett Altermatt', 'Blake', '986 Facilisis Dr', 'Williamstown', 'Cordoba');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3800, '34248519K', 'Poe Morse', 'Donna', '5747 At Dr', 'Church Point', 'Huelva');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3801, '12199741C', 'Barrow Daniels', 'Markella', '4642 Adipiscing Dr', 'St. Paul', 'Granada');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3802, '39460558V', 'Vanessen Rice', 'Song', '2568 Nunc Ave', 'Gettysburg', 'Cordoba');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3803, '13809040Y', 'Ramos Spry', 'Leticia', '7006 Pharetra Ln', 'Winters', 'Cordoba');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3804, '98629300H', 'Kozlowski Shofstahl', 'Fernando', '3718 Tincidunt St', 'Toronto', 'Sevilla');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3805, '29859538D', 'Shanafelt Hemmer', 'Mellony', '7100 Id Ave', 'Yonkers', 'Huelva');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3806, '51197267U', 'Greene Wuertz', 'Pedro', '4208 Pulvinar Ct', 'Elmwood Park', 'Huelva');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3807, '55465086J', 'Lompa Deliu', 'Tania', '781 Elementum St', 'Ogden', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3808, '59165358U', 'Albers Reith', 'Fiaze', '8077 Magna Ln', 'Redwood City', 'Almeria');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3809, '33428860B', 'Lamb Needham', 'Walter', '5946 Massa Ln', 'Tallapoosa', 'Cordoba');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3810, '60010828X', 'Quintana Dryden', 'Rosie', '5406 Lacus Ct', 'Saint Pauls', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3811, '86619328K', 'Elmer Batrouny', 'Wendy', '2091 Convallis Rd', 'Fort Collins', 'Granada');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3812, '54954588Y', 'Pierce Giera', 'Suwanto', '5590 Odio Rd', 'Leesburg', 'Huelva');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3813, '97736423Y', 'Gerhart Ramos', 'Siping', '4525 Aliquam Rd', 'Rancho Cordova', 'Sevilla');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3814, '31444987Z', 'Arbeli Comfort', 'Zachary', '4128 Vitae Rd', 'Georgetown', 'Malaga');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3815, '50312568D', 'Yach Ann', 'Janise', '1381 Magna Dr', 'Chambersburg', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3816, '89547024B', 'Nicholson Mixon', 'Brendan', '9111 Ipsum Dr', 'Anchorage', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3817, '81871191Q', 'Borrego Brown', 'Amatullah', '5336 Amet Ave', 'Traverse City', 'Malaga');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3818, '20844319C', 'Spencer Little', 'Beverly', '2410 Nec Ct', 'State College', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3819, '56200233R', 'Pento Mcnulty', 'Safiyyah', '9474 Pretium Ln', 'Henderson', 'Malaga');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3820, '69418255W', 'Lees Krynsky', 'Jody', '9247 Elementum Ave', 'Bremen', 'Huelva');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3821, '24738042B', 'Comfort Olejnik', 'Sheng', '2660 Adipiscing St', 'Bellefontaine', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3822, '39019751Y', 'Strange Yen', 'Natilee', '9781 Lorem Ct', 'Elizabethton', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3823, '12345881Y', 'Hudgens Sober', 'Ludmila', '5612 Lacus Ave', 'Lake City', 'Almeria');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3824, '91717985N', 'Sprague Clay', 'Ashwin', '2278 Porta Rd', 'Minneapolis', 'Jaen');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3825, '26042710F', 'Hopson Holden', 'Sherry', '4262 Augue Ct', 'Anchorage', 'Cadiz');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3826, '79920452N', 'Briley Bowen', 'Jannae', '9395 Etiam St', 'Abbotsford', 'Granada');
INSERT INTO JUN18.estudiantes (est_id, est_dni, est_apellidos, est_nombre, est_direccion, est_ciudad, est_provincia) VALUES (3827, '33250277S', 'Alpert Penning', 'Rose', '2579 Odio Ln', 'Trinity', 'Jaen');
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (2, 'Elzbieta', 'GIE', '1', 11);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (3, 'Jimmy', 'GII', '1', 18);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (4, 'Zachary', 'GIA', '2', 11);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (5, 'Agnes', 'GIE', '2', 17);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (6, 'Derek', 'GII', '2', 4);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (7, 'Percy', 'GIDD', '1', 6);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (8, 'Ruth', 'GII', '1', 4);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (9, 'Demetra', 'GIEI', '1', 27);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (10, 'Femi', 'GITI', '1', 30);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (11, 'Pamela', 'GIDD', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (12, 'Angela', 'GIDD', '1', 6);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (13, 'Ruth', 'GIA', '2', 20);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (14, 'Roland', 'GIA', '1', 30);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (15, 'Ira', 'GIA', '2', 15);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (16, 'Jerome', 'GIDD', '1', 15);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (17, 'Vinit', 'GITI', '1', 20);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (18, 'David', 'GIDD', '2', 25);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (19, 'Lola', 'GIE', '1', 20);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (20, 'Rogelio', 'GIE', '1', 3);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (21, 'Whitney', 'GII', '2', 6);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (22, 'Ali', 'GII', '1', 4);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (23, 'Yolanda', 'GITI', '1', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (24, 'Al', 'GIEI', '2', 27);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (25, 'Meiyin', 'GIDD', '2', 16);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (26, 'Barbara', 'GIEI', '2', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (27, 'Frances', 'GITI', '1', 8);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (28, 'Joanna', 'GIA', '2', 25);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (29, 'Fang', 'GII', '2', 28);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (30, 'Paula', 'GIE', '2', 15);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (31, 'Shelton', 'GITI', '2', 29);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (32, 'Magdalena', 'GII', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (33, 'Jacquie', 'GIE', '2', 28);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (34, 'William', 'GIDD', '2', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (35, 'Majeed', 'GII', '2', 5);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (36, 'Benjamin', 'GIE', '2', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (37, 'Ahmad', 'GII', '1', 11);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (38, 'Robbie', 'GII', '1', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (39, 'Michelamone', 'GIE', '2', 5);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (40, 'Nona', 'GIA', '1', 25);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (41, 'Toya', 'GIDD', '2', 1);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (42, 'Gill', 'GITI', '2', 28);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (43, 'Demetrius', 'GIE', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (44, 'Nudret', 'GITI', '1', 1);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (45, 'Marzee', 'GIEI', '1', 20);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (46, 'LaShonda', 'GIDD', '1', 29);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (47, 'Valesa', 'GIDD', '2', 3);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (48, 'Ida', 'GIA', '1', 14);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (49, 'Lori', 'GII', '2', 27);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (50, 'Norma', 'GII', '2', 5);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (51, 'Mosharraf', 'GIEI', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (52, 'Janette', 'GIDD', '2', 30);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (53, 'Milagros', 'GITI', '2', 13);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (54, 'Yauma', 'GIA', '2', 12);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (55, 'Tamara', 'GIEI', '1', 10);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (56, 'Agnes', 'GIA', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (57, 'Monique', 'GIDD', '1', 15);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (58, 'Althea', 'GIA', '1', 20);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (59, 'Azra', 'GIA', '2', 11);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (60, 'Louis', 'GIDD', '2', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (61, 'Yiping', 'GIDD', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (62, 'Marvin', 'GIA', '2', 3);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (63, 'Irma', 'GIDD', '1', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (64, 'Elena', 'GIDD', '2', 12);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (65, 'Shirley', 'GIA', '1', 19);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (66, 'Latrese', 'GII', '1', 25);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (67, 'Holli', 'GIE', '1', 1);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (68, 'Bern', 'GIEI', '2', 16);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (69, 'Maurice', 'GIA', '2', 29);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (70, 'Candice', 'GIA', '1', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (71, 'Katherine', 'GIA', '1', 3);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (72, 'Suwanto', 'GIA', '2', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (73, 'Lorita', 'GIDD', '2', 28);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (74, 'Julia', 'GITI', '1', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (75, 'Dorota', 'GII', '2', 25);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (76, 'Aroterick', 'GII', '1', 18);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (77, 'Shanae', 'GIEI', '1', 3);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (78, 'Kristie', 'GIA', '1', 31);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (79, 'Rosa', 'GII', '1', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (80, 'Earnell', 'GIE', '1', 11);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (81, 'Ruben', 'GIEI', '2', 5);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (82, 'Devon', 'GIE', '1', 18);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (83, 'Leatrice', 'GIA', '1', 31);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (84, 'Coty', 'GIEI', '2', 13);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (85, 'Meera', 'GIEI', '1', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (86, 'Hector', 'GIEI', '2', 15);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (87, 'Ashwin', 'GII', '1', 29);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (88, 'Narendra', 'GII', '2', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (89, 'Cheryll', 'GII', '1', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (90, 'Cayla', 'GITI', '2', 8);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (91, 'Harry', 'GIE', '1', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (92, 'Yeqing', 'GIE', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (93, 'Twyonna', 'GIDD', '2', 30);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (94, 'Dorota', 'GITI', '2', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (95, 'Marie', 'GIDD', '2', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (96, 'Ofelia', 'GIEI', '1', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (97, 'Olivia', 'GITI', '2', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (98, 'Saowalak', 'GIDD', '1', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (99, 'Diane', 'GIA', '2', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (100, 'Tauras', 'GITI', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (101, 'Marshall', 'GII', '2', 17);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (102, 'Jody', 'GIEI', '1', 19);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (103, 'Mark', 'GIA', '2', 1);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (104, 'Priscilla', 'GIE', '1', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (105, 'Ahila', 'GIEI', '2', 10);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (106, 'Racquel', 'GIEI', '2', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (107, 'Kefeng', 'GIDD', '2', 19);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (108, 'Destinee', 'GII', '2', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (109, 'Otilia', 'GIE', '1', 13);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (110, 'Humayun', 'GITI', '1', 13);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (111, 'Krissy', 'GIDD', '1', 6);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (112, 'Amir', 'GIDD', '1', 3);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (113, 'Fredric', 'GII', '2', 19);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (114, 'Latasha', 'GII', '2', 8);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (115, 'Kofi', 'GIDD', '2', 11);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (116, 'Joanna', 'GIE', '1', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (117, 'Azra', 'GIDD', '1', 13);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (118, 'Loyd', 'GITI', '2', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (119, 'Bettye', 'GIDD', '2', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (120, 'Sherrie', 'GIE', '2', 5);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (121, 'Puranjay', 'GITI', '1', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (122, 'Shunita', 'GII', '1', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (123, 'Terrence', 'GIE', '2', 1);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (124, 'Francesca', 'GIDD', '1', 10);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (125, 'Cenna', 'GIEI', '1', 23);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (126, 'Blake', 'GIEI', '1', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (127, 'Micheal', 'GIE', '1', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (128, 'Doris', 'GIEI', '2', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (129, 'Jessica', 'GITI', '2', 30);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (130, 'Mark', 'GIA', '1', 7);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (131, 'Imelda', 'GIDD', '2', 12);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (132, 'Augustine', 'GIE', '2', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (133, 'Fransisca', 'GIEI', '1', 28);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (134, 'Wichaya', 'GIEI', '2', 17);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (135, 'Valarie', 'GITI', '1', 18);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (136, 'Willie', 'GIE', '1', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (137, 'Maly', 'GIA', '1', 4);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (138, 'Andrew', 'GITI', '1', 17);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (139, 'Terrence', 'GIA', '2', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (140, 'Hurley', 'GIEI', '1', 16);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (141, 'Dante''', 'GIA', '1', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (142, 'Asher', 'GII', '1', 10);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (143, 'Brittany', 'GIE', '1', 16);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (144, 'Yewawde', 'GIDD', '1', 17);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (145, 'Marla', 'GIDD', '2', 6);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (146, 'Elsuhaili', 'GIA', '2', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (147, 'Amani', 'GIE', '2', 19);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (148, 'Irmaa', 'GIEI', '1', 31);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (149, 'Jerry', 'GIE', '1', 28);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (150, 'Mellony', 'GIE', '1', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (151, 'Ron', 'GITI', '1', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (152, 'Radhe', 'GIEI', '1', 14);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (153, 'Jacob', 'GIDD', '2', 24);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (154, 'Natasha', 'GITI', '2', 15);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (155, 'LaDagea', 'GITI', '2', 30);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (156, 'Bartley', 'GIDD', '2', 3);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (157, 'Delena', 'GIDD', '1', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (158, 'Wanda', 'GIEI', '1', 5);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (159, 'Anwar', 'GITI', '2', 31);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (160, 'Fredrick', 'GIA', '1', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (161, 'LaShonda', 'GIA', '1', 14);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (162, 'Larry', 'GIDD', '2', 11);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (163, 'Alla', 'GIA', '1', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (164, 'Dennis', 'GIDD', '2', 11);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (165, 'Delena', 'GIE', '1', 28);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (166, 'Susen', 'GIEI', '1', 9);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (167, 'Signia', 'GITI', '2', 20);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (168, 'Cameron', 'GIEI', '2', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (169, 'Hope', 'GITI', '1', 4);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (170, 'Gabriel', 'GII', '1', 29);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (171, 'Louis', 'GIE', '1', 22);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (172, 'Glory', 'GIE', '2', 25);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (173, 'Marjorie', 'GIDD', '2', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (174, 'Joslyn', 'GIA', '2', 15);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (175, 'Sara', 'GIEI', '2', 10);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (176, 'Blair', 'GII', '1', 7);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (177, 'Atif', 'GIE', '1', 14);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (178, 'Kam', 'GIEI', '1', 5);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (179, 'Marina', 'GIA', '2', 12);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (180, 'Veena', 'GITI', '2', 6);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (181, 'Cecelia', 'GIA', '2', 14);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (182, 'Naeem', 'GITI', '2', 18);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (183, 'Latonya', 'GIE', '2', 23);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (184, 'Stacey', 'GITI', '2', 30);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (185, 'Teresa', 'GII', '1', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (186, 'Atul', 'GIA', '2', 27);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (187, 'Constance', 'GIA', '2', 17);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (188, 'Leopoldo', 'GIEI', '1', 29);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (189, 'Dennis', 'GIA', '2', 5);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (190, 'Shaneka', 'GII', '2', 30);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (191, 'Lyubov', 'GIEI', '2', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (192, 'Daisy', 'GIDD', '2', 2);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (193, 'Triandi', 'GIDD', '1', 18);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (194, 'Freddy', 'GIDD', '1', 26);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (195, 'Yewawde', 'GITI', '1', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (196, 'Dung', 'GITI', '2', 15);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (197, 'Sonia', 'GIA', '1', 7);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (198, 'Darlene', 'GITI', '2', 21);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (199, 'Hae-Yong', 'GIEI', '2', 31);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (200, 'Gregory', 'GIDD', '1', 10);
INSERT INTO JUN18.asignaturas (asi_id, asi_nombre, asi_titulacion, asi_semestre, asi_profesor) VALUES (201, 'Nidal', 'GII', '1', 26);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 23, '201213', 5.14739);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 46, '201819', 6.84687);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 76, '201718', 9.50784);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 106, '201516', 4.14195);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 107, '201213', 1.04204);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 139, '201415', 8.69842);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 146, '201819', 1.75685);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 154, '201011', 3.01649);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 163, '201819', 8.45188);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 166, '201516', 2.03865);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 191, '201415', 4.01367);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3768, 198, '201617', 7.06611);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 10, '201819', 7.59254);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 12, '201718', 3.03444);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 16, '201314', 0.823238);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 46, '201415', 0.95291);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 64, '201516', 1.84585);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 101, '201011', 0.427174);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 102, '201718', 8.58897);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 114, '201819', 2.5375);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 143, '201516', 6.08468);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 154, '201112', 9.83892);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 159, '201415', 4.78527);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 176, '201516', 9.89577);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 189, '201819', 6.65871);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 193, '201617', 6.19434);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 197, '201011', 0.888706);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3769, 200, '201516', 6.75128);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 6, '201011', 1.42905);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 9, '201516', 6.08427);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 14, '201314', 4.18585);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 16, '201213', 8.78823);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 68, '201112', 0.600019);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 76, '201516', 4.20704);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 84, '201516', 8.97945);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 97, '201011', 5.17313);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 97, '201718', 9.48964);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 104, '201213', 2.97897);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 115, '201314', 1.08318);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 119, '201516', 2.44193);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 134, '201112', 3.5273);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 148, '201011', 6.29732);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 177, '201718', 1.60805);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 181, '201213', 5.27258);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3770, 198, '201112', 5.83566);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 5, '201314', 5.55158);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 22, '201415', 3.82752);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 54, '201718', 4.62557);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 60, '201415', 7.68642);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 75, '201718', 9.62596);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 78, '201819', 2.1175);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 80, '201617', 1.80533);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 86, '201314', 3.78883);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 137, '201718', 6.37502);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 138, '201819', 2.54104);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 142, '201314', 3.18543);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 148, '201516', 3.94867);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 177, '201516', 4.65991);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 184, '201112', 5.67838);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3771, 185, '201011', 1.24287);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 39, '201415', 6.33177);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 60, '201516', 0.622907);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 65, '201415', 3.7019);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 79, '201516', 8.29247);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 84, '201112', 3.77883);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 89, '201213', 7.51189);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 93, '201112', 2.47053);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 104, '201516', 9.41574);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 110, '201011', 2.89621);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 118, '201011', 4.50864);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 135, '201314', 4.74001);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 146, '201213', 7.99736);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 157, '201213', 3.34135);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3772, 159, '201314', 4.02945);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 13, '201213', 1.14523);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 14, '201213', 9.7074);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 27, '201112', 5.99778);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 41, '201213', 5.44122);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 63, '201415', 6.22519);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 68, '201415', 0.131694);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 69, '201516', 0.301792);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 76, '201112', 1.10801);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 81, '201516', 6.05798);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 89, '201314', 2.53318);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 101, '201516', 6.94085);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 103, '201617', 0.510712);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 119, '201819', 9.2371);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 120, '201516', 2.73341);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 135, '201718', 7.19792);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 176, '201516', 0.0411704);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3773, 178, '201516', 7.68817);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 16, '201819', 9.34867);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 27, '201213', 4.03348);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 31, '201718', 6.73867);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 34, '201314', 0.530249);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 43, '201314', 3.11333);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 55, '201718', 7.43915);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 75, '201415', 7.31371);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 87, '201314', 0.904911);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 101, '201213', 1.85532);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 104, '201617', 5.88753);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 108, '201112', 7.62773);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 109, '201314', 7.12524);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 112, '201516', 6.89977);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 130, '201112', 7.51534);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 163, '201112', 9.5671);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 168, '201011', 6.62903);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 177, '201011', 2.31891);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 180, '201112', 3.84465);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 181, '201516', 0.321675);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3774, 189, '201011', 9.54174);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 3, '201415', 9.90083);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 64, '201819', 0.577559);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 71, '201819', 9.93901);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 130, '201011', 7.74147);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 133, '201415', 2.45727);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 170, '201213', 9.34792);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 172, '201011', 3.52262);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 179, '201819', 3.2138);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 180, '201213', 8.97082);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 184, '201819', 7.4439);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 192, '201718', 2.41962);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3775, 197, '201617', 6.47851);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 7, '201415', 4.12686);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 10, '201314', 2.36867);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 23, '201112', 2.74216);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 53, '201516', 6.19302);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 58, '201112', 9.38668);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 91, '201718', 4.40964);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 93, '201011', 6.52354);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 93, '201415', 8.88009);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 126, '201415', 4.52611);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 130, '201415', 5.59174);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 136, '201516', 0.919876);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 156, '201415', 2.58311);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 162, '201415', 6.52009);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 169, '201415', 1.91369);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 177, '201617', 0.664115);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 190, '201516', 8.05355);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3776, 198, '201415', 9.65069);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 27, '201819', 4.43117);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 28, '201819', 6.25225);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 40, '201718', 3.62772);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 49, '201617', 2.13299);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 62, '201516', 8.27278);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 69, '201718', 4.92119);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 85, '201314', 4.24339);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 106, '201011', 6.04213);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 137, '201011', 4.47543);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 151, '201718', 3.62835);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 174, '201213', 8.33431);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 184, '201112', 1.03632);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 196, '201213', 3.33873);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3777, 199, '201819', 9.58121);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 5, '201112', 2.3579);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 9, '201718', 9.26426);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 11, '201718', 4.82144);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 43, '201718', 9.72608);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 65, '201415', 3.73186);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 67, '201213', 4.06871);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 67, '201819', 1.09281);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 80, '201617', 7.55379);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 84, '201112', 6.7418);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 93, '201213', 0.809815);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 100, '201213', 4.71293);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 111, '201213', 9.48245);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 120, '201415', 5.14273);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 148, '201011', 8.99086);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 191, '201819', 3.10118);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 194, '201819', 7.09186);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3778, 200, '201617', 8.2736);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 4, '201415', 7.88063);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 15, '201617', 2.57043);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 26, '201415', 2.60296);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 42, '201415', 1.2238);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 61, '201011', 8.97682);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 61, '201213', 6.09294);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 74, '201819', 4.38523);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 92, '201617', 6.64262);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 104, '201112', 2.46663);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 104, '201415', 2.61295);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 135, '201011', 7.1857);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 136, '201516', 7.82114);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 152, '201516', 8.11091);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 160, '201819', 7.39736);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 165, '201617', 9.70395);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 167, '201112', 8.61958);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3779, 198, '201516', 6.58828);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 5, '201314', 7.08241);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 9, '201617', 7.38419);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 26, '201516', 6.90325);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 27, '201112', 8.38326);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 30, '201516', 7.82158);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 37, '201617', 3.37398);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 62, '201112', 3.66821);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 76, '201213', 7.50582);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 93, '201617', 2.88091);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 115, '201718', 0.701874);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 117, '201819', 5.2335);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 139, '201112', 1.74539);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 144, '201516', 4.8544);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 146, '201819', 2.75653);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 160, '201314', 1.56595);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 163, '201718', 9.39801);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 170, '201718', 8.96909);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3780, 193, '201516', 2.25272);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 40, '201314', 4.55154);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 41, '201314', 4.86944);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 41, '201819', 8.31663);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 55, '201213', 2.34082);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 61, '201314', 5.06261);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 62, '201415', 7.57029);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 69, '201819', 4.23593);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 80, '201617', 2.51065);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 88, '201314', 2.46071);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 100, '201011', 3.92814);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 107, '201718', 4.41696);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 109, '201415', 4.42134);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 116, '201314', 8.73069);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 119, '201213', 1.15151);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 135, '201213', 4.70069);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 152, '201011', 8.1387);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 158, '201213', 2.46699);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 170, '201213', 9.36419);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 171, '201213', 7.01968);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 180, '201617', 0.309104);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 188, '201819', 5.44813);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3781, 198, '201819', 6.68564);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 14, '201213', 2.72412);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 45, '201112', 7.64693);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 58, '201415', 9.66719);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 60, '201011', 2.69709);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 98, '201415', 2.22866);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 100, '201213', 8.22072);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 100, '201819', 7.98165);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 101, '201213', 5.71212);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 105, '201516', 0.0798975);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 108, '201011', 6.97208);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 164, '201314', 5.99768);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 170, '201819', 1.91845);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 177, '201112', 6.01944);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 177, '201415', 0.611714);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 182, '201213', 1.18916);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3782, 201, '201516', 9.53106);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 27, '201112', 7.39349);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 51, '201718', 6.86366);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 57, '201415', 8.35802);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 58, '201617', 0.951795);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 59, '201516', 2.99672);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 61, '201011', 6.73117);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 61, '201213', 5.49011);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 71, '201718', 7.35315);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 87, '201617', 2.73291);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 92, '201112', 9.51798);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 92, '201819', 5.99981);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 124, '201718', 8.99206);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3783, 152, '201415', 6.02158);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 14, '201718', 8.75874);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 15, '201415', 2.81683);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 75, '201011', 4.64603);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 79, '201415', 5.91223);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 86, '201314', 2.22534);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 129, '201718', 2.77171);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 139, '201819', 9.74044);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 152, '201516', 0.947833);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 159, '201112', 9.50892);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 168, '201718', 1.4858);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 170, '201819', 2.25976);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 195, '201415', 9.89104);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 196, '201718', 1.35421);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 197, '201112', 0.0739454);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3784, 197, '201213', 8.55408);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 5, '201617', 9.75539);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 7, '201617', 4.67856);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 25, '201213', 0.0515349);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 51, '201213', 7.22203);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 53, '201415', 6.77621);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 76, '201011', 6.21129);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 77, '201718', 6.96487);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 81, '201213', 3.69671);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 99, '201213', 2.76205);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 121, '201112', 3.12743);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 127, '201011', 6.0928);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 139, '201011', 2.11195);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 169, '201314', 6.78874);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 174, '201011', 6.08369);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 174, '201415', 6.0519);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3785, 195, '201314', 2.39144);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 24, '201213', 1.19229);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 32, '201011', 5.1442);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 35, '201112', 3.86677);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 44, '201314', 4.93936);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 45, '201213', 5.27023);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 64, '201112', 7.2913);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 74, '201314', 7.10332);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 74, '201415', 3.39108);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 78, '201819', 0.497057);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 88, '201718', 6.62912);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 94, '201213', 5.6868);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 148, '201213', 4.32683);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 151, '201617', 9.47041);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 154, '201011', 3.33044);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 157, '201011', 0.263212);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 182, '201011', 5.99498);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 185, '201314', 1.88807);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 190, '201415', 9.69964);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 194, '201415', 4.51047);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3786, 201, '201718', 8.9999);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 15, '201718', 2.88566);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 49, '201112', 7.35342);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 50, '201314', 4.76351);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 56, '201213', 8.39693);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 74, '201314', 5.91776);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 77, '201516', 6.77078);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 79, '201112', 8.2781);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 82, '201415', 3.82367);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 84, '201011', 9.23346);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 90, '201112', 6.48752);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 97, '201819', 8.62576);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 119, '201314', 2.57219);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 149, '201819', 5.6892);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 153, '201819', 7.54434);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3787, 179, '201516', 0.868405);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 4, '201314', 7.66112);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 24, '201516', 3.77034);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 58, '201516', 6.41526);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 74, '201617', 3.1617);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 76, '201819', 7.63844);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 80, '201718', 9.4769);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 89, '201415', 9.42243);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 95, '201213', 9.40169);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 111, '201213', 7.98668);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 113, '201819', 3.46213);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 114, '201718', 3.75057);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 127, '201819', 2.71095);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 148, '201718', 4.76231);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 157, '201819', 3.0896);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3788, 190, '201213', 0.39412);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 13, '201213', 9.99395);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 20, '201819', 6.02703);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 28, '201112', 7.57196);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 29, '201314', 9.60148);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 49, '201314', 6.80534);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 73, '201516', 1.08505);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 82, '201213', 4.44818);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 106, '201516', 8.35807);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 127, '201011', 5.02118);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 128, '201819', 8.81006);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 130, '201314', 7.16192);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 142, '201718', 9.26756);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 156, '201617', 8.34825);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 158, '201415', 9.28793);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 164, '201819', 5.9489);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 175, '201011', 2.87158);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 176, '201819', 8.30698);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3789, 198, '201314', 1.2962);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 34, '201314', 2.86274);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 49, '201415', 1.01325);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 77, '201011', 4.16976);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 86, '201415', 0.221167);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 122, '201718', 5.88812);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 128, '201011', 0.271651);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 134, '201011', 7.94996);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 135, '201112', 3.13333);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 147, '201011', 0.923701);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 162, '201516', 2.79239);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 181, '201516', 8.7191);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3790, 190, '201314', 7.31852);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 2, '201617', 9.14129);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 16, '201314', 3.63067);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 25, '201415', 3.41237);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 27, '201213', 0.842339);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 29, '201112', 4.00891);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 33, '201314', 9.98029);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 45, '201516', 7.2553);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 67, '201415', 4.94594);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 99, '201213', 8.42663);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 100, '201718', 5.54576);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 118, '201516', 0.24787);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 123, '201112', 2.97532);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 132, '201011', 6.7796);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 133, '201516', 1.70947);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 159, '201819', 2.35204);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 166, '201314', 2.0513);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 182, '201011', 3.02945);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3791, 200, '201516', 6.55942);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 18, '201415', 4.67317);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 22, '201718', 3.39347);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 36, '201011', 6.33417);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 38, '201314', 0.757659);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 82, '201617', 2.62644);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 97, '201213', 4.55317);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 98, '201617', 0.244208);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 101, '201617', 8.66334);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 106, '201213', 9.3488);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 120, '201415', 6.56229);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 121, '201415', 2.61204);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 182, '201617', 9.05554);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 189, '201011', 5.08128);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 197, '201718', 8.10369);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3792, 198, '201516', 6.91284);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 27, '201314', 2.77013);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 42, '201617', 5.5778);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 57, '201718', 3.68617);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 59, '201819', 6.68283);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 60, '201819', 5.84985);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 66, '201516', 6.79266);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 69, '201415', 4.41158);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 99, '201718', 7.96532);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 103, '201213', 7.29516);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 104, '201112', 1.21187);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 110, '201819', 9.55219);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 115, '201314', 5.81267);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 126, '201213', 1.5241);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 130, '201516', 4.73193);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 131, '201011', 3.80684);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 135, '201415', 3.002);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 137, '201112', 3.15322);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 160, '201617', 4.52144);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 175, '201213', 7.19835);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 175, '201718', 4.62491);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 186, '201213', 4.64099);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3793, 187, '201617', 5.01312);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 25, '201314', 5.59449);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 40, '201617', 7.17423);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 51, '201213', 7.20521);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 68, '201213', 3.20647);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 82, '201011', 0.947665);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 111, '201213', 6.60498);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 128, '201011', 2.77474);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 139, '201213', 9.86036);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 150, '201112', 5.00959);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 150, '201213', 3.11077);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 170, '201112', 0.505978);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 194, '201213', 6.60727);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 196, '201011', 1.53007);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3794, 201, '201314', 7.75795);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 33, '201011', 2.23436);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 37, '201415', 2.93544);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 41, '201213', 2.66488);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 46, '201718', 1.31322);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 50, '201718', 8.07954);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 52, '201718', 2.60286);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 65, '201011', 6.63897);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 71, '201718', 3.14382);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 76, '201819', 0.181514);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 96, '201112', 2.934);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 127, '201617', 6.90179);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 128, '201516', 2.89028);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 135, '201011', 3.49852);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 136, '201314', 6.0589);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 141, '201314', 5.60003);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 155, '201314', 3.32458);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 163, '201213', 9.48971);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 168, '201314', 2.17735);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 182, '201819', 2.80891);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 186, '201718', 0.192627);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 198, '201314', 6.82899);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3795, 201, '201516', 7.76265);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 5, '201011', 7.53385);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 9, '201516', 9.57183);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 11, '201415', 3.32994);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 23, '201718', 4.49207);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 25, '201718', 9.73629);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 48, '201213', 4.91471);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 61, '201617', 3.47328);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 115, '201819', 8.67777);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 130, '201011', 6.79579);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 135, '201718', 9.59057);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 136, '201011', 7.617);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 157, '201819', 7.73595);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3796, 192, '201617', 7.80227);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 4, '201415', 3.24467);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 38, '201516', 1.09204);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 41, '201415', 4.89498);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 47, '201011', 7.68354);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 52, '201314', 0.890668);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 58, '201415', 9.6586);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 71, '201718', 2.82428);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 77, '201819', 3.06037);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 101, '201415', 0.678241);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 118, '201314', 2.82434);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 149, '201213', 0.0532061);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 158, '201516', 0.125018);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 160, '201516', 8.8802);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3797, 179, '201011', 2.05564);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 5, '201314', 0.95912);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 52, '201314', 6.73162);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 66, '201213', 8.0465);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 81, '201011', 6.42556);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 85, '201415', 9.2061);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 89, '201718', 5.90516);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 94, '201819', 2.46872);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 97, '201314', 5.83266);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 98, '201314', 7.3663);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 98, '201617', 1.77037);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 112, '201112', 2.21092);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 124, '201617', 1.2662);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 137, '201718', 5.1455);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 192, '201617', 4.82632);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3798, 199, '201617', 2.69726);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 9, '201617', 6.13917);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 35, '201112', 1.39331);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 36, '201617', 2.25607);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 42, '201718', 8.5486);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 50, '201617', 0.97705);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 63, '201415', 0.386552);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 66, '201112', 7.49367);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 77, '201617', 8.13097);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 78, '201819', 8.88134);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 92, '201112', 1.74667);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 106, '201617', 3.97129);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 124, '201213', 7.72974);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 126, '201819', 7.43059);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 147, '201819', 9.84539);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 165, '201718', 4.0294);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 168, '201011', 2.04475);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 180, '201415', 3.47679);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 184, '201617', 4.63493);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 188, '201819', 0.684558);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3799, 201, '201718', 7.06083);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 4, '201011', 8.44731);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 7, '201819', 4.17998);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 26, '201718', 5.8381);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 40, '201112', 0.39168);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 53, '201718', 6.06951);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 59, '201011', 5.81441);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 64, '201516', 4.21136);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 73, '201314', 3.72302);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 92, '201516', 4.1276);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 112, '201314', 3.25391);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 117, '201314', 8.60609);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 122, '201718', 3.3592);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 138, '201617', 8.50699);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 155, '201112', 1.18689);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3800, 187, '201718', 6.12066);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 5, '201617', 4.44913);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 11, '201112', 2.12573);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 23, '201415', 5.44137);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 39, '201314', 2.78332);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 44, '201617', 6.18375);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 61, '201617', 4.2503);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 68, '201011', 3.20599);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 79, '201718', 3.14926);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 92, '201314', 4.18402);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 94, '201819', 7.04907);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 99, '201819', 5.33004);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 106, '201314', 7.27532);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 118, '201415', 5.97164);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 137, '201819', 7.82679);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 149, '201516', 3.21942);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 150, '201314', 4.5121);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 155, '201516', 8.30914);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 156, '201617', 7.45284);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 161, '201314', 3.25447);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 171, '201415', 6.80535);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 177, '201516', 0.911628);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3801, 187, '201314', 7.52887);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 28, '201718', 9.17532);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 58, '201314', 6.35268);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 67, '201314', 2.69717);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 67, '201718', 0.948961);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 77, '201718', 2.50925);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 86, '201213', 2.18232);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 90, '201718', 5.15639);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 100, '201415', 9.88124);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 114, '201718', 8.63209);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 119, '201516', 0.478787);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 121, '201314', 4.73442);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 161, '201213', 3.90354);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 164, '201213', 1.66722);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 170, '201617', 4.92568);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 178, '201617', 2.7211);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 185, '201516', 8.37971);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3802, 190, '201112', 5.55512);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 10, '201718', 1.07553);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 18, '201314', 5.31886);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 24, '201617', 9.31401);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 38, '201415', 7.0499);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 48, '201112', 8.34586);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 58, '201819', 9.65344);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 61, '201314', 2.72869);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 88, '201617', 7.16731);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 117, '201213', 9.2529);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 133, '201819', 3.91202);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 135, '201819', 3.8911);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 156, '201617', 3.33096);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 158, '201819', 9.90414);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 162, '201516', 7.6481);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 172, '201718', 3.43422);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 185, '201617', 6.36002);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 186, '201112', 0.187353);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3803, 201, '201011', 3.97065);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 24, '201516', 2.14011);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 26, '201112', 6.28627);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 28, '201213', 8.90795);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 36, '201011', 3.90082);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 39, '201617', 1.38032);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 42, '201314', 4.72231);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 57, '201819', 8.94693);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 98, '201516', 4.43997);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 121, '201011', 2.89951);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 122, '201415', 2.34386);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 132, '201112', 7.46106);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 136, '201112', 6.93353);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 137, '201213', 3.55578);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 138, '201819', 7.57688);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 148, '201819', 9.0361);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 178, '201011', 4.74092);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 186, '201112', 5.04616);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 190, '201112', 3.95131);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 192, '201819', 2.15307);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3804, 201, '201516', 4.04651);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 48, '201415', 6.80396);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 50, '201819', 7.56297);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 62, '201617', 6.33372);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 81, '201516', 3.58893);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 83, '201415', 1.8639);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 86, '201011', 0.124574);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 93, '201314', 3.27075);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 112, '201819', 7.04497);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 118, '201213', 9.03161);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 151, '201314', 0.264666);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3805, 181, '201112', 0.191246);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 5, '201617', 7.30219);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 7, '201213', 8.02923);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 14, '201415', 8.6373);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 15, '201314', 7.45664);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 15, '201718', 2.7736);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 28, '201415', 9.55124);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 35, '201314', 5.80188);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 61, '201415', 9.49379);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 77, '201112', 6.38573);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 80, '201213', 7.08011);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 81, '201516', 1.57256);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 95, '201112', 3.47246);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 95, '201415', 1.37842);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 107, '201819', 8.88631);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 122, '201718', 3.00973);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 126, '201314', 0.108375);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 154, '201314', 9.78768);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 167, '201819', 6.34338);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 173, '201314', 8.12959);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 178, '201112', 3.28772);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 185, '201213', 6.19855);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 185, '201516', 1.88488);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3806, 188, '201415', 2.57096);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 3, '201011', 4.83027);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 18, '201213', 8.09513);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 22, '201819', 6.26054);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 48, '201314', 9.66935);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 81, '201516', 4.86181);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 83, '201314', 4.45381);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 85, '201718', 2.18514);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 91, '201112', 6.72282);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 95, '201617', 7.96953);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 118, '201011', 8.69458);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 131, '201314', 3.48011);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 139, '201415', 0.869873);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 158, '201112', 1.91726);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 164, '201415', 7.71364);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 167, '201112', 0.897607);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 174, '201314', 2.41049);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3807, 186, '201516', 2.45039);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 7, '201011', 5.36955);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 8, '201415', 3.67276);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 20, '201516', 0.115581);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 45, '201617', 1.84533);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 64, '201415', 1.63587);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 71, '201415', 5.44759);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 86, '201516', 7.255);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 128, '201415', 2.20191);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 131, '201112', 4.76089);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 142, '201011', 7.97815);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 157, '201718', 8.21231);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3808, 192, '201819', 1.186);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 4, '201718', 5.98928);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 22, '201415', 5.15538);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 48, '201314', 0.349032);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 51, '201617', 1.12723);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 58, '201516', 8.232);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 64, '201112', 7.69759);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 79, '201213', 1.39992);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 86, '201819', 6.51113);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 100, '201314', 1.50568);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 103, '201112', 8.34047);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 106, '201314', 0.363223);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 111, '201819', 4.76422);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 112, '201011', 1.8751);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 113, '201112', 9.55266);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 121, '201011', 1.19649);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 142, '201415', 2.82134);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 143, '201819', 0.663776);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 144, '201314', 9.73707);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 147, '201011', 4.88108);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 150, '201819', 5.73378);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 156, '201415', 0.219926);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 174, '201011', 8.63878);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 187, '201011', 2.4291);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3809, 190, '201718', 8.33926);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 31, '201112', 9.03945);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 75, '201819', 3.53211);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 82, '201617', 1.84843);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 94, '201314', 7.08887);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 111, '201617', 3.99618);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 121, '201819', 9.44609);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 132, '201112', 7.96883);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 145, '201718', 6.7899);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 146, '201516', 7.37716);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 152, '201617', 5.40852);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 191, '201718', 1.04323);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3810, 201, '201516', 0.828422);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 15, '201819', 2.39353);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 21, '201011', 4.02521);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 25, '201617', 0.598539);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 30, '201112', 3.46196);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 55, '201819', 2.33814);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 73, '201112', 4.50125);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 79, '201415', 6.01548);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 89, '201516', 3.97076);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 90, '201213', 5.94288);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 135, '201011', 0.378088);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 136, '201112', 5.42053);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 166, '201112', 9.12512);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 170, '201415', 2.62393);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 187, '201213', 9.71683);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3811, 189, '201314', 8.00802);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 6, '201415', 4.9347);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 7, '201718', 1.64685);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 44, '201314', 4.89611);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 63, '201314', 9.44005);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 74, '201112', 5.5182);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 92, '201011', 6.92718);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 92, '201819', 7.93724);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 94, '201415', 6.0648);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 96, '201415', 1.68418);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 100, '201516', 8.71164);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 103, '201718', 8.19141);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 107, '201718', 4.18603);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 119, '201617', 8.21547);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 126, '201011', 4.34906);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 136, '201516', 9.60477);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 140, '201011', 6.22736);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 150, '201213', 5.84941);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 178, '201819', 6.42714);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3812, 197, '201718', 6.31998);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 8, '201718', 3.74374);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 20, '201819', 0.0331451);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 28, '201314', 5.95164);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 29, '201314', 0.0103733);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 48, '201819', 5.84134);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 78, '201516', 6.65284);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 80, '201314', 5.2543);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 86, '201011', 0.774018);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 98, '201011', 7.68725);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 109, '201617', 3.77661);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 133, '201819', 3.70488);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 145, '201314', 0.418787);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 158, '201011', 8.34067);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 161, '201516', 9.1002);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 175, '201617', 4.52932);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3813, 184, '201718', 7.44575);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 12, '201112', 4.09794);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 20, '201617', 7.9238);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 32, '201213', 6.90878);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 47, '201112', 7.13368);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 50, '201011', 4.02432);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 68, '201819', 7.74756);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 85, '201112', 5.31048);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 88, '201011', 9.06388);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 89, '201415', 1.51987);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 111, '201112', 3.73013);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 117, '201213', 8.47875);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 127, '201314', 6.45138);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 132, '201415', 0.162522);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 138, '201213', 2.78789);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 139, '201819', 4.45255);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 146, '201516', 7.20958);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 155, '201011', 7.70674);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 159, '201213', 7.3981);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 175, '201819', 3.44051);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 177, '201617', 7.23569);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3814, 188, '201516', 3.84138);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 17, '201011', 8.23567);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 18, '201819', 2.94645);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 36, '201819', 3.62732);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 43, '201011', 9.77118);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 80, '201213', 9.91842);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 88, '201011', 3.71552);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 96, '201718', 2.89552);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 124, '201011', 5.71549);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 140, '201819', 7.05449);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 168, '201011', 5.51148);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 177, '201415', 4.4633);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 179, '201819', 7.4267);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 181, '201718', 9.29776);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3815, 185, '201011', 8.11835);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 16, '201415', 0.637237);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 40, '201415', 9.88908);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 52, '201011', 5.18327);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 60, '201213', 8.93995);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 91, '201314', 7.67152);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 94, '201011', 1.59211);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 97, '201718', 7.48735);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 103, '201819', 9.45165);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 110, '201718', 3.339);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 116, '201415', 9.59875);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 143, '201617', 3.35416);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3816, 165, '201617', 0.297975);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 16, '201112', 6.92777);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 18, '201011', 5.11218);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 77, '201718', 8.73277);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 93, '201314', 2.75251);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 94, '201314', 4.26283);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 126, '201011', 6.99585);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 133, '201415', 3.19491);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 136, '201415', 0.993955);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 152, '201112', 0.450064);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 162, '201617', 5.58896);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 168, '201011', 3.95552);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 168, '201415', 9.35281);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 169, '201415', 8.47312);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 170, '201112', 5.75995);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 176, '201213', 0.595376);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3817, 184, '201516', 4.46492);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 3, '201314', 5.32616);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 4, '201718', 1.29419);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 23, '201314', 2.78657);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 25, '201617', 3.19359);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 29, '201819', 0.756203);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 39, '201718', 6.40704);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 57, '201011', 9.93316);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 59, '201516', 0.0336655);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 59, '201819', 0.910709);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 61, '201516', 3.09073);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 67, '201112', 9.28709);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 73, '201718', 1.92178);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 76, '201617', 4.62191);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 101, '201011', 5.13295);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 121, '201112', 1.76364);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 129, '201314', 1.08092);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 130, '201516', 1.23028);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 138, '201617', 4.80237);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 170, '201011', 2.45332);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3818, 189, '201011', 5.90133);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 23, '201011', 7.00508);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 46, '201314', 4.32702);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 52, '201011', 5.82324);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 56, '201011', 7.69663);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 57, '201819', 2.18935);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 61, '201617', 1.12899);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 66, '201415', 6.61382);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 78, '201213', 2.04368);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 79, '201617', 3.20821);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 87, '201617', 9.03502);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 106, '201718', 9.15189);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 115, '201011', 1.97971);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 120, '201112', 2.08011);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 123, '201112', 0.945612);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 129, '201819', 9.04876);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 134, '201617', 6.55415);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 148, '201112', 9.62739);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 158, '201617', 1.37884);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 161, '201011', 6.52657);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 176, '201011', 1.63771);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 181, '201314', 3.88155);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 187, '201718', 5.16581);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 189, '201415', 1.63925);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3819, 199, '201617', 9.37521);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 19, '201819', 6.28858);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 20, '201213', 7.74425);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 66, '201819', 3.51844);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 75, '201011', 3.06359);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 78, '201819', 1.82664);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 101, '201617', 8.94935);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 102, '201314', 3.83335);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 118, '201213', 6.62915);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 136, '201617', 6.06889);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 147, '201415', 1.66522);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 153, '201011', 1.82729);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 172, '201718', 3.51288);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3820, 181, '201718', 6.29805);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 26, '201314', 9.67964);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 30, '201819', 7.88604);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 32, '201011', 3.31651);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 41, '201112', 1.10694);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 43, '201415', 7.29553);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 53, '201718', 7.35539);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 65, '201011', 4.30154);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 75, '201011', 9.16914);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 87, '201415', 7.09891);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 121, '201213', 1.87309);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 121, '201415', 5.95108);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 133, '201718', 8.96094);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 143, '201213', 9.95136);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 147, '201516', 4.47677);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3821, 161, '201718', 8.99116);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 4, '201314', 2.36198);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 29, '201314', 0.0332964);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 33, '201011', 1.27549);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 37, '201314', 1.39471);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 38, '201516', 9.46163);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 79, '201516', 6.16804);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 86, '201516', 2.90105);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 105, '201011', 1.0912);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 105, '201819', 9.67438);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 106, '201213', 8.76408);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 111, '201718', 6.43128);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 129, '201819', 6.89415);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 145, '201819', 3.22315);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 158, '201213', 9.80285);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3822, 166, '201718', 9.95458);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 4, '201516', 2.65106);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 17, '201718', 0.384248);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 27, '201112', 1.20889);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 30, '201011', 5.37004);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 70, '201011', 6.35938);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 89, '201213', 1.78326);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 98, '201516', 4.53696);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 103, '201819', 8.49719);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 110, '201718', 0.852198);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 119, '201819', 2.01553);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 151, '201415', 2.21751);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 169, '201314', 3.51239);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 170, '201617', 1.85917);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 174, '201819', 0.126542);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 176, '201516', 9.06095);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3823, 184, '201819', 7.82367);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 8, '201112', 7.44416);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 12, '201617', 5.51391);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 22, '201112', 4.47915);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 27, '201415', 5.89983);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 59, '201011', 5.09797);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 66, '201819', 4.06238);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 118, '201011', 5.38479);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 140, '201617', 5.0348);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 142, '201011', 4.21166);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 163, '201718', 1.73664);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 176, '201819', 0.237987);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 179, '201819', 1.30299);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 186, '201819', 6.49374);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 192, '201516', 9.09896);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 194, '201718', 0.900958);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3824, 200, '201112', 7.07625);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 12, '201617', 4.05211);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 13, '201314', 2.40803);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 19, '201112', 5.52752);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 22, '201213', 0.656166);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 59, '201819', 8.03766);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 63, '201213', 5.09703);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 75, '201011', 9.89937);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 83, '201112', 1.05373);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 106, '201314', 0.914372);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 112, '201112', 9.62703);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 124, '201112', 8.20093);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 132, '201112', 0.614564);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 132, '201314', 5.56112);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 150, '201718', 9.70449);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 154, '201011', 9.16873);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3825, 161, '201819', 7.58396);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 8, '201213', 5.26448);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 13, '201415', 8.92098);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 13, '201617', 0.435386);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 22, '201617', 5.96527);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 31, '201011', 6.63685);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 49, '201314', 7.58297);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 52, '201819', 4.56285);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 67, '201112', 2.13236);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 70, '201617', 2.6207);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 82, '201819', 2.49259);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 84, '201516', 4.49538);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 98, '201617', 6.50829);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 103, '201213', 4.41488);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 121, '201718', 0.0915012);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 165, '201415', 0.184089);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 169, '201617', 4.72948);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 178, '201011', 9.67004);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 185, '201617', 3.41697);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3826, 197, '201314', 2.38461);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 6, '201617', 3.7162);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 15, '201314', 6.71203);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 33, '201415', 1.08455);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 61, '201617', 2.19273);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 63, '201819', 5.78253);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 68, '201314', 9.86466);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 70, '201011', 4.29398);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 86, '201516', 9.54625);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 88, '201819', 0.760729);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 98, '201415', 3.54215);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 134, '201516', 0.905211);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 156, '201516', 7.53468);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 179, '201516', 1.25061);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 186, '201314', 7.4799);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 189, '201617', 5.1711);
INSERT INTO JUN18.matriculas (mat_estudiante, mat_asignatura, mat_curso, mat_nota_acta) VALUES (3827, 201, '201718', 6.51992);CREATE schema SEP18;
USE SEP18;

CREATE TABLE Equipo (
    nomequipo VARCHAR(45) NOT NULL,
    director VARCHAR(45) NULL DEFAULT NULL,
    PRIMARY KEY (nomequipo)
);

CREATE TABLE Ciclista (
    dorsal INT(11) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    edad INT(11) NULL DEFAULT NULL,
    equipo VARCHAR(45) NOT NULL,
    PRIMARY KEY (dorsal),
    FOREIGN KEY (equipo) REFERENCES Equipo (nomequipo)
);

CREATE TABLE Etapa (
    numetapa INT(11) NOT NULL,
    kms FLOAT(11) NOT NULL,
    salida VARCHAR(45) NOT NULL,
    llegada VARCHAR(45) NOT NULL,
    ganador INT(11) NOT NULL,
    PRIMARY KEY (numetapa),
    FOREIGN KEY (ganador) REFERENCES Ciclista (dorsal)
);

CREATE TABLE Puerto (
    nompuerto VARCHAR(45) NOT NULL,
    altura INT(11) NOT NULL,
    categoria VARCHAR(25) NULL DEFAULT NULL,
    pendiente INT(11) NULL DEFAULT NULL,
    etapa INT(11) NOT NULL,
    primero INT(11) NOT NULL,
    PRIMARY KEY (nompuerto),
    FOREIGN KEY (etapa)REFERENCES Etapa (numetapa),
    FOREIGN KEY (primero) REFERENCES Ciclista (dorsal)
);

CREATE TABLE Maillot (
    codigo INT(11) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    color VARCHAR(15) NOT NULL,
    premio INT(11) NULL DEFAULT NULL, PRIMARY KEY (codigo)
);

CREATE TABLE Lleva (
    ciclista INT(11) NOT NULL,
    maillot INT(11) NOT NULL,
    etapa INT(11) NOT NULL,
    PRIMARY KEY (ciclista, maillot, etapa),
    FOREIGN KEY (ciclista) REFERENCES Ciclista (dorsal),
    FOREIGN KEY (maillot) REFERENCES Maillot (codigo),
    FOREIGN KEY (etapa) REFERENCES Etapa (numetapa)
);

INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Carmen', 'Vanatta');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Doug', 'Willman');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Marilynn', 'Polenz');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Marisela', 'Najanick');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Ofelia', 'Cole');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Olivia', 'Eugene');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Ravi', 'Hutchinson');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Terrence', 'Kreigler');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Theodore', 'Smallwood');
INSERT INTO SEP18.Equipo (nomequipo, director) VALUES ('Wayne', 'Hadley');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (1, 'Grace', 28, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (2, 'Dainius', 30, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (3, 'Nidal', 27, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (4, 'Marilyn', 19, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (5, 'Truefelia', 19, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (6, 'Cenna', 16, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (7, 'Yiping', 29, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (8, 'Courtney', 22, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (9, 'Rachel', 18, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (10, 'Sonia', 21, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (11, 'Damon', 20, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (12, 'Blair', 27, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (13, 'Cely', 22, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (14, 'Zoriy', 28, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (15, 'Muhammad', 17, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (16, 'Navneet', 21, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (17, 'Carl', 29, 'Wayne');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (18, 'Reginald', 24, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (19, 'Yu', 28, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (20, 'Gazi', 27, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (21, 'April', 19, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (22, 'Susen', 23, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (23, 'Colette', 25, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (24, 'Marina', 26, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (25, 'Danka', 17, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (26, 'Ginny', 26, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (27, 'Heather', 22, 'Terrence');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (28, 'Chun', 18, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (29, 'Narendra', 26, 'Doug');
INSERT INTO SEP18.Ciclista (dorsal, nombre, edad, equipo) VALUES (30, 'Walter', 24, 'Doug');
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (1, 355, 'Lake Lillian', 'Knoxville', 1);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (2, 132, 'Simi Valley', 'Lafayette', 9);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (3, 453, 'Hewitt', 'Roxboro', 1);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (4, 117, 'Tonasket', 'Rapid City', 5);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (5, 414, 'Blacksburg', 'Cheektowaga', 1);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (6, 87, 'Adairsville', 'Oakland', 3);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (7, 232, 'Barrington', 'Cullman', 5);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (8, 242, 'Shrewsbury', 'West Chester', 7);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (9, 48, 'El Paso', 'Redondo Beach', 5);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (10, 18, 'Carrollton', 'Conehatta', 8);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (11, 78, 'Issaquah', 'Boynton Beach', 3);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (12, 18, 'Lockhart', 'San Francisco', 4);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (13, 270, 'Bella Vista', 'St. Paul', 3);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (14, 482, 'Woonsocket', 'Los Angeles', 2);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (15, 398, 'Tonasket', 'Palm Beach Gardens', 5);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (16, 183, 'Santa Clarita', 'Grand Ledge', 6);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (17, 126, 'Nashua', 'Leesburg', 1);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (18, 381, 'Smithers', 'Cumming', 5);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (19, 479, 'Walnut Creek', 'Lake Crystal', 7);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (20, 495, 'Sunny', 'Murfreesboro', 7);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (24, 413, 'St. George', 'San Diego', 7);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (25, 415, 'Conneaut', 'Saint Clair Shores', 5);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (26, 309, 'Tulsa', 'Appleton', 8);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (27, 376, 'North Barrington', 'Spencer', 1);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (28, 471, 'South Bend', 'San Juan Capistrano', 8);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (29, 234, 'Kearney', 'New York', 6);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (30, 84, 'Forney', 'Grand Ledge', 1);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (31, 95, 'Florissant', 'Charlotte', 8);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (32, 472, 'Nicholasville', 'Rapid City', 7);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (33, 205, 'Montreal', 'Bella Vista', 3);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (34, 277, 'South Bend', 'Seattle', 2);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (35, 43, 'Seattle', 'Fort Collins', 9);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (36, 59, 'King George', 'Cranford', 1);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (37, 193, 'Pittsburgh', 'Sioux Falls', 8);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (38, 357, 'Bessemer City', 'Grand Rapids', 9);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (39, 61, 'Pine Mountain', 'Oxford', 2);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (40, 409, 'El Dorado', 'Detroit', 5);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (41, 313, 'Church Point', 'San Antonio', 9);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (42, 193, 'Winter Park', 'Tallapoosa', 5);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (43, 417, 'Concord', 'Vero Beach', 9);
INSERT INTO SEP18.Etapa (numetapa, kms, salida, llegada, ganador) VALUES (44, 295, 'Woodland Hills', 'Clearwater', 3);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Adairsville', 89, 'senior', 68, 8, 16);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Albany', 82, 'senior', 21, 30, 20);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Anchorage', 84, 'senior', 60, 36, 10);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Andover', 90, 'senior', 12, 34, 4);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Apopka', 72, 'benjamin', 36, 40, 28);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Baltimore', 89, 'benjamin', 53, 7, 30);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Bradford', 80, 'alevin', 67, 11, 1);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Brick', 95, 'alevin', 73, 31, 3);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Bulverde', 98, 'benjamin', 21, 3, 29);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Cambridge', 75, 'benjamin', 54, 25, 26);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Catlettsburg', 98, 'alevin', 61, 31, 29);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Clayton', 86, 'benjamin', 84, 7, 15);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Conehatta', 71, 'senior', 85, 41, 25);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Coon Rapids', 73, 'alevin', 60, 13, 24);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Crestview', 98, 'senior', 81, 41, 12);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Denver', 87, 'senior', 59, 35, 1);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Duck River', 96, 'senior', 34, 33, 15);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Dunn', 70, 'alevin', 34, 2, 12);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('E. Lansing', 85, 'benjamin', 36, 10, 13);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Faribault', 100, 'senior', 70, 30, 5);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Fayetteville', 87, 'benjamin', 30, 24, 17);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Fort Bragg', 73, 'benjamin', 87, 29, 27);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Fort Hood', 89, 'benjamin', 27, 6, 29);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Fort Myers', 75, 'benjamin', 60, 15, 16);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Frankfort', 72, 'senior', 11, 41, 2);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Furlong', 74, 'senior', 53, 38, 30);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Glendale', 74, 'benjamin', 89, 35, 12);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Grand Rapids', 94, 'benjamin', 25, 18, 12);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Granite Falls', 70, 'senior', 86, 8, 3);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Harper Woods', 89, 'benjamin', 46, 29, 26);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Harrison', 72, 'senior', 88, 33, 1);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Higginsville', 71, 'senior', 43, 32, 30);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Hudsonville', 88, 'senior', 75, 18, 3);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Kansas City', 71, 'alevin', 79, 6, 26);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Kitchener', 72, 'benjamin', 96, 9, 10);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Lehigh Acres', 90, 'senior', 47, 6, 5);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Macomb', 89, 'alevin', 66, 4, 30);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Malibu', 99, 'benjamin', 36, 12, 24);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Malta', 72, 'senior', 83, 14, 19);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Mansfield', 95, 'senior', 11, 43, 29);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Marion', 84, 'senior', 91, 15, 30);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Massillon', 96, 'benjamin', 88, 11, 19);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('New London Area', 95, 'alevin', 92, 17, 25);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Nicholasville', 92, 'benjamin', 18, 35, 25);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Norfolk', 78, 'senior', 40, 29, 17);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Northern', 75, 'senior', 15, 3, 30);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Odessa', 93, 'senior', 56, 41, 10);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Onamia', 86, 'senior', 41, 1, 29);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Osgood', 99, 'benjamin', 14, 24, 30);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Pompano Beach', 94, 'alevin', 80, 43, 20);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Poulsbo', 91, 'senior', 72, 9, 28);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Rogersville', 89, 'benjamin', 99, 43, 14);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Savannah', 72, 'alevin', 36, 1, 25);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Senoia', 93, 'senior', 69, 4, 27);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Smithers', 95, 'alevin', 89, 17, 6);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Springfield', 95, 'benjamin', 49, 2, 21);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('The Dalles', 76, 'alevin', 63, 14, 18);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Torrington', 89, 'senior', 57, 30, 3);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Vancouver', 77, 'alevin', 13, 15, 24);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Vero Beach', 80, 'alevin', 98, 43, 22);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Vienna', 87, 'benjamin', 25, 14, 4);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Walnut Creek', 100, 'alevin', 67, 14, 27);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Warsaw', 80, 'senior', 95, 36, 27);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Warwick', 97, 'alevin', 78, 7, 15);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Whitehouse', 86, 'senior', 50, 12, 10);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Winchester', 85, 'senior', 36, 38, 12);
INSERT INTO SEP18.Puerto (nompuerto, altura, categoria, pendiente, etapa, primero) VALUES ('Woodbridge', 78, 'senior', 59, 5, 11);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (1, 'carretera', 'amarillo', 414957);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (2, 'general', 'amarillo', 499064);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (3, 'montana', 'azul', 59326);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (4, 'montana', 'amarillo', 918034);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (5, 'general', 'amarillo', 86972);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (6, 'montana', 'rojo', 230236);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (7, 'ciudad', 'verde', 890638);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (8, 'carretera', 'amarillo', 271246);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (9, 'ciudad', 'azul', 492306);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (10, 'montana', 'verde', 99561);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (11, 'carretera', 'amarillo', 482580);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (12, 'montana', 'amarillo', 377951);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (13, 'montana', 'amarillo', 781154);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (14, 'montana', 'verde', 594724);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (15, 'montana', 'verde', 669240);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (16, 'carretera', 'azul', 641067);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (17, 'general', 'verde', 196361);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (18, 'ciudad', 'azul', 662362);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (19, 'general', 'verde', 846237);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (20, 'general', 'verde', 651225);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (21, 'general', 'amarillo', 649746);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (22, 'general', 'verde', 613010);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (23, 'general', 'azul', 558749);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (24, 'general', 'verde', 870049);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (25, 'general', 'rojo', 406488);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (26, 'general', 'verde', 670444);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (27, 'montana', 'azul', 468950);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (28, 'general', 'amarillo', 439040);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (29, 'montana', 'verde', 54152);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (30, 'ciudad', 'amarillo', 292157);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (31, 'general', 'amarillo', 209568);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (32, 'carretera', 'rojo', 585051);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (33, 'general', 'rojo', 36204);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (34, 'ciudad', 'verde', 267761);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (35, 'general', 'verde', 304199);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (36, 'carretera', 'amarillo', 879804);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (37, 'montana', 'rojo', 827438);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (38, 'carretera', 'verde', 100015);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (39, 'general', 'verde', 943062);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (40, 'ciudad', 'rojo', 45605);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (41, 'montana', 'verde', 375430);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (42, 'ciudad', 'verde', 638479);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (43, 'carretera', 'azul', 91546);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (44, 'ciudad', 'rojo', 370655);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (45, 'carretera', 'rojo', 109273);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (46, 'ciudad', 'amarillo', 744930);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (47, 'ciudad', 'amarillo', 724201);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (48, 'general', 'amarillo', 784498);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (49, 'carretera', 'azul', 490808);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (50, 'montana', 'azul', 597647);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (51, 'montana', 'amarillo', 981732);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (52, 'montana', 'verde', 109012);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (53, 'general', 'rojo', 70014);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (54, 'montana', 'amarillo', 96625);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (55, 'ciudad', 'azul', 593348);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (56, 'ciudad', 'verde', 75560);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (57, 'montana', 'rojo', 257318);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (58, 'ciudad', 'amarillo', 100575);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (59, 'general', 'rojo', 937532);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (60, 'general', 'amarillo', 83191);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (61, 'montana', 'amarillo', 488992);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (62, 'carretera', 'rojo', 761173);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (63, 'ciudad', 'verde', 940518);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (64, 'general', 'rojo', 51976);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (65, 'ciudad', 'verde', 881912);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (66, 'montana', 'amarillo', 883297);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (67, 'ciudad', 'azul', 61397);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (68, 'general', 'rojo', 913236);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (69, 'montana', 'amarillo', 244437);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (70, 'general', 'amarillo', 845223);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (71, 'ciudad', 'rojo', 911869);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (72, 'general', 'azul', 661693);
INSERT INTO SEP18.Maillot (codigo, tipo, color, premio) VALUES (73, 'ciudad', 'verde', 758984);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (1, 52, 37);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (1, 56, 33);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (1, 73, 32);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (2, 41, 36);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (3, 71, 32);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (4, 7, 34);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (4, 23, 2);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (4, 73, 29);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (5, 14, 14);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (5, 41, 42);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (6, 43, 1);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (6, 67, 41);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (7, 5, 25);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (7, 33, 35);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (7, 48, 25);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (7, 59, 38);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (7, 63, 7);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (9, 56, 32);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (9, 66, 35);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (10, 3, 24);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (10, 14, 43);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (10, 21, 2);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (11, 51, 13);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (12, 12, 39);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (12, 17, 10);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (12, 58, 17);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (13, 45, 38);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (13, 56, 3);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (14, 5, 10);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (15, 4, 27);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (15, 17, 3);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (15, 53, 12);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (16, 1, 44);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (16, 43, 28);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (17, 48, 38);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (17, 60, 44);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (18, 38, 33);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (18, 48, 33);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (18, 64, 8);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (19, 37, 17);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (19, 49, 6);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (19, 56, 26);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (20, 19, 42);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (20, 50, 30);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (20, 67, 29);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (21, 40, 3);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (22, 41, 3);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (22, 53, 29);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (23, 56, 27);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (24, 26, 27);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (25, 17, 38);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (25, 69, 35);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (25, 72, 27);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (26, 12, 34);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (26, 36, 9);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (26, 42, 36);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (26, 47, 17);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (27, 9, 31);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (27, 31, 1);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (27, 34, 9);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (27, 40, 30);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (27, 45, 40);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (27, 46, 19);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (28, 3, 32);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (28, 4, 32);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (28, 18, 42);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (28, 49, 34);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (29, 34, 43);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (29, 66, 15);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (30, 12, 13);
INSERT INTO SEP18.Lleva (ciclista, maillot, etapa) VALUES (30, 25, 44);