#  Gestión de inventario para una tienda de Tecnología

## Descripción
Descripción del proyecto explicando su propósito y funcionalidad
La tienda TechZone es un negocio dedicado a la venta de productos tecnológicos, desde laptops y
teléfonos hasta accesorios y componentes electrónicos. Con el crecimiento del comercio digital y
la alta demanda de dispositivos electrónicos, la empresa ha notado la necesidad de mejorar la
gestión de su inventario y ventas.

La empresa necesita un sistema que registre todos los productos disponibles en la tienda,
clasificándolos por categoría y manteniendo un seguimiento de la cantidad en stock. Cada
producto tiene un proveedor asignado, por lo que también es fundamental llevar un registro de
los proveedores y los productos que suministran.

Cuando un cliente realiza una compra, el sistema debe registrar la venta y actualizar
automáticamente el inventario, asegurando que no se vendan productos que ya están agotados.
Además, la tienda quiere identificar qué productos se venden más, qué clientes compran con
mayor frecuencia y cuánto se ha generado en ventas en un período determinado.

## Modelo E-R
![modelo_er](https://github.com/user-attachments/assets/cfae198f-8a2f-4650-a610-e4578a3ff6e5)


## Descripción 

  - **db.sql**: Consta de la creación de todas las tablas,
   
      ``` sql
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
        	fecha_compra DATE NOT NULL,
        	FOREIGN KEY (id_cliente) REFERENCES clientes(id),
        	FOREIGN KEY (id_producto) REFERENCES productos(id)
        );
    ``` 
- ** insert.sql**: Cada tabla consta de 15 inserciones
  
  ``` sql 

      -- insertar datos de la Tabla de clientes
    
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Zully', 'Ortiz', 'zully@gmail.com', 322453100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Valerie', 'Lazo', 'valerie@gmail.com', 3321234564);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Valentina', 'Molina', 'valen@gmail.com', 3224531955);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Alejandra', 'Machuca', 'aleja@gmail.com', 3342467543);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Jean', 'Rodriguez', 'jean@gmail.com', 3223553100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Maria', 'Contreras', 'maria@gmail.com', 3454564300);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Luis', 'Bermon', 'luis@gmail.com', 1225453100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Yessica', 'Machuca', 'yessica@gmail.com', 2345354100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Luis', 'Henao', 'luorher@gmail.com', 45434100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Fernanda', 'Avendaño', 'fercha@gmail.com', 2356323100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Lucas', 'Molina', 'lucas@gmail.com', 4353256533);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Pedro', 'Martinez', 'pedro@gmail.com', 31245100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'William', 'Hernandez', 'william@gmail.com', 123453100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'Cristian', 'Mendoza', 'cristian@gmail.com', 3123433100);
      INSERT INTO clientes (nombre,apellido,email,telefono )VALUES (
      'David', 'Lopez', 'david@gmail.com', 31234553100);
      
      -- Insertar datos en la tabla proveedor
      
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Luisa', 'Ortiz', 'luisa@gmail.com', 322453100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Valerio', 'Lazo', 'valerio@gmail.com', 3321234564);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Valentino', 'Molino', 'valentino@gmail.com', 3224531955);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Alejandro', 'Machuca', 'alejandro@gmail.com', 3342467543);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Juan', 'Rodriguez', 'juan@gmail.com', 3223553100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Mario', 'Contreras', 'mario@gmail.com', 3454564300);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Luisito', 'Bermon', 'luisito@gmail.com', 1225453100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Carmen', 'Machuca', 'carmen@gmail.com', 2345354100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Alberto', 'Henao', 'alberto@gmail.com', 45434100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Fernando', 'Avendaño', 'fercho@gmail.com', 2356323100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Sebastian', 'Perez', 'sebastian@gmail.com', 4353256533);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Frida', 'Martinez', 'frida@gmail.com', 31245100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Ricardo', 'Hernandez', 'ricardo@gmail.com', 123453100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Cristiano', 'Mendoza', 'cristiano@gmail.com', 3123433100);
      INSERT INTO proveedores (nombre,apellido,email,telefono )VALUES (
      'Stiven', 'Lopez', 'stiven@gmail.com', 31234553100);
      
      -- Insertar datos en la tabla productos 
      
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto1', 'Telefono Movil Samsumg', 2000.00, 7, 1);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 1', 'Telefono Movil Iphone', 70000.00, 23, 2);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 2', 'Telefono Movil Readmi', 5000.00, 17, 4);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 3', 'Telefono Movil Xiamo', 6000.00,34, 5);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 4', 'Telefono Movil Poco', 1000.00, 57, 2);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 5', 'Telefono Movil Nokia', 400.00, 77, 8);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 6', 'Computador Portatil ASUS', 122000.00, 27, 9);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 7', 'Computador Portatil DELL', 452000.00, 97,12);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 8', 'Computador Portatil HP', 342000.00, 42, 14);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 9', 'Computador de mesa HP', 356000.00, 3, 11);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 10', 'Computador mesa ASUS', 2342000.00, 67, 13);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 11', 'Tablet Ipad', 2342000.00, 37, 8);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 12', 'Audifonos inalambricos', 32000.00, 28, 9);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 13', 'Audifonos de cables', 34.00, 47, 14);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 14', 'Teclado mecanico', 342000.00, 3, 15);
      INSERT INTO productos(nombre, categoria, precio , stock_disponible , id_proveedor ) VALUES(
      'Producto 15', 'Base de computador', 562000.00, 32, 15);
      
      -- Insertar datos en la tabla ventas
      
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Telefono Movil Samsumg', 1, 1, 1, '2025-04-11');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Telefono Movil Samsumg', 5,3, 1, '2025-05-20');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Telefono Movil Samsumg', 1, 3, 1, '2025-04-11');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Telefono Movil Iphone', 4, 4, 6, '2025-03-31');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Telefono Movil Iphone', 2, 5, 12, '2025-07-01');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Telefono Movil Iphone', 4, 7, 14, '2025-10-16');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Computador Portatil ASUS', 15, 6, 7, '2025-09-21');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Computador Portatil HP', 10, 7, 1, '2025-02-05');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Telefono Movil Xiamo', 8, 8, 4, '2025-06-28');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Tablet Ipad', 8, 9, 12, '2025-06-01');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Computador Portatil DELL', 6, 10, 8, '2025-07-27');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Audifonos de cables', 13, 11, 14, '2025-08-19');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Computador Portatil HP', 21, 12, 10, '2025-08-23');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Audifonos inalambricos', 1, 13, 12, '2025-04-19');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Telefono Movil Xiamo', 4, 14, 4, '2025-04-14');
      INSERT INTO ventas (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra) VALUES (
      'Audifonos de cables', 3, 15, 14, '2025-04-15');
      
  ``` 
- Queries: Consta de 6 consultas:
- 
  ``` sql
    -- 1. Listar los productos con stock menor a 5 unidades.

    SELECT * FROM productos WHERE stock_disponible <= 5; 
    
    -- 2. Calcular ventas totales de un mes específico.
    
    SELECT nombre_producto, SUM(cantidad) FROM ventas WHERE fecha_compra= '2025-04-11' GROUP BY 1;
    
    -- 3. Obtener el cliente con más compras realizadas
    
    SELECT c.nombre, v.nombre_producto, v.cantidad FROM ventas v
    INNER JOIN clientes c ON c.id = v.id 
    GROUP BY 1,2,3 ORDER BY cantidad DESC LIMIT 1;
    
    -- 4. Listar los 5 productos más vendidos.
    
    SELECT c.nombre, v.nombre_producto, v.cantidad FROM ventas v
    INNER JOIN clientes c ON c.id = v.id 
    GROUP BY 1,2,3 ORDER BY cantidad DESC LIMIT 5 ;
    
    -- 5. Consultar ventas realizadas en un rango de fechas de tres Días y un Mes.
    
    
    SELECT nombre_producto, SUM(cantidad) FROM ventas WHERE fecha_compra= '2025-05-20'  GROUP BY 1;
    
    -- 6.  Identificar clientes que no han comprado en los últimos 6 meses.
    
    SELECT c.nombre, v.nombre_producto, v.cantidad, v.fecha_compra FROM ventas v
     JOIN clientes c ON c.id = v.id  WHERE fecha_compra = '2025-05-20'
    GROUP BY 1,2,3, 4 ;

  ```

Para ejecutar cada consulta debes seleccionar la consulta que deseas y ejecutarla. 

  ## Creditos

  Elaborado por Zully Fernanda Ortiz Avendaño.

