--Data Analysis #1
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp 
INNER JOIN salaries AS sal ON
emp.emp_no=sal.emp_no
ORDER BY emp.emp_no ASC;

--Data Analysis #2
SELECT first_name, last_name, hire_date
FROM employees
--Need to do the 'to_char' in the where clause because WHERE is before SELECT in order of execution.
WHERE to_char(hire_date, 'YYYY-MM-DD') LIKE '1986%'
ORDER BY last_name ASC;

--Data Analysis #3
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON 
dm.dept_no=d.dept_no
INNER JOIN employees AS e ON
dm.emp_no=e.emp_no
ORDER BY dm.dept_no, dm.emp_no ASC;

--Data Analysis #4
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
from employees AS e
INNER JOIN dept_emp AS de ON
de.emp_no=e.emp_no
INNER JOIN departments AS d ON
d.dept_no=de.dept_no
ORDER BY e.emp_no ASC;

--Data Analysis #5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

--Data Analysis #6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
de.emp_no=e.emp_no
INNER JOIN departments AS d ON
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no ASC;

--Data Analysis #7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON
de.emp_no=e.emp_no
INNER JOIN departments AS d ON
d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no ASC;

--Data Analysis #8
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
