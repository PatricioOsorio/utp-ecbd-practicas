-- ===============================================
-- CREACION DE LA BD
-- ===============================================
-- Borra la base de datos si ya existe
USE master;

IF EXISTS ( SELECT name FROM master.dbo.sysdatabases WHERE name = N'heladeria')
BEGIN DROP DATABASE heladeria;
END

-- Crea una nueva base de datos
CREATE DATABASE heladeria;

-- Utiliza la nueva base de datos
USE heladeria;

-- ===============================================
-- CREACION DE TABLAS
-- ===============================================
CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY IDENTITY NOT NULL,
  nombre VARCHAR(100),
  direccion VARCHAR(200),
  telefono VARCHAR(15)
);

CREATE TABLE productos (
  id_producto INT PRIMARY KEY IDENTITY NOT NULL,
  nombre VARCHAR(100),
  precio DECIMAL(8, 2),
  descripcion VARCHAR(200)
);

CREATE TABLE ventas (
  id_venta INT PRIMARY KEY IDENTITY NOT NULL,
  id_cliente INT,
  id_producto INT,
  fecha_venta DATE,
  cantidad INT,
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
  FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- ===============================================
-- INSERCION DE DATOS
-- ===============================================
INSERT INTO clientes (nombre, direccion, telefono)
VALUES
  ('Juan Pérez', 'Calle 123, Ciudad', '1234567890'),
  ('María Rodríguez', 'Avenida 456, Ciudad', '9876543210'),
  ('Pedro Gómez', 'Calle Principal, Ciudad', '4567890123'),
  ('Laura López', 'Avenida Central, Ciudad', '0123456789'),
  ('Carlos Ramírez', 'Calle Secundaria, Ciudad', '6789012345'),
  ('Ana Martínez', 'Avenida Principal, Ciudad', '3456789012'),
  ('Luisa Herrera', 'Calle 789, Ciudad', '9012345678'),
  ('Javier Torres', 'Avenida 789, Ciudad', '2345678901'),
  ('Sofía Castro', 'Calle Final, Ciudad', '8901234567'),
  ('Daniel Vargas', 'Avenida Final, Ciudad', '5678901234');


INSERT INTO productos (nombre, precio, descripcion)
VALUES
  ('Helado de vainilla', 2.50, NULL),
  ('Helado de chocolate', 2.50, NULL),
  ('Helado de fresa', 2.50, NULL),
  ('Helado de cookies and cream', 3.00, NULL),
  ('Helado de pistacho', 3.00, NULL),
  ('Helado de dulce de leche', 3.00, 'Delicioso helado de dulce de leche argentino'),
  ('Helado de limón', 2.50, 'Refrescante helado de limón con un toque cítrico'),
  ('Helado de frutas tropicales', 3.50, 'Delicioso helado de mezcla de frutas tropicales'),
  ('Helado de mango', 3.50, 'Exótico helado de mango con trozos de fruta'),
  ('Helado de coco', 2.50, 'Cremoso helado de coco con trozos de coco rallado'),
  ('Helado de menta con chips de chocolate', 3.00, 'Refrescante helado de menta con trozos de chocolate'),
  ('Helado de avellana', 3.00, 'Delicioso helado de avellana con trozos de nuez'),
  ('Helado de stracciatella', 3.00, 'Irresistible helado de vainilla con virutas de chocolate'),
  ('Helado de nata', 2.50, 'Cremoso helado de nata con un suave sabor'),
  ('Helado de café', 2.50, 'Delicioso helado de café para los amantes del café'),
  ('Helado de cookies', 3.00, 'Irresistible helado de cookies con trozos de galleta'),
  ('Helado de yogur con frutas del bosque', 3.50, 'Helado de yogur con una mezcla de frutas del bosque'),
  ('Helado de chocolate blanco', 3.00, 'Delicioso helado de chocolate blanco cremoso'),
  ('Helado de tiramisú', 3.00, 'Exquisito helado de tiramisú con sabor a café y bizcochos'),
  ('Helado de piña colada', 3.50, 'Refrescante helado de piña colada con sabor tropical');

-- Generar fechas aleatorias en el rango de los últimos 6 meses
DECLARE @fecha_aleatoria DATE;

-- Insertar 100 registros de ventass aleatorias
DECLARE @contador INT = 1;
DECLARE @id_cliente INT, @id_producto INT, @cantidad INT;

WHILE @contador <= 100
BEGIN
  SET @id_cliente = FLOOR(1 + (RAND() * 10));
  SET @id_producto = FLOOR(1 + (RAND() * 20));
  SET @cantidad = FLOOR(1 + (RAND() * 5));
  SET @fecha_aleatoria = DATEADD(DAY, -FLOOR(RAND() * 180), GETDATE());
  
  INSERT INTO ventas (id_cliente, id_producto, fecha_venta, cantidad)
  VALUES (@id_cliente, @id_producto, @fecha_aleatoria, @cantidad);
  
  SET @contador = @contador + 1;
END;

SELECT * FROM ventas;