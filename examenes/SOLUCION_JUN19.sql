/** CONSULTA 1 **/
SELECT ar.id, ar.title, ar.date
FROM articles ar, authors au
WHERE ar.Authors_id = au.id
  AND au.name = 'María'
  AND surname = 'Pérez Montes'
  AND EXISTS(
      SELECT Articles_id
      FROM revisions
      WHERE ar.id = Articles_id
      GROUP BY Articles_id
      HAVING COUNT(*) >= 2
      );

/** CONSULTA 2 **/
SELECT t.name, COUNT(*) Articulos, COUNT(DISTINCT au.id) Autor
FROM articles ar, authors au, topics t
WHERE ar.Topics_id = t.id
AND au.id = ar.Authors_id
GROUP BY t.name;

/** CONSULTA 3 **/
SELECT ar.title, ar.date, t.name, au.surname
FROM articles ar, topics t, authors au
WHERE ar.Topics_id = t.id AND au.id = ar.Authors_id AND t.name IN('Videogames', 'Smartphones','Gamers')
AND ar.id NOT IN (
    SELECT Articles_id
    FROM revisions
    WHERE ar.id = Articles_id
    GROUP BY Articles_id
    HAVING COUNT(*) > 1
);

/** CONSULTA 4 **/
SELECT au.surname, au.name, COUNT(*) Articulos
FROM articles ar, authors au, topics t, revisions re
WHERE ar.Topics_id = t.id
AND au.id = ar.Authors_id
AND re.Articles_id = ar.id
AND re.Authors_id != au.id
AND t.name = 'Videogames'
GROUP BY au.surname, au.name
HAVING COUNT(*) > 2
ORDER BY Articulos DESC;

/** CONSULTA 5 **/
SELECT au.*
FROM authors au, topics t, articles ar
WHERE au.id = ar.Authors_id
AND t.id = ar.Topics_id
AND t.name = 'Videogames'
AND (ar.text LIKE '%machismo%'
    OR ar.text LIKE '%sexismo%'
    OR ar.text LIKE '%violencia de género%'
    OR ar.title LIKE '%machismo%'
    OR ar.title LIKE '%sexismo%'
    OR ar.title LIKE '%violencia de género%'
    )
GROUP BY au.id
ORDER BY au.surname, au.name;

/** SOLUCION CON JOINS **/

SELECT a.*
FROM articles a JOIN authors a2 on a.Authors_id = a2.id
JOIN revisions r on a.id = r.Articles_id
WHERE a2.name = 'Maria'
AND a2.surname = 'Perez Montes'
GROUP BY a.id
HAVING COUNT(a.id) >=2;


SELECT t.name, COUNT(a.id) AS Articulos, COUNT(DISTINCT a2.id) AS Autores
FROM articles a JOIN authors a2 on a.Authors_id = a2.id
JOIN topics t on a.Topics_id = t.id
GROUP BY t.name;

SELECT a.title, a.date, t.name, a2.name
FROM articles a JOIN topics t on a.Topics_id = t.id
JOIN authors a2 on a.Authors_id = a2.id
LEFT JOIN revisions r on a.id = r.Articles_id
WHERE t.name IN ('Videogames', 'Smartphones', 'Gamers')
GROUP BY a.id
HAVING COUNT(r.Authors_id) < 1;


SELECT au.surname, au.name, COUNT(a.id) as Articulos
FROM authors au JOIN articles a on au.id = a.Authors_id
JOIN topics t on a.Topics_id = t.id
WHERE t.name = 'Videogames'
GROUP BY au.surname, au.name
HAVING Articulos >=3 ;

SELECT au.id, au.surname, au.name, au.email
FROM authors au JOIN articles a on au.id = a.Authors_id
JOIN topics t on a.Topics_id = t.id
WHERE t.name = 'Videogames'
AND (
            a.title LIKE '%machismo%'
         OR a.title LIKE '%sexismo%'
         OR a.title LIKE '%violencia de género%'
         OR a.text LIKE '%machismo%'
         OR a.text LIKE '%sexismo%'
         OR a.text LIKE '%violencia de género%')
GROUP BY au.id
ORDER BY au.surname, au.surname;
