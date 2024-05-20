SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ', a.last_name) AS name,
    b.title,
    c.salary
FROM
    employees a,
    titles b,
    salaries c,
    dept_emp d
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND a.emp_no = d.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
        AND d.dept_no = (SELECT 
            dept_no
        FROM
            (SELECT 
                dept_no, AVG(salary) AS avg_salary
            FROM
                salaries a, dept_emp b
            WHERE
                a.emp_no = b.emp_no
                    AND a.to_date = '9999-01-01'
                    AND b.to_date = '9999-01-01'
            GROUP BY dept_no
            ORDER BY avg_salary DESC
            LIMIT 0 , 1) a)
ORDER BY c.salary DESC;