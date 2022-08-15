--- Challenge Start

-- Deliverable 1
-- retirement_titles 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO emp_title
FROM employees AS e
	INNER JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (et.emp_no) et.emp_no,
et.first_name,
et.last_name,
et.title
INTO unique_titles
FROM emp_title AS et
WHERE et.to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- retiring_titles
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) desc;

-- Deliverable 2

--mentorship_eligibility
SELECT DISTINCT ON(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles AS t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;