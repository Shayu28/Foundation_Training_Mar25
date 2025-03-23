-- SQL query to retrieve the names and emails of all customers. 
SELECT Firstname, lastname, email FROM Customers

-- SQL query to list all orders with their order dates and corresponding customer names

-- SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(11,'Michelle','Jonas','michellejonas@mail.com',8838187704,'Anna nagar')


-- SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
UPDATE Products
SET Price = Price * 1.10


-- SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter
DELETE FROM OrderDetails
WHERE order_id = @order_id;

DELETE FROM Orders
WHERE order_id = @order_id;

--SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(11, 11, '2024-03-10', 65000)


-- SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact
--information
UPDATE Customers SET Email = 'mj@mail.com', Address = 'Egmore' WHERE CustomerID = 11


-- SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table
UPDATE Orders
SET TotalCost = (
    SELECT SUM(od.quantity * p.price)
    FROM OrderDetails od
    JOIN Products p ON od.product_id = p.product_id 
    WHERE od.order_id = Orders.order_id
)

-- SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
-- as a parameter
DELETE FROM OrderDetails 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 11);

DELETE FROM Orders WHERE CustomerID = 11;


-- SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(11,'Smart TV', '32 inches LED TV', 80000)


-- SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
UPDATE Orders
SET Status = @NewStatus
WHERE order_id = @OrderID

-- SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table
UPDATE Customers
SET order_count = (
    SELECT COUNT(o.order_id)
    FROM Orders o
    WHERE o.customer_id = Customers.customer_id
)
