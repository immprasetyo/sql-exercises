/* Making sentences from the Occupation table */

/* =================== */

SELECT CONCAT(a.name, '(', a.sso, ')')
FROM (
   SELECT o.name, SUBSTR(o.occupation, 1, 1) AS sso
   FROM occupations AS o
   ORDER BY o.name
   ) AS a;

SELECT CONCAT('There are a total of ', b.cn, ' ', b.lo, 's.')
FROM (
   SELECT LOWER(o1.occupation) AS lo, COUNT(o1.name) AS cn
   FROM occupations AS o1
   GROUP BY lo
   ORDER BY cn, lo
   ) AS b;
   
