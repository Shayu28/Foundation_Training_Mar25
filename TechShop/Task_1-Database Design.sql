USE TechShop;

-- CUSTOMERS
CREATE TABLE Customers
(
CustomerID INT PRIMARY KEY, 
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
Phone BIGINT UNIQUE NOT NULL,
Address VARCHAR(100) NOT NULL
)

-- PRODUCTS
CREATE TABLE Products
(
ProductID INT PRIMARY KEY, 
ProductName VARCHAR(50) NOT NULL,
Description VARCHAR(100) NOT NULL,
Price INT NOT NULL
)

-- ORDERS
CREATE TABLE Orders 
(
OrderID INT PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate DATE NOT NULL,
TotalAmount INT CHECK (TotalAmount >= 0),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
)

-- ORDER DETAILS
CREATE TABLE OrderDetails
(
OrderDetailID INT PRIMARY KEY,
OrderID INT NOT NULL,
ProductID INT NOT NULL,
Quantity INT NOT NULL CHECK(Quantity>0),
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

-- INVENTORY
CREATE TABLE Inventory 
(
InventoryID INT PRIMARY KEY,
ProductID INT NOT NULL,
QuantityInStock INT NOT NULL CHECK (QuantityInStock >= 0),
LastStockUpdate DATE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- LOADING DATAS

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1,'Shayu','Syed','shayusyed@mail.com',8838187734,'ST. Thomas Mount'),
(2,'Leo','Das','leodas@mail.com',8838187731,'Adyar'),
(3,'Rose','Dawson','rosedawson@mail.com',8838187732,'Park'),
(4,'Jack','Dawson','jacckdawson@mail.com',8838187733,'Egmore'),
(5,'Tom','Holland','tomholland@mail.com',8838187735,'Pallavaram'),
(6,'Peter','Parker','peterparker@mail.com',8838187736,'Porur'),
(7,'Gwen','Stacy','gwenstacy@mail.com',8838187737,'Tambaram'),
(8,'Mary','Jane','maryjane@mail.com',8838187738,'T nagar'),
(9,'Tony','Stark','tonystark@mail.com',8838187739,'Velachery'),
(10,'Sara','Ali','saraali@mail.com',8838187730,'Thoraipakkam')

SELECT * FROM Customers

INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1,'Laptop', 'High-performance laptop', 65000),
(2, 'Smartphone', 'Latest Android smartphone', 25000),
(3, 'Tablet', '10-inch display tablet', 35000),
(4, 'Headphones', 'Noise-canceling headphones', 5000),
(5, 'Smartwatch', 'Fitness tracking smartwatch', 12000),
(6, 'Keyboard', 'Mechanical keyboard', 3500),
(7, 'Mouse', 'Wireless mouse', 2000),
(8, 'Monitor', '27-inch HD monitor', 15000),
(9, 'Printer', 'All-in-one printer', 12000),
(10, 'External Hard Drive', '5TB storage capacity', 8000)

SELECT * FROM Products

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-03-10', 65000),
(2, 2, '2024-03-12', 25000),
(3, 4, '2024-03-15', 35000),
(4, 9, '2024-03-18', 5000),
(5, 6, '2024-03-20', 12000),
(6, 10, '2024-03-22', 3500),
(7, 7, '2024-03-25', 2000),
(8, 3, '2024-03-27', 15000),
(9, 5, '2024-03-29', 12000),
(10, 8, '2024-03-30', 8000)

SELECT * FROM Orders

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1);

SELECT * FROM OrderDetails

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 20, '2024-03-01'),
(2, 2, 50, '2024-03-02'),
(3, 3, 8, '2024-03-03'),
(4, 4, 70, '2024-03-04'),
(5, 5, 25, '2024-03-05'),
(6, 6, 50, '2024-03-06'),
(7, 7, 50, '2024-03-07'),
(8, 8, 15, '2024-03-08'),
(9, 9, 5, '2024-03-09'),
(10, 10, 15, '2024-03-10')

SELECT * FROM Inventory

-- Execution
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;