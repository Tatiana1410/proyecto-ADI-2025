# proyecto-ADI-2025
Archivos de la base de datos SQL Server y MongoDB
1. Estructura del proyecto
PROYECTO-ADI-2025/
│
├── Documentación/
│   ├── Documento del Avance.docx
│   ├── ER-Conceptual.pdf
│   ├── ER-Lógico.png
│   └── Tablas Proyecto.docx
│
├── MongoDB/
│   ├── consultas.txt
│   ├── indices.txt
│   ├── inserciones.txt
│   ├── OperacionesTransaccionalesNoSQL.txt
│   ├── ScriptComidaRapida.txt
│   └── UsuariosNoSQL.txt
│
├── SQLServer/
│   ├── ComidaRapida/
│   │   ├── datasets/
│   │   │   ├── Categorias.csv / .json
│   │   │   ├── Clientes.csv / .json
│   │   │   ├── DetallesPedidos.csv / .json
│   │   │   ├── Empleados.csv / .json
│   │   │   ├── LogEventos.csv / .json
│   │   │   ├── MetodosPago.csv / .json
│   │   │   ├── Pedidos.csv / .json
│   │   │   ├── Productos.csv / .json
│   │   │   ├── Roles.csv / .json
│   │   │   ├── Sucursales.csv / .json
│   │   │   └── Usuarios.csv / .json
│   │
│   ├── transacciones/
│   │   ├── transaccionPedidos.sql
│   │   └── transaccionProductos.sql
│   │
│   ├── BDComidaRapida.sql
│   ├── casosDePrueba_triggers_sp.sql
│   ├── consultasClave.sql
│   ├── csvComidaRapida.sql
│   ├── indices.sql
│   ├── insercionesComidaRapida.sql
│   ├── jsonComidaRapida.sql
│   ├── roles.sql
│   └── triggers_sp.sql
│
└── README.md


2. Orden de Ejecución del Proyecto
Este es el flujo recomendado para ejecutar todo el sistema de forma correcta.

2.1 Preparación del entorno
Requisitos:
SQL Server 2022 o superior
MongoDB 6.0 o superior
Visual Studio Code o SSMS
Git instalado (opcional, si se trabaja desde repositorio)

Carpetas principales:
/SQLServer → Contiene toda la base relacional, scripts y transacciones.
/MongoDB → Contiene operaciones, inserciones e índices NoSQL.
/Documentación → Material de referencia y diagramas.

2.2 Ejecución en SQL Server
1. Crear la base de datos y tablas DDL
BDComidaRapida.sql

2. Crear roles y usuarios
roles.sql

3. Poblar tablas SQL Server DML
-- Insertar datos de prueba
insercionesComidaRapida.sql
o cargar los datasets con
csvComidaRapida.sql o jsonComidaRapida.sql

4. Crear índices
indices.sql

5. Crear triggers y procedimientos almacenados
triggers_sqp.sql

6. Ejecutar casos de prueba para los triggers y sp
casosDePrueba_triggers_sp.sql

Verifica:
    Actualización automática del stock.
    Inserciones registradas en LogEventos.
    Transacciones con rollback al fallar una operación.

7. Probar Transacciones
transacciones/transaccionPedidos.sql
transacciones/transaccionProductos.sql

8. Ejecutar consultas clave en consultasClave.sql 

2.3 Ejecución en MongoDB
1. Crear la BD, colecciones y usuarios
ScriptComidaRapida.txt
UsuariosNoSQL.txt

2. Inserción de documentos
inserciones.txt

3. Crear indices y consultas NoSQL
indices.txt
consultas.txt

4. Probar transacciones
OperacionesTransaccionalesNoSQL.txt

Autores
1.	Helen Margarita Martínez Clímaco
2.	Cristina Nohemy Fuentes Santiago
3.	Tatiana Gabriela Portillo Velásquez
4.	Oscar Alexander Jiménez Hernández
5.	Daniel Andrés Rodríguez Sandoval
6.	David Samuel Aquino Blanco

