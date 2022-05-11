/* Stringing some columns up */

/* =================== */

SELECT a.submission_date, (
   SELECT COUNT(DISTINCT s1.hacker_id)
   FROM submissions AS s1
   WHERE s1.submission_date=a.submission_date
      AND (
         SELECT COUNT(DISTINCT s2.submission_id)
         FROM submissions AS s2
         WHERE s2.hacker_id=s1.hacker_id
            AND s2.submission_date<a.submission_date
         ) = DATEDIFF(a.submission_date, '2016-03-01')
   ), (
   SELECT s3.hacker_id
   FROM submissions AS s3
   WHERE s3.submission_date=a.submission_date
   GROUP BY s3.hacker_id
   ORDER BY COUNT(s3.submission_id) DESC, s3.hacker_id
   ) AS b, (
   SELECT h.name
   FROM hackers AS h
   WHERE h.hacker_id=b
   )
FROM (
   SELECT DISTINCT s.submission_date
   FROM submissions AS s
   ORDER BY s.submission_date
   ) AS a;