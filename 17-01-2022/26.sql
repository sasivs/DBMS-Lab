set @i = 0;
select * from (select @i := @i+1 as i, worker_id from worker) e where mod(e.i,2)=0; 
SELECT * FROM Worker WHERE MOD(WORKER_ID,2)<>0