USE ComidaRapida;
GO

--probar trigger para registrar eventos
--INSERT
INSERT INTO Pedidos (codigoPedido, fechaPedido, horaPedido, totalPedido, estado, observaciones, idCliente, idEmpleado, idMetodoPago)
VALUES ('P-20251027-002','2025-10-27','10:30:00',6.40,'Entregado','DESCUENTO BEBIDA',27,28,3);

SELECT * FROM LogEventos WHERE tablaAfectada = 'Pedidos';

--UPDATE
UPDATE Pedidos
SET estado = 'Entregado'
WHERE codigoPedido = 'P-20251027-002';

SELECT * FROM LogEventos WHERE tipoEvento = 'UPDATE';

--DELETE
DELETE FROM Pedidos WHERE codigoPedido = 'P-20251027-002';
SELECT * FROM LogEventos WHERE tipoEvento = 'DELETE';


--probar trigger de actualizar stock al agregar un pedido
INSERT INTO DetallesPedidos (cantidad, precioUnitario, descuento, idPedido, idProducto)
VALUES (2, 5.00, 0, 1, 1);

SELECT idProducto, stock FROM Productos WHERE idProducto = 1;
SELECT * FROM LogEventos WHERE tablaAfectada = 'Productos';


--probar procedimiento de actualizar stock
EXEC sp_actualizarstock @idProducto = 1, @cantidadAgregar =10;
SELECT * FROM Productos WHERE idProducto = 1;
SELECT * FROM LogEventos WHERE tablaAfectada = 'Productos';
GO

--procedimiento para registrar pedido
CREATE TABLE #detalleTmp (
    idProducto INT,
    cantidad INT,
    precioUnitario DECIMAL(10,2),
    descuento DECIMAL(5,2)
);

INSERT INTO #detalleTmp VALUES (1, 2, 5.50, 0);

EXEC sp_registrarPedido
    @codigoPedido = 'P-20251027-001',
    @idCliente = 1,
    @idEmpleado = 1,
    @idMetodoPago = 1,
    @totalPedido = 11.00,
    @estado = 'Pendiente',
    @observaciones = 'Pedido de prueba funcional';
GO


--probar procemiento para cambiar el estado del pedido
EXEC sp_actualizarEstadoPedido @idPedido = 1, @nuevoEstado = 'Entregado';
SELECT estado FROM Pedidos WHERE idPedido = 1;
SELECT * FROM LogEventos WHERE tablaAfectada = 'pedidos';
