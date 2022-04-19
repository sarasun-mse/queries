/*
example removing duplicates with some conditions
specifically one col (value col) has dupes and 
another col (key col) defines which ones to remove or keep
two approaches:
one by tbl self join on some key value conditions
the other by subquerying to establish keys to keep or remove
*/

--approach 1: self join
DELETE p1.* FROM Person p1,
    Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id

--approach 2: index subquery

DELETE FROM Person
WHERE Id NOT IN
(SELECT * FROM (
  SELECT MIN(Id) FROM Person GROUP BY email
  ) AS P);
