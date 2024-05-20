SELECT DATE_FORMAT(NOW(), '%Y년') - DATE_FORMAT(MAX(birth_date), '%Y') AS '최고령 나이',
	   DATE_FORMAT(NOW(), '%Y년') - DATE_FORMAT(MIN(birth_date), '%Y') AS '최연소 나이'
FROM employees;