--DROP TABLE IF EXISTS Departments;
--DROP TABLE IF EXISTS Titles;
--DROP TABLE IF EXISTS Employees;
--DROP TABLE IF EXISTS Salaries;
--DROP TABLE IF EXISTS Dept_manager;
--DROP TABLE IF EXISTS Dept_emp;

CREATE TABLE Departments(
	dept_no VARCHAR(10) PRIMARY KEY, 
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Titles(
	title_id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE Employees(
	emp_no INT PRIMARY KEY, 
	emp_title_id VARCHAR(10) NOT NULL, 
	birth_date DATE NOT NULL,	
	first_name VARCHAR(30) NOT NULL, 
	last_name VARCHAR(30) NOT NULL,	
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Dept_emp(
	emp_no INT NOT NULL, 
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);	

CREATE TABLE Salaries(
	emp_no INT PRIMARY KEY, 
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

CREATE TABLE Dept_manager(
	dept_no VARCHAR(10) NOT NULL, 
	emp_no INT NOT NULL, 
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

--List the employee number, last name, first name, sex, and salary of each employee.

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
From Employees
INNER JOIN Salaries ON
Salaries.emp_no=Employees.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM Employees
WHERE hire_date > '1985-12-31' AND hire_date < '1987-01-01';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
JOIN departments as d ON 
dm.dept_no = d.dept_no
JOIN employees as e ON 
dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments as d
JOIN dept_emp as de ON
d.dept_no = de.dept_no
JOIN employees as e ON
e.emp_no = de.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON
e.emp_no = de.emp_no
JOIN departments as d ON
d.dept_no = de.dept_no
WHERE d.dept_name= 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON
e.emp_no = de.emp_no
JOIN departments as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' or d.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) as "Frequency count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency count" DESC;
























