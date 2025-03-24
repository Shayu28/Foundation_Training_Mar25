-- 1. Write a SQL query to Find the average account balance for all customers.
SELECT AVG(balance) AS avg_balance
FROM Accounts 

-- 2. Write a SQL query to Retrieve the top 10 highest account balances.
SELECT customer_id, balance
FROM Accounts
ORDER BY balance DESC

-- 3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
SELECT sum(amount) AS deposit
FROM Transactions
WHERE transaction_type = 'deposit' AND transaction_date = '2025-03-10'

-- 4. Write a SQL query to Find the Oldest and Newest Customers.
SELECT * FROM Customers c
JOIN Accounts a ON c.customer_id  = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
ORDER BY transaction_date ASC


SELECT * FROM Customers c
JOIN Accounts a ON c.customer_id  = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
ORDER BY transaction_date DESC

-- 5. Write a SQL query to Retrieve transaction details along with the account type.
SELECT t.transaction_id, t.account_id, t.transaction_type, t.amount, t.transaction_date, a.account_type
FROM Transactions t
JOIN Accounts a ON t.account_id = a.account_id

-- 6. Write a SQL query to Get a list of customers along with their account details.
SELECT * 
FROM Customers c
JOIN Accounts a ON c.customer_id  = a.customer_id

-- 7. Write a SQL query to Retrieve transaction details along with customer information for a specific account.
SELECT t.transaction_id, t.transaction_type, t.amount, t.transaction_date, c.customer_id, c.first_name, c.last_name, c.email
FROM Customers c
JOIN Accounts a ON c.customer_id  = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.account_id = 1

-- 8. Write a SQL query to Identify customers who have more than one account.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(a.account_id) AS total_accounts
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(a.account_id) > 1;

-- 9. Write a SQL query to Calculate the difference in transaction amounts between deposits and withdrawals.


-- 10. Write a SQL query to Calculate the average daily balance for each account over a specified period.
SELECT account_id, AVG(balance) AS avg_daily_balance
FROM accounts
WHERE account_id IN 
(
SELECT DISTINCT account_id 
FROM transactions 
WHERE transaction_date BETWEEN '2025-03-01' AND '2025-03-10'
)
GROUP BY account_id

-- 11. Calculate the total balance for each account type.
SELECT account_type, SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type

-- 12. Identify accounts with the highest number of transactions order by descending order.
SELECT account_id, COUNT(transaction_id) AS transaction_count
FROM Transactions
GROUP BY account_id
ORDER BY transaction_count DESC

-- 13. List customers with high aggregate account balances, along with their account types.
SELECT c.customer_id, c.first_name, c.last_name, a.account_type, SUM(a.balance) AS total_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, a.account_type 
HAVING SUM(a.balance) > 50000
ORDER BY total_balance DESC

-- 14. Identify and list duplicate transactions based on transaction amount, date, and account.
SELECT account_id, amount, transaction_date, COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, amount, transaction_date
HAVING COUNT(*) > 1
