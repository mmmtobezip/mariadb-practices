SELECT count(*) as 'Enginner 직원 수'
FROM titles
WHERE to_date like '9999-%' and title LIKE '%Enginner%';