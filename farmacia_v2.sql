--CREANDO BASE DE DATOS
create database farmacia_v2

-- CREANDO TABLAS Y SUS LLAVES FORANEAS
use farmacia_v2
go

create table proveedores(
	cod_proveedor int not null PRIMARY KEY,
	nombre_proveedor varchar (50),
	nombre_contacto varchar(50),
	apellido_contacto varchar(50),
	telefono int not null,
	correo_electronico varchar(50)
)

create table lista_codigos(
	codigo_clasificacion int not null PRIMARY KEY,
	nombre_clasificacion varchar (50)
)

create table productos(
	cod_producto int not null PRIMARY KEY,
	cod_proveedor int not null,
	nombre_producto varchar (50),
	nombre_comercial varchar(50),
	descripcion_producto varchar(50),
	presentaciones varchar(50),
	fecha_vencimiento varchar(50),
	costo_unitario int not null,
	existencias int not null,
	codigo_clasificacion int not null,
	via_administracion varchar(50),
	venta_libre int not null,
	ubicacion varchar(50)
)

create table detalle_factura(
	cod_detalle int not null PRIMARY KEY,
	cod_factura int not null,
	cod_producto int not null,
	cantidad_xproducto int not null,
	subtotal int
)

create table factura(
	cod_factura int not null PRIMARY KEY,
	cod_clientes int not null,
	cod_empleado int not null,
	fecha_venta varchar(50),
	total int not null
)

create table clientes(
	cod_clientes int not null PRIMARY KEY,
	nit int not null,
	nombre_cliente varchar(50),
	apellido_cliente varchar(50),
	telefono_cliente int not null,
	correo_cliente varchar(50),
	direccion varchar (50)
)

create table personal(
	cod_empleado int not null PRIMARY KEY,
	nombre_empleado varchar (50),
	apellido_empleado varchar(50),
	telefono_empleado int not null,
	correo_empleado varchar (50)
)

-- CREANDO LLAVES FORANEAS 

ALTER TABLE productos ADD CONSTRAINT FK_cod_proveedor FOREIGN KEY (cod_proveedor) REFERENCES proveedores(cod_proveedor) 
--Llave foranea  codigo_clasificacion
ALTER TABLE productos ADD CONSTRAINT FK_codigo_clasificacion FOREIGN KEY (codigo_clasificacion) REFERENCES lista_codigos(codigo_clasificacion) 

--LLAVES TABLA DETALLE FACTURA

--Llave foranea  cod_factura
ALTER TABLE detalle_factura ADD CONSTRAINT FK_cod_factura FOREIGN KEY (cod_factura) REFERENCES factura(cod_factura) 
--Llave foranea  cod_producto
ALTER TABLE detalle_factura ADD CONSTRAINT FK_cod_producto FOREIGN KEY (cod_producto) REFERENCES productos(cod_producto) 


--LLAVES FORANEAS FACTURA

--Llave foranea  cod_cliente
ALTER TABLE factura ADD CONSTRAINT FK_cod_clientes FOREIGN KEY (cod_clientes) REFERENCES clientes(cod_clientes) 
--Llave foranea  cod_proveedor
ALTER TABLE factura ADD CONSTRAINT FK_cod_empleado FOREIGN KEY (cod_empleado) REFERENCES personal(cod_empleado)


--INSERTAR DATOS 

INSERT INTO lista_codigos (codigo_clasificacion,nombre_clasificacion) VALUES
	(10,'Diureticos'),
	(11,'Gastrointestinales'),
	(12,'Anticonceptivos'),
	(13, 'Antidiabeticos');

INSERT INTO proveedores(cod_proveedor,nombre_proveedor,nombre_contacto,apellido_contacto,telefono,correo_electronico) VALUES
  (501,'LABORATORIOS SUED', 'Juan','Pérez', '55511234', 'juan.perez@proveedora.com'),
  (502,'INDUSTRIA FARMACEUTICA S.A', 'María','Gómez', '55515678', 'maria.gomez@otroproveedor.com'),
  (503,'PHARMAR', 'Pedro','Rodríguez', '55514321', 'pedro.rodriguez@suministros.com'),
  (504,'INTECFA', 'Ana','Martínez','55528765', 'ana.martinez@suministros.com'),
  (505,'UNIPHARM S.A', 'Luis','González', '55539876', 'luis.gonzalez@otraproveedora.com');

INSERT INTO clientes(cod_clientes,nit,nombre_cliente,apellido_cliente,telefono_cliente,correo_cliente,direccion)VALUES
	(401,1376541,'Alice', 'Johnson', 65437892, 'Alice@gmail,com', '3ra Avenida, 9-21 Z4'),
	(402,1345633,'John', 'Miller',76541275,'miller@gmail.com', '4ta Avenida, 23-67 Z8' ),
	(403,5466544,'Jessica', 'Lee', 76329368,'lee@gmail.com', '5ta Calle, 17-58 Z12' );

INSERT INTO personal(cod_empleado,nombre_empleado,apellido_empleado,telefono_empleado,correo_empleado) VALUES
	(301,'Chloe', 'Harris', 86519396, 'Harris@gmail.com'),
	(302,'Daniel', 'Clark', 29753732, 'Clark@gmail.com'),
	(303,'Grace', 'Parker', 75349783, 'Parker@gmail.com');

INSERT INTO productos(cod_producto, cod_proveedor, nombre_producto, nombre_comercial, descripcion_producto, presentaciones, 
fecha_vencimiento, costo_unitario, existencias, codigo_clasificacion, via_administracion, venta_libre, ubicacion) VALUES
	(201,502, 'Espironolactona', 'Aldactone', 'Eliminar el agua en el cuerpo y tratar presion', '25mg', '12/12/2024', 100, 20 , 10 , 'oral', 1, 'A'),
	(202, 503, 'Ranitidina', 'Gastrium' , 'Malestares, infecciones y enfermedades gastricas', '150mg', '13/09/2024', 30, 50 , 11, 'oral', 1, 'B'),
	(203, 505, 'Glibenclamida', 'Glidiabet', 'Regular los niveles de glucosa ', '2.5mg', '13/05/2024', 15, 70, 13, 'oral', 1 , 'H' );

INSERT INTO factura(cod_factura, cod_clientes, cod_empleado, fecha_venta, total)VALUES
	(100,402,301,'23-01-2023',1000),
	(101,403,302,'29/08/2023',600),
	(102,401,303,'30/10/2023',680);

INSERT INTO detalle_factura(cod_detalle, cod_factura, cod_producto, cantidad_xproducto, subtotal) VALUES
	(1,100, 201, 3, 600),
	(2,100, 201, 2, 400),
	(3,100, 202, 5, 300),
	(4,101, 202, 5, 300),
	(5,102, 203, 10, 300),
	(6,102, 201, 1, 200),
	(7,102, 202, 3, 180);





