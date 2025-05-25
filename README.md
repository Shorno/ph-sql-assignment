# PostgreSQL and SQL Concepts with Examples

## 1. What is PostgreSQL?

PostgreSQL is an advanced, open-source relational database management system (RDBMS) known for its reliability, extensibility, and support for SQL standards. It is used to store, manage, and retrieve structured data efficiently.

**Example**: Creating a simple PostgreSQL table

```sql
CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  position VARCHAR(50)
);
```

---

## 2. What is the purpose of a database schema in PostgreSQL?

A database schema in PostgreSQL is a logical container that organizes database objects such as tables, views, and functions. It helps group related objects, manage permissions, and avoid naming conflicts within a database.

**Example**: Creating a new schema and a table inside it

```sql
CREATE SCHEMA hr;

CREATE TABLE hr.employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  department VARCHAR(50)
);
```

---

## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

* **Primary Key**: A column or set of columns that uniquely identifies each row in a table.
* **Foreign Key**: A column or set of columns in one table that refers to the primary key of another table.

**Example**: Defining a primary key and foreign key relationship

```sql
CREATE TABLE departments (
  dept_id SERIAL PRIMARY KEY,
  dept_name VARCHAR(100)
);

CREATE TABLE employees (
  emp_id SERIAL PRIMARY KEY,
  emp_name VARCHAR(100),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```

---

## 4. What is the difference between the VARCHAR and CHAR data types?

* **VARCHAR(n)**: Stores variable-length strings up to `n` characters.
* **CHAR(n)**: Stores fixed-length strings padded with spaces.

**Example**:

```sql
CREATE TABLE test_types (
  name_v VARCHAR(10),
  name_c CHAR(10)
);

INSERT INTO test_types (name_v, name_c) VALUES ('Alex', 'Alex');
-- name_c will store 'Alex      ' (with padding)
```

---

## 5. Explain the purpose of the WHERE clause in a SELECT statement.

The `WHERE` clause filters rows returned by a `SELECT` statement based on specific conditions.

**Example**:

```sql
SELECT * FROM employees
WHERE department = 'Sales';
```

This will return only those employees who work in the Sales department.

