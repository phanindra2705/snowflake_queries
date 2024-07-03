CREATE DATABASE my_database;


SHOW DATABASES;

USE DATABASE my_database;

CREATE SCHEMA my_schema;

CREATE TABLE my_schema.employees (
    employee_id INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE,
    department_id INTEGER,
    salary DECIMAL(10, 2)
);

INSERT INTO my_schema.employees (employee_id, first_name, last_name, hire_date, department_id, salary)
VALUES
    (1, 'John', 'Doe', '2023-01-15', 1, 50000.00),
    (2, 'Jane', 'Smith', '2022-03-20', 2, 60000.00),
    (3, 'Michael', 'Johnson', '2023-02-10', 3, 70000.00);


SELECT * FROM employees;


SELECT *
FROM my_schema.employees
WHERE department_id = 1;


UPDATE my_schema.employees
SET salary = salary * 1.1
WHERE hire_date < '2023-01-16';



