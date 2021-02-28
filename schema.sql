CREATE TABLE departments(
    dept_no         VARCHAR(4)      NOT NULL,
    dept_name       VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no)       
);

CREATE TABLE titles(
    title_id        VARCHAR(5)      NOT NULL,
    title           VARCHAR(50)     NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE employees(
    emp_no          INT             NOT NULL,
    emp_title_id    VARCHAR(5)      NOT NULL,
    birth_date      DATE            NOT NULL,
    first_name      VARCHAR(20)     NOT NULL,
    last_name       VARCHAR(20)     NOT NULL,
    sex             VARCHAR         NOT NULL,
    hire_date       DATE            NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id)  REFERENCES titles (title_id)
);

CREATE TABLE dept_emp(
    emp_no          INT             NOT NULL,
    dept_no         VARCHAR(4)      NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
    FOREIGN KEY (emp_no)  REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no)  REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager(
    dept_no         VARCHAR(4)      NOT NULL,
    emp_no          INT             NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (emp_no)  REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no)  REFERENCES departments (dept_no)
);
CREATE TABLE salaries(
    emp_no          INT             NOT NULL,
    salary          INT             NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)
);

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, employees.last_name , employees.first_name, employees.sex , salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees 
where hire_date between '1986-01-01' and '1986-12-31' 
ORDER BY hire_date ASC;

--3List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
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