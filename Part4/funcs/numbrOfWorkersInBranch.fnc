create or replace function numbrOfWorkersInBranch(Branch_id in number) return number is

  cursor workerInBranch is
  select worker.id as workerID
  from barkalif.branch join barkalif.worker on worker.branchid = branch.id
  where branchid = Branch_id;
  
  counter number;
  unValidInput exception;
begin
  counter := 0;
  for row_ in workerInBranch
    loop
      counter := counter +1;
      dbms_output.put_line('worker id: ' || row_.workerID);
    end loop;
    if counter = 0
      then raise unValidInput;
      else
        dbms_output.put_line('total workers in this branch is: ' || counter);
     end if;
  

  return(counter);
  exception when 
    unValidInput then 
    dbms_output.put_line('Branch id not exist');
     return(-1);
end numbrOfWorkersInBranch;

/*
declare 
x number;
begin 
  x := numbrOfWorkersInBranch(Branch_id => &<name="branch id">);
    dbms_output.put_line('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    dbms_output.put_line('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  dbms_output.put_line('function res: ' || x);
end;
  
*/
/
