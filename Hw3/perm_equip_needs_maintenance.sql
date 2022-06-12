SELECT e.*, pe.branchid, pe.lastmaintenance
FROM barkalif.permanent_equipment pe, barkalif.equipment e
WHERE (CURRENT_DATE - pe.lastmaintenance) > 365 AND pe.equipmentid = e.id;