-- PROCEDIMIENTOS Y FUNCIONES

-- 1.Un procedimiento almacenado para registrar una venta
-- Validar que el cliente exista.
-- Verificar que el stock sea suficiente antes de procesar la venta.
-- Si no hay stock suficiente, Notificar por medio de un mensaje en consola usando RAISE.
-- Si hay stock, se realiza el registro de la venta.



CREATE OR REPLACE PROCEDURE registrar_venta(
  p_product_id INT,
  v_cantidad INT
)
LANGUAGE plpgsql
AS $$
DECLARE
  stock_actual INT;
  new_venta INT;
BEGIN
  
  SELECT precio , stock_disponible INTO stock_actual FROM ventas WHERE id = venta_id;
  IF stock_actual < v_cantidad THEN
    RAISE EXCEPTION 'Stock insuficiente';
  END IF;
  	-- 1. Registrar venta
		INSERT INTO venta (nombre_producto,cantidad,id_cliente ,id_producto ,fecha_compra)
		VALUES(nombre_producto1,cantidad2,id_cliente3 ,id_producto4 ,fecha_compra5)
		RETURNING id INTO new_venta;
		
END;
$$;
