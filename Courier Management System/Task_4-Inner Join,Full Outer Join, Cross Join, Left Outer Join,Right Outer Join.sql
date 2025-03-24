-- 23. Retrieve Payments with Courier Information
SELECT P.*, C.*
FROM Payment P
JOIN Courier C ON P.CourierID = C.CourierID

-- 24. Retrieve Payments with Location Information
SELECT P.*, L.*
FROM Payment P
JOIN Location L ON P.LocationID = L.LocationID

-- 25. Retrieve Payments with Courier and Location Information
SELECT P.*, C.*, L.*
FROM Payment P
JOIN Courier C ON P.CourierID = C.CourierID
JOIN Location L ON P.LocationID = L.LocationID

-- 26. List all payments with courier details
SELECT P.PaymentID, P.Amount, P.PaymentDate, C.*
FROM Payment P
JOIN Courier C ON P.CourierID = C.CourierID

-- 27. Total payments received for each courier
SELECT C.CourierID, SUM(P.Amount) AS TotalPayments
FROM Courier C
JOIN Payment P ON C.CourierID = P.CourierID
GROUP BY C.CourierID

-- 28. List payments made on a specific date
SELECT * FROM Payment
WHERE PaymentDate = '2025-03-14'

-- 29. Get Courier Information for Each Payment
SELECT P.PaymentID, P.Amount, P.PaymentDate, C.*
FROM Payment P
LEFT JOIN Courier C ON P.CourierID = C.CourierID

-- 30. Get Payment Details with Location
SELECT P.*, L.LocationName, L.Address
FROM Payment P
LEFT JOIN Location L ON P.LocationID = L.LocationID

-- 31. Calculating Total Payments for Each Courier
SELECT C.CourierID, SUM(P.Amount) AS TotalPayments
FROM Courier C
LEFT JOIN Payment P ON C.CourierID = P.CourierID
GROUP BY C.CourierID;

-- 32. List Payments Within a Date Range
SELECT * FROM Payment
WHERE PaymentDate BETWEEN '2025-03-12' AND '2025-03-17'

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side
SELECT U.*, C.*
FROM Users U
LEFT JOIN Courier C ON U.UserID = C.CourierID
UNION
SELECT U.*, C.*
FROM Users U
RIGHT JOIN Courier C ON U.UserID = C.CourierID

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
SELECT C.*, CS.*
FROM Courier C
LEFT JOIN CourierServices CS ON C.CourierID = CS.ServiceID

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
SELECT E.*, P.*
FROM Employee E
LEFT JOIN Payment P ON E.EmployeeID = P.CourierID

-- 36. List all users and all courier services, showing all possible combinations.
SELECT U.*, CS.*
FROM Users U
CROSS JOIN CourierServices CS

-- 37. List all employees and all locations, showing all possible combinations:
SELECT E.*, L.*
FROM Employee E
CROSS JOIN Location L

-- 38. Retrieve a list of couriers and their corresponding sender information (if available)
SELECT C.CourierID, C.SenderName, C.SenderAddress
FROM Courier C

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available):
SELECT C.CourierID, C.ReceiverName, C.ReceiverAddress
FROM Courier C

-- 40. Retrieve a list of couriers along with the courier service details (if available):
SELECT C.*, CS.ServiceName, CS.Cost
FROM Courier C
LEFT JOIN CourierServices CS ON C.CourierID = CS.ServiceID

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee:
SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS TotalCouriers
FROM Employee E
LEFT JOIN Courier C ON E.EmployeeID = C.CourierID
GROUP BY E.EmployeeID, E.Name

-- 42. Retrieve a list of locations and the total payment amount received at each location:
SELECT L.LocationID, L.LocationName, SUM(P.Amount) AS TotalPayments
FROM Location L
LEFT JOIN Payment P ON L.LocationID = P.LocationID
GROUP BY L.LocationID, L.LocationName

-- 43. Retrieve all couriers sent by the same sender (based on SenderName).
SELECT * FROM Courier
WHERE SenderName = 'Sneha Iyer'

-- 44. List all employees who share the same role.
SELECT Role, STRING_AGG(Name, ', ') AS Employees
FROM Employee
GROUP BY Role
HAVING COUNT(*) > 1

-- 45. Retrieve all payments made for couriers sent from the same location.
SELECT P.*
FROM Payment P
JOIN Courier C ON P.CourierID = C.CourierID
WHERE C.SenderAddress = '123 MG Road, Mumbai'


-- 46. Retrieve all couriers sent from the same location (based on SenderAddress).
SELECT * FROM Courier
WHERE SenderAddress = '123 MG Road, Mumbai'

-- 47. List employees and the number of couriers they have delivered:
SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS TotalDelivered
FROM Employee E
JOIN Courier C ON E.EmployeeID = C.CourierID
WHERE C.Status = 'Delivered'
GROUP BY E.EmployeeID, E.Name

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services 
SELECT C.CourierID, CS.Cost, SUM(P.Amount) AS TotalPayments
FROM Courier C
JOIN CourierServices CS ON C.CourierID = CS.ServiceID
JOIN Payment P ON C.CourierID = P.CourierID
GROUP BY C.CourierID, CS.Cost
HAVING SUM(P.Amount) > CS.Cost;

