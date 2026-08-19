/* ============================================================
   PROYECTO SQL B�SICO - FINANZAS PRO
   Motor: SQL Server (T-SQL)
   ============================================================ */

-- 1. CREACI�N DE LA BASE DE DATOS
CREATE DATABASE finanzasPro;
GO

USE finanzasPro;
GO

-- 2. CREACI�N DE TABLAS
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    segmento VARCHAR(50) NOT NULL
);
GO

CREATE TABLE servicios (
    id_servicio INT PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    precio_lista DECIMAL(10,2) NOT NULL,
    costo_estimado DECIMAL(10,2) NOT NULL
);
GO

CREATE TABLE categorias_gasto (
    id_categoria_gasto INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL
);
GO

CREATE TABLE ventas (
    id_venta INT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_servicio INT NOT NULL,
    cantidad INT NOT NULL,
    descuento DECIMAL(5,2) NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_servicio) REFERENCES servicios(id_servicio)
);
GO

CREATE TABLE gastos (
    id_gasto INT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_categoria_gasto INT NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_categoria_gasto) REFERENCES categorias_gasto(id_categoria_gasto)
);
GO

-- 3. INSERCI�N DE DATOS

INSERT INTO clientes (id_cliente, nombre_cliente, pais, segmento) VALUES
(1, 'Comercial Andes', 'Chile', 'Empresa'),
(2, 'Retail Express', 'Chile', 'Retail'),
(3, 'Inversiones Norte', 'Per�', 'Empresa'),
(4, 'Global Market', 'Colombia', 'Empresa'),
(5, 'Emprende F�cil', 'Chile', 'Pyme'),
(6, 'Distribuidora Lima', 'Per�', 'Distribuidor'),
(7, 'Servicios Patagonia', 'Chile', 'Pyme'),
(8, 'Caf� Central', 'Chile', 'Pyme'),
(9, 'Tech Solutions', 'M�xico', 'Empresa'),
(10, 'Consultora Sur', 'Argentina', 'Empresa');
GO

INSERT INTO servicios (id_servicio, nombre_servicio, precio_lista, costo_estimado) VALUES
(1, 'Asesor�a financiera b�sica', 300, 90),
(2, 'Planificaci�n presupuestaria', 450, 140),
(3, 'An�lisis de rentabilidad', 600, 220),
(4, 'Implementaci�n dashboard financiero', 900, 350),
(5, 'Auditor�a de gastos', 500, 180),
(6, 'Proyecci�n de flujo de caja', 750, 280);
GO

INSERT INTO categorias_gasto (id_categoria_gasto, nombre_categoria) VALUES
(1, 'Sueldos'),
(2, 'Arriendo'),
(3, 'Marketing'),
(4, 'Software'),
(5, 'Servicios b�sicos'),
(6, 'Transporte'),
(7, 'Impuestos'),
(8, 'Capacitaci�n');
GO

INSERT INTO ventas (id_venta, fecha, id_cliente, id_servicio, cantidad, descuento, metodo_pago) VALUES
(1, '2024-01-05', 1, 1, 1, 0.00, 'Transferencia'),
(2, '2024-01-10', 2, 2, 1, 0.05, 'Tarjeta'),
(3, '2024-01-15', 5, 1, 2, 0.00, 'Transferencia'),
(4, '2024-01-22', 3, 3, 1, 0.10, 'Transferencia'),
(5, '2024-02-03', 4, 4, 1, 0.00, 'Transferencia'),
(6, '2024-02-08', 8, 2, 1, 0.00, 'Tarjeta'),
(7, '2024-02-14', 6, 5, 1, 0.05, 'Transferencia'),
(8, '2024-02-20', 1, 6, 1, 0.00, 'Transferencia'),
(9, '2024-03-02', 7, 1, 1, 0.00, 'Tarjeta'),
(10, '2024-03-07', 9, 4, 1, 0.10, 'Transferencia'),
(11, '2024-03-12', 10, 3, 1, 0.00, 'Transferencia'),
(12, '2024-03-18', 2, 5, 1, 0.00, 'Tarjeta'),
(13, '2024-04-04', 3, 6, 1, 0.05, 'Transferencia'),
(14, '2024-04-09', 5, 2, 2, 0.00, 'Transferencia'),
(15, '2024-04-16', 4, 3, 1, 0.00, 'Tarjeta'),
(16, '2024-04-25', 8, 1, 1, 0.00, 'Transferencia'),
(17, '2024-05-03', 1, 4, 1, 0.05, 'Transferencia'),
(18, '2024-05-11', 6, 6, 1, 0.00, 'Transferencia'),
(19, '2024-05-17', 9, 3, 2, 0.10, 'Tarjeta'),
(20, '2024-05-23', 10, 5, 1, 0.00, 'Transferencia'),
(21, '2024-06-05', 2, 1, 2, 0.00, 'Tarjeta'),
(22, '2024-06-12', 7, 2, 1, 0.05, 'Transferencia'),
(23, '2024-06-18', 4, 6, 1, 0.00, 'Transferencia'),
(24, '2024-06-26', 3, 4, 1, 0.10, 'Transferencia');
GO

INSERT INTO gastos (id_gasto, fecha, id_categoria_gasto, descripcion, monto) VALUES
(1, '2024-01-03', 1, 'Pago sueldo equipo', 1200),
(2, '2024-01-05', 2, 'Arriendo oficina', 500),
(3, '2024-01-12', 3, 'Campa�a publicidad', 250),
(4, '2024-01-20', 4, 'Licencias software', 180),
(5, '2024-02-03', 1, 'Pago sueldo equipo', 1200),
(6, '2024-02-05', 2, 'Arriendo oficina', 500),
(7, '2024-02-10', 5, 'Luz e internet', 160),
(8, '2024-02-18', 6, 'Movilizaci�n reuniones', 90),
(9, '2024-03-03', 1, 'Pago sueldo equipo', 1300),
(10, '2024-03-05', 2, 'Arriendo oficina', 500),
(11, '2024-03-15', 3, 'Anuncios redes sociales', 300),
(12, '2024-03-22', 7, 'Pago impuestos', 280),
(13, '2024-04-03', 1, 'Pago sueldo equipo', 1300),
(14, '2024-04-05', 2, 'Arriendo oficina', 500),
(15, '2024-04-14', 4, 'Software financiero', 220),
(16, '2024-04-26', 8, 'Curso equipo financiero', 350),
(17, '2024-05-03', 1, 'Pago sueldo equipo', 1400),
(18, '2024-05-05', 2, 'Arriendo oficina', 500),
(19, '2024-05-12', 3, 'Campa�a captaci�n clientes', 400),
(20, '2024-05-21', 5, 'Servicios b�sicos', 170),
(21, '2024-06-03', 1, 'Pago sueldo equipo', 1400),
(22, '2024-06-05', 2, 'Arriendo oficina', 500),
(23, '2024-06-14', 7, 'Pago impuestos', 350),
(24, '2024-06-24', 6, 'Transporte comercial', 120);
GO

-- 4. VALIDACI�N DE QUE LAS TABLAS TENGAN DATOS
SELECT * FROM clientes;
SELECT * FROM servicios;
SELECT * FROM ventas;
SELECT * FROM categorias_gasto;
SELECT * FROM gastos;
GO

-- 5. CONSULTA B�SICA DE VENTAS (cliente, servicio, cantidad, precio, descuento)
SELECT
    v.id_venta,
    v.fecha,
    c.nombre_cliente,
    s.nombre_servicio,
    v.cantidad,
    s.precio_lista,
    v.descuento
FROM ventas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
ORDER BY v.id_venta;
GO

-- 6. TOTAL VENDIDO POR VENTA
SELECT
    v.id_venta,
    v.fecha,
    c.nombre_cliente,
    s.nombre_servicio,
    v.cantidad,
    s.precio_lista,
    v.descuento,
    v.cantidad * s.precio_lista * (1 - v.descuento) AS total_venta
FROM ventas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
ORDER BY v.id_venta;
GO

-- 7. VENTAS POR CLIENTE (mayor a menor)
SELECT
    c.id_cliente,
    c.nombre_cliente,
    SUM(v.cantidad * s.precio_lista * (1 - v.descuento)) AS total_vendido
FROM ventas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
GROUP BY c.id_cliente, c.nombre_cliente
ORDER BY total_vendido DESC;
GO

-- 8. GASTOS POR CATEGOR�A
SELECT
    cg.nombre_categoria,
    SUM(g.monto) AS total_gastado
FROM gastos g
JOIN categorias_gasto cg ON cg.id_categoria_gasto = g.id_categoria_gasto
GROUP BY cg.nombre_categoria
ORDER BY total_gastado DESC;
GO

-- 9. UTILIDAD BRUTA POR VENTA
SELECT
    v.id_venta,
    c.nombre_cliente,
    s.nombre_servicio,
    v.cantidad,
    s.precio_lista,
    s.costo_estimado,
    v.descuento,
    v.cantidad * (s.precio_lista * (1 - v.descuento) - s.costo_estimado) AS utilidad_bruta
FROM ventas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
ORDER BY utilidad_bruta DESC;
GO

-- 10. PREGUNTAS DE AN�LISIS

-- 10.1 Cliente con mayor total vendido
SELECT TOP 1
    c.nombre_cliente,
    SUM(v.cantidad * s.precio_lista * (1 - v.descuento)) AS total_vendido
FROM ventas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
GROUP BY c.nombre_cliente
ORDER BY total_vendido DESC;
GO

-- 10.2 Categor�a con mayor gasto acumulado
SELECT TOP 1
    cg.nombre_categoria,
    SUM(g.monto) AS total_gastado
FROM gastos g
JOIN categorias_gasto cg ON cg.id_categoria_gasto = g.id_categoria_gasto
GROUP BY cg.nombre_categoria
ORDER BY total_gastado DESC;
GO

-- 10.3 Venta con mayor total vendido
SELECT TOP 1
    v.id_venta,
    c.nombre_cliente,
    s.nombre_servicio,
    v.cantidad * s.precio_lista * (1 - v.descuento) AS total_venta
FROM ventas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
ORDER BY total_venta DESC;
GO

-- 10.4 Venta con mayor utilidad bruta
SELECT TOP 1
    v.id_venta,
    c.nombre_cliente,
    s.nombre_servicio,
    v.cantidad * (s.precio_lista * (1 - v.descuento) - s.costo_estimado) AS utilidad_bruta
FROM ventas v
JOIN clientes c ON c.id_cliente = v.id_cliente
JOIN servicios s ON s.id_servicio = v.id_servicio
ORDER BY utilidad_bruta DESC;
GO

-- 10.5 Comparaci�n: gastos totales vs ventas totales
SELECT
    (SELECT SUM(v.cantidad * s.precio_lista * (1 - v.descuento))
     FROM ventas v JOIN servicios s ON s.id_servicio = v.id_servicio) AS ventas_totales,
    (SELECT SUM(monto) FROM gastos) AS gastos_totales;
GO