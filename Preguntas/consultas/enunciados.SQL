-- CONSULTAS

-- Cons A Where y order by

-- ¿Que personas tienen en su pasaporte de última letra M o su apellido empiece por A 
-- y que han nacido antes del 2000 ordenados por edad y nombre de mas a menos?
SELECT nombre, fecha_nacimiento
FROM persona
WHERE (RIGHT(n_pasaporte, 1) LIKE '%M' OR apellidos LIKE 'A%') AND YEAR(fecha_nacimiento)<2000
ORDER BY fecha_nacimiento, nombre DESC;

-- Consulta B funciones con Fechas
-- ¿Cuales son los billetes más caros comprados en cada dia de la semana?

SELECT DATE_FORMAT(fecha,"%W") AS dia_semana, MAX(coste) AS precio
FROM billete
GROUP BY DATE_FORMAT(fecha,"%W");

-- Consulta C Funciones numericas: Candidata Nivel Medio
-- Cual es la duracion media de los vuelos
-- categorizados por año y que hayan salido
-- a y media.

SELECT AVG(duracion) AS duracion_media, YEAR(fecha_hora_vuelo) AS years
FROM vuelo
WHERE DATE_FORMAT(fecha_hora_vuelo, "%i")=30
GROUP BY years;

-- C E Funciones texto: Candidata Nivel fácil
-- Cuales son los nombres de los pilotos que terminan 
-- por la misma letra que su apellido.
SELECT CONCAT(nombre," ", apellidos) AS nombre_apellidos
FROM piloto
WHERE RIGHT(nombre, 1)=RIGHT(apellidos, 1);

-- Consulta G: Nivel difícil
-- Muestra todas las personas que hayan pagado
-- menos de la mitad de la media y que empiecen 
-- por "j"

SELECT nombre
FROM persona
WHERE nombre LIKE "j%" AND dni IN (
    SELECT dni_viajero 
    FROM viajero
    WHERE billete IN (
        SELECT id_billete
        FROM billete
        WHERE coste<(
            SELECT AVG(coste)/2 AS mitad_media
            FROM billete
        )
    )
);

-- CONSULTA D

-- Agrupame por años la suma de las ventas de todos los billetes 
-- que sean del tipo ida_vuelta
-- que hayan costado menos de 1000

SELECT YEAR(fecha) AS annio, SUM(coste) AS total_coste
FROM billete
WHERE tipo='ida_vuelta'
GROUP BY YEAR(fecha)
HAVING total_coste<1000;

-- CONSULTA F
-- SELECCIONAME aquellas personas nacidas 
-- un miercoles
-- y muestra el nombre en mayusculas
SELECT UPPER(nombre) AS nombre
FROM persona
WHERE WEEKDAY(fecha_nacimiento)=2;