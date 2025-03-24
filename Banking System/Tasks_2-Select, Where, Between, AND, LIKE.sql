-- 1. Write a SQL query to retrieve the name, account type and email of all customers.
SELECT c.first_name, c.last_name, a.account_type, c.email
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id

-- 2. Write a SQL query to list all transaction corresponding customer.
SELECT c.first_name, c.last_name, t.transaction_type, t.amount
FROM Transactions t
JOIN Accounts a ON a.account_id = t.account_id
JOIN Customers c ON c.customer_id = a.customer_id

-- 3. Write a SQL query to increase the balance of a specific account by a certain amount.
UPDATE Accounts
SET balance = balance + 5000  
WHERE account_id = 1

-- 4. Write a SQL query to Combine first and last names of customers as a full_name.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Customers

-- 5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
DELETE FROM Accounts
WHERE balance = 0 AND account_type = 'savings'

-- 6. Write a SQL query to Find customers living in a specific city.
SELECT first_name, last_name, address
FROM Customers

-- 7. Write a SQL query to Get the account balance for a specific account.
SELECT balance
FROM Accounts
WHERE account_id = 1

-- 8. Write a SQL query to List all current accounts with a balance greater than $1,000.
SELECT c.first_name, c.last_name, a.balance
FROM Customers c
JOIN Accounts a ON a.customer_id = c.customer_id
WHERE balance>1000 AND account_type='current'

-- 9. Write a SQL query to Retrieve all transactions for a specific account.
SELECT * FROM transactions
WHERE account_id = 3

-- 10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.
SELECT account_id, balance, (balance * 0.05) AS interest_accured  
FROM Accounts
WHERE account_type = 'savings';

-- 11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.
SELECT * FROM accounts
WHERE balance < 5000

-- 12. Write a SQL query to Find customers not living in a specific city
SELECT first_name, last_name, address
FROM Customers
WHERE address NOT IN ('St. Thomas Mount')
