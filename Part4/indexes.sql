create INDEX renewing_equipment_IDX on renewing_equipment(branchid,lastrenew,equipmentid);


create INDEX branch_IDX on branch(yearstart);

create index permanent_equipment_IDX on permanent_equipment(lastmaintenance,branchid,equipmentid)

