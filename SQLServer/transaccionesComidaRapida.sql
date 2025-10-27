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
