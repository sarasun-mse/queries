/*
common id col from two tables
some ids appear in both tables
some do not
those that do not are considered
ids with missing info
two approaches to identify
depending on sql database
*/

--mysql (no full outer join option)
SELECT e.employee_id AS employee_id
FROM Employees e
WHERE e.employee_id NOT IN (SELECT employee_id FROM Salaries) OR e.name IS NULL
UNION
SELECT s.employee_id
FROM Salaries s
WHERE s.employee_id NOT IN (SELECT employee_id FROM Employees) OR s.salary IS NULL
ORDER BY employee_id;

--ms sql server (with full outer join)
SELECT 
CASE WHEN P.id IS NULL THEN P.id2 ELSE P.id END AS employee_id FROM
(SELECT e.employee_id AS id, s.employee_id AS id2
FROM Employees e
FULL OUTER JOIN Salaries s ON e.employee_id = s.employee_id
WHERE e.employee_id IS NULL OR s.employee_id IS NULL) AS P
ORDER BY employee_id;
