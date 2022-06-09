create or replace view branch_equipment as
select permanent_equipment.id,permanent_equipment.lastmaintenance,permanent_equipment.equipmentid,branch.id as branchID 
, branch.location  from barkalif.branch join 
barkalif.permanent_equipment on permanent_equipment.branchid = branch.id
where lastmaintenance between TO_DATE('1-1-2015','dd-mm-yyyy') and CURRENT_DATE;


select * from branch_equipment;











create or replace view branch_worker as
select branch.id,branch.location,branch.yearstart,worker.id as workerID,worker.startdate 
from barkalif.branch join barkalif.worker on  worker.branchid = branch.id
where branch.yearstart > 2010 
order by branchid;

select * from branch_worker;
