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
