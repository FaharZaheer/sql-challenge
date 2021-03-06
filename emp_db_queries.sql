-- Data Analysis --
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no = employees.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name,employees.last_name,employees.hire_date
FROM employees
WHERE EXTRACT(YEAR FROM employees.hire_date)=1986;

-- 3. List the manager of each department with the following information: 
--   department number, department name, the manager's employee number, last name, first name.
SELECT dept_managers.dept_no,departments.dept_name, dept_managers.emp_no, employees.first_name, employees.last_name 
FROM dept_managers
INNER JOIN departments ON
departments.dept_no = dept_managers.dept_no
INNER JOIN employees ON
employees.emp_no = dept_managers.emp_no;

-- 4. List the department of each employee with the following information: 
--   employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name,employees.sex
FROM employees
WHERE (employees.first_name = 'Hercules') AND (SUBSTRING(employees.last_name, 1, 1) = 'B') ;

-- 6. List all employees in the Sales department, including their 
--    employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Last Name Frequency" 
FROM employees
GROUP BY last_name
ORDER BY "Last Name Frequency" DESC;
