select distinct count(JOB_ID) from employees;

select sum(SALARY) from employees;

select min(SALARY) from employees;

select max(SALARY) from employees where JOB_ID like '%PROG';

select avg(SALARY), count(EMPLOYEE_ID) from employees
where DEPARTMENT_ID=90;

select max(SALARY), min(SALARY), sum(SALARY), avg(SALARY) from employees;

select JOB_ID, count(EMPLOYEE_ID) from employees
group by JOB_ID;

select max(SALARY)-min(SALARY) from employees;

select MANAGER_ID, min(SALARY) from employees group by MANAGER_ID;

select * from employees where MANAGER_ID=100;

select DEPARTMENT_ID, sum(SALARY) from employees 
group by DEPARTMENT_ID;

select JOB_ID, avg(SALARY) from employees
group by JOB_ID
having JOB_ID not like '%PROG';

select sum(SALARY), max(SALARY), min(SALARY), avg(SALARY) from 
(select * from employees where DEPARTMENT_ID=90) e group by JOB_ID;

select JOB_ID, max(SALARY) from employees group by JOB_ID
having max(SALARY)>=4000;

select DEPARTMENT_ID, avg(SALARY), count(EMPLOYEE_ID) from employees 
group by DEPARTMENT_ID having count(EMPLOYEE_ID)>10;

select DEPARTMENT_ID, avg(SALARY) FROM employees
group by DEPARTMENT_ID HAVING AVG(sALARY)>9000;