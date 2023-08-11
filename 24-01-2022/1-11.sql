select concat(FIRST_NAME, ' ', LAST_NAME) as NAME, SALARY from employees where SALARY not between 10000 and 15000;

select concat(FIRST_NAME, ' ', LAST_NAME) as NAME, DEPARTMENT_ID from employees where DEPARTMENT_ID=30 or DEPARTMENT_ID=100
order by DEPARTMENT_ID;

select NAME, SALARY from (select concat(FIRST_NAME, ' ', LAST_NAME) as NAME, DEPARTMENT_ID, SALARY from employees where 
SALARY not between 10000 and 15000) as e where DEPARTMENT_ID=30 or DEPARTMENT_ID=100;

SELECT concat(FIRST_NAME, ' ', LAST_NAME) as NAME, SALARY FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000 
AND department_id IN (30, 100);

select concat(FIRST_NAME, ' ', LAST_NAME) as NAME, HIRE_DATE from employees where year(HIRE_DATE)=1987;

select FIRST_NAME from employees where FIRST_NAME like "%b%" and FIRST_NAME like "%c%";

select LAST_NAME, JOB_ID, SALARY from  employees 
where JOB_ID in ("IT_PROG", "SH_CLERK")
and SALARY not in (4500,10000,15000);

select LAST_NAME from employees where length(LAST_NAME)=6;

select LAST_NAME from employees where locate('e', LAST_NAME)=3;

select distinct JOB_ID from employees;

select concat(FIRST_NAME, ' ', LAST_NAME) as NAME, SALARY, SALARY*0.15 AS PF from employees;

select * from employees where LAST_NAME in ("Blake","Scott","King","Ford");