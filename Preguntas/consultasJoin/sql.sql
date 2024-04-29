SELECT first_name, COUNT(last_name) AS n_apellidos
FROM employees
GROUP BY first_name;

CREATE INDEX indice_busqueda on employees(first_name, last_name) using BTREE;

CREATE VIEW prueba AS SELECT first_name, COUNT(last_name) AS n_apellidos
FROM employees
GROUP BY first_name;
