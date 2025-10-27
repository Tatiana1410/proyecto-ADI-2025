USE ComidaRapida;
GO

--probar trigger para registrar eventos
--INSERT
INSERT INTO Pedidos (codigoPedido, fechaPedido, horaPedido, totalPedido, estado, observaciones, idCliente, idEmpleado, idMetodoPago)
VALUES ();

SELECT * FROM LogEventos WHERE tablaAfectada = 'Pedidos';

--UPDATE
UPDATE Pedidos
SET estado = 'Entregado'
WHERE codigoPedido = '';

SELECT * FROM LogEventos WHERE tipoEvento = 'UPDATE';

--DELETE
DELETE FROM Pedidos WHERE codigoPedido = '';
SELECT * FROM LogEventos WHERE tipoEvento = 'DELETE';


--probar trigger de actualizar stock al agregar un pedido
INSERT INTO DetallesPedidos (cantidad, precioUnitario, descuento, idPedido, idProducto)
VALUES (2, 5.00, 0, 1, 1);
SELECT idProducto, stock FROM Productos WHERE idProducto = 1;
SELECT * FROM LogEventos WHERE tablaAfectada = 'Productos';


--probar procedimiento de actualizar stock
EXEC sp_actualizarstock @idProducto = 1, @nuevaCantidad = 50;
SELECT * FROM Productos WHERE idProducto = 1;
SELECT * FROM LogEventos WHERE tablaAfectada = 'Productos';


--procedimiento para registrar pedido
CREATE TABLE #detalleTmp (
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10,2),
    descuento DECIMAL(5,2)
);

INSERT INTO #detalleTmp VALUES (1, 2, 5.50, 0);

EXEC sp_registrarPedido
    @codigoPedido = 'PED-PRUEBA-001',
    @idCliente = 1,
    @idEmpleado = 1,
    @idMetodoPago = 1,
    @totalPedido = 11.00,
    @estado = 'Pendiente',
    @observaciones = 'Pedido de prueba funcional';



--probar procemiento para cambiar el estado del pedido
EXEC sp_actualizarEstadoPedido @idPedido = 1, @nuevoEstado = 'Entregado';
SELECT estado FROM Pedidos WHERE idPedido = 1;
SELECT * FROM LogEventos WHERE tablaAfectada = 'pedidos';
