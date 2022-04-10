--select all
SELECT * FROM Customers;

--select one column
SELECT City FROM Customers;

--select different values from a column
SELECT DISTINCT Country FROM Customers;

--select all based on value in another col WHERE conditions
SELECT * FROM Customers
WHERE City = "Berlin";

SELECT * FROM Customers
WHERE NOT City = 'Berlin';

SELECT * FROM Customers
WHERE CustomerID = 32;

SELECT * FROM Customers
WHERE City = 'Berlin'
AND PostalCode = 12229;

SELECT * FROM Customers
WHERE City = 'Berlin'
OR City = 'London';

--select and order results
SELECT * FROM Customers
ORDER BY City;

SELECT * FROM Customers
ORDER BY City DESC --reverse alphabetical order

SELECT * FROM Customers
ORDER BY Country,City --order by one column then a second

--insert new records
INSERT INTO Customers (CustomerName, Address, City, PostalCode, Country)
VALUES ('Hakan Olsen','GateVein 15','Sandnes','4348','Norway')

--select no values
SELECT * FROM Customers
WHERE PostalCode IS NULL;

SELECT * FROM Customers
WHERE PostalCode IS NOT NULL;

--modify existing records UPDATE
UPDATE Customers
SET City='Oslo';

UPDATE Customers
SET City='Oslo'
WHERE Country='Norway';

UPDATE Customers
SET City='Oslo', Country='Norway'
WHERE CustomerID=32;

--delete records
DELETE FROM Customers
WHERE Country='Norway';

DELETE FROM Customers; --delete all records while preserving table and data structure

--functions to aggregate or take stats
SELECT MIN(Price) FROM Products;

SELECT MAX(Price) FROM Products;

SELECT COUNT(*) FROM Products
WHERE Price=18;

SELECT AVG(Price) FROM Products;

SELECT SUM(Price) FROM Products;

--query to match certain string patterns LIKE
SELECT * FROM Customers
WHERE City LIKE 'a%'; --name starts with a

WHERE City LIKE '%a'; --ends with a

WHERE City LIKE '%a%'; --has a in any position

WHERE City LIKE 'a%b'; --starts with a ends with b

WHERE City LIKE '_a%'; --has a in second position

WHERE City NOT LIKE 'a%'; --does not start with a

WHERE City LIKE 'a_%'; --starts with a and at least 2-char long

WHERE City LIKE 'a__%'; --starts with a and at least 3-char long

WHERE City LIKE '[acs]%'; --starts with a, c, or s

WHERE City LIKE '[a-f]%'; --starts with anything from a to f

WHERE City LIKE '[^acs]%'; --first letter not a or c or s, ^ the complement set

--shorthand for multiple OR conditions IN
SELECT * FROM Customers
WHERE Country IN ('France','Germany');

SELECT * FROM Customers
WHERE Country NOT IN ('France','Germany');

--query for values BETWEEN can be strings between letters in alphabetical order
SELECT * FROM Customers
WHERE Age BETWEEN 20 AND 30;

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Name BETWEEN 'A' AND 'G';

--temporary more readable col or table names aliases AS
SELECT Name, PostalCode AS Pno FROM Products;

SELECT * FROM Customers AS Consumers;

--joins
SELECT * FROM Orders 
LEFT JOIN Customers
ON Orders.CustomerID=Customers.CustomerID;

INNER JOIN Customers --intersection only

RIGHT JOIN Customers --all of right tables and matchings from left table

--summary using GROUP BY
SELECT COUNT(CustomerID),Country FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

--database and table operations
CREATE DATABASE testDB;

DROP DATABASE testDB;

CREATE TABLE People (
  PersonID int,
  Name varchar(255),
  Address varchar(255)
  );
  
DROP TABLE People;

TRUNCATE TABLE People; --drop data inside table but no delete table

ALTER TABLE People
ADD Birthday DATE; --add a column

ALTER TABLE People
DROP COLUMN Birthday;
