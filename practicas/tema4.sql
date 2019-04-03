/* Ejercicio 1 */
SELECT *
FROM articulos
WHERE ART_PESO < (
  SELECT ART_PESO
  FROM articulos
  WHERE ART_NUM = 2)
ORDER BY ART_PESO;

/* Ejercicio 2 */
SELECT ART_NUM, ART_NOM
FROM articulos
WHERE ART_PESO > (
  SELECT MAX(ART_PESO)
  FROM articulos
  WHERE ART_NOM LIKE 'calendario')
   OR ART_COL IN (
  SELECT ART_COL
  FROM articulos
  WHERE ART_NOM LIKE 'impresora');

/* Ejercicio 3 */
SELECT *
FROM articulos
WHERE ART_COL IN (
  SELECT ART_COL
  FROM articulos
  WHERE ART_NUM = 10)
  AND ART_PESO >= (
  SELECT AVG(ART_PESO)
  FROM articulos);

/* Ejercicio 4 */
SELECT *
FROM proveedores
WHERE PRV_NUM IN (SELECT ART_PRV
                  FROM articulos
                  WHERE ART_COL = 'negro');

/* Ejercicio 5 */
SELECT CLT_NOM, CLT_APELL
FROM clientes
WHERE CLT_PAIS = 'e'
  AND CLT_POB IN (
  SELECT CLT_POB
  FROM clientes
  WHERE CLT_NOM LIKE 'pablo')
ORDER BY CLT_NUM;

/* Ejercicio 6 */
SELECT ART_COL, ART_NOM
FROM articulos A1
WHERE ART_PV IN (SELECT MAX(ART_PV)
                 FROM articulos A2
                 WHERE A1.ART_COL = A2.ART_COL
                 GROUP BY ART_COL)
GROUP BY ART_NOM;

/* Ejercicio 7 */
SELECT ART_COL, ART_NOM
FROM articulos A1
WHERE ART_PV IN (SELECT MAX(ART_PV)
                 FROM articulos A2
                 WHERE A1.ART_COL = A2.ART_COL
                    OR A1.ART_COL IS NULL
                 GROUP BY ART_COL)
GROUP BY ART_NOM;

/* Ejercicio 8 */
SELECT TDA_GER
FROM tiendas
WHERE TDA_NUM IN (
  SELECT VNT_TDA
  FROM ventas
  WHERE VNT_CANT >= 1
    AND VNT_ART = 2);

/* Ejercicio 9 */
SELECT *
FROM articulos
WHERE ART_PV >
      (SELECT MIN(ART_PV)
       FROM articulos
       WHERE ART_COL LIKE 'blanco');

/* Ejercicio 10 */
SELECT *
FROM articulos
WHERE ART_PV >
      (SELECT min(ART_PV)
       FROM articulos
       GROUP BY ART_COL
       HAVING ART_COL LIKE 'blanco'
      );

/* Ejercicio 11 */
SELECT *
FROM articulos A1
WHERE EXISTS
        (SELECT min(ART_PV)
         FROM articulos A2
         GROUP BY ART_COL
         HAVING A1.ART_PV > min(A2.ART_PV)
            AND ART_COL LIKE 'blanco');

/* Ejercicio 12 */
SELECT *
FROM clientes
WHERE CLT_NUM IN (
  SELECT VNT_CLT
  FROM ventas
  WHERE VNT_PRECIO > (
    SELECT AVG(VNT_PRECIO)
    FROM ventas)
);

/* Ejercicio 13 */
SELECT CLT_NUM, CLT_NOM
FROM clientes
WHERE CLT_NUM IN (
  SELECT VNT_CLT
  FROM ventas
  GROUP BY VNT_CLT
  HAVING COUNT(DISTINCT VNT_TDA) > 2
);

/* Ejercicio 14 */
SELECT ART_NUM, ART_NOM
FROM articulos
WHERE ART_NUM IN (
  SELECT VNT_ART
  FROM ventas
  WHERE VNT_CANT > (
    SELECT AVG(VNT_CANT)
    FROM ventas)
);

/* Ejercicio 15 */
SELECT *
FROM clientes
WHERE CLT_NUM IN (
  SELECT VNT_CLT
  FROM ventas
  HAVING COUNT(DISTINCT VNT_CLT) >= 3
);

/* Ejercicio 16 */
SELECT *
FROM articulos
WHERE ART_NUM IN (
  SELECT VNT_ART
  FROM ventas
  WHERE VNT_CLT = 1
);

/* Ejercicio 17 */
SELECT *
FROM clientes
WHERE CLT_NUM NOT IN (
  SELECT VNT_CLT
  FROM ventas
  WHERE VNT_FCH LIKE '92%'
);

/* Ejercicio 18 */
SELECT *
FROM clientes
WHERE CLT_NUM IN (
  SELECT VNT_CLT
  FROM ventas
  WHERE VNT_CANT > 5
);

/* Ejercicio 19 */
SELECT TDA_NUM, TDA_GER
FROM tiendas
WHERE TDA_NUM IN (
  SELECT VNT_TDA
  FROM ventas
  WHERE VNT_CANT > (
    SELECT AVG(VNT_CANT)
    FROM ventas)
);

/* Ejercicio 20 */
SELECT *
FROM clientes
WHERE CLT_POB IN ('madrid', 'barcelona')
  AND CLT_NUM NOT IN (
  SELECT VNT_CLT
  FROM ventas
  GROUP BY VNT_CLT
  HAVING sum(VNT_CANT) >= 2
);