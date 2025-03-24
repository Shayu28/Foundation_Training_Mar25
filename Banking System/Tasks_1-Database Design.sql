use BankingSystem

-- Customers

CREATE TABLE Customers
(
customer_id INT PRIMARY KEY IDENTITY, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
email VARCHAR(50) NOT NULL,
phone_number BIGINT UNIQUE NOT NULL,
address VARCHAR(100) NOT NULL 
)

INSERT INTO Customers(first_name, last_name, date_of_birth, email, phone_number,address) VALUES
('Shayu','Syed','2004-04-28','shayusyed@mail.com',8838187734,'St. Thomas Mount'),
('Leo','Das','2003-07-18','leodas@mail.com',8838187731,'Porur'),
('Rose','Dawson','2003-06-09','rosedawson@mail.com',8838187732,'Tambaram'),
('Jack','Dawson','2003-04-22','jacckdawson@mail.com',8838187733,'Pallavaram'),
('Tom','Holland','2004-01-04','tomholland@mail.com',8838187735,'T nagar'),
('Peter','Parker','2003-12-11','peterparker@mail.com',8838187736,'Gunidy'),
('Gwen','Stacy','2004-04-28','gwenstacy@mail.com',8838187737,'Velachery'),
('Mary','Jane','2004-05-15','maryjane@mail.com',8838187738,'Vadapalani'),
('Tony','Stark','2003-04-01','tonystark@mail.com',8838187739,'Red Hills'),
('Sara','Ali','2003-03-10','saraali@mail.com',8838187730,'Ambattur')

SELECT * FROM Customers


-- Accounts

CREATE TABLE Accounts 
(
account_id INT IDENTITY PRIMARY KEY,
customer_id INT NOT NULL,
account_type VARCHAR(50) CHECK (account_type IN ('savings', 'current', 'zero_balance')),
balance DECIMAL(10,2) CHECK (balance >= 0),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
)


INSERT INTO Accounts (customer_id, account_type, balance) VALUES 
(1, 'savings', 500000.00),
(2, 'current', 120000.50),
(3, 'zero_balance', 0.00),
(4, 'savings', 30000.75),
(5, 'current', 250000.00),
(6, 'savings', 45000.25),
(7, 'zero_balance', 0.00),
(8, 'savings', 15000.00),
(9, 'current', 175000.90),
(10, 'zero_balance', 0.00);

SELECT * FROM Accounts

-- Transactions

CREATE TABLE Transactions 
(
transaction_id INT IDENTITY PRIMARY KEY,
account_id INT NOT NULL,
transaction_type VARCHAR(20) CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')),
amount DECIMAL(10,2) CHECK (amount > 0),
transaction_date DATE NOT NULL,
FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
)


INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date) VALUES 
(1, 'deposit', 10000.00, '2025-03-01'),
(2, 'withdrawal', 5000.00, '2025-03-02'),
(3, 'deposit', 7500.00, '2025-03-03'),
(4, 'withdrawal', 2000.00, '2025-03-04'),
(5, 'transfer', 15000.00, '2025-03-05'),
(6, 'deposit', 20000.00, '2025-03-06'),
(7, 'deposit', 1000.00, '2025-03-07'),
(8, 'transfer', 5000.00, '2025-03-08'),
(9, 'deposit', 12000.00, '2025-03-09'),
(10, 'deposit', 3000.00, '2025-03-10');


SELECT * FROM Transactions
