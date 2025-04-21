# ☕ Create Your Own Coffee – Proyecto SQL

Este proyecto consiste en el diseño e implementación de una base de datos relacional para un e-commerce de cafés personalizados. Fue desarrollado como parte de un trabajo práctico integrador con foco en el modelado, mantenimiento y explotación de una base de datos en SQL.

## 📌 Modelo de negocio

“Create Your Own Coffee” es una tienda online de cápsulas de café en la que los clientes pueden personalizar su propio café a partir de ingredientes seleccionados desde una plataforma web. El negocio apunta a ofrecer una experiencia única y personalizada para los amantes del café.

---

## 🎯 Objetivos del proyecto

- Crear una base de datos relacional desde cero (modelado, creación e inserción de datos).
- Desarrollar objetos de base de datos como funciones, procedimientos almacenados y triggers.
- Ejecutar consultas SQL para la generación de reportes de negocio.
- Implementar un modelo de auditoría y mantenimiento.

---

## 🧩 Componentes del proyecto

- Modelo E-R (Diagrama Entidad-Relación).
- Listado de tablas con descripción de columnas, tipos de datos y claves.
- Scripts SQL de:
  - Creación de tablas y relaciones
  - Inserción de datos
  - Vistas
  - Funciones definidas por el usuario
  - Procedimientos almacenados (Stored Procedures)
  - Triggers
- Consultas SQL para informes de negocio
- Documentación en PDF

---

## 🔍 Consultas e informes generados

- **Top 5 clientes por facturación total**
- **Productos más vendidos (% del total de ventas)**
- **Evolución mensual de ventas en pesos ($)**  
  → Se detectó estacionalidad en la facturación, con picos en los meses fríos.

---

## ⚙️ Stored Procedures destacados

- `sp_add_producto`: Inserta nuevos productos con múltiples parámetros.
- `sp_nombre_producto_order`: Devuelve listado de productos ordenados por el campo indicado.
- `sp_buscar_producto`: Busca productos por coincidencia parcial del nombre.
- `sp_buscar_prov`: Busca proveedores por coincidencia parcial del nombre.
- `sp_add_cliente`: Inserta nuevos clientes en la base de datos.

---

## 🚨 Triggers implementados

| Trigger               | Tabla Monitoreada | Acción       | Tabla de Log       | Descripción                                |
|----------------------|-------------------|--------------|--------------------|--------------------------------------------|
| Tr_add_new_productos | productos         | AFTER INSERT | Log_productos      | Registra la creación de productos nuevos   |
| Tr_new_precios       | productos         | BEFORE UPDATE| Log_precios        | Registra los cambios de precio             |
| Tr_add_new_factura   | facturas          | AFTER INSERT | Log_facturas       | Registra la creación de nuevas facturas    |
| Tr_delete_factura    | facturas          | AFTER DELETE | Log_facturas       | Registra eliminación de facturas           |
| Tr_new_cliente       | cliente           | AFTER INSERT | Log_clientes       | Registra la creación de nuevos clientes    |
| Tr_delete_cliente    | cliente           | AFTER DELETE | Log_clientes       | Registra eliminación de clientes           |

---

## 📊 Herramientas utilizadas

- **MySQL / MySQL Workbench** – Base de datos y consultas
- **Draw.io** – Modelado del Diagrama E-R
- **Microsoft Excel** – Apoyo en análisis y tabulados
- **PDF** – Documentación estructurada del proyecto

---

## 📁 Estructura de archivos
README.md: Archivo con la descripción general del proyecto.
scriptFINAL.sql: Contiene todo el código SQL utilizado para crear la base de datos de la cafetería, incluyendo tablas, stored procedures y triggers.
SQL_ProyectoFinal.pdf: Documento de presentación del proyecto, donde se expone la estructura de la base de datos, gráficos y análisis realizados.

