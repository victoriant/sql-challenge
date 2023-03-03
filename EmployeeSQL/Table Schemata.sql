Departments
-
dept_no VARCHAR(10) PK 
dept_name VARCHAR(30)

Dept_emp
-
emp_no INT PK FK - Employees.emp_no
dept_no VARCHAR(10) FK >- Departments.dept_no

Dept_manager
-
dept_no VARCHAR(10) PK FK >- Departments.dept_no
emp_no INT FK -< Employees.emp_no

Employees
-
emp_no INT PK 
emp_title_id VARCHAR(10) FK - Titles.title_id
birth_date DATE	
first_name VARCHAR(30)	 
last_name VARCHAR(30)	
sex VARCHAR(1)
hire_date DATE

Salaries
-
emp_no INT PK FK - Employees.emp_no
salary INT 

Titles
-
title_id VARCHAR(10) PK
title VARCHAR(30)