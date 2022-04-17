/* Ordering the time required to complete several distinct projects */

/* =================== */

SELECT a.start_date, MIN(b.end_date)
FROM ((
   SELECT p.start_date
   FROM projects AS p
   WHERE p.start_date NOT IN (
      SELECT p1.end_date
      FROM projects AS p1
      )) AS a, (
   SELECT p2.end_date
   FROM projects AS p2
   WHERE p2.end_date NOT IN (
      SELECT p3.start_date
      FROM projects AS p3
      )) AS b
   )
WHERE a.start_date<b.end_date
GROUP BY a.start_date
ORDER BY DATEDIFF(a.start_date, MIN(b.end_date)) DESC, a.start_date;