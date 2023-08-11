delimiter $$
create function no_of_years(eid decimal(6,0)) returns integer deterministic
begin
declare HireDate date; 
select hire_date into HireDate from employees where EMPLOYEE_ID=eid;
return year(Current_date())-year(HireDate);
end $$
delimiter ;
select employee_id,first_name,last_name,hire_date, no_of_years(Employee_id) as No_of_yrs 
from employees where EMPLOYEE_ID=100;

delimiter $$
create function calculate_level(cnum int) returns varchar(30) deterministic
begin
declare custLevel varchar(30);
declare custCredit decimal(10,2);
select creditLimit into custCredit from customers where customerNumber=cnum;
if custCredit >= 50000 then
select "platinum" into custLevel;
elseif custCredit > 10000 and custCredit < 50000 then
select "gold" into custLevel;
else 
select "silver" into custLevel;
end if;
return custLevel;
end $$
delimiter ;
select customerNumber,creditLimit, calculate_level(customerNumber) as custLevel
from customers where customerNumber=103;

delimiter $$
create function calcProfit(prodid varchar(15)) returns decimal(10,2) deterministic
begin
declare profit decimal(10,2);
select msrp-buyPrice into profit from products 
where productCode=prodid;
return profit;
end $$
delimiter ;
select productCode, buyPrice, msrp, calcProfit(productCode) as profit 
from products where productCode="S10_2016";

delimiter $$
create function weighted_average(n1 int, n2 int, n3 int, n4 int) 
returns decimal(10,2) deterministic
begin
declare weightsSum int;
declare avgWeight decimal(10,2);
select (1+1+2+4) into weightsSum;
select (n1+n2+(2*n3)+(4*n4))/weightSum into avgWeight;
return avgWeight;
end $$
delimiter ;

delimiter $$
create function weighted_average1(n1 int, n2 int, n3 int, n4 int) 
returns decimal(10,2) deterministic
begin
declare weightsSum int;
declare avgWeight decimal(10,2);
select (1+1+2+4) into weightsSum;
select (n1+n2+(2*n3)+(4*n4))/weightSum into avgWeight;
return avgWeight;
end $$
delimiter ;
select stud_name, weighted_average1(mark1, mark2, mark3, mark4) 
as weightAvg from studentdata;

delimiter $$
create function weighted_average2(name varchar(30), n1 int, n2 int, n3 int, n4 int) 
returns decimal(10,2) deterministic
begin
declare weightsSum int;
declare avgWeight decimal(10,2);
select (1+1+2+4) into weightsSum;
select (n1+n2+(2*n3)+(4*n4))/weightSum into avgWeight;
insert into studentdata values
(name,n1,n2,n3,n4);
return avgWeight;
end $$
delimiter ;


delimiter $$
create function weighted_average_update(n varchar(30), n1 int, n2 int, n3 int, n4 int) 
returns int deterministic
begin
update studentdata
set mark1=n1, mark2=n2, mark3=n3, mark4=n4
where name=n;
return 1;
end $$
delimiter ;

delimiter $$
create function f_discount_price(price decimal(10,2)) 
returns decimal(10,2) deterministic
begin
declare discount decimal(10,2);
if price>500.00 then 
select 0.8*price into discount;
elseif price>100.00 then
select 0.9*price into discount;
end if;
return discount;
end $$
delimiter ;
select productCode, f_discount_price(msrp) as discount 
from products where productCode="S10_1949";

delimiter $$
create function sf_past_movie_return_date(rDate date)
returns varchar(5) deterministic
begin
declare datDiff int;
declare msg varchar(5);
select rDate-current_date() into datDiff;
if datDiff<0 then 
select "Yes" into msg;
else
select "No" into msg;
end if;
return msg;
end $$
delimiter ;

delimiter $$
create function get_salary(eid int) returns int deterministic
begin
declare sal int;
select salary into sal from employees 
where employee_id=eid;
return sal;
end $$
delimiter ;












