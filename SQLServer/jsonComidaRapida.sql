USE ComidaRapida;
GO

-- Roles
INSERT INTO dbo.Roles (nombreRol, descripcion)
SELECT  j.nombreRol, j.descripcion
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\Roles.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  nombreRol   nvarchar(50)  '$.nombreRol',
  descripcion nvarchar(150) '$.descripcion'
) AS j;

SELECT * FROM Roles;

-- Metodos Pago
INSERT INTO dbo.MetodosPago (nombreMetodo, descripcionMetodo)
SELECT  j.nombreMetodo, j.descripcionMetodo
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\MetodosPago.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  nombreMetodo   nvarchar(50)  '$.nombreMetodo',
  descripcionMetodo nvarchar(150) '$.descripcionMetodo'
) AS j;

SELECT * FROM MetodosPago;

-- Categorias
INSERT INTO dbo.Categorias (nombreCategoria, descripcionCategoria, estadoCategoria)
SELECT  j.nombreCategoria, j.descripcionCategoria, j.estadoCategoria
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\Categorias.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  nombreCategoria   nvarchar(50)  '$.nombreCategoria',
  descripcionCategoria nvarchar(150) '$.descripcionCategoria',
  estadoCategoria nvarchar (20) '$.estadoCategoria'
) AS j;

SELECT * FROM Categorias;

-- Sucursales
INSERT INTO dbo.Sucursales (nombreSucursal, direccion, telefono, estado)
SELECT  j.nombreSucursal, j.direccion, j.telefono, j.estado
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\Sucursal.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  nombreSucursal   nvarchar(50)  '$.nombreSucursal',
  direccion nvarchar(150) '$.direccion',
  telefono nvarchar (9) '$.telefono',
  estado nvarchar (20) '$.estado'
) AS j;

SELECT * FROM Sucursales;

-- Clientes
INSERT INTO dbo.Clientes (nombreCliente, telefono, emailCliente, fechaRegistro)
SELECT  j.nombreCliente, j.telefono, j.emailCliente, j.fechaRegistro
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\Clientes.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  nombreCliente   nvarchar(100)  '$.nombreCliente',
  telefono nvarchar(9) '$.telefono',
  emailCliente nvarchar (100) '$.emailCliente',
  fechaRegistro DATE '$.fechaRegistro'
) AS j;

SELECT * FROM Clientes;

-- Empleados
INSERT INTO dbo.Empleados (nombreEmpleado, apellidoEmpleado, telefono, fechaIngreso, cargo, estado, idSucursal)
SELECT  j.nombreEmpleado, j.apellidoEmpleado, j.telefono, j.fechaIngreso, j.cargo, j.estado, j.idSucursal
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\Empleados.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  nombreEmpleado   nvarchar(80)  '$.nombreEmpleado',
  apellidoEmpleado nvarchar(80) '$.apellidoEmpleado',
  telefono nvarchar (9) '$.telefono',
  fechaIngreso DATE '$.fechaIngreso',
  cargo nvarchar (50) '$.cargo',
  estado nvarchar (20) '$.estado',
  idSucursal int '$.idSucursal'
) AS j;

SELECT * FROM Empleados;

-- Usuarios
INSERT INTO dbo.Usuarios (nombreUser, emailUser, claveUser, estado, idEmpleado, idRol)
SELECT  j.nombreUser, j.emailUser, j.claveUser, j.estado, j.idEmpleado, j.idRol
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\Usuarios.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  nombreUser   nvarchar(50)  '$.nombreUser',
  emailUser nvarchar(100) '$.emailUser',
  claveUser nvarchar (200) '$.claveUser',
  estado nvarchar(20) '$.estado',
  idEmpleado int '$.idEmpleado',
  idRol int	'$.idRol'
) AS j;

SELECT * FROM Usuarios;

-- Productos
INSERT INTO dbo.Productos (nombreProducto, descripcion, precio, stock, estado, idCategoria)
SELECT  j.nombreProducto, j.descripcion, j.precio, j.stock, j.estado, j.idCategoria
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\Productos.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  nombreProducto   nvarchar(50)  '$.nombreProducto',
  descripcion nvarchar(150) '$.descripcion',
  precio decimal (10,2) '$.precio',
  stock int '$.stock',
  estado nvarchar (20) '$.estado',
  idCategoria int	'$.idCategoria'
) AS j;

SELECT * FROM Productos;

-- Pedidos
INSERT INTO dbo.Pedidos (codigoPedido, fechaPedido, horaPedido, totalPedido, estado, observaciones, idCliente, idEmpleado, idMetodoPago)
SELECT  j.codigoPedido, j.fechaPedido, j.horaPedido, j.totalPedido, j.estado, j.observaciones, j.idCliente, j.idEmpleado, j.idMetodoPago
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\Pedidos.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  codigoPedido   nvarchar(20)  '$.codigoPedido',
  fechaPedido date '$.fechaPedido',
  horaPedido time '$.horaPedido',
  totalPedido decimal(10,2) '$.totalPedido',
  estado nvarchar (30) '$.estado',
  observaciones nvarchar(200) '$.observaciones',
  idCliente int '$.idCliente',
  idEmpleado int '$.idEmpleado',
  idMetodoPago int '$.idMetodoPago'
) AS j;

SELECT * FROM Pedidos;

-- DetallesPedidos
INSERT INTO dbo.DetallesPedidos (Cantidad, precioUnitario, descuento, idPedido, idProducto)
SELECT  j.Cantidad, j.precioUnitario, j.descuento, j.idPedido, j.idProducto
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\DetallesPedidos.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  Cantidad   int  '$.Cantidad',
  precioUnitario decimal(10,2) '$.precioUnitario',
  descuento decimal (5,2) '$.descuento',
  idPedido int '$.idPedido',
  idProducto int '$.idProducto'
) AS j;

SELECT * FROM DetallesPedidos;

-- LogEventos
INSERT INTO dbo.LogEventos (fechaLog, usuario, tipoEvento, tablaAfectada, registroAfectado, descripcion)
SELECT  j.fechaLog, j.usuario, j.tipoEvento, j.tablaAfectada, j.registroAfectado, j.descripcion
FROM OPENROWSET(BULK 'C:\ComidaRapida\datasets\LogEventos.json', SINGLE_CLOB) AS src
CROSS APPLY OPENJSON(src.BulkColumn)
WITH (
  fechaLog   datetime  '$.fechaLog',
  usuario nvarchar(50) '$.usuario',
  tipoEvento nvarchar(50) '$.tipoEvento',
  tablaAfectada nvarchar(50) '$.tablaAfectada',
  registroAfectado int '$.registroAfectado',
  descripcion nvarchar (250) '$.descripcion'
) AS j;

SELECT * FROM LogEventos; 