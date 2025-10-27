--CASOS EXITO O ROLLBACK

--Para comprobar los casos debe modificar los siguientes valores:
use ComidaRapida;
go

DECLARE @ProductoID INT = 12;      --ID del producti
DECLARE @CantidadSolicitada INT = 5; --Cantidad del pedido
DECLARE @PrecioUnitario DECIMAL(10, 2) = 4.50; --Este es opcional pero seria correcto cambiarlo al mismo precio delproducto

DECLARE @NuevoPedidoID INT;
DECLARE @StockDisponible INT;
DECLARE @TotalPedido DECIMAL(10, 2) = @CantidadSolicitada * @PrecioUnitario;
DECLARE @CodigoPedido VARCHAR(50) = 'P-' + FORMAT(GETDATE(), 'yyyyMMdd-') + '999'; --999 para saber que datos de prueba
BEGIN TRANSACTION;
SELECT @StockDisponible = Stock FROM dbo.Productos WHERE IdProducto = @ProductoID;

--Validación para utilizar uno de los casos, ya sea EXITO O ROLLBACK
IF (@StockDisponible >= @CantidadSolicitada) 
BEGIN
    --Insertar el nuevo pedido en Pedidos
    INSERT INTO dbo.Pedidos (codigoPedido, fechaPedido, horaPedido, totalPedido, estado, observaciones, idCliente, idEmpleado, idMetodoPago)
    VALUES (@CodigoPedido, CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME), @TotalPedido, 'Confirmado', NULL, 1, 2, 1);

    SET @NuevoPedidoID = SCOPE_IDENTITY(); 

    --Insertar el detalle del pedido en DetallesPedidos
    INSERT INTO dbo.DetallesPedidos (idPedido, idProducto, Cantidad, precioUnitario, descuento)
    VALUES (@NuevoPedidoID, @ProductoID, @CantidadSolicitada, @PrecioUnitario, 0.00);


    --CASO DE EXITO: Confirmar todos los cambios
    COMMIT TRANSACTION;
    SELECT 'EXITO: Pedido ID: ' + CAST(@NuevoPedidoID AS VARCHAR) + ' Creado. Stock actualizado de ' + CAST(@StockDisponible AS VARCHAR) + ' a ' + CAST(@StockDisponible - @CantidadSolicitada AS VARCHAR) + '.';
    
END
ELSE 
BEGIN
    --CASO DE ROLLBACK: Cancela los cambios
    ROLLBACK TRANSACTION;
    SELECT 'ERROR: Stock insuficiente para Id ' + CAST(@ProductoID AS VARCHAR) + '. Solicitado: ' + CAST(@CantidadSolicitada AS VARCHAR) + ', Disponible: ' + CAST(@StockDisponible AS VARCHAR) + '.';
END
