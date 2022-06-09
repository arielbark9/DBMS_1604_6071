create or replace view equipment_VIEW as 
select  EXTRACT(Year from lastmaintenance)  as year ,count(*) as numberOf
from barkalif.permanent_equipment
where EXTRACT(Year from lastmaintenance) > 2015
group by  EXTRACT(Year from lastmaintenance);





select * from equipment_VIEW;


























create or replace view renewing_equipment_VIEW as 
select  EXTRACT(Year from lastrenew)  as year ,count(*) as numberOf
from barkalif.renewing_equipment
where EXTRACT(Year from lastrenew) > 2000
group by  EXTRACT(Year from lastrenew)
order by EXTRACT(Year from lastrenew);






select * from renewing_equipment_VIEW;






































declare
x number;
begin 
 printEquipmentNumber(branch_id => &<name"brach id">);
  end;






















