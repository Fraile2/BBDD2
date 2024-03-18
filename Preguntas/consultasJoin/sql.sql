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

SELECT p.nombre
FROM billete b
JOIN viajero v
ON b.id_billete=v.billete
JOIN persona p
ON v.dni_viajero=p.dni
WHERE b.coste<(
    SELECT AVG(coste)/2
    FROM billete
) AND p.nombre LIKE 'j%';

