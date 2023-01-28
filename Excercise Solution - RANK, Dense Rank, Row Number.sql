/* Write a query containing a window function to obtain 
all salary values that employee number 10560 has ever signed a contract for.
Order and display the obtained salary values from highest to lowest. */

USE employees;
SELECT
emp_no, salary
 /*RANK() OVER(PARTITION BY emp_no ORDER BY SALARY desc)*/
FROM	
salaries
WHERE emp_no = 10560
ORDER BY salary DESC;



/*Write a query that upon execution, displays the number of salary contracts 
that each manager has 
ever signed while working in the company. */
SELECT max(sal_count) AS no_of_contract, 
a.man_no
from
(
SELECT dm.emp_no as man_no
 , sal.salary,
ROW_NUMBER() OVER(PARTITION BY dm.emp_no ORDER BY salary) AS sal_count
FROM
dept_manager dm
join salaries sal
on sal.emp_no = dm.emp_no
/*LIMIT 10 */
) a

GROUP BY a.man_no
ORDER BY no_of_contract;

/* Write a query that upon execution retrieves a result set containing all salary values that employee 10560 has
 ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that 
equal salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are allowed.*/
USE employees;
SELECT
emp_no, salary,
RANK() OVER(PARTITION BY emp_no ORDER BY SALARY desc)
FROM	
salaries
WHERE emp_no = 10560;

/*Write a query that upon execution retrieves a result set containing all salary 
values that employee 10560 has ever signed a contract for. Use a window function to rank all salary values from highest to lowest in a way that equal 
salary values bear the same rank and that gaps in the obtained ranks for subsequent rows are not allowed.*/

USE employees;
SELECT
emp_no, salary,
DENSE_RANK() OVER(PARTITION BY emp_no ORDER BY SALARY desc)
FROM	
salaries
WHERE emp_no = 10560;





