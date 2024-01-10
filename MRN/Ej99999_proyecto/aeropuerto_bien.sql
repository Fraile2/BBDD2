CREATE DATABASE IF NOT EXISTS aeropuertodb_grupo;
USE aeropuertodb_grupo;

-- DROP
DROP TABLE IF EXISTS piloto_avion_vuelo;
DROP TABLE IF EXISTS vuelo;
DROP TABLE IF EXISTS cliente_billete;
DROP TABLE IF EXISTS aerolinea;
DROP TABLE IF EXISTS avion;
DROP TABLE IF EXISTS piloto;
DROP TABLE IF EXISTS billete;
DROP TABLE IF EXISTS puerta;
DROP TABLE IF EXISTS terminal;
DROP TABLE IF EXISTS viajero;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS persona;

-- CREATES
CREATE TABLE IF NOT EXISTS persona (
    dni VARCHAR(9) CHECK(LENGTH(dni) > 8),
    n_pasaporte VARCHAR(9) CHECK(LENGTH(n_pasaporte) > 8) NOT NULL,
    nombre VARCHAR(26) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    fecha_nacimiento DATE,

    UNIQUE(n_pasaporte),
    PRIMARY KEY (dni)
);

CREATE TABLE IF NOT EXISTS cliente (
    dni VARCHAR(9) CHECK(LENGTH(dni) > 8),

    PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES persona(dni) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS viajero (
    dni VARCHAR(9) CHECK(LENGTH(dni) > 8),

    PRIMARY KEY (dni),
    FOREIGN KEY (dni) REFERENCES cliente(dni) ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS terminal (
    id_terminal INT AUTO_INCREMENT,

    PRIMARY KEY (id_terminal)
);

CREATE TABLE IF NOT EXISTS puerta (
    id_puerta INT AUTO_INCREMENT,
    id_terminal INT,

    PRIMARY KEY (id_puerta),
    FOREIGN KEY (id_terminal) REFERENCES terminal(id_terminal)
);

CREATE TABLE IF NOT EXISTS billete (
    id_billete INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    numero_asientos VARCHAR(4) CHECK(LENGTH(numero_asientos) > 3),
    coste NUMERIC(7, 2) NOT NULL,
    tipo ENUM('ida', 'ida_vuelta') NOT NULL,
    dni_viajero VARCHAR(9) CHECK(LENGTH(dni_viajero) > 8),

    PRIMARY KEY (id_billete),
    FOREIGN KEY (dni_viajero) REFERENCES viajero(dni)
);

CREATE TABLE IF NOT EXISTS piloto (
    id_piloto INT AUTO_INCREMENT,
    nombre VARCHAR(26) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    antiguedad DATE NOT NULL,
    numero_galones NUMERIC(1) CHECK(LENGTH(numero_galones) < 5) NOT NULL,
    id_copiloto INT,

    PRIMARY KEY (id_piloto),
    FOREIGN KEY (id_copiloto) REFERENCES piloto(id_piloto)
);

CREATE TABLE IF NOT EXISTS avion (
    matricula VARCHAR(10),
    marca VARCHAR(31) NOT NULL,
    modelo VARCHAR(63) NOT NULL,

    PRIMARY KEY (matricula)
);

CREATE TABLE IF NOT EXISTS aerolinea (
    id_aerolinea INT AUTO_INCREMENT,
    nombre VARCHAR(31) NOT NULL,
    id_piloto INT NOT NULL,

    PRIMARY KEY (id_aerolinea),
    FOREIGN KEY (id_piloto) REFERENCES piloto(id_piloto)
);

CREATE TABLE IF NOT EXISTS cliente_billete (
    id_billete INT,
    dni_cliente VARCHAR(9) CHECK(LENGTH(dni_cliente) > 8),

    PRIMARY KEY (id_billete, dni_cliente),
    FOREIGN KEY (dni_cliente) REFERENCES cliente(dni),
    FOREIGN KEY (id_billete) REFERENCES billete(id_billete)
);

CREATE TABLE IF NOT EXISTS vuelo (
    id_vuelo INT AUTO_INCREMENT,
    duracion DOUBLE NOT NULL,
    fecha_hora_vuelo DATETIME NOT NULL,
    dni_viajero VARCHAR(9) CHECK(LENGTH(dni_viajero) > 8),
    id_terminal INT NOT NULL,
    id_puerta INT NOT NULL,

    PRIMARY KEY (id_vuelo),
    FOREIGN KEY (dni_viajero) REFERENCES viajero(dni),
);