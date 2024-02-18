-- Pewlett Hackard Employee Database Script

-- Drop existing tables with CASCADE to handle dependencies
DROP TABLE IF EXISTS departments CASCADE;

-- Create departments table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

-- Populate departments table from CSV file
COPY departments (dept_no, dept_name) FROM 'C:\Users\Thomas\Desktop\Finished Projects\Project 9 Finished\data\departments.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER);

-- Display contents of the departments table
SELECT * FROM departments;

-- Create dept_emp table
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
    PRIMARY KEY (emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE
);

-- Populate dept_emp table from CSV file
COPY dept_emp (emp_no, dept_no) FROM 'C:\Users\Thomas\Desktop\Finished Projects\Project 9 Finished\data\dept_emp.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER);

-- Display contents of the dept_emp table
SELECT * FROM dept_emp;

-- Create dept_manager table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
    dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE
);

-- Populate dept_manager table from CSV file
COPY dept_manager (dept_no, emp_no) FROM 'C:\Users\Thomas\Desktop\Finished Projects\Project 9 Finished\data\dept_manager.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER);

-- Display contents of the dept_manager table
SELECT * FROM dept_manager;

-- Create employees table
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

-- Populate employees table from CSV file
COPY employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) FROM 'C:\Users\Thomas\Desktop\Finished Projects\Project 9 Finished\data\employees.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER);

-- Display contents of the employees table
SELECT * FROM employees;

-- Create salaries table
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE
);

-- Populate salaries table from CSV file
COPY salaries (emp_no, salary) FROM 'C:\Users\Thomas\Desktop\Finished Projects\Project 9 Finished\data\salaries.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER);

-- Display contents of the salaries table
SELECT * FROM salaries;

-- Create titles table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY NOT NULL,
    title VARCHAR(50) NOT NULL
);

-- Populate titles table from CSV file
COPY titles (title_id, title) FROM 'C:\Users\Thomas\Desktop\Finished Projects\Project 9 Finished\data\titles.csv' WITH (FORMAT CSV, DELIMITER ',', HEADER);

-- Display contents of the titles table
SELECT * FROM titles;
