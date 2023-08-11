create table Customer(
cid int primary key,
cname varchar(50) not null
);

create table Branch(
bcode int primary key,
bname varchar(50) not null
);

create table Accounts(
ano int primary key,
atype varchar(1) not null,
balance int not null,
cid int not null,
bcode int not null
);

create table Transactions(
tid int not null,
ano int not null,
Tttype varchar(1) not null,
Tdate date default (current_date),
Tamount int not null,
primary key (tid,ano)
);

insert into customer(cid, cname)
values(1,"Vision"),
(2,"Wanda"),
(3,"Stephen"),
(4,"Christi"),
(5,"Xavier");

insert into branch(bcode, bname)
values(1,"Illuminati"),
(2,"Kamar Taj");

insert into Accounts(ano, atype, balance, cid, bcode)
values(1,'S',10000,1,1),
(2,'C',20000,1,1),
(3,'S',30000,2,2),
(4,'C',40000,2,2),
(5,'S',50000,3,1),
(6,'S',60000,4,2),
(7,'C',70000,5,1);

insert into Transactions(tid, ano, Tttype, Tamount)
values(1,1,'D',2000),
(2,1,'D',3000),
(3,1,'W',10000),
(4,2,'D',5000),
(5,2,'W',10000),
(6,3,'D',20000),
(7,4,'W',2000),
(8,4,'W',2000),
(9,4,'D',1000),
(10,5,'W',20000);

select c.cid,c.cname from customer c join 
(Accounts a1 join Accounts a2 on a1.cid=a2.cid and a1.atype='S' and a2.atype='C') 
on c.cid=a1.cid;

select b.bcode, b.bname, count(*) as nAcc from branch b join Accounts a 
on b.bcode=a.bcode group by b.bcode,b.bname;

select b.bcode, b.bname from branch b join accounts a 
on b.bcode=a.bcode group by b.bcode,b.bname 
having count(*)<(select (select count(*) from accounts)/(select count(*) from branch) as average);  

select c1.cid,c1.cname from customer c1 join 
(select a.cid from accounts a join transactions t on a.ano=t.ano and a.aType='S'
group by a.cid,t.Tdate having count(*)=3) c2 on c1.cid=c2.cid;

create view branch_details as 
select b.bcode,b.bname, count(*) as nAcc from branch b join accounts a 
on b.bcode=a.bcode group by b.bcode, b.bname;

select * from branch_details;
