SELECT e.*, re.branchid, re.lastrenew
FROM barkalif.renewing_equipment re, barkalif.equipment e
WHERE (CURRENT_DATE - re.lastrenew) > 100 AND re.equipmentid = e.id;