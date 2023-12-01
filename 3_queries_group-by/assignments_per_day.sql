SELECT assignments.day, count(*) AS total_assignments FROM assignments
GROUP BY assignments.day
ORDER BY assignments.day;
