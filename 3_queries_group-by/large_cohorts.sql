SELECT cohorts.name AS cohort_name, count(*) AS student_count FROM students
JOIN cohorts on cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING count(*) >= 18
ORDER BY student_count;