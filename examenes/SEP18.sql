CREATE schema SEP18;
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