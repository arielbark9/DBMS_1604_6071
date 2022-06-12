SELECT b.id, b.location, e.id AS equipment_ID, e.cataloguenumber, pe.lastmaintenance
FROM barkalif.permanent_equipment pe, barkalif.branch b, equipment e
WHERE pe.branchid = b.id AND e.id = pe.equipmentid;