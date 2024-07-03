CREATE TABLE projects (
    id INT AUTOINCREMENT,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY(id)
);

ALTER TABLE employees
ADD COLUMN email VARCHAR(100);


select * from projects;

INSERT INTO projects (project_name, start_date, end_date)
VALUES 
    ('Project Beta', '2024-02-01', '2024-07-01'),
    ('Project Gamma', '2024-03-01', '2024-08-01'),
    ('Project Delta', '2024-04-01', '2024-09-01');