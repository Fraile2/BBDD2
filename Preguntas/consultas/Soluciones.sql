-- Nivel Fácil
SELECT CONCAT(nombre," ", apellidos) AS nombre_apellidos
FROM piloto
WHERE RIGHT(nombre, 1)=RIGHT(apellidos, 1);

-- Nivel Medio
SELECT AVG(duracion) AS duracion_media, YEAR(fecha_hora_vuelo) AS years
FROM vuelo
WHERE DATE_FORMAT(fecha_hora_vuelo, "%i")=30
GROUP BY years;

-- Nivel Alto
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