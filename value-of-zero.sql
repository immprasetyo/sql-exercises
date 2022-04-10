/* Case of broken keyboard */

/* =================== */

SELECT CEIL(AVG(e.salary) - (
   SELECT AVG(a.rs)
   FROM (
      SELECT REPLACE(e1.salary, 0, '') AS rs
      FROM employees AS e1
   ) AS a
   ))
FROM employees AS e;
