select d.DEPARTMENT_ID, l.LOCATION_ID, l.STREET_ADDRESS, l.CITY, l.STATE_PROVINCE, 
c.COUNTRY_NAME from (departments as d join locations as l 
on d.LOCATION_ID=l.LOCATION_ID) join countries as c on 
l.COUNTRY_ID=c.COUNTRY_ID; 

select concat(FIRST_NAME," ",LAST_NAME) as NAME, d.DEPARTMENT_ID, d.DEPARTMENT_NAME
from employees as e join departments as d on e.DEPARTMENT_ID=d.DEPARTMENT_ID;

select concat(FIRST_NAME," ",LAST_NAME) as NAME, e.JOB_ID, e.DEPARTMENT_ID, 
d.DEPARTMENT_NAME from (employees as e join departments as d on 
e.DEPARTMENT_ID=d.DEPARTMENT_ID) join locations as l on d.LOCATION_ID=l.LOCATION_ID 
where l.CITY='London'; 

select e.EMPLOYEE_ID, e.LAST_NAME as E_LAST_NAME, e.MANAGER_ID, m.LAST_NAME as M_LAST_NAME 
from  employees as e join employees as m on e.MANAGER_ID=m.EMPLOYEE_ID; 

select concat(e.FIRST_NAME," ",e.LAST_NAME) as NAME, e.HIRE_DATE from 
employees as e left outer join employees as j on j.LAST_NAME='Jones'
where e.HIRE_DATE>j.HIRE_DATE;

select d.DEPARTMENT_NAME, count(e.EMPLOYEE_ID) as COUNT from
employees as e join departments as d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
group by DEPARTMENT_NAME; 

select EMPLOYEE_ID, j.JOB_TITLE, datediff(END_DATE, START_DATE) as DAYS from
job_history as jh join jobs as j on jh.JOB_ID=j.JOB_ID 
where jh.DEPARTMENT_ID=90;

select d.DEPARTMENT_ID, d.DEPARTMENT_NAME, e.FIRST_NAME from
departments as d join employees as e on d.MANAGER_ID=e.EMPLOYEE_ID;

select d.DEPARTMENT_NAME, concat(e.FIRST_NAME," ", e.LAST_NAME) as NAME, l.CITY from
(departments as d join employees as e on d.MANAGER_ID=e.EMPLOYEE_ID) join locations as l
on d.LOCATION_ID=l.LOCATION_ID; 

select j.JOB_TITLE, avg(e.SALARY) as AVG_SALARY from 
employees as e join jobs as j on e.JOB_ID=j.JOB_ID
group by j.JOB_TITLE;

select j.JOB_TITLE, concat(e.FIRST_NAME," ", e.LAST_NAME) as NAME, 
e.SALARY-j.MIN_SALARY as DIFFERENCE from employees as e join jobs as j on 
e.JOB_ID=j.JOB_ID;

select jh.EMPLOYEE_ID, jh.START_DATE, jh.END_DATE, jh.JOB_ID, jh.DEPARTMENT_ID
from job_history as jh join employees as e on jh.EMPLOYEE_ID=e.EMPLOYEE_ID 
where e.SALARY>10000;

select d.DEPARTMENT_NAME, concat(e.FIRST_NAME," ", e.LAST_NAME) as NAME, 
e.HIRE_DATE, e.SALARY from departments as d join employees as e on
d.MANAGER_ID=e.EMPLOYEE_ID where datediff(now(), e.HIRE_DATE)>(15*365);

select * from employees as e right outer join departments as d on 
e.DEPARTMENT_ID=d.DEPARTMENT_ID; 

select c.COUNTRY_ID, c.COUNTRY_NAME, c.REGION_ID from
countries as c left outer join locations as l on
c.COUNTRY_ID=l.COUNTRY_ID; 

select * from employees as e left outer join departments as d on 
e.DEPARTMENT_ID=d.DEPARTMENT_ID
UNION ALL 
select * from employees as e right outer join departments as d on 
e.DEPARTMENT_ID=d.DEPARTMENT_ID; 


