create or replace function needToRenewEq(branch_ID in number) return integer is

  cursor EquipmentInBranch is
  select re.id, re.lastrenew, re.branchid
  from barkalif.branch b join barkalif.renewing_equipment re on re.branchid = b.id
  where b.id = Branch_id;

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
          updateDateForEquipment(Requipment_id_in => row_.id); -- use of another procedure
          flag := false;
          commit;
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


