-- 1. Retrieve the customer(s) with the highest account balance.
SELECT customer_id, first_name, last_name
FROM Customers
WHERE customer_id IN 
(
SELECT customer_id FROM accounts 
WHERE balance = (SELECT MAX(balance) FROM accounts)
)

-- 2. Calculate the average account balance for customers who have more than one account.
SELECT AVG(balance) AS avg_balance_multiple_accounts
FROM Accounts
WHERE customer_id IN 
(
SELECT customer_id FROM Accounts
GROUP BY customer_id
HAVING COUNT(account_id) > 1
)

-- 3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.
SELECT * FROM Transactions
WHERE amount > (SELECT AVG(amount) FROM transactions)

-- 4. Identify customers who have no recorded transactions.
SELECT customer_id
FROM Customers
WHERE NOT EXISTS 
(
SELECT 1 FROM Transactions t
JOIN accounts a ON t.account_id = a.account_id
WHERE a.customer_id = customers.customer_id
)

-- 5. Calculate the total balance of accounts with no recorded transactions.
SELECT SUM(balance) AS total_balance
FROM Accounts
WHERE account_id NOT IN 
(
SELECT DISTINCT account_id 
FROM transactions
)

-- 6. Retrieve transactions for accounts with the lowest balance.
SELECT * FROM Transactions
WHERE account_id IN 
(
SELECT account_id FROM Accounts
WHERE balance = (SELECT MIN(balance) FROM accounts)
)

-- 7. Identify customers who have accounts of multiple types.
SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1

-- 8. Calculate the percentage of each account type out of the total number of accounts.
SELECT account_type, COUNT(account_type) AS account_count, (COUNT(account_type) * 100.0) / (SELECT COUNT(account_type) FROM accounts) AS percentage
FROM Accounts
GROUP BY account_type

-- 9. Retrieve all transactions for a customer with a given customer_id.
SELECT t.*
FROM transactions t
WHERE t.account_id IN 
(
SELECT account_id FROM accounts
WHERE customer_id = 1
)

-- 10. Calculate the total balance for each account type, including a subquery within the SELECT clause.
SELECT account_type, (SELECT SUM(balance) FROM accounts a2 WHERE a2.account_type = a1.account_type) AS total_balance
FROM Accounts a1
GROUP BY account_type
