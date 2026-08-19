# proyecto-sql-finanzas-pro
Creación de base de datos + consultas

Proyecto SQL Básico — Finanzas Pro
Base de datos relacional en SQL Server para la empresa ficticia Finanzas Pro, que ofrece servicios de asesoría financiera. El proyecto organiza la información de clientes, servicios, ventas, categorías de gasto y gastos operacionales, y desarrolla consultas SQL para responder preguntas de análisis financiero.
Descripción del proyecto
Finanzas Pro necesitaba pasar de tener su información dispersa en Excel a contar con una base de datos ordenada, donde cada dato estuviera en su lugar correcto y conectado con el resto de la información del negocio. Este proyecto construye esa base de datos desde cero: se crean las tablas, se conectan entre sí mediante llaves primarias y foráneas, se cargan los datos reales de la empresa, y finalmente se escriben consultas SQL para responder preguntas de negocio como cuál es el cliente más importante, en qué se gasta más dinero, y si la empresa está generando ganancia.
Estructura de la base de datos
La base de datos finanzasPro contiene 5 tablas:

Tabla
Descripción
clientes
Empresas que contratan servicios a Finanzas Pro (10 registros)
servicios
Catálogo de servicios ofrecidos, con precio de lista y costo estimado (6 registros)
ventas
Registro de cada venta realizada, conectada a clientes y servicios (24 registros)
categorias_gasto
Tipos de gasto operacional de la empresa (8 registros)
gastos
Registro de cada gasto realizado, conectado a categorias_gasto (24 registros)

Relaciones
ventas.id_cliente → clientes.id_cliente
ventas.id_servicio → servicios.id_servicio
gastos.id_categoria_gasto → categorias_gasto.id_categoria_gasto
Contenido del repositorio
Proyecto_finanzas_pro.sql — script completo: creación de la base de datos, creación de tablas con sus relaciones, inserción de todos los datos, y las 6 consultas de análisis financiero requeridas.
Consultas desarrolladas
Validación de datos: confirma que las 5 tablas contengan información cargada.
Consulta básica de ventas: muestra cada venta junto con el nombre del cliente, el nombre del servicio, cantidad, precio y descuento, uniendo las tablas ventas, clientes y servicios.
Total vendido por venta: calcula el monto real de cada venta con la fórmula cantidad × precio_lista × (1 − descuento).
Ventas por cliente: suma el total vendido a cada cliente y lo ordena de mayor a menor.
Gastos por categoría: suma el total gastado en cada categoría y lo ordena de mayor a menor.
Utilidad bruta por venta: calcula la ganancia real de cada venta con la fórmula cantidad × (precio_lista × (1 − descuento) − costo_estimado).
Resultados del análisis
Pregunta
Respuesta
¿Qué cliente tiene el mayor total vendido?
Global Market, con $2.250
¿Qué categoría presenta el mayor gasto acumulado?
Sueldos, con $7.800
¿Cuál fue la venta con mayor total vendido?
Venta N.º 19 (Tech Solutions — Análisis de rentabilidad), con $1.080
¿Qué venta generó la mayor utilidad bruta?
Venta N.º 19 (Tech Solutions — Análisis de rentabilidad), con $640
¿Los gastos totales son menores o mayores que las ventas totales?
Los gastos totales ($13.670) son menores que las ventas totales ($14.937,5)


En el período analizado, Finanzas Pro generó un margen positivo de aproximadamente $1.267,5 entre lo vendido y lo gastado.
Herramientas utilizadas
Motor de base de datos: SQL Server (T-SQL)
Cliente: SQL Server Management Studio (SSMS)
Fuente de datos: archivo Excel entregado con la información de clientes, servicios, ventas, categorías de gasto y gastos
Cómo ejecutar el proyecto
Abrir SQL Server Management Studio y conectarse a una instancia de SQL Server.
Abrir el archivo Proyecto_finanzas_pro.sql.
Ejecutar el script completo (o por bloques, separados por GO), en orden: creación de la base de datos, creación de tablas, inserción de datos, y finalmente las consultas de análisis.

