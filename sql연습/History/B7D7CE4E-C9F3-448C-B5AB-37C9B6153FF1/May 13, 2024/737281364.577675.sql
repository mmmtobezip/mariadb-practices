-- 문제9.
-- 어떤 직책들이 있나요? 중복 없이 이름이 긴 순서대로 출력해 보세요.
-- distinct, 
SELECT DISTINCT(title)
FROM titles
ORDER BY title ASC;