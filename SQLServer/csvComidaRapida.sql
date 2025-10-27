USE ComidaRapida;
GO
SET DATEFORMAT ymd;

--Roles
CREATE TABLE dbo.RolesImport(
	idRol INT,
	nombreRol VARCHAR(50) NOT NULL,
	descripcion VARCHAR (150)
);

BULK INSERT dbo.RolesImport
FROM 'C:\ComidaRapida\datasets\Roles.csv'
WITH(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2,
	CODEPAGE = '65001',
	TABLOCK
);

SELECT * FROM dbo.RolesImport;

--Metodos de Pago
CREATE TABLE dbo.MetodosPagoImport(
	idMetodoPago INT,
	nombreMetodo VARCHAR(50) NOT NULL,
	descripcionMetodo VARCHAR (150)
);

BULK INSERT dbo.MetodosPagoImport
FROM 'C:\ComidaRapida\datasets\MetodosPagos.csv'
WITH(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2,
	CODEPAGE = '65001',
	TABLOCK
);

SELECT * FROM dbo.MetodosPagoImport;

-- Categorias

CREATE TABLE dbo.CategoriasStaging
(
    idCategoria VARCHAR(MAX),
    nombreCategoria VARCHAR(MAX),
    descripcionCategoria VARCHAR(MAX),
    estadoCategoria VARCHAR(MAX)
);

BULK INSERT dbo.CategoriasStaging
FROM 'C:\ComidaRapida\datasets\Categorias.csv'
WITH(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FIRSTROW = 2
);

SELECT * FROM dbo.CategoriasStaging;

-- Sucursales

CREATE TABLE dbo.SucursalesStaging 
(
	idSucursal VARCHAR(MAX),
	nombreSucursal VARCHAR(MAX),
	direccion VARCHAR(MAX),
	telefono VARCHAR(MAX),
	estado VARCHAR(MAX)
);

BULK INSERT dbo.SucursalesStaging
FROM 'C:\ComidaRapida\datasets\Sucursales.csv'
WITH(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FIRSTROW = 2
);

SELECT * FROM dbo.SucursalesStaging;

-- Clientes
CREATE TABLE dbo.ClientesStaging
(
	idCliente VARCHAR(MAX),
	nombreCliente VARCHAR(MAX),
	telefono VARCHAR(MAX),
	emailCliente VARCHAR(MAX),
	fechaRegistro VARCHAR(MAX),
);

BULK INSERT dbo.ClientesStaging
FROM 'C:\ComidaRapida\datasets\Clientes.csv'
WITH(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FIRSTROW = 2
);

SELECT * FROM dbo.ClientesStaging;

-- Empleados
CREATE TABLE dbo.EmpleadosStaging
(
	idEmpleado VARCHAR(MAX),
	nombreEmpleado VARCHAR(MAX),
	apellidoEmpleado VARCHAR(MAX),
	telefono VARCHAR(MAX),
	fechaIngreso VARCHAR(MAX),
	cargo VARCHAR(MAX),
	estado VARCHAR(MAX),
	idSucursal VARCHAR(MAX)
);

BULK INSERT dbo.EmpleadosStaging
FROM 'C:\ComidaRapida\datasets\Empleados.csv'
WITH(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FIRSTROW = 2
);

SELECT * FROM dbo.EmpleadosStaging;

-- Usuarios

CREATE TABLE dbo.UsuariosImport
(
	idUser INT,
	nombreUser VARCHAR(50) NOT NULL,
	emailUser VARCHAR (100) NOT NULL,
	claveUser VARCHAR(200) NOT NULL,
	estado VARCHAR(20) NOT NULL,
	idEmpleado INT,
	idRol INT,
);

BULK INSERT dbo.UsuariosImport
FROM 'C:\ComidaRapida\datasets\Usuarios.csv'
WITH(
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0A',
	FIRSTROW = 2,
	CODEPAGE = '65001',
	TABLOCK
);

SELECT * FROM dbo.UsuariosImport;

-- Productos 

CREATE TABLE dbo.ProductosStaging
(
	idProducto VARCHAR(MAX),
	nombreProducto VARCHAR(MAX),
	descripcion VARCHAR(MAX),
	precio VARCHAR(MAX),
	stock VARCHAR(MAX),
	estado VARCHAR(MAX),
	idCategoria VARCHAR(MAX)
);


BULK INSERT dbo.ProductosStaging
FROM 'C:\ComidaRapida\datasets\Productos.csv'
WITH(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FIRSTROW = 2
);

SELECT * FROM ProductosStaging;

-- Pedidos

CREATE TABLE dbo.PedidosImport
(
	codigoPedido VARCHAR(20) NOT NULL,
	fechaPedido DATE NOT NULL,
	horaPedido TIME NOT NULL,
	totalPedido DECIMAL(10,2) NOT NULL,
	estado VARCHAR(30),
	observaciones VARCHAR(200),
	idCliente INT,
	idEmpleado INT,
	idMetodoPago INT,
);

BULK INSERT dbo.PedidosImport
FROM 'C:\ComidaRapida\datasets\Pedidos.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);

SELECT * FROM PedidosImport;

-- Detalles de Pedido
CREATE TABLE dbo.DetallesPedidosImport
(
	Cantidad VARCHAR(MAX),
	precioUnitario VARCHAR(MAX),
	descuento VARCHAR(MAX),
	idPedido VARCHAR(MAX),
	idProducto VARCHAR(MAX),
);

BULK INSERT dbo.DetallesPedidosImport
FROM 'C:\ComidaRapida\datasets\DetallesPedidos.csv'
WITH (
	FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FIRSTROW = 2
);


SELECT * FROM DetallesPedidosImport;

-- LogEventos
CREATE TABLE dbo.LogEventosImport (
    fechaLog VARCHAR(MAX),
    usuario VARCHAR(MAX),
    tipoEvento VARCHAR(MAX),
    tablaAfectada VARCHAR(MAX),
    registroAfectado VARCHAR(MAX),
    descripcion VARCHAR(MAX)
);

BULK INSERT dbo.LogEventosImport
FROM 'C:\ComidaRapida\datasets\LogEventos.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0D0A',
    FIRSTROW = 2
);

SELECT * FROM LogEventosImport;