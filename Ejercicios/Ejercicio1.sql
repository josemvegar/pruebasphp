/*
    Diseñar y crear la base de datos de un consecionario.
*/

CREATE DATABASE  IF NOT EXISTS consecionario; 
USE consecionario;

CREATE TABLE coches (
    id          int(10) auto_increment not null,
    modelo      varchar(100) not null,
    marca       varchar(50),
    precio      int(20) not null,
    stock       int(255) not null,
    CONSTRAINT  pk_coches PRIMARY KEY(id)
) ENGINE=InnoDB;

CREATE TABLE grupos (
    id          int(10) auto_increment not null,
    nombre      varchar(100) not null,
    ciudad      varchar(100),
    CONSTRAINT pk_grupos PRIMARY KEY(id)
) ENGINE=InnoDB;

CREATE TABLE vendedores (
    id          int(10) auto_increment not null,
    grupo_id    int(10) not null,
    jefe        int(10),
    nombre      varchar(100) not null,
    apellidos   varchar(150),
    cargo       varchar(50),
    fecha_alta  date,
    sueldo      float(20,2),
    comision    float(10,2),
    CONSTRAINT pk_vendedores PRIMARY KEY(id),
    CONSTRAINT fk_vendedor_grupo FOREIGN KEY(grupo_id) REFERENCES grupos(id),
    CONSTRAINT fk_vendedor_jefe FOREIGN KEY(jefe) REFERENCES vendedores(id)
) ENGINE=InnoDB;

CREATE TABLE clientes(
    id              int(10) auto_increment not null,
    vendedor_id     int(10),
    nombre          varchar(150) not null,
    ciudad          varchar(100) not null,
    gastado         float(50,2),
    fecha           date,
    CONSTRAINT pk_clientes PRIMARY KEY(id),
    CONSTRAINT fk_cliente_vendedor FOREIGN kEY(vendedor_id) REFERENCES vendedores(id)
) ENGINE=InnoDB;

CREATE TABLE encargos (
    id          int(10) auto_increment not null,
    cliente_id  int(10) not null,
    coche_id   int(10) not null,
    cantidad    int(100) not null,
    fecha       date,
    CONSTRAINT pk_encargos PRIMARY KEY(id),
    CONSTRAINT fk_encargo_cliente FOREIGN KEY(cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_encargo_coche FOREIGN KEY(coche_id) REFERENCES coches(id)
) ENGINE=InnoDB;

# RELLENAR LA BASE DE DATOS CON INFORMACIÓN #

#COCHES
INSERT INTO coches VALUES(NULL, "Clio", "Renault", 12000, 13);
INSERT INTO coches VALUES(NULL, "Explorer", "Ford", 50000, 10);
INSERT INTO coches VALUES(NULL, "4Runner", "Toyota", 45000, 2);
INSERT INTO coches VALUES(NULL, "Civic", "Honda", 20000, 8);
INSERT INTO coches VALUES(NULL, "C3", "Citroen", 20000, 15);

#GRUPOS
INSERT INTO grupos VALUES(NULL, "Vendedores A", "Nueva Esparta");
INSERT INTO grupos VALUES(NULL, "Vendedores B", "Sucre");
INSERT INTO grupos VALUES(NULL, "Vendedores C", "Caracas");
INSERT INTO grupos VALUES(NULL, "Vendedores D", "Maracaibo");

#VENDEDORES
INSERT INTO vendedores VALUES(NULL, 1, NULL, "José", "Vega", "Jefe de grupo A", CURDATE(), 30000, 4);
INSERT INTO vendedores VALUES(NULL, 2, NULL, "Gabriela", "Gonzales", "Jefe de grupo B", CURDATE(), 30000, 4);
INSERT INTO vendedores VALUES(NULL, 1, 1, "Luis", "Castillo", "Vendedor", CURDATE(), 20000, 2);
INSERT INTO vendedores VALUES(NULL, 2, 6, "Antonio", "Banderas", "Vendedor", CURDATE(), 20000, 2);
INSERT INTO vendedores VALUES(NULL, 1, 1, "Pedro", "López", "Vendedor", CURDATE(), 20000, 2);
#CLIENTES
INSERT INTO clientes VALUES(NULL, 1, "Cliente 1", "Nueva Esparta", 13000.00, CURDATE());

#ENCARGOS
INSERT INTO encargos VALUES(NULL, 1, 2, 2, CURDATE());


#PRUEBAS
SELECT cantidad, nombre FROM encargos, clientes WHERE encargos.cliente_id=clientes.id;
SELECT cantidad, nombre, modelo FROM encargos, clientes, coches WHERE encargos.cliente_id=clientes.id AND encargos.coche_id=coches.id;