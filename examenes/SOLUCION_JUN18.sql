USE JUN18;

/* Ejercicio 1 */
SELECT *
FROM profesores
WHERE pro_id IN (
    SELECT asi_profesor
    FROM asignaturas
    WHERE asi_id IN (
        SELECT mat_asignatura
        FROM matriculas
        WHERE mat_estudiante IN (
            SELECT est_id
            FROM estudiantes
            WHERE est_dni = '87998849H'
            )
        )
    );

SELECT profesores.*
FROM profesores
JOIN asignaturas a ON profesores.pro_id = a.asi_profesor
JOIN matriculas m ON a.asi_id = m.mat_asignatura
JOIN estudiantes e ON m.mat_estudiante = e.est_id
WHERE e.est_dni = '87998849H'
GROUP BY pro_id;

/* Ejercicio 2 */
SELECT estudiantes.*
FROM estudiantes
JOIN matriculas m ON estudiantes.est_id = m.mat_estudiante
JOIN asignaturas a on m.mat_asignatura = a.asi_id
WHERE m.mat_curso LIKE '201819' AND a.asi_nombre NOT LIKE 'Jimmy'
GROUP BY est_id
ORDER BY est_apellidos, est_nombre ,est_dni;

/* Ejercicio 3 */
SELECT a.asi_nombre, COUNT(mat_asignatura) AS MATRICULAS, MAX(mat_nota_acta) AS NOTA
FROM estudiantes
JOIN matriculas m on estudiantes.est_id = m.mat_estudiante
JOIN asignaturas a on m.mat_asignatura = a.asi_id
WHERE est_dni LIKE '99216210C'
GROUP BY asi_id
ORDER BY MATRICULAS DESC;

SELECT asi_nombre AS "NOMBRE",COUNT(mat_asignatura) AS "vecesMatriculado",MAX(mat_nota_acta) AS "NotaMaxima"
FROM matriculas,asignaturas
WHERE mat_asignatura = asi_id AND mat_estudiante IN( SELECT est_id
                                                     FROM estudiantes
                                                     WHERE est_dni LIKE '99216210C')
GROUP BY asi_nombre
ORDER BY vecesMatriculado DESC;


/* Ejercicio 4 */
SELECT pro_nombre, pro_apell, a.asi_titulacion
FROM asignaturas, profesores JOIN asignaturas a ON profesores.pro_id = a.asi_profesor
WHERE a.asi_titulacion LIKE 'GI%';


/* Ejercicio 5 */
SELECT est_provincia AS POBLACION ,COUNT(est_id) AS ESTUDIANTES, asi_titulacion AS TITULACION
FROM estudiantes, matriculas, asignaturas
WHERE est_id = mat_estudiante AND mat_asignatura = asi_id
GROUP BY est_provincia, asi_titulacion
HAVING ESTUDIANTES < 20;
