CREATE DATABASE E_com;
SHOW DATABASES;
USE E_com;

CREATE TABLE category (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(50) NOT NULL,
    c_description VARCHAR(100) NOT NULL
);

CREATE TABLE product (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(50) NOT NULL,
    c_id INT,
    FOREIGN KEY (c_id) REFERENCES category(c_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE price (
    price_id INT PRIMARY KEY,
    p_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (p_id) REFERENCES product(p_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
SHOW TABLES;

INSERT INTO category VALUES 
(101, 'furniture', 'Wooden and Steel Items'),
(102, 'electronics', 'Home and personal gadgets'),
(103, 'clothing', 'Men and Women apparel'),
(104, 'kitchenware', 'Cooking and dining items');

INSERT INTO product VALUES
(201, 'Chair', 101),
(202, 'Table', 101),
(203, 'Sofa', 101),
(204, 'Smartphone', 102),
(205, 'Laptop', 102),
(206, 'T-Shirt', 103),
(207, 'Jeans', 103),
(208, 'Microwave', 104),
(209, 'Mixer Grinder', 104);

INSERT INTO price VALUES
(301, 201, 1500.00),
(302, 202, 2500.00),
(303, 203, 8000.00),
(304, 204, 20000.00),
(305, 205, 55000.00),
(306, 206, 800.00),
(307, 207, 1200.00),
(308, 208, 9000.00),
(309, 209, 3500.00);

SELECT * FROM category;
SELECT * FROM product;
SELECT * FROM price;

DELETE FROM product WHERE p_id=204;

UPDATE product 
SET p_name = 'Desktop', c_id = 101 
WHERE p_id = 205;

SELECT * FROM product
WHERE p_name LIKE 'd%';

DELETE FROM product
WHERE p_name LIKE '%s';


#aliases
SELECT p_name AS name, c_id AS category
FROM product;
SELECT c_id AS id, c_name AS name 
FROM category;

#like
SELECT * FROM product WHERE p_name LIKE 'c%';
SELECT * FROM product WHERE p_name LIKE '%r';
SELECT * FROM product WHERE p_name LIKE '%top%';
SELECT * FROM product WHERE p_name LIKE '_a%';

#views
CREATE VIEW product_view AS
SELECT p_name, c_id
FROM product;
SELECT * FROM product_view;

CREATE OR REPLACE VIEW category_view AS
SELECT c_id, c_name
FROM category;
SELECT * FROM category_view;

DROP VIEW product_view;