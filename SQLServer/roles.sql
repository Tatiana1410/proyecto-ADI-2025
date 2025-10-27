USE ComidaRapida;
GO

--LOGIN ADMINISTRADOR
IF SUSER_ID('login_admin') IS NOT NULL
    DROP LOGIN login_admin;
GO

CREATE LOGIN login_admin WITH PASSWORD = 'Admin123*', CHECK_POLICY = ON;
GO

-- Si el usuario ya existe, eliminarlo
IF EXISTS(SELECT name FROM sys.database_principals WHERE name = 'adminapp')
    DROP USER adminapp;
GO

CREATE USER adminapp FOR LOGIN login_admin WITH DEFAULT_SCHEMA = dbo;
GO

IF NOT EXISTS(SELECT name FROM sys.database_principals WHERE name = 'ROL_ADMIN')
    CREATE ROLE ROL_ADMIN;
GO

ALTER ROLE ROL_ADMIN ADD MEMBER adminapp;
GO

-- Permisos del rol Admin
GRANT CONTROL ON DATABASE::ComidaRapida TO ROL_ADMIN;
GRANT CONNECT TO ROL_ADMIN;
GO

--LOGIN CAJERO
IF SUSER_ID('login_cajero') IS NOT NULL
    DROP LOGIN login_cajero;
GO

CREATE LOGIN login_cajero WITH PASSWORD = 'Cajero123*', CHECK_POLICY = ON;
GO

IF EXISTS(SELECT name FROM sys.database_principals WHERE name = 'cajeroapp')
    DROP USER cajeroapp;
GO

CREATE USER cajeroapp FOR LOGIN login_cajero WITH DEFAULT_SCHEMA = dbo;
GO

IF NOT EXISTS(SELECT name FROM sys.database_principals WHERE name = 'ROL_CAJERO')
    CREATE ROLE ROL_CAJERO;
GO

ALTER ROLE ROL_CAJERO ADD MEMBER cajeroapp;
GO

-- Permisos del rol Cajero
GRANT CONNECT TO ROL_CAJERO;
GRANT SELECT, INSERT, UPDATE ON dbo.Clientes TO ROL_CAJERO;
GRANT SELECT, INSERT, UPDATE ON dbo.Pedidos TO ROL_CAJERO;
GRANT SELECT, INSERT, UPDATE ON dbo.DetallesPedidos TO ROL_CAJERO;
GO

--LOGIN SOPORTE
IF SUSER_ID('login_soporte') IS NOT NULL
    DROP LOGIN login_soporte;
GO

CREATE LOGIN login_soporte WITH PASSWORD = 'Soporte123*', CHECK_POLICY = ON;
GO

IF EXISTS(SELECT name FROM sys.database_principals WHERE name = 'soporteapp')
    DROP USER soporteapp;
GO

CREATE USER soporteapp FOR LOGIN login_soporte WITH DEFAULT_SCHEMA = dbo;
GO

IF NOT EXISTS(SELECT name FROM sys.database_principals WHERE name = 'ROL_SOPORTE')
    CREATE ROLE ROL_SOPORTE;
GO

ALTER ROLE ROL_SOPORTE ADD MEMBER soporteapp;
GO

-- Permiso de conexión
GRANT CONNECT TO ROL_SOPORTE;
GO

-- Permisos del rol Soporte
GRANT SELECT, UPDATE ON dbo.Pedidos TO ROL_SOPORTE;  
GRANT SELECT, UPDATE ON dbo.DetallesPedidos TO ROL_SOPORTE;  
GO