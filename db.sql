
-- CREACION DE TABLAS

CREATE TABLE clientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	telefono BIGINT NOT NULL
);

CREATE TABLE proveedores(
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	apellido VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
	telefono BIGINT NOT NULL
);

CREATE TABLE productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	categoria VARCHAR(100) NOT NULL,
	precio NUMERIC(10,2) NOT NULL,
	stock_disponible BIGINT NOT NULL,
	id_proveedor INT,
	FOREIGN KEY (id_proveedor) REFERENCES proveedores(id)
);

CREATE TABLE ventas (
	id SERIAL PRIMARY KEY,
	nombre_producto VARCHAR(100) NOT NULL,
	cantidad BIGINT NOT NULL,
	id_cliente INT NOT NULL,
	id_producto INT NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id),
	FOREIGN KEY (id_producto) REFERENCES productos(id)
);