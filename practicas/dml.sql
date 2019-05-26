USE Banco;
INSERT INTO Provincias (pro_id, pro_provincia) VALUES
(NULL, 'Salamanca'),
(NULL, 'Huesca');

INSERT INTO Ciudades (ciu_id, ciu_nombre, ciu_provincia) VALUES
(NULL, 'Almudévar', (SELECT pro_id FROM Provincias WHERE pro_provincia='Huesca')),
(NULL, 'Salamanca', (SELECT pro_id FROM Provincias WHERE pro_provincia='Salamanca')),
(NULL, 'Puerto Sta Ma', (SELECT pro_id FROM Provincias WHERE pro_provincia='Cádiz'));

INSERT INTO CodigosPostales (cp_cp, cp_ciudad)VALUES
('11407', (SELECT ciu_id FROM Ciudades WHERE ciu_nombre='Jerez')),
('11502', (SELECT ciu_id FROM Ciudades WHERE ciu_nombre='Puerto Sta Ma')),
('37001', (SELECT ciu_id FROM Ciudades WHERE ciu_nombre='Salamanca')),
('22270', (SELECT ciu_id FROM Ciudades WHERE ciu_nombre='Almudévar'));

INSERT INTO Clientes (cli_dni, cli_apellidos, cli_nombre, cli_direccion, cli_cp, cli_fec_nac) VALUES
('12345678A', 'López García', 'Virginia', 'C/Sol, 13.', 11001, NULL),
('12345679B', 'Saura Pérez', 'Juan', 'Urb. Membrillar, 3, Bajo B.', 11407, NULL),
('12345680C', 'Ramírez Servando', 'Laura', 'C/ Larga 1.11502.', 11502, NULL),
('12345681D', 'Santos Pera', 'Vicente', 'Plaza Marco Antonio, 17 Dcha.', 37001, NULL),
('12345682E', 'Larios Jardín', 'Miguel', 'Calle Roble, 4, 1ºA.', 22270, NULL);

INSERT INTO Cuentas (cue_ccc, cue_cliente)
VALUES ('21000003134567811115', (SELECT cli_id FROM Clientes WHERE cli_dni ='12345678A')),
       ('21000024003102575766', (SELECT cli_id FROM Clientes WHERE cli_dni ='12345679B')),
       ('21000024003102570000', (SELECT cli_id FROM Clientes WHERE cli_dni ='12345680C')),
       ('21000024003102571111', (SELECT cli_id FROM Clientes WHERE cli_dni ='12345681D')),
       ('21000024003102572222', (SELECT cli_id FROM Clientes WHERE cli_dni ='12345682E'));

INSERT INTO Hipotecas(hip_cuenta, hip_importe, hip_meses, hip_interes, hip_cuotas, hip_fecha_inicio)
VALUES ((SELECT cue_id
         FROM Clientes
                  JOIN Cuentas C on Clientes.cli_id = C.cue_cliente
         WHERE cli_dni = '12345678A'), 150000, 360, 2, 360, '2018-04-30'),
       ((SELECT cue_id
         FROM Clientes
                  JOIN Cuentas C on Clientes.cli_id = C.cue_cliente
         WHERE cli_dni = '12345680C'), 150000, 360, 2, 360, '2018-04-30');

UPDATE Clientes
SET cli_nombre='Laura'
WHERE cli_dni = '12345680C';


UPDATE Clientes
SET cli_cp=11045
WHERE cli_dni = '12345679B';

DELETE FROM Hipotecas
WHERE hip_cuenta IN(SELECT cue_id
         FROM Clientes
                  JOIN Cuentas C on Clientes.cli_id = C.cue_cliente
         WHERE cli_dni = '12345682E');

DELETE FROM Cuentas
WHERE cue_cliente IN(SELECT cli_id FROM Clientes WHERE cli_dni ='12345682E');

DELETE FROM Clientes
WHERE cli_dni ='12345682E';
