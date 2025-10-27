USE ComidaRapida;
GO
SET DATEFORMAT ymd;

-- Roles

INSERT INTO dbo.Roles (nombreRol, descripcion) VALUES
('Administrador','Acceso total al sistema'),
('Cajero','Registra pedidos y cobros'),
('Cocinero','Visualiza y actualiza estado de pedidos');
GO

-- Metodos de pago

INSERT INTO dbo.MetodosPago (nombreMetodo, descripcionMetodo) VALUES
('Efectivo','Pago en efectivo'),
('Tarjeta','Crédito o débito'),
('Transferencia','Transferencia bancaria');

-- Categorias

INSERT INTO dbo.Categorias (nombreCategoria, descripcionCategoria, estadoCategoria) VALUES
('Hamburguesas','Productos a base de carne','Activo'),
('Bebidas','Refrescos y agua','Activo'),
('Postres','Helados y pasteles','Activo'),
('Pizzas','Productos horneados con base de masa y toppings variados','Activo'),
('Tacos','Preparaciones con tortilla rellena de carne, vegetales o queso','Activo'),
('Ensaladas','Opciones frescas con vegetales, proteínas y aderezos','Activo'),
('Snacks','Alimentos ligeros como papas fritas, nuggets o aros de cebolla','Activo'),
('Wraps','Rollos de tortilla rellenos de ingredientes variados','Activo'),
('Pollo','Preparaciones a base de pollo frito, asado o empanizado','Activo'),
('Hot Dogs','Pan con salchicha y acompañamientos','Activo'),
('Combos','Paquetes que agrupan varios productos con descuento','Activo'),
('Vegetariano','Opciones sin carne, con base vegetal o sustitutos','Activo'),
('Infantil','Menús diseñados para niños, con porciones y sabores adaptados','Activo'),
('Salsas','Complementos líquidos para acompañar platos principales','Activo'),
('Extras','Adiciones como queso, tocino, huevo o jalapeños','Activo');
GO

-- Sucursales

INSERT INTO dbo.Sucursales (nombreSucursal, direccion, telefono, estado) VALUES
('Sucursal Centro','Av. Principal #123','22223333','Activo'),
('Sucursal MetroCentro','Blvd. Comercial #456','22224444','Activo'),
('Sucursal Pasatiempo','Carretera Panamericana, Lourdes','22325444','Activo'),
('Sucursal Multiplaza', 'Carretera Panamericana, Antiguo Cuscatlán', '25079800', 'Activo'),
('Sucursal El Platillo', 'Blv. Merliot y Calle el Pedregal #1', '25238490', 'Activo');
GO

-- Clientes

INSERT INTO dbo.Clientes (nombreCliente, telefono, emailCliente, fechaRegistro) VALUES
('Juan Pérez','77778888','juan.perez@gmail.com','2025-10-01'),
('Ana López','77779999','ana.lopez@gmail.com','2025-10-01'),
('Carlos Díaz','76667777','carlos.diaz@gmail.com','2025-10-02'),
('María Gómez','75556666','maria.gomez@gmail.com','2025-10-03'),
('Luis Torres','74445555','luis.torres@gmail.com','2025-10-01'),
('Sofía Ramírez','73334444','sofia.ramirez@gmail.com','2025-10-01'),
('Pedro Castillo','72223333','pedro.castillo@gmail.com','2025-10-01'),
('Laura Méndez','71112222','laura.mendez@gmail.com','2025-10-01'),
('Diego Herrera','70001111','diego.herrera@gmail.com','2025-10-01'),
('Valentina Cruz','79998888','valentina.cruz@gmail.com','2025-10-02'),
('Jorge Molina','78887777','jorge.molina@gmail.com','2025-10-02'),
('Camila Rivas','77776666','camila.rivas@gmail.com','2025-10-02'),
('Andrés Salazar','76665555','andres.salazar@gmail.com','2025-10-02'),
('Isabella Pineda','75554444','isabella.pineda@gmail.com','2025-10-02'),
('Ricardo Chávez','74443333','ricardo.chavez@gmail.com','2025-10-03'),
('Daniela Flores','73332222','daniela.flores@gmail.com','2025-10-03'),
('Manuel Ortiz','72221111','manuel.ortiz@gmail.com','2025-10-03'),
('Fernanda Reyes','71110000','fernanda.reyes@gmail.com','2025-10-03'),
('Alejandro Navarro','70009999','alejandro.navarro@gmail.com','2025-10-03'),
('Lucía Campos','79997777','lucia.campos@gmail.com','2025-10-04'),
('Sebastián Vega','78886666','sebastian.vega@gmail.com','2025-10-04');
GO

INSERT INTO dbo.Clientes (nombreCliente, telefono, emailCliente, fechaRegistro) VALUES
('Paula Fuentes','77775555','paula.fuentes@gmail.com','2025-10-04'),
('Tomás Aguirre','76664444','tomas.aguirre@gmail.com','2025-10-04'),
('Gabriela Peña','75553333','gabriela.pena@gmail.com','2025-10-04'),
('Héctor Morales','74442222','hector.morales@gmail.com','2025-10-05'),
('Renata Silva','73331111','renata.silva@gmail.com','2025-10-05'),
('Martín Estrada','72220000','martin.estrada@gmail.com','2025-10-05'),
('Carolina Varela','71119999','carolina.varela@gmail.com','2025-10-05'),
('Francisco Rojas','70008888','francisco.rojas@gmail.com','2025-10-05'),
('Natalia Cordero','79996666','natalia.cordero@gmail.com','2025-10-06'),
('Iván Méndez','78885555','ivan.mendez@gmail.com','2025-10-06'),
('Mónica Herrera','77774444','monica.herrera@gmail.com','2025-10-06'),
('Esteban Ponce','76663333','esteban.ponce@gmail.com','2025-10-06'),
('Claudia Zamora','75552222','claudia.zamora@gmail.com','2025-10-06'),
('Oscar Delgado','74441111','oscar.delgado@gmail.com','2025-10-07'),
('Patricia León','73330000','patricia.leon@gmail.com','2025-10-07'),
('Rodrigo Palma','72229999','rodrigo.palma@gmail.com','2025-10-07'),
('Marina Duarte','71118888','marina.duarte@gmail.com','2025-10-07'),
('Gustavo Arévalo','70007777','gustavo.arevalo@gmail.com','2025-10-07'),
('Cecilia Bravo','79995555','cecilia.bravo@gmail.com','2025-10-08'),
('Felipe Carrillo','78884444','felipe.carrillo@gmail.com','2025-10-08'),
('Lorena Ayala','77773333','lorena.ayala@gmail.com','2025-10-08');
GO

INSERT INTO dbo.Clientes (nombreCliente, telefono, emailCliente, fechaRegistro) VALUES
('Pablo Méndez','76662222','pablo.mendez@gmail.com','2025-10-08'),
('Andrea Molina','75551111','andrea.molina@gmail.com','2025-10-08'),
('Enrique Ramos','74440000','enrique.ramos@gmail.com','2025-10-09'),
('Melanie Torres','73339999','melanie.torres@gmail.com','2025-10-09'),
('Álvaro Cruz','72238888','alvaro.cruz@gmail.com','2025-10-09'),
('Bianca Romero','71137777','bianca.romero@gmail.com','2025-10-09'),
('Julián Salinas','70036666','julian.salinas@gmail.com','2025-10-09'),
('Diana Castillo','79934444','diana.castillo@gmail.com','2025-10-10'),
('Mauricio Peña','78832222','mauricio.pena@gmail.com','2025-10-10'),
('Rocío Vargas','77731111','rocio.vargas@gmail.com','2025-10-10'),
('Cristian López','76630000','cristian.lopez@gmail.com','2025-10-10'),
('Verónica Sánchez','75529999','veronica.sanchez@gmail.com','2025-10-10'),
('Emilio Navarro','74428888','emilio.navarro@gmail.com','2025-10-01'),
('Tamara Rivas','73327777','tamara.rivas@gmail.com','2025-10-01'),
('Benjamín Reyes','72226666','benjamin.reyes@gmail.com','2025-10-01'),
('Alicia Paredes','71125555','alicia.paredes@gmail.com','2025-10-01'),
('Raúl Castañeda','70024444','raul.castaneda@gmail.com','2025-10-01'),
('Noelia Guzmán','79923333','noelia.guzman@gmail.com','2025-10-02'),
('Armando Rivera','78822222','armando.rivera@gmail.com','2025-10-02'),
('Marisol Herrera','77721111','marisol.herrera@gmail.com','2025-10-02'),
('Joaquín Duarte','76620000','joaquin.duarte@gmail.com','2025-10-02');
GO

INSERT INTO dbo.Clientes (nombreCliente, telefono, emailCliente, fechaRegistro) VALUES
('Elsa Romero','75519999','elsa.romero@gmail.com','2025-10-02'),
('Bruno Salazar','74418888','bruno.salazar@gmail.com','2025-10-03'),
('Vanessa Campos','73317777','vanessa.campos@gmail.com','2025-10-03'),
('Matías Rivas','72216666','matias.rivas@gmail.com','2025-10-03'),
('Clara Molina','71115555','clara.molina@gmail.com','2025-10-03'),
('Leonardo Chávez','70014444','leonardo.chavez@gmail.com','2025-10-03'),
('Rebeca Méndez','79913333','rebeca.mendez@gmail.com','2025-10-04'),
('Samuel Torres','78812222','samuel.torres@gmail.com','2025-10-04'),
('Fátima Varela','77711111','fatima.varela@gmail.com','2025-10-04'),
('Ignacio Bravo','76610000','ignacio.bravo@gmail.com','2025-10-04'),
('Teresa Palma','75509999','teresa.palma@gmail.com','2025-10-04'),
('Ángel Duarte','74408888','angel.duarte@gmail.com','2025-10-05'),
('Claudia Rojas','73307777','claudia.rojas@gmail.com','2025-10-05'),
('Javier León','72206666','javier.leon@gmail.com','2025-10-05'),
('María Carrillo','71105555','maria.carrillo@gmail.com','2025-10-05'),
('Estefanía Ayala','70004444','estefania.ayala@gmail.com','2025-10-05'),
('Luis Romero','79903333','luis.romero@gmail.com','2025-10-06'),
('Daniela Salinas','78802222','daniela.salinas@gmail.com','2025-10-06'),
('Carlos Vargas','77701111','carlos.vargas@gmail.com','2025-10-06'),
('Lucía Castillo','76600000','lucia.castillo@gmail.com','2025-10-06'),
('Miguel Sánchez','75599999','miguel.sanchez@gmail.com','2025-10-06');
GO

INSERT INTO dbo.Clientes (nombreCliente, telefono, emailCliente, fechaRegistro) VALUES
('Jazmín Ortega','74412345','jazmin.ortega@example.com','2025-09-15'),
('Mauricio Cañas','73354321','mauricio.canas@example.com','2025-09-18'),
('Claudia Figueroa','72267890','claudia.figueroa@example.com','2025-09-20'),
('Roberto Mejía','71198765','roberto.mejia@example.com','2025-09-22'),
('Patricia Aguilar','70011223','patricia.aguilar@example.com','2025-09-25'),
('Esteban Cruz','79933445','esteban.cruz@example.com','2025-09-28'),
('Marcela Rivas','78855667','marcela.rivas@example.com','2025-10-12'),
('Fernando López','77777889','fernando.lopez@example.com','2025-10-15'),
('Alejandra Molina','76666778','alejandra.molina@example.com','2025-10-18'),
('Julián Torres','75555689','julian.torres@example.com','2025-10-20'),
('Verónica Chávez','74444590','veronica.chavez@example.com','2025-10-22'),
('Carlos Ramírez','73333401','carlos.ramirez@example.com','2025-10-25'),
('Lucía Herrera','72222312','lucia.herrera@example.com','2025-10-28'),
('Andrés Salinas','71111223','andres.salinas@example.com','2025-10-30'),
('Gabriela Pineda','70000134','gabriela.pineda@example.com','2025-11-01'),
('Iván Duarte','79999245','ivan.duarte@example.com','2025-11-03'),
('Mónica Castillo','78888156','monica.castillo@example.com','2025-11-05'),
('Rodrigo Peña','77777067','rodrigo.pena@example.com','2025-11-07'),
('Natalia Campos','76666978','natalia.campos@example.com','2025-11-09'),
('Sebastián Flores','75555889','sebastian.flores@example.com','2025-11-10');
GO

-- Empleados
INSERT INTO dbo.Empleados (nombreEmpleado, apellidoEmpleado, telefono, fechaIngreso, cargo, estado, idSucursal) VALUES
('Luis','Martínez','70001111','2025-09-15','Administrador','Activo',1), 
('Sofía','Ramírez','70002222','2025-09-20','Cajero','Activo',1), 
('Erick','Castro','70003333','2025-09-25','Cocinero','Activo',2),
('Ana','Gómez','70004444','2025-09-26','Cajero','Activo',1),
('Carlos','López','70005555','2025-09-26','Cocinero','Activo',2),
('María','Fernández','70006666','2025-09-27','Mesero','Activo',3),
('José','Ramírez','70007777','2025-09-27','Cocinero','Activo',4),
('Lucía','Torres','70008888','2025-09-28','Cajero','Activo',5),
('Pedro','Martínez','70009999','2025-09-28','Administrador','Activo',1),
('Valeria','Cruz','70010000','2025-09-29','Mesero','Activo',2),
('Jorge','Molina','70011111','2025-09-29','Cocinero','Activo',3),
('Camila','Reyes','70012222','2025-09-30','Cajero','Activo',4),
('Andrés','Salazar','70013333','2025-09-30','Mesero','Activo',5),
('Isabel','Pineda','70014444','2025-10-01','Cocinero','Activo',1),
('Ricardo','Chávez','70015555','2025-10-01','Cajero','Activo',2),
('Daniela','Flores','70016666','2025-10-02','Mesero','Activo',3),
('Manuel','Ortiz','70017777','2025-10-02','Cocinero','Activo',4),
('Fernanda','Reyes','70018888','2025-10-03','Cajero','Activo',5),
('Alejandro','Navarro','70019999','2025-10-03','Administrador','Activo',1),
('Lucía','Campos','70021111','2025-10-04','Mesero','Activo',2),
('Sebastián','Vega','70022222','2025-10-04','Cocinero','Activo',3),
('Paula','Fuentes','70023333','2025-10-05','Cajero','Activo',4),
('Tomás','Aguirre','70024444','2025-10-05','Mesero','Activo',5),
('Gabriela','Peña','70025555','2025-10-06','Cocinero','Activo',1),
('Héctor','Morales','70026666','2025-10-06','Cajero','Activo',2),
('Renata','Silva','70027777','2025-10-07','Mesero','Activo',3);
GO

INSERT INTO dbo.Empleados (nombreEmpleado, apellidoEmpleado, telefono, fechaIngreso, cargo, estado, idSucursal) VALUES
('Martín','Estrada','70028888','2025-10-07','Cocinero','Activo',4),
('Carolina','Varela','70029999','2025-10-08','Cajero','Activo',5),
('Francisco','Rojas','70031111','2025-10-08','Mesero','Activo',1),
('Natalia','Cordero','70032222','2025-10-09','Cocinero','Activo',2),
('Iván','Méndez','70033333','2025-10-09','Cajero','Activo',3),
('Mónica','Herrera','70034444','2025-10-10','Mesero','Activo',4),
('Esteban','Ponce','70035555','2025-10-10','Cocinero','Activo',5),
('Claudia','Zamora','70036666','2025-10-11','Cajero','Activo',1),
('Oscar','Delgado','70037777','2025-10-11','Mesero','Activo',2),
('Patricia','León','70038888','2025-10-12','Cocinero','Activo',3),
('Rodrigo','Palma','70039999','2025-10-12','Cajero','Activo',4),
('Marina','Duarte','70041111','2025-10-13','Mesero','Activo',5),
('Gustavo','Arévalo','70042222','2025-10-13','Cocinero','Activo',1),
('Cecilia','Bravo','70043333','2025-10-14','Cajero','Activo',2),
('Felipe','Carrillo','70044444','2025-10-14','Mesero','Activo',3),
('Lorena','Ayala','70045555','2025-10-15','Cocinero','Activo',4),
('Pablo','Méndez','70046666','2025-10-15','Cajero','Activo',5),
('Andrea','Molina','70047777','2025-10-16','Mesero','Activo',1),
('Enrique','Ramos','70048888','2025-10-16','Cocinero','Activo',2),
('Melanie','Torres','70049999','2025-10-17','Cajero','Activo',3),
('Álvaro','Cruz','70051111','2025-10-17','Mesero','Activo',4),
('Bianca','Romero','70052222','2025-10-18','Cocinero','Activo',5),
('Julián','Salinas','70053333','2025-10-18','Cajero','Activo',1),
('Diana','Castillo','70054444','2025-10-19','Mesero','Activo',2),
('Mauricio','Peña','70055555','2025-10-19','Cocinero','Activo',3),
('Jennie','Ruby','70055556','2025-10-01','Cocinero','Activo',4);
GO

-- Usuarios
INSERT INTO dbo.Usuarios (nombreUser, emailUser, claveUser, estado, idEmpleado, idRol) VALUES
('lmartinez','luis.martinez@comida.com','clave123','Activo',1,1),
('sramirez','sofia.ramirez@comida.com','clave123','Activo',2,2),
('ecastro','erick.castro@comida.com','clave123','Activo',3,3),
('agomez','ana.gomez@comida.com','clave123','Activo',4,2),
('clopez','carlos.lopez@comida.com','clave123','Activo',5,3),
('mfernandez','maria.fernandez@comida.com','clave123','Activo',6,2),
('jramirez','jose.ramirez@comida.com','clave123','Activo',7,3),
('ltorres','lucia.torres@comida.com','clave123','Activo',8,2),
('pmartinez','pedro.martinez@comida.com','clave123','Activo',9,1),
('vcruz','valeria.cruz@comida.com','clave123','Activo',10,2),
('jmolina','jorge.molina@comida.com','clave123','Activo',11,3),
('creyes','camila.reyes@comida.com','clave123','Activo',12,2),
('asalazar','andres.salazar@comida.com','clave123','Activo',13,2),
('ipineda','isabel.pineda@comida.com','clave123','Activo',14,3),
('rchavez','ricardo.chavez@comida.com','clave123','Activo',15,2),
('dflores','daniela.flores@comida.com','clave123','Activo',16,2),
('mortiz','manuel.ortiz@comida.com','clave123','Activo',17,3),
('freyes','fernanda.reyes@comida.com','clave123','Activo',18,2),
('anavarro','alejandro.navarro@comida.com','clave123','Activo',19,1),
('lcampos','lucia.campos@comida.com','clave123','Activo',20,2),
('svega','sebastian.vega@comida.com','clave123','Activo',21,3),
('pfuentes','paula.fuentes@comida.com','clave123','Activo',22,2),
('taguirre','tomas.aguirre@comida.com','clave123','Activo',23,2),
('gpena','gabriela.pena@comida.com','clave123','Activo',24,3),
('hmorales','hector.morales@comida.com','clave123','Activo',25,2),
('rsilva','renata.silva@comida.com','clave123','Activo',26,2);
GO

INSERT INTO dbo.Usuarios (nombreUser, emailUser, claveUser, estado, idEmpleado, idRol) VALUES
('mestrada','martin.estrada@comida.com','clave123','Activo',27,3),
('cvarela','carolina.varela@comida.com','clave123','Activo',28,2),
('frojas','francisco.rojas@comida.com','clave123','Activo',29,2),
('ncordero','natalia.cordero@comida.com','clave123','Activo',30,3),
('imendez','ivan.mendez@comida.com','clave123','Activo',31,2),
('mherrera','monica.herrera@comida.com','clave123','Activo',32,2),
('eponce','esteban.ponce@comida.com','clave123','Activo',33,3),
('czamora','claudia.zamora@comida.com','clave123','Activo',34,2),
('odelgado','oscar.delgado@comida.com','clave123','Activo',35,2),
('pleon','patricia.leon@comida.com','clave123','Activo',36,3),
('rpalma','rodrigo.palma@comida.com','clave123','Activo',37,2),
('mduarte','marina.duarte@comida.com','clave123','Activo',38,2),
('garevalo','gustavo.arevalo@comida.com','clave123','Activo',39,3),
('cbravo','cecilia.bravo@comida.com','clave123','Activo',40,2),
('fcarrillo','felipe.carrillo@comida.com','clave123','Activo',41,3),
('layala','lorena.ayala@comida.com','clave123','Activo',42,2),
('pmendez','pablo.mendez@comida.com','clave123','Activo',43,2),
('amolina','andrea.molina@comida.com','clave123','Activo',44,2),
('eramos','enrique.ramos@comida.com','clave123','Activo',45,3),
('mtorres','melanie.torres@comida.com','clave123','Activo',46,2),
('acruz','alvaro.cruz@comida.com','clave123','Activo',47,3),
('bromero','bianca.romero@comida.com','clave123','Activo',48,2),
('jsalinas','julian.salinas@comida.com','clave123','Activo',49,3),
('dcastillo','diana.castillo@comida.com','clave123','Activo',50,2),
('mpena','mauricio.pena@comida.com','clave123','Activo',51,3),
('jruby','jennie.ruby@comida.com','clave123','Activo',52,3);
GO

-- Productos
INSERT INTO dbo.Productos (nombreProducto, descripcion, precio, stock, estado, idCategoria) VALUES
('Hamburguesa BBQ','Carne, queso, cebolla caramelizada y salsa BBQ',4.25,180,'Activo',1),
('Hamburguesa Vegetariana','Hamburguesa de garbanzo con vegetales',3.80,100,'Activo',1),
('Hamburguesa Picante','Carne, jalapeños, queso cheddar y salsa picante',4.00,120,'Activo',1),
('Refresco 1L','Bebida gaseosa 1 litro',1.50,300,'Activo',2),
('Jugo Natural','Jugo de frutas sin azúcar añadida',1.75,250,'Activo',2),
('Café Helado','Café frío con leche y hielo',2.00,200,'Activo',2),
('Brownie','Brownie de chocolate con nueces',2.50,90,'Activo',3),
('Sundae Chocolate','Helado de vainilla con sirope de chocolate',2.25,110,'Activo',3),
('Galleta Chispas','Galleta grande con chispas de chocolate',1.50,150,'Activo',3),
('Pizza Personal','Pizza individual de pepperoni',3.75,80,'Activo',4),
('Pizza Vegetariana','Pizza con vegetales y queso mozzarella',3.50,70,'Activo',4),
('Pizza Suprema','Pizza con carne, vegetales y doble queso',4.50,60,'Activo',4),
('Taco de Pollo','Tortilla con pollo, lechuga y salsa',2.00,200,'Activo',5),
('Taco de Res','Tortilla con carne de res y vegetales',2.25,180,'Activo',5),
('Taco Vegetariano','Tortilla con frijoles, maíz y aguacate',2.00,150,'Activo',5),
('Ensalada César','Lechuga, pollo, crutones y aderezo César',3.00,100,'Activo',6),
('Ensalada Mixta','Vegetales frescos con vinagreta',2.75,120,'Activo',6),
('Ensalada Tropical','Frutas frescas con yogurt',2.50,90,'Activo',6),
('Papas Fritas','Papas fritas clásicas',1.50,300,'Activo',7),
('Aros de Cebolla','Aros empanizados y fritos',1.75,200,'Activo',7),
('Nuggets de Pollo','Porción de 6 nuggets',2.25,250,'Activo',7),
('Wrap de Pollo','Tortilla rellena de pollo y vegetales',3.25,100,'Activo',8),
('Wrap Vegetariano','Tortilla con hummus y vegetales',3.00,80,'Activo',8),
('Alitas BBQ','6 alitas con salsa BBQ',4.00,90,'Activo',9),
('Piezas de Pollo','2 piezas de pollo frito',3.50,100,'Activo',9),
('Hot Dog Clásico','Pan, salchicha, ketchup y mostaza',2.00,150,'Activo',10),
('Hot Dog Especial','Salchicha con queso, tocino y jalapeños',2.50,120,'Activo',10);
GO

-- Pedidos

INSERT INTO dbo.Pedidos (codigoPedido, fechaPedido, horaPedido, totalPedido, estado, observaciones, idCliente, idEmpleado, idMetodoPago) VALUES
('P-20251025-001','2025-10-25','12:15:00',9.00,'Entregado',NULL,1,2,1),
('P-20251025-002','2025-10-25','12:30:00',7.00,'Entregado','SIN SALSA',1,2,2),
('P-20251025-003','2025-10-25','13:05:00',6.40,'Entregado',NULL,1,2,1),
('P-20251025-004','2025-10-25','13:20:00',7.45,'Entregado','DESCUENTO REFRESCOS',1,2,1),
('P-20251020-001','2025-10-20','11:00:00',8.50,'Entregado',NULL,1,5,1),
('P-20251020-002','2025-10-20','11:15:00',6.75,'Entregado','SIN HIELO',1,6,2),
('P-20251020-003','2025-10-20','11:30:00',9.20,'Entregado',NULL,6,7,1),
('P-20251020-004','2025-10-20','11:45:00',7.80,'Entregado','EXTRA QUESO',7,8,3),
('P-20251020-005','2025-10-20','12:00:00',5.90,'Entregado',NULL,8,9,1),
('P-20251021-001','2025-10-21','12:10:00',10.00,'Entregado','SIN MAYONESA',9,10,2),
('P-20251021-002','2025-10-21','12:25:00',6.50,'Entregado',NULL,10,11,1),
('P-20251021-003','2025-10-21','12:40:00',7.30,'Entregado','DESCUENTO POSTRES',11,12,3),
('P-20251021-004','2025-10-21','12:55:00',8.10,'Entregado',NULL,12,13,1),
('P-20251021-005','2025-10-21','13:10:00',9.90,'Entregado','SIN TOMATE',13,14,2),
('P-20251022-001','2025-10-22','13:20:00',6.00,'Entregado',NULL,14,15,1),
('P-20251022-002','2025-10-22','13:35:00',7.25,'Entregado','EXTRA SALSA',15,16,3),
('P-20251022-003','2025-10-22','13:50:00',8.60,'Entregado',NULL,16,17,1),
('P-20251022-004','2025-10-22','14:05:00',9.15,'Entregado','SIN CEBOLLA',17,18,2),
('P-20251022-005','2025-10-22','14:20:00',6.80,'Entregado',NULL,18,19,1),
('P-20251023-001','2025-10-23','14:30:00',10.50,'Entregado','DESCUENTO COMBO',19,20,3),
('P-20251023-002','2025-10-23','14:45:00',7.10,'Entregado',NULL,20,21,1),
('P-20251023-003','2025-10-23','15:00:00',8.25,'Entregado','SIN MOSTAZA',21,22,2),
('P-20251023-004','2025-10-23','15:15:00',9.40,'Entregado',NULL,22,23,1),
('P-20251023-005','2025-10-23','15:30:00',6.95,'Entregado','EXTRA NUGGETS',23,24,3),
('P-20251024-001','2025-10-24','15:45:00',7.60,'Entregado',NULL,24,25,1),
('P-20251024-002','2025-10-24','16:00:00',8.85,'Entregado','SIN SAL',25,26,2),
('P-20251024-003','2025-10-24','16:15:00',9.75,'Entregado',NULL,26,27,1),
('P-20251024-004','2025-10-24','16:30:00',6.40,'Entregado','DESCUENTO BEBIDA',27,28,3);
GO

INSERT INTO dbo.Pedidos (codigoPedido, fechaPedido, horaPedido, totalPedido, estado, observaciones, idCliente, idEmpleado, idMetodoPago) VALUES
('P-20251024-005','2025-10-24','16:45:00',7.95,'Entregado',NULL,28,29,1),
('P-20251025-005','2025-10-25','14:00:00',8.10,'Entregado','SIN HIELO',29,30,2),
('P-20251025-006','2025-10-25','14:15:00',9.30,'Entregado',NULL,30,31,1),
('P-20251025-007','2025-10-25','14:30:00',6.70,'Entregado','EXTRA SALSA',31,32,3),
('P-20251025-008','2025-10-25','14:45:00',7.85,'Entregado',NULL,32,33,1),
('P-20251025-009','2025-10-25','15:00:00',10.20,'Entregado','SIN MAYONESA',33,34,2),
('P-20251025-010','2025-10-25','15:15:00',6.55,'Entregado',NULL,34,35,1),
('P-20251025-011','2025-10-25','15:30:00',8.90,'Entregado','DESCUENTO POSTRES',35,36,3),
('P-20251025-012','2025-10-25','15:45:00',9.60,'Entregado',NULL,36,37,1),
('P-20251025-013','2025-10-25','16:00:00',7.35,'Entregado','SIN TOMATE',37,38,2),
('P-20251025-014','2025-10-25','16:15:00',6.20,'Entregado',NULL,38,39,1),
('P-20251025-015','2025-10-25','16:30:00',8.75,'Entregado','EXTRA QUESO',39,40,3),
('P-20251025-016','2025-10-25','16:45:00',7.50,'Entregado',NULL,40,41,1),
('P-20251025-017','2025-10-25','17:00:00',9.95,'Entregado','SIN CEBOLLA',41,42,2),
('P-20251025-018','2025-10-25','17:15:00',6.65,'Entregado',NULL,42,43,1),
('P-20251025-019','2025-10-25','17:30:00',8.40,'Entregado','DESCUENTO COMBO',43,44,3),
('P-20251025-020','2025-10-25','17:45:00',7.20,'Entregado',NULL,44,45,1),
('P-20251025-021','2025-10-25','18:00:00',9.10,'Entregado','SIN MOSTAZA',45,46,2),
('P-20251025-022','2025-10-25','18:15:00',6.35,'Entregado',NULL,46,47,1),
('P-20251025-023','2025-10-25','18:30:00',8.95,'Entregado','EXTRA NUGGETS',47,48,3),
('P-20251025-024','2025-10-25','18:45:00',7.70,'Entregado',NULL,48,49,1),
('P-20251025-025','2025-10-25','19:00:00',9.50,'Entregado','SIN SAL',49,50,2),
('P-20251025-026','2025-10-25','19:15:00',6.10,'Entregado',NULL,1,1,1),
('P-20251025-027','2025-10-25','19:30:00',8.30,'Entregado','DESCUENTO BEBIDA',2,2,3),
('P-20251025-028','2025-10-25','19:45:00',7.55,'Entregado',NULL,3,3,1),
('P-20251025-029','2025-10-25','20:00:00',9.98, 'Entregado', NULL, 32, 4, 1);
GO

-- Detalles de Pedidos
INSERT INTO dbo.DetallesPedidos (Cantidad, precioUnitario, descuento, idPedido, idProducto) VALUES
(2,3.50,0.00,1,1),
(2,1.00,0.00,1,3),
(1,4.75,0.00,2,2),
(1,2.25,0.00,2,5),
(1,0.90,0.00,3,4),
(1,2.00,0.00,3,6),
(1,3.50,0.00,3,1),
(3,1.00,0.30,4,3),
(1,4.75,0.00,4,2),
(2,2.25,0.00,5,5),
(1,3.50,0.00,5,1),
(1,1.00,0.00,6,3),
(2,2.00,0.00,6,6),
(1,4.75,0.00,7,2),
(1,0.90,0.00,7,4),
(2,3.50,0.00,8,1),
(1,2.25,0.00,8,5),
(1,1.00,0.00,9,3),
(1,2.00,0.00,9,6),
(1,4.75,0.00,10,2),
(2,0.90,0.00,10,4),
(1,3.50,0.00,11,1),
(1,2.25,0.00,11,5),
(1,1.00,0.00,12,3),
(1,2.00,0.00,12,6),
(1,4.75,0.00,13,2),
(1,0.90,0.00,13,4),
(2,3.50,0.00,14,1);
GO

INSERT INTO dbo.DetallesPedidos (Cantidad, precioUnitario, descuento, idPedido, idProducto) VALUES
(1,2.25,0.00,14,5),
(1,1.00,0.00,15,3),
(1,2.00,0.00,15,6),
(1,4.75,0.00,16,2),
(2,0.90,0.00,16,4),
(1,3.50,0.00,17,1),
(1,2.25,0.00,17,5),
(1,1.00,0.00,18,3),
(1,2.00,0.00,18,6),
(1,4.75,0.00,19,2),
(1,0.90,0.00,19,4),
(2,3.50,0.00,20,1),
(1,2.25,0.00,20,5),
(1,1.00,0.00,21,3),
(1,2.00,0.00,21,6),
(1,4.75,0.00,22,2),
(2,0.90,0.00,22,4),
(1,3.50,0.00,23,1),
(1,2.25,0.00,23,5),
(1,1.00,0.00,24,3),
(1,2.00,0.00,24,6),
(1,4.75,0.00,25,2),
(1,0.90,0.00,25,4),
(2,3.50,0.00,26,1),
(1,2.25,0.00,26,5),
(1,1.00,0.00,27,3),
(1,2.00,0.00,27,6);
GO	
-- Log de Eventos

INSERT INTO dbo.LogEventos (fechaLog, usuario, tipoEvento, tablaAfectada, registroAfectado, descripcion) VALUES
('2025-10-25 12:16:00','sramirez','INSERT','Pedidos',1,'Pedido registrado'),
('2025-10-25 12:16:05','ecastro','UPDATE','Pedidos',1,'Pedido marcado como Entregado');
