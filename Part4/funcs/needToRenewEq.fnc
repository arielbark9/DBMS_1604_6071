create or replace function needToRenewEq(branch_ID in number) return integer is

  cursor EquipmentInBranch is
  select *
  from barkalif.branch join barkalif.renewing_equipment on renewing_equipment.branchid = branch.id
  where branchid = Branch_id;

  counter number;
  unValidInput exception;
  nothingToDo exception;
  flag boolean ;
begin
  flag := true;
    counter := 0;
  for row_ in EquipmentInBranch
    loop
      if CURRENT_DATE > row_.lastrenew then 
         counter := counter +1;
          updateDateForEquipment(equipment_id_in => row_.equipmentid); -- use of another procedure
          flag := false;
      end if;
    end loop;
    if flag = true
      then 
        raise nothingToDo;
    else if counter = 0 then
       raise unValidInput;
      else
        dbms_output.put_line('total update Equipment: ' || counter);
     end if;
     end if;
  return(counter);
    exception when
     nothingToDo then 
      dbms_output.put_line('All equipment is up to date');
        return(-1); 
      when unValidInput then 
    dbms_output.put_line('Branch id not exist');
      return(-1);
end needToRenewEq;


/*
declare

x number;
begin 
 -- x := needToRenewEq(branch_ID => &<name="branch id">);
    x := needToRenewEq(branch_ID => 900);
    dbms_output.put_line('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    dbms_output.put_line('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    dbms_output.put_line('function res: ' || x);
  end;
*/
