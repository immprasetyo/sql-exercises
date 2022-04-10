/* Reckoning the total employees for a specific role */

/* =================== */

SELECT c.company_code, c.founder,
   COUNT(DISTINCT lm.lead_manager_code), COUNT(DISTINCT sm.senior_manager_code), COUNT(DISTINCT m.manager_code), COUNT(DISTINCT employee_id)
FROM company AS c
   JOIN lead_managers AS lm ON (c.company_code=lm.company_code)
   JOIN senior_managers AS sm ON (c.company_code=sm.company_code)
   JOIN managers AS m ON (c.company_code=m.company_code)
   JOIN employees AS e ON (c.company_code=e.company_code)
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;
