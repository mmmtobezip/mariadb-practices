-- 문제10
-- 현재 Enginner 직책의 사원은 총 몇 명입니까?
SELECT count(*) as 'Enginner 직원 수'
FROM titles
WHERE to_date like '9999-%' and title like '%Engineer%';