/* Who earns less? */

/* =================== */

SELECT s.name
FROM students AS s
   JOIN packages AS ps ON (s.id=ps.id)
   JOIN friends AS f ON (s.id=f.id)
   JOIN packages AS pf ON (f.friend_id=pf.id)
WHERE ps.salary<pf.salary
ORDER BY pf.salary;