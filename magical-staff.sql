/* Frugal tips in buying optimum magical staff */

/* =================== */

SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands AS w JOIN wands_property AS wp ON (w.code=wp.code)
WHERE w.coins_needed IN (
   SELECT MIN(w1.coins_needed)
   FROM wands AS w1 JOIN wands_property AS wp1 ON (w1.code=wp1.code)
   WHERE w1.power=w.power
      AND wp1.age=wp.age
   ) AND wp.is_evil IN (0)
ORDER BY w.power DESC, wp.age DESC;