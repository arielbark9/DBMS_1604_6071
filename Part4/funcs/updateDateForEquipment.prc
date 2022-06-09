create or replace procedure updateDateForEquipment(Requipment_id_in in number) is
equipmenid number;
begin
  select re.equipmentid into equipmenid
  from barkalif.renewing_equipment re
  where re.id = Requipment_id_in
  fetch first 1 rows only;
  
  update renewing_equipment
  set renewing_equipment.lastrenew = CURRENT_DATE
  where renewing_equipment.id = equipmenid;
 
  dbms_output.put_line('update equipment id num: ' || Requipment_id_in ||  ' to date: ' || CURRENT_DATE);
  
  exception
    when NO_DATA_FOUND
      then 
        update permanent_equipment
  set permanent_equipment.lastmaintenance = CURRENT_DATE
  where permanent_equipment.id = Requipment_id_in;
  dbms_output.put_line('update equipment id num: ' || Requipment_id_in || ' to date: ' || CURRENT_DATE);
  when TOO_MANY_ROWS
    then 
      dbms_output.put_line(' ');
  
end updateDateForEquipment;


/*
begin 
  updateDateForEquipment(equipment_id_in => 1);
  end;
*/
