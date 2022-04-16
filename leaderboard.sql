/* Listing top hackers */

/* =================== */

SELECT a.hacker_id, a.name, SUM(a.ms) AS sms
FROM (
   SELECT h.hacker_id, h.name, MAX(s.score) AS ms
   FROM hackers AS h JOIN submissions AS s ON (h.hacker_id=s.hacker_id)
   GROUP BY h.hacker_id, h.name, s.challenge_id
   ) AS a
GROUP BY a.hacker_id, a.name
HAVING sms NOT IN (0)
ORDER BY sms DESC, a.hacker_id;