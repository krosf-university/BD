/* Ejercicio 1 */
SELECT *
FROM proveedores;
SELECT *
FROM tiendas;
SELECT *
FROM articulos;
SELECT *
FROM clientes;
SELECT *
FROM ventas;
SELECT *
FROM pesos;

/* Ejercicio 2 */
SELECT PRV_NOM
FROM proveedores;

/* Ejercicio 3 */
SELECT CLT_NOM, CLT_APELL
FROM clientes;

/* Ejercicio 4 */
SELECT TDA_GER
FROM tiendas;

/* Ejercicio 5 */
SELECT TDA_GER, TDA_POB
FROM tiendas;

/* Ejercicio 6 */
SELECT CLT_POB
FROM clientes;

/* Ejercicio 7 */
SELECT ART_NOM
FROM articulos;

/* Ejercicio 8 */
SELECT ART_COL
FROM articulos;

/* Ejercicio 9 */
SELECT CLT_POB AS localidad
FROM clientes;

/* Ejercicio 10 */
SELECT *
FROM clientes
WHERE CLT_POB = 'madrid';

/* Ejercicio 11 */
SELECT *
FROM articulos
WHERE ART_PESO > 500;

/* Ejercicio 12 */
SELECT *
FROM clientes
WHERE CLT_PAIS != 'e';

/* Ejercicio 13 */
SELECT *
FROM articulos
WHERE ART_PV >= ART_PC * 2;

/* Ejercicio 14 */
SELECT VNT_ART
FROM ventas
WHERE VNT_CLT = 1;

/* Ejercicio 15 */
SELECT *
FROM articulos
WHERE ART_COL = 'rojo'
  AND ART_PESO > 100;

/* Ejercicio 16 */
SELECT *
FROM articulos
WHERE ART_COL = 'rojo'
   OR ART_PESO > 500;

/* Ejercicio 17 */
SELECT *
FROM articulos
WHERE NOT (ART_COL = 'rojo' OR ART_PESO > 500);

/* Ejercicio 18 */
SELECT *
FROM articulos
WHERE (ART_COL = 'rojo' AND ART_PESO > 100)
   OR ART_COL = 'verde';

/* Ejercicio 19 */
SELECT *
FROM articulos
WHERE NOT (ART_COL = 'blanco' OR ART_COL = 'negro');

/* Ejercicio 20 */
SELECT *
FROM articulos
WHERE ART_PC BETWEEN 20 AND 30;

/* Ejercicio 21 */
SELECT *
FROM articulos
WHERE ART_PESO IS NULL
  AND ART_COL IS NULL;

/* Ejercicio 22 */
SELECT *
FROM articulos
WHERE ART_COL = 'rojo'
   OR ART_COL = 'verde';

/* Ejercicio 23 */
SELECT *
FROM ventas
WHERE VNT_FCH = '910109';

/* Ejercicio 24 */
SELECT *
FROM clientes
WHERE CLT_APELL LIKE 'ro%';

/* Ejercicio 25 */
SELECT *
FROM clientes
WHERE CLT_NOM NOT LIKE 'm%';

/* Ejercicio 26 */
SELECT *
FROM clientes
WHERE CLT_APELL LIKE 'du%t'
  AND LENGTH(CLT_APELL) = 6;

/* Ejercicio 27 */
SELECT *
FROM articulos
WHERE ART_COL IS NULL;

/* Ejercicio 28 */
SELECT *
FROM articulos
ORDER BY ART_PESO ASC;

/* Ejercicio 29 */
SELECT TDA_GER
FROM tiendas
ORDER BY TDA_GER ASC;

/* Ejercicio 30 */
SELECT *
FROM articulos
WHERE ART_PESO <= 100
ORDER BY ART_PESO ASC, ART_PC DESC;

/* Ejercicio 31 */
SELECT VNT_ART
FROM ventas
ORDER BY VNT_CANT ASC;

/* Ejercicio 32 */
SELECT *
FROM ventas
ORDER BY VNT_CANT ASC;

/* Ejercicio 33 */
SELECT ART_NOM
FROM articulos
WHERE ART_PRV = 2;

/* Ejercicio 34 */
SELECT CLT_NOM
FROM clientes
WHERE CLT_POB = 'pamplona';