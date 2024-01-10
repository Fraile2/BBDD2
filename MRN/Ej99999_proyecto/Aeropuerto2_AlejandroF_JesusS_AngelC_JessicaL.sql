CREATE DATABASE aeropuerto;
USE aeropuerto;

CREATE TABLE persona(
    dni VARCHAR(9) CHECK(LENGTH(dni)>8),
    n_pasaporte VARCHAR(9) CHECK(LENGTH(n_pasaporte)>8),
    nombre VARCHAR(26) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    fecha_nacimiento DATE,
    UNIQUE(n_pasaporte),
    PRIMARY KEY(dni)
);

CREATE TABLE cliente(
    dni_cliente VARCHAR(9),
    PRIMARY KEY(dni_cliente),
    FOREIGN KEY(dni_cliente) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE avion(
    matricula VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(31) NOT NULL,
    modelo VARCHAR(63) NOT NULL
);

CREATE TABLE vuelo(
    id_vuelo INT AUTO_INCREMENT PRIMARY KEY,
    duracion DOUBLE NOT NULL,
    fecha_hora_vuelo DATETIME NOT NULL
);

CREATE TABLE billete(
    id_billete INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    numero_asiento VARCHAR(4) CHECK(LENGTH(numero_asiento) > 3),
    coste NUMERIC(7, 2) NOT NULL,
    tipo ENUM('ida', 'ida_vuelta') NOT NULL,
    PRIMARY KEY (id_billete)
);

CREATE TABLE viajero(
    dni_viajero VARCHAR(9),
    billete INT NOT NULL,
    vuelo INT NOT NULL,
    PRIMARY KEY(dni_viajero),
    FOREIGN KEY(dni_viajero) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(billete) REFERENCES billete(id_billete),
    FOREIGN KEY(vuelo) REFERENCES vuelo(id_vuelo)
);

CREATE TABLE compra(
    id_billete INT,
    dni_cliente VARCHAR(9) CHECK(LENGTH(dni_cliente) > 8),
    PRIMARY KEY (id_billete, dni_cliente),
    FOREIGN KEY (dni_cliente) REFERENCES cliente(dni_cliente),
    FOREIGN KEY (id_billete) REFERENCES billete(id_billete)
);

CREATE TABLE terminal(
    id_terminal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
);

CREATE TABLE puerta(
    id_puerta INT AUTO_INCREMENT,
    terminal INT NOT NULL,
    vuelo INT NOT NULL,
    PRIMARY KEY(id_puerta, terminal),
    FOREIGN KEY(terminal) REFERENCES terminal(id_terminal),
    FOREIGN KEY(vuelo) REFERENCES vuelo(id_vuelo)
);

CREATE TABLE aerolinea(
    id_aerolinea INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL
);

CREATE TABLE piloto(
    id_piloto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    num_galones NUMERIC(1) CHECK(LENGTH(num_galones) < 5) NOT NULL,
    antiguedad VARCHAR(20),
    nombre VARCHAR(60),
    apellidos VARCHAR(60),
    id_copiloto INT NOT NULL,
    aerolinea INT NOT NULL,
    FOREIGN KEY(id_copiloto) REFERENCES piloto(id_piloto) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(aerolinea) REFERENCES aerolinea(id_aerolinea) ON DELETE RESTRICT
);

CREATE TABLE pilota(
    vuelo INT NOT NULL,
    avion VARCHAR(10) NOT NULL,
    piloto INT NOT NULL,
    FOREIGN KEY(vuelo) REFERENCES vuelo(id_vuelo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(avion) REFERENCES avion(matricula) ON DELETE CASCADE,
    FOREIGN KEY(piloto) REFERENCES piloto(id_piloto) ON DELETE CASCADE
);
