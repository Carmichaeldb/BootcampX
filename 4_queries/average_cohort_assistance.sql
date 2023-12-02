SELECT cohorts.name AS cohort, AVG((completed_at - started_at)) AS average_assistance_request_duration FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohort
ORDER BY average_assistance_request_duration;