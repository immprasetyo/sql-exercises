/* Some index, information schema tables, and prime numbers */

/* =================== */

SELECT GROUP_CONCAT (b.m SEPARATOR '&')
FROM (
   SELECT @m:=@m+1 AS m
   FROM information_schema.tables AS t1, information_schema.tables AS s2, (
      SELECT @m:=0
      ) AS a
   WHERE @m<1000
   ) AS b
WHERE b.m>1 AND NOT EXISTS (
   SELECT d.n
   FROM (   
      SELECT @n:=@n+1 AS n
      FROM information_schema.tables AS t3, information_schema.tables AS t4, (
         SELECT @n:=0
         ) AS c
      WHERE @n<1000
   ) AS d
   WHERE d.n>1 AND d.n<b.m
      AND FLOOR(b.m/d.n)=(b.m/d.n)
);