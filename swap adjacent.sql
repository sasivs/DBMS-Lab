drop table student;

create table student(
stud_id int,
stud_name varchar(50)
);

insert into student
values
(1, 'Lavanya'),
(2, 'Manasa'),
(3, 'Akhila'),
(4, 'Vasuki'),
(5, 'Vasuki');

select stud_name from student group by stud_name having count(stud_id)>1;

select stud_id, student.stud_name from student inner join 
(select stud_name from student group by stud_name having count(stud_id)>1)dup on student.stud_name=dup.stud_name;

select s1.stud_id, s1.stud_name from student s1, student s2 where s1.stud_id>s2.stud_id and s1.stud_name=s2.stud_name;

delete from student where stud_name in 
(select * from (select stud_id, stud_name from student s1 
where 1<(select count(*) from student s2 where s1.stud_name=s2.stud_name and s1.stud_id<s2.stud_id))s);

delete from student where (stud_id,stud_name) in 
(select * from (select s1.stud_id, s1.stud_name from student s1, student s2 where s1.stud_id>s2.stud_id and s1.stud_name=s2.stud_name)s);


delete s1 from student s1, student s2 where s1.stud_id>s2.stud_id and s1.stud_name=s2.stud_name; 
set @i=-1;
set @j=0;
select count(*) from student into @c;


select * from student;

DELIMITER //
create procedure swap_adjacent()
begin
set @i=1;
set @j=2;
select count(*) from student into @c;
while @i<=@c and @j<=@c do
update student s1 
inner join student s2 on s1.stud_id<>s2.stud_id
set s1.stud_name=s2.stud_name,
s2.stud_name=s1.stud_name
where s1.stud_id = @i  and s2.stud_id = @j;
set @i = @i+2;
set @j = @j+2;
end while;
end //
DELIMITER ;

call swap_adjacent();



