/* Pairing x with y based on two requirements */

/* =================== */

SELECT f.x, f.y
FROM functions AS f JOIN functions AS f1 ON (f.x=f1.y AND f.y=f1.x)
GROUP BY f.x, f.y
HAVING COUNT(f.x)>1
   OR f.x<f.y
ORDER BY f.x;