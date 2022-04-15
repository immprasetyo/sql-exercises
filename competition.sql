/* Finding the Hacker */

/* =================== */

SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS cc
FROM hackers AS h JOIN challenges AS c ON (h.hacker_id=c.hacker_id)
GROUP BY h.hacker_id, h.name
HAVING cc IN (
   SELECT MAX(a.cc1)
   FROM (
      SELECT COUNT(c1.challenge_id) AS cc1
      FROM challenges AS c1 JOIN hackers AS h1 ON (c1.hacker_id=h1.hacker_id)
      GROUP BY h1.hacker_id, h1.name
      ) AS a
   ) OR cc IN (
   SELECT b.cc2
   FROM (
      SELECT COUNT(c2.challenge_id) AS cc2
      FROM challenges AS c2 JOIN hackers AS h2 ON (c2.hacker_id=h2.hacker_id)
      GROUP BY h2.hacker_id, h2.name
      ) AS b
   GROUP BY b.cc2
   HAVING COUNT(b.cc2) IN (1))
ORDER BY cc DESC, h.hacker_id;