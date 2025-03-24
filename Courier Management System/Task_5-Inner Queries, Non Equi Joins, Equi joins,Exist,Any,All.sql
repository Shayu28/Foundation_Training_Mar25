-- 49. Find couriers that have a weight greater than the average weight of all couriers
SELECT * 
FROM Courier 
WHERE Weight > (SELECT AVG(Weight) FROM Courier)

-- 50. Find the names of all employees who have a salary greater than the average salary:
SELECT * 
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee)

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost
SELECT SUM(Cost) AS TotalCost 
FROM CourierServices 
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices)

-- 52. Find all couriers that have been paid for
SELECT  c.* 
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID

-- 53. Find the locations where the maximum payment amount was made
SELECT LocationID, SUM(Amount) AS TotalPayment
FROM Payment
GROUP BY LocationID
HAVING SUM(Amount) = (SELECT MAX(TotalPayment) 
FROM (SELECT LocationID, SUM(Amount) AS TotalPayment 
FROM Payment 
GROUP BY LocationID) AS PaymentTotals)

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'): 
SELECT * 
FROM Courier 
WHERE Weight > (SELECT MAX(Weight) FROM Courier WHERE SenderName = 'SenderName')

