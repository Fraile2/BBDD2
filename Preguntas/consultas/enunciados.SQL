-- CONSULTAS

-- C1 Where y order by

-- ¿Que personas tienen en su pasaporte de última letra M o su apellido empiece por A 
-- y que han nacido antes del 2000 ordenados por edad y nombre de mas a menos?
SELECT nombre, fecha_nacimiento
FROM persona
WHERE (RIGHT(n_pasaporte, 1) LIKE '%M' OR apellidos LIKE 'A%') AND YEAR(fecha_nacimiento)<2000
ORDER BY fecha_nacimiento, nombre DESC;

-- C2 funciones con Fechas
-- ¿Cuales son los billetes más caros comprados en cada dia de la semana?

SELECT DATE_FORMAT(fecha,"%W") AS dia_semana, MAX(coste) AS precio
FROM billete
GROUP BY DATE_FORMAT(fecha,"%W");

SELECT ;

-- C3 Funciones numericas:
-- 
