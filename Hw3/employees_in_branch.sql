SELECT b.id, b.location, workers.employee_count
FROM (SELECT b.id AS branch, COUNT(*) AS employee_count
     FROM barkalif.worker w, barkalif.branch b
     WHERE w.branchid = b.id
     GROUP BY b.id) workers, barkalif.branch b
WHERE workers.branch = b.id;