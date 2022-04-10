/* Using Phytagorean Theorem to compute distance between two geospatial point */

/* =================== */

SELECT ROUND(SQRT(
   POW((MAX(s.lat_n)-MIN(s.lat_n)), 2) + POW((MAX(s.long_w)-MIN(s.long_w)), 2)
   ), 4)
FROM station AS s;