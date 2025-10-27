CREATE DATABASE ComidaRapida
GO

USE ComidaRapida
GO

CREATE TABLE Roles(
idRol INT PRIMARY KEY IDENTITY(1,1),
nombreRol VARCHAR(50) NOT NULL,
descripcion VARCHAR (150)
)
GO

CREATE TABLE MetodosPago(
idMetodoPago INT PRIMARY KEY IDENTITY(1,1),
nombreMetodo VARCHAR(50) NOT NULL,
descripcionMetodo VARCHAR (150)
)
GO
CREATE TABLE Categorias(
idCategoria INT PRIMARY KEY IDENTITY(1,1),
nombreCategoria VARCHAR(50) NOT NULL,
descripcionCategoria VARCHAR (150),
estadoCategoria VARCHAR (20)
)
GO

CREATE TABLE Sucursales(
idSucursal INT PRIMARY KEY IDENTITY(1,1),
nombreSucursal VARCHAR(50) NOT NULL,
direccion VARCHAR (150) NOT NULL,
telefono VARCHAR(9),
estado VARCHAR (20) NOT NULL
)
GO

CREATE TABLE Clientes(
idCliente INT PRIMARY KEY IDENTITY(1,1),
nombreCliente VARCHAR(100) NOT NULL,
telefono VARCHAR (9),
emailCliente VARCHAR (100),
fechaRegistro DATE
)
GO

CREATE TABLE Empleados(
idEmpleado INT PRIMARY KEY IDENTITY(1,1),
nombreEmpleado VARCHAR(80) NOT NULL,
apellidoEmpleado VARCHAR(80) NOT NULL,
telefono VARCHAR (9),
fechaIngreso DATE NOT NULL,
cargo VARCHAR(50) NOT NULL,
estado VARCHAR (20) NOT NULL,
idSucursal INT,
FOREIGN KEY (idSucursal) REFERENCES Sucursales (idSucursal) ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE Usuarios(
idUser INT PRIMARY KEY IDENTITY(1,1),
nombreUser VARCHAR(50) NOT NULL,
emailUser VARCHAR (100) NOT NULL,
claveUser VARCHAR(200) NOT NULL,
estado VARCHAR(20) NOT NULL,
idEmpleado INT,
idRol INT,
FOREIGN KEY (idEmpleado) REFERENCES Empleados (idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idRol) REFERENCES Roles (idRol) ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE Productos(
idProducto INT PRIMARY KEY IDENTITY(1,1),
nombreProducto VARCHAR(50) NOT NULL,
descripcion VARCHAR (150) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
stock INT NOT NULL,
estado VARCHAR(20),
idCategoria INT,
FOREIGN KEY (idCategoria) REFERENCES Categorias (idCategoria) ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE Pedidos(
idPedido INT PRIMARY KEY IDENTITY(1,1),
codigoPedido VARCHAR(20) NOT NULL,
fechaPedido DATE NOT NULL,
horaPedido TIME NOT NULL,
totalPedido DECIMAL(10,2) NOT NULL,
estado VARCHAR(30),
observaciones VARCHAR(200),
idCliente INT,
idEmpleado INT,
idMetodoPago INT,
FOREIGN KEY (idCliente) REFERENCES Clientes (idCliente) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idEmpleado) REFERENCES Empleados (idEmpleado) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idMetodoPago) REFERENCES MetodosPago (idMetodoPago) ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE DetallesPedidos(
idDetalle INT PRIMARY KEY IDENTITY(1,1),
Cantidad INT NOT NULL,
precioUnitario DECIMAL (10,2) NOT NULL,
descuento DECIMAL (5,2) DEFAULT 0 NOT NULL,
subtotal AS (Cantidad * precioUnitario - descuento) PERSISTED,
idPedido INT,
idProducto INT,
FOREIGN KEY (idPedido) REFERENCES Pedidos (idPedido) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (idProducto) REFERENCES Productos (idProducto) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
--TABLA LOG PARA REGISTRAR CAMBIOS EN LA BASE DE DATOS, DE LA TABLA PEDIDOS Y PRODUCTOS
CREATE TABLE LogEventos (
    idLog INT IDENTITY(1,1) PRIMARY KEY,
    fechaLog DATETIME,
    usuario VARCHAR(50),
    tipoEvento VARCHAR(50),
    tablaAfectada VARCHAR(50),
    registroAfectado INT,
    descripcion VARCHAR(250)
);