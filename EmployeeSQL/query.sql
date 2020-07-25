-- List employee details and salary 
SELECT 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
FROM employees e
INNER JOIN salaries AS s ON
	s.emp_no = e.emp_no;
	
-- List employees hired in 1986
SELECT 
	first_name,
	last_name,
	hire_date
FROM employees
WHERE 
	EXTRACT(YEAR FROM hire_date) = 1986;


-- List manager of each department
SELECT
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM departments d
INNER JOIN dept_manager AS dm
	ON dm.dept_no = d.dept_no
INNER JOIN employees AS e
	ON e.emp_no = dm.emp_no;
	
-- List department of each employee
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
INNER JOIN departments As d
	ON d.dept_no = de.dept_no;
	
-- List employees whose first name is Hercules & last name begin with "B"
SELECT 
	first_name,
	last_name,
	sex
FROM employees
WHERE
	first_name = 'Hercules' AND last_name LIKE 'B%';
	
-- List employees in Sales departments
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
INNER JOIN departments As d
	ON d.dept_no = de.dept_no
WHERE d.dept_no IN 
(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales'
);

-- List employees in Sales and Development departments
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM employees e
INNER JOIN dept_emp AS de
	ON de.emp_no = e.emp_no
INNER JOIN departments As d
	ON d.dept_no = de.dept_no
WHERE d.dept_no IN 
(
	SELECT dept_no
	FROM departments
	WHERE dept_name = 'Sales' OR dept_name = 'Development'
);

-- List frequency count of employee last names
SELECT
	last_name, COUNT(emp_no) AS "employee count"
FROM employees
GROUP BY last_name
ORDER BY "employee count" DESC;
