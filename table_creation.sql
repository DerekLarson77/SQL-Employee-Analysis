--Drop tables (In reverse order of creation to account for Foreign Keys)
drop table salaries;
drop table dept_manager;
drop table dept_emp;
drop table employees;
drop table titles;
drop table departments;


--Create departments table
create table departments
(
	dept_no CHAR(4) PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

--Create titles table
create table titles
(
	title_id CHAR(5) PRIMARY KEY ,
	title VARCHAR NOT NULL
);

--Create employees table
create table employees
(
	emp_no INT PRIMARY KEY,
	emp_title_id CHAR(5), 
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR(1),
	hire_date DATE
);

--Create dept_emp table
create table dept_emp
(
	emp_no INT, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no CHAR(4), 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

--Create dept_manager table
create table dept_manager
(
	dept_no CHAR(4), 
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

--Create salaries table
create table salaries
(
	emp_no INT, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary MONEY NOT NULL
);

--Viewing each created table to check data is what's expected.
select * from departments;
select * from titles;
select * from employees;
select * from dept_emp;
select * from dept_manager;
select * from salaries;

--Data Analysis #1
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp 
INNER JOIN salaries AS sal ON
emp.emp_no=sal.emp_no
ORDER BY emp.emp_no ASC;

--Data Analysis #2 - NOT COMPLETE
SELECT first_name, last_name, hire_date
FROM employees
WHERE CONVERT(VARCHAR, hire_date, 111) LIKE '1986%'
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

