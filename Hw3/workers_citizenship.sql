SELECT w.citizenship, COUNT(*) employee_count
FROM barkalif.worker w
GROUP BY w.citizenship;