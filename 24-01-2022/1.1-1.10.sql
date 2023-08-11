select s.name, d.name from student s join department d 
on s.deptNo=d.deptId;

select s.name, d.phone from student s join department d
on s.deptNo=d.deptId where s.sex='F';

select s.name, p.name from student s join professor p
on s.advisor=p.empID;

select s.name from student s join professor p
on s.advisor=p.empID where s.sex=p.sex;

select s.name from student s join professor p
on s.advisor=p.empID where s.sex<>p.sex;

select distinct s.name from (enrollment e join course c on e.courseId = c.courseId) 
join student s on s.rollNo = e.rollNo where c.credits=4;

select d.name, p.name from department d join professor p 
on d.hod=p.empId;

select d.name, p.name from department d join professor p 
on d.hod=p.empId where p.sex='F';

select c.name, c1.name from (course c join preRecCourse pr on c.courseId=pr.courseId)
join course c1 on pr.preRecCourse=c1.courseId;

select p.name from (teaching t1 join teaching t2
on t1.classroom = t2.classroom and t1.empId<>t2.empId) join professor p
on t1.empId = p.empId