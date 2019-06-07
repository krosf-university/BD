USE JUN17;

/* Ejercicio #1 */
SELECT med_dni AS DNI, med_nombre AS NOMBRE, med_apellidos AS APELLIDOS
FROM Medicos
UNION
SELECT enf_dni AS DNI, enf_nombre AS NOMBRE, enf_apellidos AS APELLIDOS
FROM Enfermeros;

/* Ejercicio #2 */
SELECT *
FROM Enfermeros
WHERE enf_id NOT IN (
    SELECT gua_enf_B
    FROM Guardias
)
  AND enf_id NOT IN (
    SELECT gua_enf_A
    FROM Guardias);

/* Ejercicio #3 */
select *
from Medicos
where med_nomina * 12 > 50000
order by med_nomina, med_apellidos;

/* Ejercicio #4 */
select *
from Enfermeros
where enf_id in (
    select asig_enfermero
    from Asignaciones
    where asig_habitacion in (
        select hab_id
        from Habitaciones
        where hab_area in (
            select area_id
            from Area
            where area_nombre like 'Idaho'
               or area_nombre like 'Connecticut')
        )
    );

/* Ejercicio #5 */
SELECT area_nombre AS AREA,
       (SELECT COUNT(hab_area)
        FROM Habitaciones
        WHERE area_id = hab_area
       ) AS HABITACIONES,

       (SELECT COUNT(med_area)
        FROM Medicos
        WHERE area_id = med_area
       ) AS MEDICOS,

       (SELECT COUNT(enf_id)
           FROM Enfermeros
           WHERE enf_id IN (
               SELECT asig_enfermero
               FROM Asignaciones
               WHERE asig_habitacion IN (
                   SELECT hab_id
                   FROM Habitaciones
                   WHERE hab_area = area_id)
               )
        ) AS ENFERMEROS
FROM Area
GROUP BY area_id;

SELECT COUNT(gua_med_A)*100 + COUNT(gua_enf_B) * 70 + COUNT(gua_enf_A) * 60 + COUNT(gua_enf_B) * 40 AS GASTO_GUARDIAS
FROM Guardias
WHERE gua_fecha LIKE '2016%';
