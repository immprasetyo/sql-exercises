/* Distinguishing components of a stucture */

/* =================== */

SELECT n, 
   CASE
      WHEN p IS NULL THEN 'Root'
      WHEN n IN (
         SELECT bst1.p
         FROM bst AS bst1
         ) THEN 'Inner'
      ELSE 'Leaf'
   END
FROM bst
ORDER BY n;
