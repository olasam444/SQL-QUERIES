SELECT
emp_no,
salary,
LAG(salary) OVER w AS previous_salary,
LEAD(salary) OVER w AS next_salary,
salary - LAG(salary) OVER w AS diff_sal_curr_prev,
LEAD(SALARY) OVER W - salary AS diff_sal_next_current
FROM salaries
where emp_no = 10001
WINDOW w as (ORDER BY salary);