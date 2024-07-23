CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50)
);

CREATE TABLE productss (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    supplier_id INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,  
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES productss(product_id)
);

INSERT INTO categories (category_id, category_name) VALUES
    (1, 'Electronics'),
    (2, 'Clothing'),
    (3, 'Books');

INSERT INTO suppliers (supplier_id, supplier_name) VALUES
    (1, 'Supplier A'),
    (2, 'Supplier B'),
    (3, 'Supplier C');


INSERT INTO productss (product_id, product_name, category_id, supplier_id, unit_price) VALUES
    (1, 'Smartphone', 1, 1, 699.99),
    (2, 'Laptop', 1, 2, 1299.99),
    (3, 'T-shirt', 2, 3, 19.99),
    (4, 'Book - SQL Basics', 3, 1, 29.99);


INSERT INTO order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES
    (1, 1001, 1, 2, 699.99),
    (2, 1001, 2, 1, 1299.99),
    (3, 1002, 3, 3, 19.99),
    (4, 1003, 1, 1, 699.99),
    (5, 1003, 4, 2, 29.99);




SELECT 
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.unit_price,
    SUM(od.quantity) AS total_ordered_quantity,
    AVG(od.unit_price) AS avg_unit_price_ordered
FROM 
    productss p
JOIN 
    categories c ON p.category_id = c.category_id
JOIN 
    suppliers s ON p.supplier_id = s.supplier_id
LEFT JOIN 
    order_details od ON p.product_id = od.product_id
WHERE 
    p.unit_price > 50
GROUP BY 
    p.product_id, p.product_name, c.category_name, s.supplier_name, p.unit_price
HAVING 
    SUM(od.quantity) > 0
ORDER BY 
    total_ordered_quantity DESC;

