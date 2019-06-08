USE SEP18;

/* Ejercico 1 */
SELECT nombre, dorsal, nomequipo
FROM Ciclista, Equipo
WHERE equipo = nomequipo
AND nomequipo LIKE '%e%'
ORDER BY nomequipo, nombre;

/* Ejercicio 2 */
SELECT nombre, equipo, COUNT(color) AS VECES
FROM Ciclista, Lleva, Maillot
WHERE dorsal = ciclista AND maillot = codigo AND color LIKE 'rojo'
GROUP BY nombre, equipo
ORDER BY VECES DESC;

/* Ejercicio 3 */
SELECT COUNT(*) ETAPAS, SUM(kms) DISTANCIA, COUNT(DISTINCT ganador) GANADORES
FROM Etapa;

/* Ejercicio 4 */
SELECT numetapa ETAPA, kms DISTNACIA, salida SALIDA, llegada LLEGADA, COUNT(categoria) "Puertos de Cat 1 y 2"
FROM Etapa, Puerto
WHERE numetapa = etapa AND  categoria IN ('benjamin','alevin')
GROUP BY numetapa;

/* Ejercicio 5 */
SELECT director, nomequipo, COUNT(ganador) AS VICTORIAS
FROM Equipo, Ciclista, Etapa
WHERE nomequipo = equipo AND dorsal = ganador AND (nombre NOT LIKE 'carl' OR nombre NOT LIKE 'chun')
GROUP BY director, nomequipo
HAVING VICTORIAS < 20
ORDER BY VICTORIAS, director;


/* Ejercicio 6 */
SELECT nombre, edad, equipo
FROM Ciclista, Etapa
WHERE dorsal = ganador AND edad = (SELECT MIN(edad) FROM Ciclista)
LIMIT 1;