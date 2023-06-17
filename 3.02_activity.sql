

# 3.02 Activity 1

#Keep working on the `bank` database.

USE bank;

#Use the below query and list `district_name`, `client_id` and `account_id` for those clients who are owner of the account. Order the results by `district_name`:

select da.a2, c.client_id, d.account_id
from bank.disp d join bank.client c on d.client_id = c.client_id
join bank.district da on da.A1 = c.district_id
where type = 'owner' order by da.a2;


-- sql
-- select * from bank.disp d
-- join bank.client c
-- on d.client_id = c.client_id
-- join bank.district da
-- on da.A1 = c.district_id;


# 3.02 Activity 2


-- List districts together with total amount borrowed and average loan amount.

select d.a2 AS DISTRICT, SUM(l.amount) AS TOTAL_AMOUNT, AVG(l.amount) AS AVG_AMOUNT
from bank.district d 
join bank.account a on a.district_id = d.a1
join bank.loan l on a.account_id = l.account_id
GROUP BY d.a2
ORDER BY d.a2;

# 3.02 Activity 3

-- Create a temporary table `district_overview` in the `bank` database which lists districts together with total amount borrowed and average loan amount.

CREATE TEMPORARY TABLE bank.district_overview
SELECT d.a2 AS DISTRICT, SUM(l.amount) AS TOTAL_AMOUNT, AVG(l.amount) AS AVG_AMOUNT
FROM bank.district d 
JOIN bank.account a on a.district_id = d.a1
JOIN bank.loan l on a.account_id = l.account_id
GROUP BY d.a2
ORDER BY d.a2;

SELECT * FROM bank.district_overview;

# 3.02 Activity 4

-- Still working in the `bank` database, list the clients with no credit card.

SELECT c.client_id AS Client, COUNT(ca.card_id) AS Card
FROM bank.card ca
RIGHT JOIN bank.disp d on ca.disp_id = d.disp_id
RIGHT JOIN bank.client c on c.client_id = d.client_id
GROUP BY Client
HAVING Card= 0;


