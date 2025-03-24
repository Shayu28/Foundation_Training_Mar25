USE ECOM

-- customers

CREATE TABLE customers
(
customer_id INT PRIMARY KEY IDENTITY, 
name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
password INT UNIQUE NOT NULL 
)

INSERT INTO customers(name, email, password) VALUES
('Shayu','shayu@mail.com',1001),
('Leo', 'leo@mail.com',1002),
('Rose','rose@mail.com',1003),
('Jack','jack@mail.com',1004),
('Tom','tom@mail.com',1005),
('Peter', 'peter@mail.com',1006),
('Gwen', 'gwen@mail.com',1007),
('Mary', 'mary@mail.com',1008),
('Tony', 'tony@mail.com',1009),
('Sara', 'sara@mail.com',1010)

SELECT * FROM customers


-- products


CREATE TABLE products
(
product_id INT PRIMARY KEY IDENTITY, 
name VARCHAR(50) NOT NULL,
price INT NOT NULL,
description VARCHAR(100) NOT NULL,
stockQuantity INT NOT NULL 
)

INSERT INTO products(name, price, description, stockQuantity) VALUES
('Laptop', 75000, '15.6-inch display, 8GB RAM, 512GB SSD', 10),
('Smartphone', 25000, '6.5-inch display, 6GB RAM, 128GB Storage', 20),
('Wireless Headphones', 5000, 'Bluetooth over-ear noise-canceling', 15),
('Gaming Mouse', 2000, 'RGB lighting, 6 programmable buttons', 30),
('Mechanical Keyboard', 4500, 'Blue switches, RGB backlight', 25),
('Smartwatch', 10000, 'Heart rate monitor, GPS, waterproof', 12),
('Tablet', 30000, '10.5-inch display, 64GB storage, 4GB RAM', 18),
('External Hard Drive', 7000, '1TB storage, USB 3.0', 22),
('Monitor', 15000, '24-inch Full HD, 75Hz refresh rate', 17),
('Bluetooth Speaker', 3500, 'Portable, waterproof, 12-hour battery', 40)

SELECT * FROM products
SELECT * FROM orders
-- cart

CREATE TABLE cart
(
cart_id INT PRIMARY KEY IDENTITY, 
customer_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
)


INSERT INTO cart (customer_id, product_id, quantity) VALUES 
(1, 3, 2),   
(2, 5, 1), 
(3, 2, 3),
(4, 8, 1),
(5, 7, 4),
(6, 6, 2),  
(1, 4, 5),
(7, 1, 1),
(8, 9, 2), 
(10, 10, 3)

SELECT * FROM cart


-- orders

CREATE TABLE orders
(
order_id INT PRIMARY KEY IDENTITY, 
customer_id INT NOT NULL,
order_date DATE NOT NULL,
total_price INT NOT NULL CHECK (total_price > 0),
shipping_address VARCHAR(100) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
)


INSERT INTO orders (customer_id, order_date, total_price, shipping_address) 
VALUES 
(1, '2025-03-10', 15000, 'St. Thomas Mount'),
(2, '2025-03-11', 2500, 'Porur'),
(3, '2025-03-12', 7800, 'Vadapalani'),
(4, '2025-03-13', 9200, 'Manali'),
(5, '2025-03-14', 6500, 'Pallavaram'),
(6, '2025-03-15', 32000, 'Tambaram'),
(7, '2025-03-16', 18000, 'Gunidy'),
(8, '2025-03-17', 5400, 'Park'),
(1, '2025-03-18', 10200, 'St. Thomas Mount'),
(10, '2025-03-19', 7200, 'T nagar')

SELECT * FROM orders



-- order_items 

CREATE TABLE order_items
(
order_item_id INT PRIMARY KEY IDENTITY, 
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT NOT NULL CHECK (quantity > 0),
FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
)


INSERT INTO order_items (order_id, product_id, quantity) VALUES 
(1, 3, 3),   
(2, 5, 1),  
(3, 2, 3),  
(4, 8, 1),
(5, 7, 1),  
(6, 6, 3),  
(7, 4, 4),  
(8, 1, 1),   
(9, 9, 2), 
(10, 10, 2)

SELECT * FROM order_items




























