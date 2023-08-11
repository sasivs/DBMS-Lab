create table student(
rollno int,
name varchar(30),
degree varchar(30),
year int,
sex varchar(1),
deptno int,
advisor varchar(30)
);

insert into student
values
(1,'a','deg1',1,'M',1,'A')
(2,'b','deg2',1,'M',2,'B')
(3,'c','deg1',1,'F',1,'Cjobs')
(1,'Flash','BTech',1,'M',101,'Octavius'),
(2,'Peter Parker','Science',1,'M',102,'Tony Stark'),
(3,'Tony','BTech',1,'M',103,'Pepper Potts'),
(4,'Stephen','Magic',1,'M',104,'Ancient one'),
(5,'Jane Foster','Astrology',1,'F',105,'Erik Selvig'),
(6,'Bruce Banner','Cytology',1,'M',106,null),
(7,'Betty Ross','Cytology',1,'F',106,'Ross'),
(8,'Thor','Astrology',1,'M',105,'Odin'),
(9,'Nick Fury','Inter-gallactic threats',1,'M',107,null),
(10,'Natasha','Life Skills',1,'F',108,'Clint Barton'),
(11,'Steve Rogers','Survival',1,'M',109,null),
(12,'Peter Quill','Social Skills',1,'M',110,'Yondu'),
(13,'T\'Challa','Archeology',1,'M',111,'T\'Chaka'),
(14,'Loki','Mischief',1,'M',112,'Frigga');

create table department(
deptid int,
name varchar(30),
hod varchar(30),
phone varchar(10)
);

insert into department
values 
(

create table professor(
empid int,
name varchar(30),
sex varchar(1),
startYear varchar(4),
deptno int,
phone varchar(10)
);

create table course(
courseid int,
cname varchar(30),
credits int,
deptno int
);

create table enrollment(
rollno int,
courseid int,
sem int,
year int,
grade varchar(1)
);

create table teaching(
empid int,
courseid int,
sem int,
year int,
classroom varchar(5)
);

create table prerequisite(
preRecCourse varchar(30),
courseid int
);