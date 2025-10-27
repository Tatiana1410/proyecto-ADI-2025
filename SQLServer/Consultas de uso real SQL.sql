USE ComidaRapida;
GO

/* CONSULTA 1? - TOTAL DE VENTAS POR SUCURSAL */
SELECT 
    s.nombreSucursal AS Sucursal,
    SUM(p.totalPedido) AS Total_Ventas
FROM Pedidos p
INNER JOIN Empleados e ON p.idEmpleado = e.idEmpleado
INNER JOIN Sucursales s ON e.idSucursal = s.idSucursal
GROUP BY s.nombreSucursal
ORDER BY Total_Ventas DESC;
GO

/* CONSULTA 2?- PRODUCTO MÁS VENDIDO POR CANTIDAD TOTAL */
SELECT 
    pr.nombreProducto AS Producto,
    SUM(dp.Cantidad) AS Cantidad_Total_Vendida,
    SUM(dp.subtotal) AS Ingreso_Generado
FROM DetallesPedidos dp
INNER JOIN Productos pr ON dp.idProducto = pr.idProducto
GROUP BY pr.nombreProducto
ORDER BY Cantidad_Total_Vendida DESC;
GO

/* CONSULTA 3? - INGRESOS GENERADOS POR CADA EMPLEADO */
SELECT 
    e.nombreEmpleado + ' ' + e.apellidoEmpleado AS Empleado,
    s.nombreSucursal AS Sucursal,
    COUNT(p.idPedido) AS Total_Pedidos,
    SUM(p.totalPedido) AS Total_Ventas
FROM Pedidos p
INNER JOIN Empleados e ON p.idEmpleado = e.idEmpleado
INNER JOIN Sucursales s ON e.idSucursal = s.idSucursal
GROUP BY e.nombreEmpleado, e.apellidoEmpleado, s.nombreSucursal
ORDER BY Total_Ventas DESC;
GO

/* CONSULTA 4? - CLIENTES FRECUENTES DIGAMOS CON MAS DE 5 PEDIDOS */
SELECT 
    c.nombreCliente AS Cliente,
    COUNT(p.idPedido) AS Numero_Pedidos
FROM Clientes c
INNER JOIN Pedidos p ON c.idCliente = p.idCliente
GROUP BY c.nombreCliente
HAVING COUNT(p.idPedido) > 5
ORDER BY Numero_Pedidos DESC;
GO

/* CONSULTA 5? - PRODUCTOS SIN STOCK O INACTIVOS */
SELECT 
    nombreProducto,
    stock,
    estado
FROM Productos
WHERE stock <= 0 OR estado = 'Inactivo';
GO

/* CONSULTA 6? - PEDIDOS DE UNA FECHA ESPECÍFICA */
SELECT 
    p.codigoPedido,
    p.fechaPedido,
    c.nombreCliente,
    m.nombreMetodo AS Metodo_Pago,
    p.totalPedido,
    p.estado
FROM Pedidos p
INNER JOIN Clientes c ON p.idCliente = c.idCliente
INNER JOIN MetodosPago m ON p.idMetodoPago = m.idMetodoPago
WHERE p.fechaPedido = '2025-10-25';
GO
