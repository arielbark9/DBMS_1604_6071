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