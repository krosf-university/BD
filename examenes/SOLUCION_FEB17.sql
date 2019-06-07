/* FEB17 */
USE bbdd;
/*
                       _   _
                      | | (_)
   ___ _   _  ___  ___| |_ _  ___  _ __   ___  ___
  / __| | | |/ _ \/ __| __| |/ _ \| '_ \ / _ \/ __|
 | (__| |_| |  __/\__ \ |_| | (_) | | | |  __/\__ \
  \___|\__,_|\___||___/\__|_|\___/|_| |_|\___||___/


  __
 /_ |
  | |
  | |
  | |
  |_|

  */
DESCRIBE proveedores;

/*
  ___
 |__ \
    ) |
   / /
  / /_
 |____|

  */
SELECT *
FROM proveedores
WHERE PRV_NUM = (
    SELECT ART_PRV
    FROM articulos
    WHERE ART_PESO > 100
);
/* Esta mal porque devuelve mas de una fila */

SELECT *
FROM proveedores
WHERE PRV_NUM = ANY(
    SELECT ART_PRV
    FROM articulos
    WHERE ART_PESO > 100
);
/* Solucion [=ANY] == [IN]  */

SELECT *
FROM proveedores
WHERE PRV_NUM = ALL(
    SELECT ART_PRV
    FROM articulos
    WHERE ART_PESO > 100
);

/* Incorrecta PRV_NUM != a todos lo elementos del subquery */

/*
  ____
 |___ \
   __) |
  |__ <
  ___) |
 |____/


+--------------------------+------------------------+
|          Where           |         Having         |
+--------------------------+------------------------+
| SELECT UPDATE DELETE     | SELECT                 |
| WHERE condition GROUP BY | GROUP BY column HAVING |
| Filtra antes de agrupar. | Agrupa y luego filtra. |
+--------------------------+------------------------+

                  _     _
                 | |   | |
  _ __  _ __ ___ | |__ | | ___ _ __ ___   __ _ ___
 | '_ \| '__/ _ \| '_ \| |/ _ \ '_ ` _ \ / _` / __|
 | |_) | | | (_) | |_) | |  __/ | | | | | (_| \__ \
 | .__/|_|  \___/|_.__/|_|\___|_| |_| |_|\__,_|___/
 | |
 |_|


  __
 /_ |
  | |
  | |
  | |
  |_|

*/

/* A */
SELECT tiendas.*, SUM(COALESCE(VNT_PRECIO,0)) AS VENTAS
FROM tiendas, ventas
WHERE TDA_NUM = VNT_TDA
GROUP BY TDA_NUM;

/* B */

SELECT clientes.*
FROM clientes, ventas
WHERE VNT_CLT = CLT_NUM
  AND CLT_POB LIKE 'Ma%'
  AND CLT_NOM NOT LIKE 'pablo'
  AND VNT_CANT >= 3
GROUP BY CLT_NUM
ORDER BY CLT_APELL, CLT_NOM;

/* C */

SELECT *, C.TIENDAS /C.CLIENTES AS RATIO
FROM (
    SELECT TDA_POB, COUNT(DISTINCT TDA_NUM) AS TIENDAS ,COUNT(CLT_NUM) AS CLIENTES
    FROM tiendas, clientes
    WHERE TDA_POB = CLT_POB
    GROUP BY TDA_NUM
    ) AS C;

/*
  ___
 |__ \
    ) |
   / /
  / /_
 |____|

  */


/* a) Prodructo Natural */
SELECT tiendas.*
FROM tiendas, articulos, ventas
WHERE TDA_NUM = VNT_TDA AND VNT_ART = ART_NUM AND ART_PRV = 5;

/* b) Anidada */
SELECT *
FROM tiendas
WHERE TDA_NUM IN(
    SELECT VNT_TDA
    FROM ventas
    WHERE VNT_ART IN(
        SELECT ART_NUM
        FROM articulos
        WHERE ART_PRV = 5
        )
    );

/* c) Correlacionada */
SELECT *
FROM tiendas AS t
WHERE TDA_NUM = (
    SELECT VNT_TDA
    FROM ventas AS v
    WHERE VNT_ART = (
        SELECT ART_NUM
        FROM articulos
        WHERE ART_PRV = 5
          AND ART_NUM = v.VNT_ART
        )
    AND VNT_TDA = t.TDA_NUM
);

/* d) Existencia */
SELECT *
FROM tiendas
WHERE EXISTS(
    SELECT VNT_TDA
    FROM ventas
    WHERE EXISTS(
        SELECT ART_NUM
        FROM articulos
        WHERE ART_PRV = 5
          AND ART_NUM = VNT_ART
          AND VNT_TDA = TDA_NUM
        )
);
