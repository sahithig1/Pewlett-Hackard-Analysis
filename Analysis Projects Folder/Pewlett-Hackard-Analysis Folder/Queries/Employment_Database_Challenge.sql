--Deliverable 1
--NO. of Retiring Employees by title

SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.titles,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by emp_no asc;

select * from retirement_titles


-- Use Dictinct with Orderby to remove duplicate rows
select distinct on(rt.emp_no) rt.emp_no,
	   rt.first_name,
   	  rt. last_name,
	   rt.titles
into unique_titles
from retirement_titles as rt
order by emp_no , to_date DESC;

select * from unique_titles

--Retrieve the number of employees by their most recent job title who are about to retire
Select count(emp_no),
		ut.titles
INTO retiring_titles
from unique_titles as ut
group by titles
order by count(titles) desc;

select * from retiring_titles


--Qrery to create a mentorship elegibility table that holds the employees who are eligible to participate in a mentorship program
select distinct on(e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.titles
into mentorship_eligibility
from employees as e
	inner join dept_emp as de
		on (e.emp_no = de.emp_no)
			inner join titles as t
				on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no;


select * from mentorship_eligibility

