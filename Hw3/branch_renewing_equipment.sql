SELECT b.id, b.location, e.id AS equipment_ID, e.cataloguenumber, re.lastrenew
FROM barkalif.renewing_equipment re, barkalif.branch b, equipment e
WHERE re.branchid = b.id AND e.id = re.equipmentid;