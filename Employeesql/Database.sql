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
	hire_date DATE);
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

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees 
where hire_date between '1986-01-01' and '1986-12-31' 
ORDER BY hire_date ASC

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select departments.dept_no,departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name
from departments
join dept_manager
on departments.dept_no = dept_manager.dept_no
join employees
on dept_manager.emp_no = employees.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name , employees.first_name,departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no=departments.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name , employees.first_name,departments.dept_name
from employees
join dept_emp
on employees.emp_no = dept_emp.emp_no
join departments
on dept_emp.dept_no=departments.dept_no
where dept_name= 'Sales';
