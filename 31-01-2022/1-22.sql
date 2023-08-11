select concat(FIRST_NAME, " ", LAST_NAME) as Name from employees 
where SALARY > all(select salary from employees where LAST_NAME='Bull');

select concat(FIRST_NAME," ",LAST_NAME) as Name from
employees join departments on employees.DEPARTMENT_ID=departments.DEPARTMENT_ID
where DEPARTMENT_NAME='IT';

select concat(FIRST_NAME," ",LAST_NAME) as Name from 
(employees join departments on employees.DEPARTMENT_ID=departments.DEPARTMENT_ID) 
join locations on departments.LOCATION_ID=locations.LOCATION_ID
where employees.MANAGER_ID<>0 and locations.COUNTRY_ID='US';

select concat(FIRST_NAME," ",LAST_NAME) as Name from 
employees join departments on employees.DEPARTMENT_ID=departments.DEPARTMENT_ID
where employees.EMPLOYEE_ID=departments.MANAGER_ID;

select concat(FIRST_NAME," ",LAST_NAME) as Name, SALARY from employees 
where SALARY > (select avg(SALARY) from employees);

select concat(FIRST_NAME," ",LAST_NAME) as Name from 
employees as E join jobs as J on E.JOB_ID=J.JOB_ID 
where E.SALARY=J.MIN_SALARY;

select concat(FIRST_NAME," ",LAST_NAME) as Name, SALARY from 
employees as E join departments as D on E.DEPARTMENT_ID=D.DEPARTMENT_ID
where E.SALARY > (select avg(SALARY) from employees) and D.DEPARTMENT_NAME like 'IT%';

select concat(FIRST_NAME," ",LAST_NAME) as Name, SALARY from employees
where SALARY > (select SALARY from employees where FIRST_NAME='Bell' or LAST_NAME='Bell');

select concat(FIRST_NAME," ",LAST_NAME) as Name, SALARY as Salary from 
employees as E join jobs as J on E.JOB_ID=J.JOB_ID 
where E.SALARY=J.MIN_SALARY;

select concat(FIRST_NAME," ",LAST_NAME) as Name, SALARY as Salary from employees
where SALARY > all(select avg(SALARY) from employees group by DEPARTMENT_ID); 

select concat(FIRST_NAME," ",LAST_NAME) as Name, SALARY as Salary from employees
where SALARY > all(select SALARY from employees where JOB_ID='SH_CLERK') 
order by SALARY asc;


select concat(FIRST_NAME," ",LAST_NAME) as Name, SALARY as Salary from employees
where EMPLOYEE_ID not in (select MANAGER_ID from employees); 

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_NAME from 
employees join departments on employees.DEPARTMENT_ID=departments.DEPARTMENT_ID;

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY from employees E
where SALARY > (select avg(SALARY) from employees D where E.DEPARTMENT_ID=D.DEPARTMENT_ID);

select * from employees where mod(EMPLOYEE_ID,2)<>0;

SET @i = 0; 
SELECT i, employee_id 
FROM (SELECT @i := @i + 1 AS i, employee_id FROM employees)
a WHERE MOD(a.i, 2) = 0;

select distinct SALARY 
from employees e1 
WHERE 5 = (select count(distinct SALARY) 
from employees e2 
where e2.salary >= e1.salary);

select distinct SALARY 
from employees e1 
WHERE 4 = (select count(distinct SALARY) 
from employees e2 
where e2.salary <= e1.salary);

select * from (select * from employees order by EMPLOYEE_ID desc limit 10) e
order by EMPLOYEE_ID asc;

select DEPARTMENT_ID, DEPARTMENT_NAME from departments
where DEPARTMENT_ID not in (select DEPARTMENT_ID from employees);

select SALARY from employees order by SALARY desc limit 3;

select SALARY from employees order by SALARY asc limit 3;

select SALARY from employees order by SALARY desc limit n;