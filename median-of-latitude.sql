/* Indexing latitude values in order to determine the median */

/* =================== */

SELECT ROUND(AVG(a.lat_n), 4)
FROM (
   SELECT @rowindex:=@rowindex+1 AS ri, s.lat_n
   FROM station AS s, (SELECT @rowindex:=-1) AS t1
   ORDER BY s.lat_n
   ) AS a
WHERE a.ri IN (FLOOR(@rowindex/2), CEIL(@rowindex/2)
) AS b;