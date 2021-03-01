-- Drop table if exists
-- DROP TABLE titles;
-- Create Table titles
create table titles(
	title_id varchar(30),
	title varchar(30),
	PRIMARY KEY (title_id)
);

create table employees(
	emp_no int,
	emp_title_id varchar(5),
	birth_date date,
	first_name varchar(20),
	last_name varchar(20),
	sex varchar(1),
	hire_date date,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

create table salaries(
	emp_no int PRIMARY KEY,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

create table departments(
	dept_no varchar(4) PRIMARY KEY,
	dept_name varchar(30)
);

create table dept_managers(
	dept_no varchar(4),
	emp_no int,
	CONSTRAINT PK_dept_managers PRIMARY KEY (dept_no,emp_no)
);

-- Drop table if exists
DROP TABLE dept_emp;
create table dept_emp(
	emp_no int ,
	dept_no varchar(4),
	CONSTRAINT PK_dept_emp PRIMARY KEY (emp_no,dept_no)
);
