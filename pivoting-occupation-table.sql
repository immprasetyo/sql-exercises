/* Pivoting table using case statement and row index */

/* =================== */

SELECT MAX(a.doctors), MAX(a.professors), MAX(a.singers), MAX(a.actors)
FROM (
   SELECT (
      CASE o.occupation
         WHEN ('Doctor') THEN @d:=@d+1
         WHEN ('Professor') THEN @p:=@p+1
         WHEN ('Singer') THEN @s:=@s+1
         WHEN ('Actor') THEN @a:=@a+1
      END AS rowing,
      CASE o.occupation
         WHEN ('Doctor') THEN o.name
      END AS doctors,
      CASE o.occupation
         WHEN ('Professor') THEN o.name
      END AS professors,
      CASE o.occupation
         WHEN ('Singer') THEN o.name
      END AS singers
      CASE o.occupation
         WHEN ('Actor') THEN o.name
      END AS actors
   FROM occupation AS o, (SELECT @d:=0, @p:=0, @s:=0, @a:=0) AS t1
   ORDER BY o.name
   ) AS a
GROUP BY a.rowing;
