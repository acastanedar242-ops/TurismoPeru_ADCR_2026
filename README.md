## 🏦 Proyecto Base de Datos: Sistema de Gestión Turismo Perú

## 📘 Descripción General
El proyecto "Turismo Perú" consiste en el diseño, desarrollo e implementación de una base de datos relacional robusta para automatizar y gestionar las operaciones principales de una agencia de viajes y turismo. Utilizando el esquema personalizado `ADCR`, el sistema centraliza la información de entidades clave, permitiendo la gestión eficiente de clientes, reservas, paquetes turísticos, disponibilidad de alojamientos y control de pagos. 

El modelo de datos incluye tablas estructuradas (como `cliente`, `reserva`, `alojamiento`, `paquete`, `pago` y `persona`) conectadas mediante relaciones de integridad referencial para garantizar la consistencia de la información.

## 🚀 Fases del Proyecto
1. **Modelado Conceptual y Lógico:** Diseño del Diagrama Entidad-Relación (DER) y normalización de datos.
2. **Creación de la Estructura (DDL):** Creación de la base de datos `TURISMOPERU_ADCR`, esquemas y tablas con sus respectivas restricciones (Primary Keys, Foreign Keys, Checks).
3. **Población de Datos (DML):** Inserción de datos maestros y catálogos (regiones, tipos de documento, estados de reserva).
4. **Desarrollo de Lógica de Negocio:** Creación de Procedimientos Almacenados (Stored Procedures) para automatizar transacciones complejas.
5. **Implementación de Seguridad y Validaciones:** Uso de bloques `TRY...CATCH` y transacciones (`BEGIN TRAN`, `COMMIT`, `ROLLBACK`) para evitar inconsistencias y asegurar la atomicidad de las operaciones.

## 🧠 Competencias a Desarrollar
* Modelado de bases de datos relacionales y normalización.
* Programación avanzada en **SQL-Server**.
* Creación y optimización de Procedimientos Almacenados.
* Manejo de excepciones y control de errores estructurado.
* Gestión de transacciones para garantizar la integridad de los datos.

## 🗂️ Estructura del Proyecto

```bash
proyecto_TURISMOPERU_ADCR/
│
├── database/
│   └── 1_Create_Database_and_Schema.sql
│   └── 2_Create_Tables_ADCR.sql
│
├── docs/
│   └── diagrama_entidad_relacion.png
│   └── diccionario_de_datos.pdf
│
├── scripts/
│   └── 1_Insert_Master_Data.sql
│   └── 2_Stored_Procedures.sql
│   └── 3_Test_Queries.sql
│
├── README.md

## 🧰 Requisitos Previos

Para poder desarrollar y comprender este proyecto en su totalidad, es necesario contar con las siguientes habilidades y herramientas:

* **Diseño de Bases de Datos Relacionales:** Saber crear tablas, definir relaciones mediante claves primarias (PK) y foráneas (FK), y garantizar la integridad de los datos.
* **Dominio de SQL y T-SQL:** Capacidad para manipular datos y crear consultas estructuradas.
* **Lógica Avanzada de Base de Datos:** Creación de Procedimientos Almacenados (Stored Procedures), manejo seguro de transacciones (`BEGIN TRAN`, `COMMIT`, `ROLLBACK`) y control de errores con `TRY...CATCH`.
* **Integración Backend/Frontend:** Conocimientos para conectar la base de datos con una aplicación web y renderizar los datos en vistas HTML.
* **Visual Studio Code (VS Code):** Como entorno de desarrollo principal para escribir y gestionar el código de la aplicación.
* **SQL Server Management Studio (SSMS):** O cualquier otra herramienta similar para administrar la base de datos y ejecutar los scripts.

## 👨‍🏫 Autor

Proyecto desarrollado aplicando conceptos de Big Data, Python y bases de datos SQL..

**Angel Danny Castañeda Ruíz**
**Esquema:** ADCR
**Fecha:** 08.08.2026
