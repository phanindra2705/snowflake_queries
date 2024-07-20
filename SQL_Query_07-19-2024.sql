-- Create a temporary table for demonstration
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    hire_date DATE
);

CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert sample data into departments table
INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'IT');

-- Insert sample data into employees table
INSERT INTO employees (employee_id, employee_name, department_id, salary, hire_date)
VALUES
    (101, 'phani', 1, 60000.00, '2018-01-15'),
    (102, 'Phanindra', 2, 70000.00, '2019-05-20'),
    (103, 'Sandeep', 3, 80000.00, '2017-08-10'),
    (104, 'sri', 1, 55000.00, '2020-02-28'),
    (105, 'ysn', 2, 75000.00, '2016-11-12');

-- Query to retrieve employees who have been hired before 2019 and belong to departments with average salary greater than $60,000
SELECT 
    employee_name,
    hire_date,
    salary,
    d.department_name
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    hire_date < '2019-01-01'
    AND e.department_id IN (
        SELECT 
            department_id
        FROM 
            departments
        WHERE 
            (SELECT AVG(salary) FROM employees WHERE department_id = departments.department_id) > 60000.00
    );
