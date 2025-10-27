USE ComidaRapida;
GO

/* ÍNDICE 1️ - PEDIDOS POR CLIENTE
   Justificación: este índice acelera las consultas que muestran los pedidos de un cliente específico,
   por ejemplo al generar el historial de compras de un cliente frecuente. */
CREATE INDEX idx_pedidos_cliente
ON Pedidos (idCliente);
GO

/* ÍNDICE 2️ - PRODUCTOS POR ESTADO
   Justificación: mejora la velocidad al listar productos activos o inactivos sin tener que escanear toda la tabla. */
CREATE INDEX idx_productos_estado
ON Productos (estado);
GO

/* ÍNDICE 3️ - EMPLEADOS POR SUCURSAL Y ESTADO
   Justificación: permite filtrar más rápido a los empleados de una sucursal en particular y con cierto estado Activo/Inactivo. */
CREATE INDEX idx_empleados_sucursal_estado
ON Empleados (idSucursal, estado);
GO
