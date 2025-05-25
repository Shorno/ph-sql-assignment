# PostgreSQL and SQL Concepts

## 1. What is PostgreSQL?
PostgreSQL is an advanced, open-source relational database management system (RDBMS) known for its reliability, extensibility, and support for SQL standards. It is used to store, manage, and retrieve structured data efficiently.

## 2. What is the purpose of a database schema in PostgreSQL?
A database schema in PostgreSQL is a logical container that organizes database objects such as tables, views, and functions. It helps group related objects, manage permissions, and avoid naming conflicts within a database.

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
- **Primary Key**: A column or set of columns that uniquely identifies each row in a table. It ensures that no duplicate or NULL values exist in the key columns.
- **Foreign Key**: A column or set of columns in one table that references the primary key of another table. It enforces referential integrity by ensuring that values in the foreign key column correspond to existing values in the referenced table.

## 4. What is the difference between the VARCHAR and CHAR data types?
- **VARCHAR(n)**: Stores variable-length character strings up to `n` characters. It uses only as much space as needed for the actual data.
- **CHAR(n)**: Stores fixed-length character strings. If the data is shorter than `n`, it is padded with spaces to reach the specified length.

## 5. Explain the purpose of the WHERE clause in a SELECT statement.
The `WHERE` clause filters rows returned by a `SELECT` statement based on specified conditions. It allows you to retrieve only those rows that meet the criteria defined in the clause.
