create or replace procedure printEquipmentNumber(branch_id in number) is

cursor renewing_equipmentCur is 
select * 
  from barkalif.renewing_equipment
  where renewing_equipment.branchid = branch_id;
  
  cursor permanent_equipmentCur is 
select * 
  from barkalif.permanent_equipment
  where permanent_equipment.branchid = branch_id;
  
  counterRen number;
  
  counterPer number;
  
begin
  counterRen := 0;
  counterPer := 0;
  
  for row_ in renewing_equipmentCur
    loop
    counterRen := counterRen + 1;
    end loop;
    
      for row_ in permanent_equipmentCur
        loop
    counterPer := counterPer + 1;
    end loop;
    
    dbms_output.put_line('branch id: '|| branch_id);
    dbms_output.put_line('number of renewing equipment in branch: '|| counterRen);
    dbms_output.put_line('number of permanent equipmentCur in branch: '|| counterPer);
    
  
end printEquipmentNumber;
/
