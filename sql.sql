-- SELECCIONA EL nombre de la especie cuyos 
-- cuidadores trabajen mas de 8 horas.


SELECT e.NombreCientifico, LEFT(e.Descripcion, 50)
FROM Especies e
JOIN Cuidadores c
ON e.NombreCientifico=c.NombreCientifico
WHERE TIMEDIFF(c.HorarioFinal,c.HorarioInicio)>8*3600
AND e.Numero_Animales>5;

SELECT v.Nombre, z.NombreZona
FROM Visitantes v
JOIN Visitan vi
ON v.DNIVisitante=vi.DNIVisitante
JOIN Zonas z
ON vi.NombreZona=z.NombreZona
WHERE v.Fecha_Nacimiento>'1980-01-01'
AND z.Extension>300;

SELECT ha.Nombre_Cientifico
FROM Habitat h
JOIN Habita ha
ON h.NombreHabitat=ha.NombreHabitat
WHERE h.NombreHabitat='Selva Tropical'
UNION
SELECT DISTINCT NombreHabitat
FROM Habitat
WHERE NombreHabitat='Selva Tropical';