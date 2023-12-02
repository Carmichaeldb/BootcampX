SELECT teachers.name AS teachers, cohorts.name AS cohort, count(assistance_requests) AS total_assistances FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assistance_requests ON students.id = student_id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE cohorts.name = 'JUL02'
GROUP BY (teachers, cohort)
ORDER BY teachers;