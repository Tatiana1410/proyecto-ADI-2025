USE ComidaRapida;
GO

-- Para insertar un nuevo producto y registrar un nuevo evento en LogEventos con COMMIT
BEGIN TRANSACTION;

BEGIN TRY
    INSERT INTO Productos (nombreProducto, descripcion, precio, stock, estado, idCategoria)
    VALUES ('Combo Hamburguesa', 'Incluye papas y bebida', 5.99, 50, 'Activo', 1);

    DECLARE @idProducto INT = SCOPE_IDENTITY();

    INSERT INTO LogEventos (fechaLog, usuario, tipoEvento, tablaAfectada, registroAfectado, descripcion)
    VALUES (GETDATE(), 'admin', 'INSERT', 'Productos', @idProducto, 'Se insertó un nuevo producto');

    COMMIT;
    PRINT 'Transacción confirmada.';
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

SELECT * FROM Productos;
SELECT * FROM LogEventos;


-- Transacción para actualizar el stock
BEGIN TRANSACTION;

BEGIN TRY
    UPDATE Productos
    SET stock = stock - 3
    WHERE idProducto = 1;

    INSERT INTO LogEventos (fechaLog, usuario, tipoEvento, tablaAfectada, registroAfectado, descripcion)
    VALUES (GETDATE(), 'Administrador', 'UPDATE', 'Productos', 1, 'Se descontó stock por venta');

    COMMIT;
    PRINT 'Stock actualizado correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

SELECT * FROM LogEventos;