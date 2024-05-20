-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요.
-- (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 
-- 이름은 first_name과 last_name을 합쳐 출력 합니다.
SELECT a.emp_no AS '사번', CONCAT(a.first_name, ' ', a.last_name) AS '이름'
FROM employees a, titles b
WHERE a.emp_no = b.emp_no
AND b.title = 'Technique Leader' 
AND b.to_date NOT LIKE '9999%';