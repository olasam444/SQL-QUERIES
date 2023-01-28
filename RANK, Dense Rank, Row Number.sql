USE employees;
SELECT
emp_no, salary,
RANK() OVER(PARTITION BY emp_no ORDER BY SALARY desc)
FROM	
salaries
WHERE emp_no = 11839


#####################

USE employees;
SELECT
emp_no, salary,
DENSE_RANK() OVER(PARTITION BY emp_no ORDER BY SALARY desc)
FROM	
salaries
WHERE emp_no = 11839

USE employees;
SELECT
emp_no, salary,
RANK() OVER(PARTITION BY emp_no ORDER BY SALARY desc)
FROM	
salaries
WHERE emp_no = 11839