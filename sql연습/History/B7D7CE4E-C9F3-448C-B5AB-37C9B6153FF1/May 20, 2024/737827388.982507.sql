SELECT 
    e.dept_name AS '부서이름', 
    CONCAT(a.first_name, ' ', a.last_name) AS '사원이름', 
    b.salary AS '연봉', 
    d.manager, d.manager_salary
FROM 
    employees a
JOIN 
    salaries b ON a.emp_no = b.emp_no
JOIN 
    dept_emp c ON a.emp_no = c.emp_no
JOIN 
    departments e ON c.dept_no = e.dept_no
JOIN 
    (SELECT 
         a.dept_no, 
         b.first_name AS manager, 
         c.salary AS manager_salary 
     FROM 
         dept_manager a
     JOIN 
         employees b ON a.emp_no = b.emp_no
     JOIN 
         salaries c ON c.emp_no = a.emp_no
     WHERE 
         a.to_date = '9999-01-01' 
         AND c.to_date = '9999-01-01') d ON c.dept_no = d.dept_no
WHERE 
    b.to_date = '9999-01-01'
    AND c.to_date = '9999-01-01'
    AND b.salary > d.manager_salary
ORDER BY 
    연봉;