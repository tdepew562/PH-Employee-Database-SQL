SELECT emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries USING (emp_no);
