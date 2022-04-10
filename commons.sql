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

