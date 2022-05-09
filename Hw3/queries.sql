SELECT b.id, b.location, e.id AS equipment_ID, e.cataloguenumber, pe.lastmaintenance
FROM barkalif.permanent_equipment pe, barkalif.branch b, equipment e
WHERE pe.branchid = b.id AND e.id = pe.equipmentid;

SELECT b.id, b.location, e.id AS equipment_ID, e.cataloguenumber, re.lastrenew
FROM barkalif.renewing_equipment re, barkalif.branch b, equipment e
WHERE re.branchid = b.id AND e.id = re.equipmentid;

SELECT b.id, b.location, workers.employee_count
FROM (SELECT b.id AS branch, COUNT(*) AS employee_count
     FROM barkalif.worker w, barkalif.branch b
     WHERE w.branchid = b.id
     GROUP BY b.id) workers, barkalif.branch b
WHERE workers.branch = b.id;

SELECT w.citizenship, COUNT(*) employee_count
FROM barkalif.worker w
GROUP BY w.citizenship;

SELECT e.*, pe.branchid, pe.lastmaintenance
FROM barkalif.permanent_equipment pe, barkalif.equipment e
WHERE (CURRENT_DATE - pe.lastmaintenance) > 365 AND pe.equipmentid = e.id;

SELECT e.*, re.branchid, re.lastrenew
FROM barkalif.renewing_equipment re, barkalif.equipment e
WHERE (CURRENT_DATE - re.lastrenew) > 100 AND re.equipmentid = e.id;

SELECT be.id, SUM(be.equipment_count) AS total_equipment
FROM
       (SELECT b.id, COUNT(*) AS equipment_count
       FROM barkalif.branch b, barkalif.permanent_equipment pe
       WHERE b.id = pe.branchid
       GROUP BY b.id
       UNION ALL
       SELECT b.id, COUNT(*)
       FROM barkalif.branch b, barkalif.renewing_equipment re
       WHERE b.id = re.branchid
       GROUP BY b.id) be
GROUP BY be.id;
