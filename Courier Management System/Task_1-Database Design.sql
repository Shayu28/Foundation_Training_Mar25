USE CourierManagement
-- Users

CREATE TABLE Users
(UserID INT PRIMARY KEY IDENTITY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
Password VARCHAR(255),
ContactNumber VARCHAR(20),
Address TEXT
)

INSERT INTO Users (Name, Email, Password, ContactNumber, Address) VALUES
('Shayu Syed', 'shayusyed@mail.com', '1001', '9876543210', '123 MG Road, Mumbai'),
('Sneha Iyer', 'sneha.iyer@email.com', '1002', '8765432109', '45 Gandhi Street, Chennai'),
('Amit Verma', 'amit.verma@email.com', '1003', '7654321098', '78 Lajpat Nagar, Delhi'),
('Priya Singh', 'priya.singh@email.com', '1004', '6543210987', '56 Park Avenue, Kolkata'),
('Vikram Raj', 'vikram.raj@email.com', '1005', '5432109876', '90 Residency Road, Bangalore'),
('Ananya Das', 'ananya.das@email.com', '1006', '4321098765', '32 Lake View, Hyderabad'),
('Karthik Nair', 'karthik.nair@email.com', '1007', '3210987654', '21 Greenway, Kochi'),
('Meera Kapoor', 'meera.kapoor@email.com', '1008', '2109876543', '88 Rose Street, Pune'),
('Rohan Mehta', 'rohan.mehta@email.com', '1009', '1098765432', '67 Marina Bay, Ahmedabad'),
('Divya Pillai', 'divya.pillai@email.com', '1010', '9988776655', '34 South Avenue, Coimbatore');

SELECT * FROM Users

-- Courier

CREATE TABLE Courier
(
CourierID INT PRIMARY KEY IDENTITY,
SenderName VARCHAR(255),
SenderAddress TEXT,
ReceiverName VARCHAR(255),
ReceiverAddress TEXT,
Weight DECIMAL(5, 2),
Status VARCHAR(50),
TrackingNumber VARCHAR(20) UNIQUE,
DeliveryDate DATE
)

INSERT INTO Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) VALUES
('Shayu Syed', '123 MG Road, Mumbai', 'Sneha Iyer', '45 Gandhi Street, Chennai', 2.50, 'In Transit', 'TRK2025032401', '2025-03-28'),
('Amit Verma', '78 Lajpat Nagar, Delhi', 'Priya Singh', '56 Park Avenue, Kolkata', 1.80, 'Delivered', 'TRK2025032402', '2025-03-22'),
('Vikram Raj', '90 Residency Road, Bangalore', 'Ananya Das', '32 Lake View, Hyderabad', 3.20, 'Pending', 'TRK2025032403', NULL),
('Karthik Nair', '21 Greenway, Kochi', 'Meera Kapoor', '88 Rose Street, Pune', 5.00, 'Shipped', 'TRK2025032404', '2025-03-27'),
('Rohan Mehta', '67 Marina Bay, Ahmedabad', 'Divya Pillai', '34 South Avenue, Coimbatore', 4.50, 'Out for Delivery', 'TRK2025032405', '2025-03-25'),
('Sneha Iyer', '45 Gandhi Street, Chennai', 'Amit Verma', '78 Lajpat Nagar, Delhi', 2.00, 'In Transit', 'TRK2025032406', '2025-03-29'),
('Priya Singh', '56 Park Avenue, Kolkata', 'Vikram Raj', '90 Residency Road, Bangalore', 1.60, 'Delivered', 'TRK2025032407', '2025-03-23'),
('Meera Kapoor', '88 Rose Street, Pune', 'Rohan Mehta', '67 Marina Bay, Ahmedabad', 3.80, 'Shipped', 'TRK2025032408', '2025-03-26'),
('Divya Pillai', '34 South Avenue, Coimbatore', 'Karthik Nair', '21 Greenway, Kochi', 4.10, 'Pending', 'TRK2025032409', NULL),
('Ananya Das', '32 Lake View, Hyderabad', 'Shayu Syed', '123 MG Road, Mumbai', 3.70, 'Out for Delivery', 'TRK2025032410', '2025-03-24');

SELECT * FROM Courier

-- CourierServices

CREATE TABLE CourierServices
(
ServiceID INT PRIMARY KEY IDENTITY, 
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2)
)

INSERT INTO CourierServices (ServiceName, Cost) VALUES
('Standard Delivery', 100.00),
('Express Delivery', 250.00),
('Same Day Delivery', 500.00),
('Overnight Delivery', 400.00),
('International Standard', 1200.00),
('International Express', 2500.00),
('Fragile Item Handling', 150.00),
('Bulk Shipment', 800.00),
('Temperature Controlled', 1800.00),
('Document Courier', 90.00);

SELECT * FROM CourierServices

-- Employee Table

CREATE TABLE Employee
(
EmployeeID INT PRIMARY KEY IDENTITY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
ContactNumber VARCHAR(20),
Role VARCHAR(50),
Salary DECIMAL(10, 2)
)

INSERT INTO Employee (Name, Email, ContactNumber, Role, Salary) VALUES
('Arjun Patel', 'arjun.patel@example.com', '9876543210', 'Manager', 75000.00),
('Neha Reddy', 'neha.reddy@example.com', '8765432109', 'Customer Support', 40000.00),
('Suresh Yadav', 'suresh.yadav@example.com', '7654321098', 'Delivery Executive', 30000.00),
('Pooja Malhotra', 'pooja.malhotra@example.com', '6543210987', 'Operations Manager', 80000.00),
('Ravi Sharma', 'ravi.sharma@example.com', '5432109876', 'IT Administrator', 60000.00),
('Swati Joshi', 'swati.joshi@example.com', '4321098765', 'HR Manager', 70000.00),
('Kunal Bansal', 'kunal.bansal@example.com', '3210987654', 'Warehouse Supervisor', 50000.00),
('Meghna Das', 'meghna.das@example.com', '2109876543', 'Finance Analyst', 65000.00),
('Vishal Nair', 'vishal.nair@example.com', '1098765432', 'Marketing Specialist', 55000.00),
('Anjali Saxena', 'anjali.saxena@example.com', '9876501234', 'Delivery Executive', 32000.00);

SELECT * FROM Employee

-- Location Table

CREATE TABLE Location
(
LocationID INT PRIMARY KEY IDENTITY,
LocationName VARCHAR(100),
Address TEXT
)

INSERT INTO Location (LocationName, Address) VALUES
('Main Warehouse', '123 Industrial Road, Chennai, Tamil Nadu, India'),
('Branch Office 1', '45 MG Road, Bangalore, Karnataka, India'),
('Branch Office 2', '78 Park Street, Kolkata, West Bengal, India'),
('Sorting Center 1', '21 NH-8, Delhi, India'),
('Sorting Center 2', '36 GT Road, Ludhiana, Punjab, India'),
('Regional Hub - South', '99 Anna Salai, Chennai, Tamil Nadu, India'),
('Regional Hub - North', '5 Connaught Place, Delhi, India'),
('Regional Hub - East', '66 Salt Lake, Kolkata, West Bengal, India'),
('Regional Hub - West', '32 FC Road, Pune, Maharashtra, India'),
('Corporate Office', '10 BKC Complex, Mumbai, Maharashtra, India');

SELECT * FROM Location

-- Payment Table

CREATE TABLE Payment
(
PaymentID INT PRIMARY KEY IDENTITY,
CourierID INT,
LocationId INT,
Amount DECIMAL(10, 2),
PaymentDate DATE,
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
)

INSERT INTO Payment (CourierID, LocationId, Amount, PaymentDate) VALUES
(1, 2, 1500.00, '2025-03-10'),
(2, 5, 750.50, '2025-03-11'),
(3, 1, 2000.00, '2025-03-12'),
(4, 3, 1200.75, '2025-03-13'),
(5, 7, 1750.00, '2025-03-14'),
(6, 9, 900.25, '2025-03-15'),
(7, 4, 1350.00, '2025-03-16'),
(8, 6, 1850.00, '2025-03-17'),
(9, 8, 2100.50, '2025-03-18'),
(10, 10, 1600.00, '2025-03-19');

SELECT * FROM Payment
