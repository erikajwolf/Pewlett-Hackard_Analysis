-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL, 
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

-- Create the employees table
CREATE TABLE employees (
	emp_no INT NOT NULL, 
	birth_date DATE NOT NULL, 
	first_name VARCHAR NOT NULL, 
	last_name VARCHAR NOT NULL, 
	gender VARCHAR NOT NULL, 
	hire_date DATE NOT NULL, 
	PRIMARY KEY (emp_no)
);

-- Create the dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL, 
	from_date DATE NOT NULL,
	to_date DATE NOT NULL, 
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Create the salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no), 
	PRIMARY KEY (emp_no)
);

-- Create the department_employees table
CREATE TABLE department_employees (
	emp_no INT NOT NULL, 
	dept_no VARCHAR(4) NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

-- Create the titles table
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

DROP TABLE department_employees;
DROP TABLE titles;

-- Create the dept_emp table
CREATE TABLE dept_emp (
	emp_no INT NOT NULL, 
	dept_no VARCHAR(4) NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- Create the titles table
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL, 
	from_date DATE NOT NULL, 
	to_date DATE NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date)
);

-- Retirement eligibility
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

-- Retirement eligibility into retirement_info
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')