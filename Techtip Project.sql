use hr
 
show tables



---1---number of employees as per department----
select departments.department_name,count(employees.employee_id) as 'Number of employees' from
departments join employees on departments.department_id=employees.department_id group by 
departments.department_name order by count(employees.employee_id) desc

---2----average salary of employees as per department---------
select departments.department_name,avg(employees.salary) as 'average salary' from
employees join departments on employees.department_id=departments.department_id 
group by departments.department_name order by avg(employees.salary) desc 

----3-----number of employees with respect to job title---------

select jobs.job_title,count(employees.employee_id) from jobs
join employees on jobs.job_id=employees.job_id group by jobs.job_title order by count(employees.employee_id)
 desc
 
---4---------average salary as per job title -------------

select jobs.job_title,avg(employees.salary) from jobs
join employees on jobs.job_id=employees.job_id group by jobs.job_title order by avg(employees.salary)
 desc 

--5--number of employees by country---
select country_name,count(employee_id) as 'Number of employees' from emp_details_view group by country_name

----6--salary of employees with respect to experience---
select year(curdate())- year(hire_date) as 'Experience' ,avg(salary) as 'average salry' from employees
group by year(curdate())- year(hire_date) order by avg(salary) desc

----7----top 10 employees with highest salaries----
select concat(first_name," ",last_name) as 'full name',salary from employees
order by salary desc limit 10

---8--------top3 employees by salary of each department---------
select department_name,first_name,last_name,salary,dense_rank() over(partition by department_name order by salary desc)
 as 'rank'      from emp_details_view

---9--employees who have salary higher than average salary----

select first_name,last_name,salary from employees where
salary >( select avg(salary) from employees )


---10--number of employees in the organization-----
select count(*) as 'Total Number of Employees' from employees

-------11---number of  employees by city---

select city,count(employee_id)  as 'Number of Employees'   from emp_details_view
group by city order by count(employee_id) desc

----12---details of the employees who recieve commission-----

select * from employees where commission_pct is not null
