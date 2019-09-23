  drop table departments;
  drop table dept_emp;
  drop table dept_manager;
  drop table employees;
  drop table salaries;
  drop table titles;
  
     CREATE TABLE departments (
  dept_no VARCHAR(20) NOT NULL,
  dept_name VARCHAR(30));
         SELECT * FROM departments;

    CREATE TABLE dept_manager (
  dept_no VARCHAR(20) NOT NULL,
  emp_no INT NOT NULL,
  from_date VARCHAR(30)NOT NULL,
  to_date VARCHAR(30) NOT NULL);
	   SELECT * FROM dept_manager;

	
	
	CREATE TABLE dept_emp (
  emp_no VARCHAR(20) NOT NULL,
  dept_no VARCHAR(20) NOT NULL,
  from_date VARCHAR(30)NOT NULL,
  to_date VARCHAR(30) NOT NULL);
		SELECT * FROM dept_emp;

	CREATE TABLE employees (
  emp_no VARCHAR(20),
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
  to_date VARCHAR(30) NOT NULL);
	    SELECT * FROM salaries;

	
	
	CREATE TABLE titles (
  emp_no VARCHAR(20) NOT NULL,
  title VARCHAR(20) NOT NULL,
  from_date VARCHAR(30)NOT NULL,
  to_date VARCHAR(30) NOT NULL);
        SELECT * FROM titles;
  
--ALTERATIONS
	ALTER TABLE employees 
    RENAME COLUMN emp_no TO emp_nopk;

    ALTER TABLE departments 
    RENAME COLUMN dept_no TO dept_noPK;
	
---List the following details of each employee: employee number, 
--last name, first name, gender, and salary.
SELECT employees.emp_nopk, first_name, last_name, gender, salary
FROM employees, salaries
WHERE employees.emp_nopk=salaries.emp_no;

---List employees who were hired in 1987.
SELECT first_name, last_name, hire_date
FROM employees
where hire_date BETWEEN '1986-12-31' AND '1988-01-01';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT dept_no, dept_name, emp_no, last_name, first_name, from_date, to_date
FROM dept_manager, departments, employees
WHERE employees.emp_nopk=dept_manager.emp_no
AND departments.dept_no=dept_manager.dept_no;

---List the department of each employee with the following information: 
---employee number, last name, first name, and department name.
SELECT emp_nopk, last_name, first_name, dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_noPK = dept_emp.emp_no
AND departments.dept_noPK = dept_emp.dept_no;


---List all employees whose first name is "Duangkaew" and 
---last names begin with "P."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Duangkaew'
AND last_name LIKE 'P%';

---List all employees in the Sales department, including 
---their employee number, last name, first name, and department name.
SELECT emp_no, last_name, first_name, dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_nopk = dept_emp.emp_no
AND departments.dept_nopk = dept_emp.dept_no
AND dept_name IN
  (SELECT dept_name
   FROM departments
   WHERE dept_name IN ('Sales')
   );

---List all employees in the Sales and Development departments, 
---including their employee number, last name, first name, and department name.
SELECT emp_nopk, last_name, first_name, dept_name
FROM employees, departments, dept_emp
WHERE employees.emp_noPK = dept_emp.emp_no
AND departments.dept_noPK = dept_emp.dept_no
AND dept_name IN
   (SELECT dept_name
   FROM departments
   WHERE dept_name IN ('Sales', 'Development')
);


---In ascending order, list the frequency count of employee last names, 
---i.e., how many employees share each last name.
SELECT last_name, 
COUNT(last_name) AS "Total_Employee" 
FROM employees 
GROUP BY last_name
ORDER BY "last_name" ASC;



