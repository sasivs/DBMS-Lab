select JOINING_DATE,DEPARTMENT,count(*) from worker
group by JOINING_DATE,DEPARTMENT having count(*)>1