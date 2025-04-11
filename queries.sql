-- CONSULTAS 

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


