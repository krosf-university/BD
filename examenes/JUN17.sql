create schema JUN17;
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
