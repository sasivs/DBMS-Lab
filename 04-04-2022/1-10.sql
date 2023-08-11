create table WorkCenters(
id int auto_increment primary key ,
name varchar(30) not null,
capacity int not null
);

create table WorkCenterStats(
totalCapacity int not null
);

delimiter ;;
create trigger Before_Insert before insert
on WorkCenters for each row
begin
declare nrows int;
select * into nrows from WorkCenterStats;
if nrows > 0 then
update WorkCenterStats
set totalCapacity = totalCapacity + new.capacity;
else
insert into WorkCenterStats(totalCapacity)
values(new.capacity);
end if;
end ;;
delimiter ;

drop table if exists workcenterstats;

insert into WorkCenters(name, capacity)
values("The Backyard", 100);

select * from WorkCenterStats;

insert into WorkCenters(name, capacity)
values("The Hells Kitchen", 100);

select * from WorkCenterStats;

drop table if exists members;
create table members(
id int auto_increment primary key,
name varchar(30) not null,
email varchar(50) not null,
birthDate date
);
 
create table remainders(
id int auto_increment primary key,
memberId int,
message varchar(200) not null
);
drop trigger if exists After_Insert;
delimiter ;;
create trigger After_Insert after insert
on members for each row
begin
if new.birthDate<=>null then
insert into remainders(memberId, message)
values(new.id, "Please update your date of birth"); 
end if;
end ;;
delimiter ;

INSERT INTO members(name, email, birthDate)
VALUES ('Khatar', 'khatar@gamil.com', NULL);

select * from remainders;

create table sales(
id int auto_increment primary key,
product varchar(50) not null,
quantity int not null,
fiscalYear int not null,
fiscalMonth varchar(5) not null
);

delimiter ;;
create trigger Before_Update before update
on sales for each row
begin
if new.quantity>(3*old.quantity) then
signal sqlstate '45000' set message_text = "Increasing the value by 3 times";
end if;
end ;;
delimiter ;

insert into sales (product, quantity, fiscalYear, fiscalMonth)
values("Web fluid", 40, 2022, "Apr");

update sales
set quantity=150 where id=1;

create table salesChange(
id int auto_increment primary key,
salesId int not null,
beforeQuantity int not null,
afterQuantity int not null,
changedAt timestamp not null);

delimiter ;;
create trigger After_Update_quantity after update
on sales for each row
begin
insert into salesChange (salesId,beforeQuantity,afterQuantity,changedAt)
values(old.id, old.quantity, new.quantity, current_timestamp());
end ;;
delimiter ;

update sales
set quantity=60 where id=1;

select * from salesChange;

drop table if exists salaries;

create table salaries(
employeeNumber int auto_increment primary key,
validFrom date not null,
amount int not null);

create table salaryArchives(
id int auto_increment primary key,
employeeNumber int not null,
validFrom date not null,
amount int not null,
deletedAt date not null);

delimiter ;;
create trigger before_delete_salary before delete
on salaries for each row
begin
insert into salaryArchives (employeeNumber, validFrom, amount, deletedAt)
values(old.employeeNumber, old.validFrom, old.amount, curdate());
end ;;
delimiter ;

insert into salaries(validFrom, amount)
values(curdate(), 100000);

select * from salaries;
delete from salaries where employeeNumber=3;
select * from salaryArchives;

drop table if exists salaryBudget;
create table salary(
employeeNumber int auto_increment primary key,
sal int not null);
create table salaryBudget(
total int not null
);

drop trigger if exists after_insert_salary;
delimiter ;;
create trigger after_insert_salary after insert
on salary for each row
begin
declare nrows int;
declare psal int;
select count(*) into nrows from salaryBudget;
if nrows>0 then
select total into psal from salaryBudget;
delete from salaryBudget;
insert into salaryBudget(total)
values((psal+new.sal));
else
insert into salaryBudget(total)
values(new.sal);
end if;
end ;;
delimiter ;

delimiter ;;
create trigger after_delete_salary after delete
on salary for each row
begin
declare nrows int;
declare psal int;
select count(*) into nrows from salary;
if nrows>0 then
select total into psal from salaryBudget;
delete from salaryBudget;
insert into salaryBudget(total)
values(psal-old.sal);
else
delete from salaryBudget;
end if;
end ;;
delimiter ;

insert into salary(sal)
values(100000),
(200000);
select * from salary;
delete from salary where sal=100000;
select * from salaryBudget;

create table products(
productCode int auto_increment primary key,
productName varchar(50) not null,
msrp int not null
);
create table priceLogs(
id int auto_increment primary key,
productCode int not null,
price int not null,
updated_at timestamp default current_timestamp()
);
create table userChangeLogs(
id int auto_increment primary key,
productCode int not null,
updatedAt timestamp default current_timestamp,
updatedBy varchar(50) not null
); 
delimiter ;;
create trigger before_products_update before update
on products for each row
begin
if old.msrp<>new.msrp then
insert into priceLogs(productCode,price)
values(new.productCode,old.msrp);
end if;
end ;;
delimiter ;

delimiter ;;
create trigger before_products_update_log_user before update
on products for each row follows before_products_update
begin
if old.msrp<>new.msrp then
insert into userChangeLogs(productCode,updatedBy)
values(old.productCode,user());
end if;
end ;;
delimiter ;

insert into products (productName,msrp)
values("mjolnr",10000);
select * from products;
update products 
set msrp=15000 where productName="mjolnr";
select * from pricelogs;
select * from userchangelogs;

create table person(
nam varchar(50) not null,
age int not null);

delimiter ;;
create trigger before_insert_age before insert
on person for each row
begin
if new.age<18 then
signal sqlstate '45000' set message_text = "Age is less than 18 years";
end if;
end ;;
delimiter ;

insert into person(nam,age)
values("Robert Downey jr",57);
insert into person(nam,age)
values("vision",3);

create table average_age(
average double);

delimiter ;;
create trigger after_insert_avg after insert
on person for each row
begin
declare avg_age double;
select avg(age) into avg_age from person;
delete from average_age;
insert into average_age(average)
values(avg_age);
end ;;
delimiter ;

insert into person(nam,age)
values("Thor", 1500);

select * from average_age;

delimiter ;;
create trigger before_update_person before update
on person for each row
begin
if new.age<18 then 
signal sqlstate '45000' set message_text = "Age is less than 18 years";
end if;
end ;;
delimiter ;

update person 
set age=10 where nam="Thor";

delimiter ;;
create trigger after_update_avg after update
on person for each row
begin
declare avg_age double;
if new.age<>old.age then
select avg(age) into avg_age from person;
delete from average_age;
insert into average_age(average)
values(avg_age);
end if;
end ;;
delimiter ;

select * from average_age;

update person set age=1700 where nam="Thor";
drop table if exists person_archive;
create table person_archive(
nam varchar(50) not null,
age int not null,
time_del timestamp default current_timestamp()
);

delimiter ;;
create trigger before_delete_person before delete
on person for each row
begin
insert into person_archive (nam,age)
values(old.nam,old.age);
end ;;
delimiter ;

delete from person where nam="Robert Downey jr";
select * from person_archive;

delimiter ;;
create trigger after_delete_avg after delete
on person for each row
begin
declare avg_age double;
select avg(age) into avg_age from person;
delete from average_age;
insert into average_age(average)
values(avg_age);
end ;;
delimiter ;

alter table average_age modify column average double null;
select * from person;
delete from person;
select * from average_age;
