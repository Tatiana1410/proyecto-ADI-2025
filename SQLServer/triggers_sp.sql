USE ComidaRapida;
GO
-- TRIGGER PARA REGISTRAR LOGS EN LA TABLA PEDIDOS
CREATE TRIGGER trg_LogPedidos
ON Pedidos
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Operacion VARCHAR(50);
    DECLARE @IdAfectado INT;

    -- Detectar tipo de operación
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @Operacion = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @Operacion = 'INSERT';
    ELSE IF EXISTS (SELECT * FROM deleted)
        SET @Operacion = 'DELETE';

    -- Obtener el Id del registro afectado
    IF @Operacion = 'DELETE'
        SELECT @IdAfectado = idPedido FROM deleted;
    ELSE
        SELECT @IdAfectado = idPedido FROM inserted;

    -- Insertar en la tabla de log
    INSERT INTO LogEventos (fechaLog, usuario, tipoEvento, tablaAfectada, registroAfectado, descripcion)
    VALUES (
        GETDATE(),
        SUSER_SNAME(),--obtiene el usuario actual de SQL                    
        @Operacion,
        'Pedidos',
        @IdAfectado,
        CONCAT('Se realizó un ', @Operacion, ' en la tabla Pedidos')
    );
END;
GO

--TRIGGER PARA ACTUALIZAR STOCK DEL PRODUCTO CUANDO SE CREA UN PEDIDO 
--AGREGA LOG DEL CAMBIÓ REALIZADO EN LA TABLA PRODUCTOS
CREATE TRIGGER trg_ActualizarStock
ON DetallesPedidos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE p
    SET p.stock = p.stock - i.cantidad
    FROM Productos p
    INNER JOIN inserted i ON p.idProducto = i.idProducto;

    INSERT INTO LogEventos (fechaLog, usuario, tipoEvento, tablaAfectada, registroAfectado, descripcion)
    SELECT GETDATE(), SUSER_SNAME(), 'UPDATE', 'Productos', i.IdProducto,
           CONCAT('Stock reducido automáticamente en ', i.Cantidad, ' unidades.')
    FROM inserted i;
END;
GO


--PROCEDIMIENTO PARA ACTUALIZAR STOCK DE FORMA MANUAL
CREATE PROCEDURE sp_actualizarstock
    @idproducto INT,
    @cantidadAgregar INT  
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        DECLARE @stockActual INT;
        DECLARE @nuevoStock INT;

        -- VALIDAR QUE LA CANTIDAD NO SEA NEGATIVA
        IF @cantidadAgregar <= 0
        BEGIN
            RAISERROR('ERROR: la cantidad a agregar debe ser mayor que cero.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- VALIDAR QUE EL PRODUCTO EXISTA
        IF NOT EXISTS (SELECT 1 FROM Productos WHERE idProducto = @idproducto)
        BEGIN
            RAISERROR('ERROR: el producto especificado no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- OBTENER EL STOCK ACTUAL
        SELECT @stockActual = stock FROM Productos WHERE idProducto = @idproducto;

        -- CALCULAR NUEVO STOCK
        SET @nuevoStock = @stockActual + @cantidadAgregar;

        -- ACTUALIZAR EL STOCK
        UPDATE Productos
        SET stock = @nuevoStock
        WHERE idProducto = @idproducto;

        -- REGISTRAR EL CAMBIO EN LA TABLA LOG
        INSERT INTO LogEventos (fechaLog, usuario, tipoEvento, tablaAfectada, registroAfectado, descripcion)
        VALUES (
            GETDATE(),
            SUSER_SNAME(),
            'UPDATE',
            'Productos',
            @idproducto,
            CONCAT('Se agregaron ', @cantidadAgregar, ' unidades al stock. Total actualizado: ', @nuevoStock, ' unidades.')
        );

        COMMIT TRANSACTION;
        PRINT 'STOCK ACTUALIZADO CORRECTAMENTE.';

    END TRY
    BEGIN CATCH
        -- SI OCURRE UN ERROR, HACER ROLLBACK Y MOSTRAR MENSAJE
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'ERROR AL ACTUALIZAR STOCK.';
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO

--PROCEDIMIENTO PARA AGREGAR PEDIDO
CREATE PROCEDURE sp_registrarPedido
    @codigoPedido VARCHAR(20),
    @idCliente INT,
    @idEmpleado INT,
    @idMetodoPago INT,
    @totalPedido DECIMAL(10,2),
    @estado VARCHAR(30),
    @observaciones VARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @idpedido INT;

        -- INSERTAR ENCABEZADO DEL PEDIDO
        INSERT INTO Pedidos (codigoPedido, fechaPedido, horaPedido, totalPedido, estado, observaciones, idCliente, idEmpleado, idMetodoPago)
        VALUES (@codigopedido, GETDATE(), CONVERT(TIME, GETDATE()), @totalPedido, @estado, @observaciones, @idCliente, @idEmpleado, @idMetodoPago);

        SET @idpedido = SCOPE_IDENTITY();

        -- INSERTAR DETALLES DESDE TABLA TEMPORAL
        INSERT INTO detallespedidos (cantidad, precioUnitario, descuento, idPedido, idProducto)
        SELECT cantidad, precioUnitario, descuento, @idPedido, idProducto
        FROM #detalleTmp;

        COMMIT TRANSACTION;
        PRINT 'PEDIDO REGISTRADO CORRECTAMENTE.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'ERROR AL REGISTRAR EL PEDIDO: ' + ERROR_MESSAGE();
    END CATCH
END;
GO



-- PROCEDIMIENTO: ACTUALIZAR ESTADO DEL PEDIDO 
CREATE PROCEDURE sp_actualizarEstadoPedido
    @idPedido INT,
    @nuevoEstado VARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        -- VALIDAR QUE EL PEDIDO EXISTA
        IF NOT EXISTS (SELECT 1 FROM Pedidos WHERE idPedido = @idPedido)
        BEGIN
            RAISERROR('ERROR: el pedido especificado no existe.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- ACTUALIZAR EL ESTADO DEL PEDIDO
        UPDATE Pedidos
        SET estado = @nuevoEstado
        WHERE idPedido = @idPedido;

        COMMIT TRANSACTION;
        PRINT 'ESTADO DEL PEDIDO ACTUALIZADO CORRECTAMENTE.';
    END TRY
    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'ERROR AL ACTUALIZAR EL ESTADO DEL PEDIDO.';
        PRINT ERROR_MESSAGE();
    END CATCH
END;
GO
