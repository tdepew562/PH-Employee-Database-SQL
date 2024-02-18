SELECT d.dept_no, d.dept_name, m.emp_no, m.last_name, m.first_name
FROM dept_manager AS dm
JOIN departments AS d ON dm.dept_no = d.dept_no
JOIN employees AS m ON dm.emp_no = m.emp_no;


