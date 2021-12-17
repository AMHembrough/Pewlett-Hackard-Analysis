
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (retirement_titles.emp_no) 
retirement_titles.emp_no,
retirement_titles.first_name,
retirement_titles.last_name,
retirement_titles.title
INTO unique_titles
FROM retirement_titles
ORDER BY retirement_titles.emp_no, to_date DESC;

SELECT COUNT(unique_titles.title), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY COUNT DESC;

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
employees.first_name,
employees.last_name,
employees.birth_date,
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
and (dept_emp.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT employees.emp_no,
employees.first_name,
employees.last_name,
employees.gender,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_gender
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

Select * from retirement_gender limit 5

SELECT DISTINCT ON (retirement_gender.emp_no) 
retirement_gender.emp_no,
retirement_gender.first_name,
retirement_gender.last_name,
retirement_gender.title,
retirement_gender.gender
INTO unique_gender_titles
FROM retirement_gender
ORDER BY retirement_gender.emp_no, to_date DESC;

Select * from unique_gender_titles limit 5

SELECT COUNT(unique_gender_titles.gender), unique_gender_titles.gender
INTO retiring_gender
FROM unique_gender_titles
GROUP BY unique_gender_titles.gender
ORDER BY COUNT DESC

Select * from retiring_gender limit 5
