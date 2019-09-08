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
