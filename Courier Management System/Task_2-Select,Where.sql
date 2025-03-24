-- 1. List all customers
SELECT * FROM Users

-- 2. List all orders for a specific customer
SELECT * FROM Courier
WHERE CourierID = 3;

-- 3. List all couriers
SELECT * FROM Courier

-- 4. List all packages for a specific order
SELECT * FROM Courier WHERE CourierID = 5

-- 5. List all deliveries for a specific courier
SELECT * FROM Courier WHERE CourierID = 5

-- 6. List all undelivered packages
SELECT * FROM Courier WHERE Status NOT IN ('Delivered')

-- 7. List all packages that are scheduled for delivery today
SELECT * FROM Courier WHERE DeliveryDate = '2025-03-25'

-- 8. List all packages with a specific status
SELECT * FROM Courier WHERE Status IN ('Delivered')
SELECT * FROM Courier WHERE Status IN ('In Transit')

-- 9. Calculate the total number of packages for each courier
SELECT CourierID, COUNT(*) AS TotalPackages 
FROM Courier 
GROUP BY CourierID

-- 10. Find the average delivery time for each courier
SELECT c.CourierID, AVG(DATEDIFF(DAY, p.PaymentDate, c.DeliveryDate)) AS AvgDeliveryTime 
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID 
GROUP BY c.CourierID

-- 11. List all packages with a specific weight range
SELECT * FROM Courier
WHERE Weight BETWEEN 2 AND 10

-- 12. Retrieve employees whose names contain 'John'
SELECT * FROM Employee
WHERE Name='John'

-- 13. Retrieve all courier records with payments greater than $50. 
SELECT * FROM Payment
WHERE Amount>50

