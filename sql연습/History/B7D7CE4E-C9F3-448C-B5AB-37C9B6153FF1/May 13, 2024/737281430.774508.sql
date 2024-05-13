-- 문제10
-- 현재 Enginner 직책의 사원은 총 몇 명입니까?
SELECT count(*)
FROM titles
WHERE title = 'Enginner';