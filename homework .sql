CREATE TABLE departments (
  dept_no VARCHAR(20) NOT NULL,
  dept_name VARCHAR(30));
SELECT * FROM departments;

CREATE TABLE dept_manager (
  dept_no VARCHAR(20) NOT NULL,
  emp_no INT NOT NULL,
  from_date VARCHAR(30)NOT NULL,
  to_date VARCHAR(30) NOT NULL)
	;
	SELECT * FROM dept_manager;

	
	drop table dept_emp;
	CREATE TABLE dept_emp (
  emp_no VARCHAR(20) NOT NULL,
  dept_no VARCHAR(20) NOT NULL,
  from_date VARCHAR(30)NOT NULL,
  to_date VARCHAR(30) NOT NULL)
	;
		SELECT * FROM dept_emp;

	CREATE TABLE employees (
  emp_no VARCHAR(20) NOT NULL,
  birth_date VARCHAR(20) NOT NULL,
  first_name VARCHAR(30)NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  gender VARCHAR(10),
  hire_date VARCHAR(20));

	SELECT * FROM employees;


CREATE TABLE salaries (
  emp_no VARCHAR(20) NOT NULL,
  salary INT NOT NULL,
  from_date VARCHAR(30)NOT NULL,
  to_date VARCHAR(30) NOT NULL)
	;
		SELECT * FROM salaries;

	
	
	CREATE TABLE titles (
  emp_no VARCHAR(20) NOT NULL,
  title VARCHAR(20) NOT NULL,
  from_date VARCHAR(30)NOT NULL,
  to_date VARCHAR(30) NOT NULL)
	;
	
		SELECT * FROM titles;

SELECT employees.emp_no, employees.first_name, employees.last_name, 
       employees.gender, salaries.emp_no, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

SELECT * FROM employees WHERE hire_date IS 
