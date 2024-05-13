-- 문제10
-- 현재 Enginner 직책의 사원은 총 몇 명입니까?
SELECT count(emp_no) as 'Enginner 직원 수'
FROM title
-- WHERE to_date like '9999-%' and title LIKE '%Enginner%';
WHERE title LIKE '%Enginner%';