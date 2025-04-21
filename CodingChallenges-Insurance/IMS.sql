CREATE DATABASE InsuranceManagementSystem
GO

USE InsuranceManagementSystem
GO

-- User table
CREATE TABLE [User] 
(
userId INT PRIMARY KEY IDENTITY(1,1),
username VARCHAR(50) NOT NULL,
password VARCHAR(100) NOT NULL,
role VARCHAR(20) NOT NULL
)


-- Client table
CREATE TABLE Client 
(
clientId INT PRIMARY KEY IDENTITY(1,1),
clientName VARCHAR(100) NOT NULL,
contactInfo VARCHAR(200) NOT NULL,
policyId INT FOREIGN KEY REFERENCES Policy(policyId)
)


-- Claim table
CREATE TABLE Claim 
(
claimId INT PRIMARY KEY IDENTITY(1,1),
claimNumber NVARCHAR(50) NOT NULL UNIQUE,
dateFiled DATE NOT NULL,
claimAmount DECIMAL(15, 2) NOT NULL,
status VARCHAR(20) NOT NULL,
policyId INT FOREIGN KEY REFERENCES Policy(policyId),
clientId INT FOREIGN KEY REFERENCES Client(clientId)
)

-- Payment table
CREATE TABLE Payment 
(
paymentId INT PRIMARY KEY IDENTITY(1,1),
paymentDate DATE NOT NULL,
paymentAmount DECIMAL(15, 2) NOT NULL,
clientId INT FOREIGN KEY REFERENCES Client(clientId)
)

-- Policy table
CREATE TABLE Policy 
(
policyId INT PRIMARY KEY IDENTITY(1,1),
policyName VARCHAR(100) NOT NULL,
policyType VARCHAR(50) NOT NULL,
coverageAmount DECIMAL(15, 2) NOT NULL,
premiumAmount DECIMAL(15, 2) NOT NULL,
startDate DATE NOT NULL,
endDate DATE NOT NULL
)


SELECT * FROM [User]
SELECT * FROM Client
SELECT * FROM Claim 
SELECT * FROM Payment
SELECT * FROM Policy

