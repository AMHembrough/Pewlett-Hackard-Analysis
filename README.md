# Pewlett-Hackard

## Overview 

The purpose of the analysis was twofold: 

1.	determine the number of retiring employees per title and 
2.	identify employees with eligibility for the company’s mentorship program.  

This analysis was conducted using SQL through PostgreSQL (=relational database system) and pgAdmin (-where the queries and written, executed and results are viewed).  

## Methodology / Results: 

The first task was to determine the number of retiring employees per title.  This was accomplished via the below methodology.  
-	First, we retrieved all necessary data from the various data tables, specifically
o	Employees table : emp_no, first_name, last_name, 
o	Titles table : title, from_date, to_date
-	A new table, called retirement_titles, was created using INTO clause and a join via the primary key which exists in both tables.  
-	The data was then filtered by birth_date to include only employee born between 1952 and 1955.
-	The output of this exercise yielded a table that included duplicates of employees (one line for each job title).  This is interesting data, but not the requested deliverable… Let’s keep going.
-	The next step was to retrieve emp_no, first_name, last_name and title from the new table we just created : retirement_titles.  
-	We then used a distinct statement to retrieve only the first occurrence of each employee number, thus eliminating the issue we discovered in the aforementioned steps.  
-	We were then asked to exclude employees who have already left the company by filtering on the to_date.  This was problematic because when we later tried to create the retiring_titles table, our counts were off if this step was included.  Because of this, I did not include this step.  
-	We then created a new table called unique_titles using the INTO clause.  
-	The next step was to write a third query to retrieve the number of employees by their most recent job title who are near retirement. 
-	First we retrieved the number of titles from the unique_titles table and we then created a new table called retiring_titles.  
-	We grouped the new table by title and sorted the count column.  The final output looked like this : 

The next task was to identify employees with eligibility for the company’s mentorship program.  We accomplished this using the following methodology
-	First we retrieved data from our tables: 
o	Employees table : emp_no, first_name, last_name, birth_date
o	Dept_emp table : from_date, to_date
o	Titles table : title
-	We then used DISCTINCT ON to retrieve the first  occurrence of the employee number, and created a new table using INNER JOIN called mentoriship_elibilgibility.
-	We then filtered the data on the to_date  to get current employees, and filtered on birth_date to get all the employees born in 1965.
-	We ordered the table by employee number.  

## Summary: 

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?

There will be 90,398 retirement-induced vacancies at Pewlett-Hackard-Analysis in the very near future.  

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

There are enough retirement-ready employees in the departments (=90,398) to mentor the those eligible for mentorship (=1,549).  It is important that Pewlett Hackard quickly work with the retiring managers and leverage their expertise before they retire.  

### Provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

I refractored the code from the above analysis to quantify the number of male and female employees retiring.  60% of the those eligible for retirement are male, while the remaining 40% are female.  Having a diverse workforce is increasingly relevant, especially in order to meet sustainability objectives, and to create a workplace where future employees want to work.  Given Pewlett Hackard’s upcoming silver tsunami, its important that the company examines various employee diversity indices in planning for the future.  This is a great start to a larger diversity analysis.  
