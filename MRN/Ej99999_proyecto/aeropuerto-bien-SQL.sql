create database aeropuerto;
use aeropuerto;

CREATE TABLE persona(  -- Alejandro Fraile
    dni VARCHAR(9) CHECK(LENGTH(dni)>8),
    n_pasaporte VARCHAR(9) CHECK(LENGTH(n_pasaporte)>8),
    nombre VARCHAR(26) NOT NULL,
    apellidos VARCHAR(60) NOT NULL,
    fecha_nacimiento DATE,

    UNIQUE(n_pasaporte),
    PRIMARY KEY(dni)
);
CREATE TABLE viajero(  -- Alejandro Fraile
    dni_viajero VARCHAR(9),

    PRIMARY KEY(dni_viajero),
    FOREIGN KEY(dni_viajero) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cliente(  -- Alejandro Fraile
    dni_cliente VARCHAR(9),

    PRIMARY KEY(dni_cliente),
    FOREIGN KEY(dni_cliente) REFERENCES persona(dni) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE avion( -- Jessica Lalaleo
    matricula VARCHAR(10) primary key,
    marca VARCHAR(31) NOT NULL,
    modelo VARCHAR(63) NOT NULL
);
CREATE TABLE vuelo( -- Jessica Lalaleo
    id_vuelo INT AUTO_INCREMENT primary key,
    duracion DOUBLE NOT NULL,
    fecha_hora_vuelo DATETIME NOT NULL
);
CREATE TABLE billete( -- Jesus Santana
    id_billete INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    numero_asientos VARCHAR(4) CHECK(LENGTH(numero_asientos) > 3),
    coste NUMERIC(7, 2) NOT NULL,
    tipo ENUM('ida', 'ida_vuelta') NOT NULL,
    PRIMARY KEY (id_billete)
);
CREATE TABLE compra( -- Jessica Lalaleo
    id_billete INT,
    dni_cliente VARCHAR(9) CHECK(LENGTH(dni_cliente) > 8),
    PRIMARY KEY (id_billete, dni_cliente),
    FOREIGN KEY (dni_cliente) REFERENCES cliente(dni_cliente),
    FOREIGN KEY (id_billete) REFERENCES billete(id_billete)
);

CREATE TABLE terminal( -- Jesus Santana
    id_terminal INT AUTO_INCREMENT primary key,
    nombre VARCHAR(25) NOT NULL
);
CREATE TABLE puerta( -- Jesus Santana
    id_puerta int auto_increment,
    terminal int NOT NULL,
    vuelo int NOT NULL,
    PRIMARY KEY(id_puerta, terminal),
    foreign key (vuelo) references terminal(id_terminal), 
    foreign key (terminal) references vuelo(id_vuelo)
);
create table aerolinea( -- Angel Almache
    id_aerolinea INT NOT NULL primary key,
    nombre varchar(60) NOT NULL
);
create table piloto( -- Angel Almache
    id_piloto INT NOT NULL AUTO_INCREMENT primary key,
    num_galones numeric(1) CHECK(LENGTH(num_galones) < 5) NOT NULL,
    antiguedad varchar(20),
    nombre varchar(60),
    apellidos varchar(60),
    id_copilto INT NOT NULL,
    aerolinea INT NOT NULL,
    foreign key(id_copilto) references piloto(id_piloto) on delete cascade on update cascade,
    foreign key(aerolinea) references aerolinea(id_aerolinea) ON DELETE RESTRICT
);
create table pilota( -- Angel Almache
    vuelo INT NOT NULL,
    avion varchar(10) NOT NULL,
    piloto INT NOT NULL AUTO_INCREMENT primary key,
    foreign key(vuelo) references vuelo(id_vuelo) on delete cascade on update cascade,
    foreign key(avion) references avion(matricula) on delete cascade,
    foreign key(piloto) references piloto(id_piloto) on delete cascade
);
