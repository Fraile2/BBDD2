-- Ej1 - Cuantos pilotos pilotan aviones de la marca boeing
-- Entre el año 2013 y 2015 y hayan pilotado un martes.


SELECT p1.nombre
FROM piloto p1
JOIN pilota p2
ON p1.id_piloto=p2.piloto;