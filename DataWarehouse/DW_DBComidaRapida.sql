CREATE DATABASE DW_BDComidaRapida;
GO
USE DW_BDComidaRapida;
GO

--Dimención cliente
CREATE TABLE dbo.dimClientes(
	cliente INT PRIMARY KEY,
	nombreCliente VARCHAR(100) NOT NULL,
	telefono VARCHAR(15),
	email VARCHAR(75),
);
GO

--Dimensión producto
CREATE TABLE dbo.dimProductos(
	producto INT PRIMARY KEY,
	nombreProducto VARCHAR(100) NOT NULL,
	precioUnitario DECIMAL(10,2),
	nombreCategoria VARCHAR(100)
);
GO

--Dimensión sucursal
CREATE TABLE dbo.dimSucursales(
	sucursal INT PRIMARY KEY,
	nombreSucursal VARCHAR(100) NOT NULL,
	direccion VARCHAR(150),
);
GO

--Dimensión método de pago
CREATE TABLE dbo.dimMetodosPago(
	metodoPago INT PRIMARY KEY,
	nombreMetodo VARCHAR(50) NOT NULL,
);
GO

--Dimensión tiempo optimizada
CREATE TABLE dbo.dimTiempo(
	tiempo INT PRIMARY KEY,            
	fechaCompleta DATE NOT NULL,
	dia TINYINT,                        
	mes TINYINT,                       
	nombreMes VARCHAR(20),
	trimestre TINYINT,                 
	anio SMALLINT,                     
	diaSemana VARCHAR(15)
);
GO

--Tabla de hechos
CREATE TABLE dbo.factHechosVentas(
	cliente INT FOREIGN KEY REFERENCES dbo.dimClientes(cliente),
	producto INT FOREIGN KEY REFERENCES dbo.dimProductos(producto),
	sucursal INT FOREIGN KEY REFERENCES dbo.dimSucursales(sucursal),
	metodoPago INT FOREIGN KEY REFERENCES dbo.dimMetodosPago(metodoPago),
	tiempo INT FOREIGN KEY REFERENCES dbo.dimTiempo(tiempo),
	cantidad DECIMAL(10,2),
	precioUnitario DECIMAL(10,2),
	descuento DECIMAL(10,2),
	subtotal DECIMAL(10,2),
	total DECIMAL(10,2),
	CONSTRAINT PK_factHechosVentas PRIMARY KEY(cliente,producto,tiempo,sucursal,metodoPago)
);
GO

