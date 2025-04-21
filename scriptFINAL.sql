-- CREACION DE LA BASE DE DATOS Y USO DE LA MISMA

CREATE DATABASE coffe_sql;
USE coffe_sql;

-- 1. CREACIÓN DE TABLAS

CREATE TABLE IF NOT EXISTS cliente (
	IDcliente INT NOT NULL AUTO_INCREMENT, 
    nombre_cliente VARCHAR(50) NOT NULL,
    apellido_cliente VARCHAR(50) NOT NULL,
	telefono_cliente VARCHAR(50) NOT NULL,
    direccion_cliente VARCHAR(50),
    condicionIVA VARCHAR(50) NOT NULL,
    condicion_vta VARCHAR(50) NOT NULL,
	PRIMARY KEY (IDcliente)
) ;

CREATE TABLE IF NOT EXISTS facturas (
	IDfactura INT NOT NULL AUTO_INCREMENT,
    IDcliente INT NOT NULL,
    condicionIVA VARCHAR(50) NOT NULL,
	fecha_factura DATE NOT NULL,
    fecha_vtopago DATE NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (IDfactura),
    FOREIGN KEY (IDcliente) REFERENCES cliente (IDcliente)
) ;

CREATE TABLE IF NOT EXISTS vendedor (
	IDvendedor INT NOT NULL AUTO_INCREMENT,
    IDventas INT NOT NULL,
    nombre_vendedor VARCHAR(50) NOT NULL,
    apellido_vendedor VARCHAR(50) NOT NULL,
    PRIMARY KEY (IDvendedor)
) ;

CREATE TABLE IF NOT EXISTS ventas (
	IDventas INT NOT NULL AUTO_INCREMENT,
    IDfactura INT NOT NULL,
    IDproducto INT NOT NULL,
    IDvendedor INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (IDventas),
    FOREIGN KEY (IDfactura) REFERENCES facturas (IDfactura),
    FOREIGN KEY (IDvendedor) REFERENCES vendedor (IDvendedor)
) ;

CREATE TABLE IF NOT EXISTS productos (
	IDproducto INT NOT NULL AUTO_INCREMENT,
    nombre_producto VARCHAR(50) NOT NULL,
    precio_producto DECIMAL(10,2) NOT NULL,
    descripcion_producto VARCHAR(50) NOT NULL,
    foto_producto VARCHAR(50),
    PRIMARY KEY (IDproducto)
) ;
 
CREATE TABLE IF NOT EXISTS ingredientes (
	IDingrediente INT NOT NULL AUTO_INCREMENT,
    IDproducto INT NOT NULL,
    nombre_ingrediente VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (IDingrediente),
    FOREIGN KEY (IDproducto) REFERENCES productos (IDproducto)
) ;

CREATE TABLE IF NOT EXISTS proveedor ( 
	IDproveedor INT NOT NULL AUTO_INCREMENT,
    nombre_prov VARCHAR(50) NOT NULL,   
    PRIMARY KEY (IDproveedor)
) ;

CREATE TABLE IF NOT EXISTS direcciones(
	IDproveedor INT NOT NULL,
    calle VARCHAR(50) NOT NULL,
    numero INT NOT NULL,
    FOREIGN KEY (IDproveedor) REFERENCES proveedor (IDproveedor)
);

CREATE TABLE IF NOT EXISTS telefonos (
	IDproveedor INT NOT NULL,
    telefono INT NOT NULL,
    FOREIGN KEY (IDproveedor) REFERENCES proveedor (IDproveedor)
);
 
 CREATE TABLE IF NOT EXISTS emails (
	IDproveedor INT NOT NULL,
    email VARCHAR(50) NOT NULL,
    FOREIGN KEY (IDproveedor) REFERENCES proveedor (IDproveedor)
);
    
CREATE TABLE IF NOT EXISTS pedidos_proveedores (
	IDpedido INT NOT NULL AUTO_INCREMENT,
    IDproveedor INT NOT NULL,
    IDingrediente INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (IDpedido),
    FOREIGN KEY (IDproveedor) REFERENCES proveedor (IDproveedor),
    FOREIGN KEY (IDingrediente) REFERENCES ingredientes (IDingrediente)
) ;

CREATE TABLE IF NOT EXISTS stock ( 
	IDproveedor INT NOT NULL,
    IDingrediente INT NOT NULL,
    cantidad INT NOT NULL,
    stock_min INT NOT NULL,
	FOREIGN KEY (IDproveedor) REFERENCES proveedor (IDproveedor),
    FOREIGN KEY (IDingrediente) REFERENCES ingredientes (IDingrediente)
) ;


-- 2. INSERCIÓN DE DATOS EN LAS TABLAS

INSERT INTO cliente (
IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) 
VALUES 
(NULL, 'Isis', 'Smith','898-932-8276', '7 Onsgard Drive', 'Consumidor Final', 'Contado'),
(NULL, 'Jermain', 'Jonhson','125-223-8105', '50 John Wall Plaza', 'Consumidor Final', 'Contado'),
(NULL, 'Angil', 'Williams','263-955-3620', '96 Oakridge Center', 'Consumidor Final', 'Contado'),
(NULL, 'Idell', 'Brown','288-385-5593', '336 Ludington Place', 'Consumidor Final', 'Contado'),
(NULL, 'Hyacinthe', 'Jones','994-608-6307', '6368 Shopko Terrace', 'Consumidor Final', 'Contado'),
(NULL, 'Nobie', 'Garcia','655-489-5683', '2950 Cascade Court','Consumidor Final', 'Contado'),
(NULL, 'Zacharias', 'Miller','379-663-7462', '425 Barnett Street','Consumidor Final', 'Contado'),
(NULL, 'Claudell', 'Wright','644-999-0303', '4040 Westerfield Drive','Consumidor Final', 'Contado'),
(NULL, 'Mandy', 'Robinson','250-951-7877', '487 Corry Place','Consumidor Final', 'Contado'),
(NULL, 'Josephine', 'Evans' ,'144-903-2486', '477 Corry Court','Consumidor Final', 'Contado');

INSERT INTO facturas (
IDfactura, IDcliente, condicionIVA, fecha_factura, fecha_vtopago, cantidad, subtotal, total)
VALUES
(NULL, '1', 'Consumidor Final', '2023-07-01','2023-07-01', '1', '200', '242'),
(NULL, 3, 'Consumidor Final', '2023-06-02','2023-06-02', '2', '300', '363'),
(NULL, 5, 'Consumidor Final', '2023-07-03','2023-07-03', '1', '300', '363'),
(NULL, 7, 'Consumidor Final', '2023-07-04','2023-07-04', '3', '900', '1089'),
(NULL, 10, 'Consumidor Final', '2023-07-05','2023-07-05', '1', '400', '484'),
(NULL, 7, 'Consumidor Final', '2023-08-05','2023-08-05', '1', '200', '242'),
(NULL, 9, 'Consumidor Final', '2023-07-05','2023-07-05', '2', '300', '363'),
(NULL, 2, 'Consumidor Final', '2023-08-07','2023-08-07', '2', '600', '726'),
(NULL, 1, 'Consumidor Final', '2023-09-10','2023-09-10', '3', '900', '1089'),
(NULL, 3, 'Consumidor Final', '2023-09-11','2023-09-11', '1', '400', '484');

INSERT INTO vendedor (
IDvendedor, IDventas, nombre_vendedor, apellido_vendedor)
VALUES
(NULL,'1', 'Juan', 'Gomez'),
(NULL,'2', 'Gonzalo', 'Peralta'),
(NULL,'3', 'Francisco', 'Stoessel'),
(NULL,'4', 'Tini', 'Fernandez'),
(NULL,'5', 'Javier', 'Diaz');

INSERT INTO ventas (
IDventas, IDfactura, IDproducto, IDvendedor, cantidad)
VALUES
(NULL, '1','1','1','1'),
(NULL, '2', '2','1','2'),
(NULL, '3', '3','3' ,'1'),
(NULL, '4', '4','4' ,'3'),
(NULL, '5', '5','4','1'),
(NULL, '1','1','5','1'),
(NULL, '2', '2','1','2'),
(NULL, '3', '3','2','2'),
(NULL, '4', '4','3', '3'),
(NULL, '5', '5','5','1');

INSERT INTO productos (
IDproducto, nombre_producto, precio_producto, descripcion_producto, foto_producto)
VALUES
('1','doppio', '200', 'cafe doppio', NULL),
('2','americano', '150', 'cafe americano', NULL),
('3','flat white', '300', 'cafe flat white', NULL),
('4','viennese cappucino', '300', 'cafe viennese cappucino', NULL),
('5','latte macchiato', '400', 'cafe latte macchiato', NULL);

INSERT INTO ingredientes (
IDingrediente, IDproducto, nombre_ingrediente, cantidad)
VALUES
(NULL, '1','cacao', '2'),
(NULL, '2','leche','5'),
(NULL, '3','azucar', '7'),
(NULL, '4','crema','3'),
(NULL, '5','canela','9');

INSERT INTO proveedor (
IDproveedor, nombre_prov)
VALUES
(NULL, 'Latte SA'),
(NULL, 'MOCA SRL'),
(NULL, 'Cafiver'),
(NULL, 'Molidos SA'),
(NULL, 'Coffe Suppliers SRL');

INSERT INTO direcciones (
IDproveedor, calle, numero)
VALUES
('1', 'Av. Coronel Diaz','245'),
('2','Lavalle', '4100'),
('3','Juncal', '2405'),
('4', 'Ayacucho', '301'),
('5', 'Av. Callao', '2505');

INSERT INTO telefonos (
IDproveedor, telefono)
VALUES
('1','112141694'),
('2','119135533'),
('3','117135491'),
('4','116135697'),
('5','115533698');

INSERT INTO emails (
IDproveedor, email)
VALUES
('1','latte@hotmail.com'),
('2', 'mocasrl@gmail.com'),
('3', 'cafiver@cafiver.com'),
('4', 'molidos@molidosa.com'),
('5', 'suppliersrl@srl.com');

INSERT INTO pedidos_proveedores (
IDpedido, IDproveedor, IDingrediente, cantidad)
VALUES
(NULL, '1', '1','12'),
(NULL, '2', '2','10'),
(NULL, '3', '3','9'),
(NULL, '4', '4','8'),
(NULL, '5', '5','7');

INSERT INTO stock (
IDproveedor, IDingrediente, cantidad, stock_min)
VALUES
(1,'1','12','4'),
(2,'2','10','4'),
(3,'3','6','4'),
(4,'4','5','4'),
(5,'5','9','4');


-- 3. CREACION DE VISTAS

-- 3.1. Mostrar nombre y teléfono de clientes que consumen café Americano
CREATE OR REPLACE VIEW vista_clientes_americano AS ( 
SELECT nombre_cliente, telefono_cliente
FROM cliente AS c
JOIN productos AS p ON c.IDcliente = p.IDproducto
WHERE IDproducto = 2
);

-- 3.2. Mostrar nombre y teléfono de clientes que consumen café Flat White
CREATE OR REPLACE VIEW vista_clientes_flat AS ( 
SELECT nombre_cliente, telefono_cliente
FROM cliente AS c
JOIN productos AS p ON c.IDcliente = p.IDproducto
WHERE IDproducto = 3
);

-- 3.3. Mostrar nombre y teléfono de clientes que consumen café Latte Macchiato
CREATE OR REPLACE VIEW vista_clientes_latte AS ( 
SELECT nombre_cliente, telefono_cliente
FROM cliente AS c
JOIN productos AS p ON c.IDcliente = p.IDproducto
WHERE IDproducto = 5
);

-- 3.4. Mostrar los productos más vendidos
CREATE VIEW vista_productos_mas_vendidos AS (
	SELECT
		nombre_producto,
        SUM(cantidad) AS Cantidad
	FROM ventas AS v
	JOIN productos AS p ON v.IDventas = p.IDproducto
	GROUP BY p.nombre_producto
	ORDER BY v.cantidad DESC
);

-- 3.5. Mostrar los productos que tengan un precio superior a $ 200
CREATE OR REPLACE VIEW vista_precio_producto_mayor200 AS ( 
SELECT nombre_producto, precio_producto
FROM productos
WHERE precio_producto > 200
);

-- 3.6. Mostrar el total facturado ordenado por mes
CREATE OR REPLACE VIEW vista_total_facturado_mes AS ( 
SELECT MONTH(fecha_factura) AS Mes, SUM(total) AS 'Total Facturado ($)'
FROM facturas
GROUP BY Mes
ORDER BY Mes
);


-- 4. CREACION DE FUNCIONES

-- 4.1. Funcion cálculo IVA 21%
DELIMITER $$

CREATE FUNCTION fn_calculo_IVA (subtotal DECIMAL)
RETURNS DECIMAL(11,2)
NO SQL  
BEGIN
	DECLARE resultado DECIMAL(11,2);
    DECLARE impuesto DECIMAL(11,2);
    SET impuesto = 21.00;
    SET resultado = subtotal * (impuesto/100);
    RETURN resultado;
END$$

DELIMITER ;

-- 4.1.1. Prueba de la funcion calculo_IVA
SELECT fn_calculo_IVA (10) AS total;

-- 4.2. Funcion para calcular el precio de venta total con IVA incluido

DELIMITER $$

CREATE FUNCTION fn_precio_total(neto_gravado DECIMAL(11,2))
RETURNS DECIMAL(11,2)
NO SQL
BEGIN
	DECLARE resultado DECIMAL(11,2);
	SET resultado = neto_gravado + fn_calculo_IVA(neto_gravado);
    RETURN resultado;
END$$

DELIMITER ;

-- 4.2.1. Prueba de la funcion precio_total
SELECT fn_precio_total (5) AS Total; 

-- 4.3. Funcion para determinar la cantidad de ingredientes a pedir a los proveedores
DELIMITER $$

CREATE FUNCTION fn_pedido (cantidad INT, stock_min INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = (cantidad - stock_min); 
	RETURN resultado;
END$$
DELIMITER ;

-- 4.3.1. Prueba de la funcion fn_pedido
SELECT fn_pedido (6,4) AS 'cantidad a solicitar';

-- 4.4. Funcion para determinar un nuevo precio dada la inflacion mensual
DELIMITER $$

CREATE FUNCTION fn_precio_inflacion(precio DECIMAL(11,2), inflacion DECIMAL (11,2))
RETURNS DECIMAL(11,2)
NO SQL
BEGIN
	DECLARE resultado DECIMAL (11,2);
    SET resultado = precio * (1 + (inflacion/100));
RETURN resultado;
END$$

DELIMITER ;

-- 4.4.1. Prueba de la funcion precio_total
SELECT fn_precio_inflacion (100,5);

-- 4.5. Funcion para determinar el total facturado hasta la fecha

DELIMITER $$

CREATE FUNCTION fn_ventas() 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE ftotal DECIMAL(10,2);
    SET ftotal = 0.00;  
    SELECT SUM(total) FROM facturas INTO ftotal;
    RETURN ftotal;
END $$

DELIMITER ;

-- 4.5.1. Prueba de la funcion precio_total
SELECT fn_ventas() AS 'Total de importe facturado en $';

-- 4.6. Funcion 


-- 5. STORED PROCEDURES 

-- 5.1. Creación de SP (creación de parámetro que indica el campo de ordenamiento de la tabla Productos)
DELIMITER $$  

CREATE PROCEDURE `sp_nombre_producto_order` (IN field CHAR(20), IN orden VARCHAR(4)) 
BEGIN 	
	IF field <> '' THEN 		
		SET @nombre_producto_order = CONCAT(' ORDER BY ', field); 	
	ELSE 		
    SET @nombre_producto_order = '';     
    END IF;          
    
    SET @consulta = CONCAT('SELECT * FROM coffe_sql.productos', @nombre_producto_order);        
    
    PREPARE buscar FROM @consulta;     
    EXECUTE buscar;     
    DEALLOCATE PREPARE buscar;      
    
END$$  
    
DELIMITER ;

-- 5.1.1. Prueba del SP armado ordenando la tabla Productos por IDproducto en orden Ascendente
CALL coffe_sql.sp_nombre_producto_order('IDproducto', 'ASC');

-- 5.2. Creación de SP (creación de parámetro que agrega registros en la tabla)
DELIMITER $$  

CREATE PROCEDURE `sp_add_producto` (IN nombre VARCHAR(50), precio INT, descripcion VARCHAR(50), foto VARCHAR(50))
BEGIN 	
	INSERT INTO productos (nombre_producto, precio_producto, descripcion_producto, foto_producto)
	VALUES (nombre, precio, descripcion, foto);
    SELECT 'Producto insertado correctamente' AS Mensaje;
END$$  
    
DELIMITER ;

-- 5.2.1. Prueba del SP (CALL + SELECT) para chequear en la tabla Productos
CALL coffe_sql.sp_add_producto('caramel', 550, 'cafe caramel ', '');

SELECT * FROM productos;

-- 5.3. Creacion de un SP para buscar el producto, en caso de no saber su nombre exacto
DELIMITER $$  
CREATE PROCEDURE `sp_buscar_producto` (IN nombre VARCHAR(50))
BEGIN
	SELECT IDproducto, nombre_producto, descripcion_producto FROM productos
    WHERE nombre LIKE '%';
END$$ 
DELIMITER ;

-- 5.3.1. Prueba del SP creado
CALL sp_buscar_producto ('fla'); 

-- 5.4. Creacion de un SP para buscar un proveedor del listado
DELIMITER $$  
CREATE PROCEDURE `sp_buscar_prov` (IN nombre VARCHAR(50))
BEGIN
	SELECT IDproveedor, nombre_prov FROM proveedor
    WHERE nombre LIKE '%';
END$$ 
DELIMITER ;

-- 5.4.1. Prueba del SP creado
CALL sp_buscar_prov ('Latte'); 

-- 5.5. Creación de SP para generar un nuevo cliente
DELIMITER $$  

CREATE PROCEDURE `sp_add_cliente` (nombre VARCHAR(50), apellido VARCHAR(50), telefono VARCHAR(50), direccion VARCHAR(50), IVA VARCHAR(50), venta VARCHAR(50))
BEGIN 	
	INSERT INTO cliente (nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta)
	VALUES (nombre, apellido, telefono, direccion, IVA, venta);
    SELECT 'Cliente ingresado correctamente' AS Mensaje;
END$$  
    
DELIMITER ;

-- 5.5.1. Prueba del SP (CALL + SELECT) para chequear en la tabla Cliente
CALL coffe_sql.sp_add_cliente('Juan', 'Perez', '550-503-0305', '40 Oakridge Drive', 'Consumidor Final', 'Contado');

SELECT * FROM Cliente;

-- 6. TRIGGERS

-- 6.1. Creacion de una tabla log y de un trigger AFTER INSERT un nuevo producto
CREATE TABLE IF NOT EXISTS log_productos (
IDproducto INT NOT NULL AUTO_INCREMENT,
nombre_producto VARCHAR(50) NOT NULL,
precio_producto INT NOT NULL,
descripcion_producto VARCHAR(50) NOT NULL,
foto_producto VARCHAR(50),
usuario VARCHAR(50) NOT NULL,
fecha_registro DATETIME NOT NULL,
PRIMARY KEY (IDproducto)
);

CREATE TRIGGER tr_add_new_productos
AFTER INSERT ON productos
FOR EACH ROW
INSERT INTO log_productos (IDproducto, nombre_producto, precio_producto, descripcion_producto, foto_producto, usuario, fecha_registro)
VALUES (NEW.IDproducto, NEW.nombre_producto, NEW.precio_producto, NEW.descripcion_producto, NEW.foto_producto, USER(), NOW() );

-- 6.1.1. Prueba del trigger tr_add_new_productos que permita observar la nueva tabla con el registro inserto

INSERT INTO productos (
IDproducto, nombre_producto, precio_producto, descripcion_producto, foto_producto)
VALUES
(NULL,'baileys latte', '320', 'cafe baileys latte', NULL);

SELECT * FROM log_productos;

-- 6.2. Creacion de una tabla log y de un trigger BEFORE UPDATE para la actualización de precios de los productos, junto con el usuario y fecha que lo modificó
CREATE TABLE IF NOT EXISTS log_precios (
IDproducto INT NOT NULL AUTO_INCREMENT,
nombre_producto VARCHAR(50) NOT NULL,
precio_antiguo_producto INT NOT NULL,
precio_nuevo_producto INT NOT NULL,
usuario VARCHAR(50) NOT NULL,
fecha_registro DATETIME NOT NULL,
PRIMARY KEY (IDproducto)
);

CREATE TRIGGER tr_precios_productos
BEFORE UPDATE ON productos
FOR EACH ROW
INSERT INTO log_precios (IDproducto, nombre_producto, precio_antiguo_producto, precio_nuevo_producto, usuario, fecha_registro)
VALUES (NEW.IDproducto, NEW.nombre_producto, OLD.precio_producto, NEW.precio_producto, USER(), NOW() );

-- 6.2.1. Prueba del trigger de precios, subiendo un 20% el precio del producto café americano
UPDATE productos 
SET precio_producto = (precio_producto * 1.20)
WHERE IDproducto = 2;

-- 6.2.2. Prueba del trigger tr_precios_productos que permita comparar el precio anterior y el actual

SELECT * from log_precios;

-- 6.3. Creacion de una tabla log y de un trigger AFTER INSERT ante la generacion de una nueva factura de venta, junto con el usuario y fecha que lo modificó
CREATE TABLE IF NOT EXISTS log_factura (
event_name VARCHAR(50),
IDfactura INT NOT NULL AUTO_INCREMENT,
IDcliente INT NOT NULL,
condicionIVA VARCHAR(50),
fecha_factura DATE,
fecha_vtopago DATE,
cantidad INT,
subtotal DECIMAL(10,2),
total DECIMAL(10,2),
usuario VARCHAR(50) NOT NULL,
fecha_registro DATETIME NOT NULL,
PRIMARY KEY (IDfactura),
FOREIGN KEY (IDcliente) REFERENCES cliente (IDcliente)
);

CREATE TRIGGER tr_add_new_factura
AFTER INSERT ON facturas
FOR EACH ROW
INSERT INTO log_factura (event_name, IDfactura, IDcliente, condicionIVA, fecha_factura, fecha_vtopago, cantidad, subtotal, total, usuario, fecha_registro)
VALUES ('Nueva factura', NEW.IDfactura, NEW.IDcliente, NEW.condicionIVA, NEW.fecha_factura, NEW.fecha_vtopago, NEW.cantidad, NEW.subtotal, NEW.total, USER(), NOW() );

-- 6.3.1. Prueba del trigger tr_add_new_factura que permita observar la nueva tabla con el registro insertado

INSERT INTO facturas (
IDfactura, IDcliente, condicionIVA, fecha_factura, fecha_vtopago, cantidad, subtotal, total)
VALUES
(NULL,'3','Consumidor Final', '2023-10-3','2023-10-3', 1, '400', '484');

SELECT * FROM facturas;
SELECT * FROM log_factura;

-- 6.4. Creacion de un trigger para registrar la eliminación de una factura en la tabla log_factura
CREATE TRIGGER tr_delete_factura
AFTER DELETE ON facturas
FOR EACH ROW
INSERT INTO log_factura (event_name, IDfactura, usuario, fecha_registro)
VALUES ('Eliminacion de factura', OLD.IDfactura, USER(), NOW() );

-- 6.5. Creacion de un trigger para registrar la nueva inserción en la tabla log_clientes

CREATE TABLE IF NOT EXISTS log_clientes (
event_name VARCHAR(50),
IDcliente INT NOT NULL AUTO_INCREMENT,
nombre_cliente VARCHAR(50),
apellido_cliente VARCHAR(50),
telefono_cliente VARCHAR(50),
direccion_cliente VARCHAR(50),
condicionIVA VARCHAR(50),
condicion_vta VARCHAR(50),
usuario VARCHAR(50) NOT NULL,
fecha_registro DATETIME NOT NULL,
PRIMARY KEY (IDcliente)
);

CREATE TRIGGER tr_new_cliente
AFTER INSERT ON cliente
FOR EACH ROW
INSERT INTO log_clientes (event_name, IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta, usuario, fecha_registro)
VALUES ('Nuevo cliente', NEW.IDcliente, NEW.nombre_cliente, NEW.apellido_cliente, NEW.telefono_cliente, NEW.direccion_cliente, NEW.condicionIVA, NEW.condicion_vta, USER(), NOW() );

CREATE TRIGGER tr_delete_cliente
AFTER DELETE ON cliente
FOR EACH ROW
INSERT INTO log_clientes (event_name, IDcliente, nombre_cliente, apellido_cliente, usuario, fecha_registro)
VALUES ('Eliminacion de cliente', OLD.IDcliente, OLD.nombre_cliente, OLD.apellido_cliente, USER(), NOW() );

INSERT INTO cliente (
IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) 
VALUES 
(NULL, 'Johana', 'Gomez','898-933-8576', '15 Onsgard Drive', 'Consumidor Final', 'Contado');


-- CREACION DE 2 USUARIOS 
CREATE USER IF NOT EXISTS 'usuario1'@'localhost' IDENTIFIED BY '123';
CREATE USER IF NOT EXISTS 'usuario2'@'localhost' IDENTIFIED BY '123';

-- Establezco permisos de solo lectura al usuario 1 sobre todas las tablas
GRANT SELECT ON *.* TO 'usuario1'@'localhost';

-- Establezco permisos de lectura, inserción y modificación de datos para el usuario 2
GRANT SELECT, INSERT, UPDATE ON *.* TO 'usuario2'@'localhost';

-- Elimino el IDproveedor 5 de la tabla de Emails, y realizo un ROLLBACK
START TRANSACTION;

DELETE FROM 
	emails
WHERE 
	IDproveedor = 5;

ROLLBACK;
-- En caso de querer reafirmar dicho delete, realizo un COMMIT en lugar de ROLLBACK
-- COMMIT; 

-- Insertamos 8 registros y realizamos un SAVEPOINT, y comentamos un release savepoint 
START TRANSACTION;

INSERT INTO cliente (IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) VALUES (NULL, 'Christoph', 'Sambiedge', '370-350-1643', 'Suite 96', 'Consumidor Final', 'Contado');
INSERT INTO cliente (IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) VALUES (NULL, 'Toni', 'Ripper', '842-938-0624', '1st Floor', 'Consumidor Final', 'Contado');
INSERT INTO cliente (IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) VALUES (NULL, 'Patin', 'Brettor', '430-536-0320', 'Apt 835', 'Consumidor Final', 'Contado');
INSERT INTO cliente (IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) VALUES (NULL, 'Sunshine', 'Kelsow', '592-846-1636', '1st Floor', 'Consumidor Final', 'Contado');

SAVEPOINT mitad;

INSERT INTO cliente (IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) VALUES (NULL, 'Ferne', 'Trangmar', '871-959-5709', 'Room 1426', 'Consumidor Final', 'Contado');
INSERT INTO cliente (IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) VALUES (NULL, 'Barbey', 'Brackley', '472-786-4883', 'PO Box 19996', 'Consumidor Final', 'Contado');
INSERT INTO cliente (IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) VALUES (NULL, 'Charlean', 'Vlasyuk', '297-589-5414', 'Room 1518', 'Consumidor Final', 'Contado');
INSERT INTO cliente (IDcliente, nombre_cliente, apellido_cliente, telefono_cliente, direccion_cliente, condicionIVA, condicion_vta) VALUES (NULL, 'Betteanne', 'Wathan', '143-924-2842', 'PO Box 62358', 'Consumidor Final', 'Contado');

COMMIT;

-- RELEASE SAVEPOINT mitad; 

