--populate deparments table
Create table departments(
	dept_no VARCHAR,
	dept_name VARCHAR);
Select * from departments;

--populate dept_emp table
Create table  dept_emp (
	emp_no INT,
	dept_no VARCHAR);
Select * from dept_emp;

--populate dept_manager table
Create table  dept_manager (
	dept_no VARCHAR,
	emp_no VARCHAR);
--insert primary key
alter table dept_manager
add column dept_manager_id serial primary key;
DROP TABLE dept_manager;
Select * from dept_manager;

--populate dept_manager table
Create table  employees (
	emp_no VARCHAR,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex	VARCHAR,
	hire_date VARCHAR);
DROP TABLE employees;
Select * from employees;
--insert primary key
alter table employees
add column emp_id serial primary key;

--populate salaries table
Create table  salaries (
	emp_no VARCHAR,
	salary VARCHAR
	);
Select * from salaries;

--populate titles table
Create table  titles (
	title_id VARCHAR,
	title VARCHAR
	);
Select * from titles;	
	

