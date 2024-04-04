/*
	Pregunta 1: Fácil
	"Muestra los DNIs terminados en 'Q' de los clientes que hayan comprado el billete, así como los DNIs terminados en 'D' de los viajeros respectivamente."

*/

SELECT c.dni_cliente, v.dni_viajero
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
	Pregunta 4: media 
	Muestra los nombres de los pilotos 
	que empiecen por 'M' cuya aerolinea 
	no sea 'Iberia', contenga una 'r'

*/
SELECT p1.nombre, p1.apellidos
FROM aerolinea a
JOIN piloto p1
ON a.id_aerolinea=p1.aerolinea
JOIN pilota p2
ON p1.id_piloto=p2.piloto
WHERE a.nombre<>'Iberia'
AND a.nombre LIKE '%r%'
AND TIMESTAMPDIFF(YEAR, p1.antiguedad, CURDATE())>8;

/* Pregunta 4

*/

SELECT a.marca, count(a.modelo) As n_modelos
FROM avion a
JOIN pilota p
ON a.matricula=p.avion
JOIN vuelo v
ON p.vuelo=v.id_vuelo
JOIN puerta p2
ON v.id_vuelo=p2.vuelo
WHERE HOUR(fecha_hora_vuelo)=8
GROUP BY a.marca;

/** Pregunta 5 Facil
	Cuantos tipos de billetes hay
	sin usar limit
*/
SELECT tipo AS NombreBilletes
FROM billete
UNION
SELECT tipo 
FROM billete;

