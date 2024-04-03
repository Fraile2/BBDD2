/*
	Pregunta 1: Fácil
	Muestra los DNI de los clientes que acaben con la letra 
	Q y el DNI de los viajeros cuyo DNI acaben por D.
*/

SELECT c.dni_cliente, v.dni_viajero, b.numero_asiento
FROM viajero v
JOIN billete b
ON v.billete=b.id_billete
JOIN compra c
ON b.id_billete=c.id_billete
WHERE v.dni_viajero LIKE '%D'
AND c.dni_cliente LIKE '%Q';

/* Pregunta 3 - Proyecto final tercer trimestre

	Pregunta 2: Dificil
	Muestra todas las marcas de los aviones
	que hayan salido a la vez cuya duracion 
	en vuelo haya sido mayor a la media y 
	agrupa los resultados por fecha y hora de vuelo.
*/

SELECT v.fecha_hora_vuelo, GROUP_CONCAT(distinct a.marca) AS marcas
FROM avion a
JOIN pilota p
ON a.matricula=p.avion
JOIN vuelo v
ON p.vuelo=v.id_vuelo
WHERE v.duracion>(
	SELECT AVG(duracion)
	FROM vuelo
)
GROUP BY fecha_hora_vuelo
HAVING marcas LIKE '%,%';

/*	Pregunta 2
	Pregunta 3: media 
	Muestra los nombres de los pilotos 
	que empiecen por 'M' cuya aerolinea
	sea 'Iberia'

*/
SELECT p1.nombre
FROM aerolinea a
JOIN piloto p1
ON a.id_aerolinea=p1.aerolinea
JOIN pilota p2
ON p1.id_piloto=p2.piloto
WHERE p1.aerolinea='Iberia'
AND TIMESTAMPDIFF(YEAR, p1.antiguedad, CURDATE());

