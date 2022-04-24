/* Specifying some competent hackers */

/* =================== */

SELECT con.contest_id, con.hacker_id, con.name, SUM(a.sts) AS sts1, SUM(a.stas) AS stas1, SUM(b.stv) AS stv1, SUM(b.stuv) AS stuv1
FROM contests AS con
   JOIN colleges AS col ON (con.contest_id=col.contest_id)
   JOIN challenges AS cha ON (col.college_id=cha.college_id)
   LEFT JOIN (
      SELECT cha1.challenge_id, SUM(ss.total_submissions) AS sts, SUM(ss.total_accepted_submissions) AS stas
      FROM challenges AS cha1 JOIN submission_stats AS ss ON (cha1.challenge_id=ss.challenge_id)
      GROUP BY cha1.challenge_id
      ) AS a
   LEFT JOIN (
      SELECT cha2.challenge_id, SUM(vs.total_views) AS stv, SUM(vs.total_unique_views) AS stuv
      FROM challenges AS cha2 JOIN view_stats AS vs ON (cha2.challenge_id=vs.challenge_id)
      GROUP BY cha2.challenge_id
      ) AS b
GROUP BY con.contest_id, con.hacker_id, con.name
HAVING (sts1+stv1) > 0
ORDER BY con.contest_id;