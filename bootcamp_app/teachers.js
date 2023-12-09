const { Pool } = require('pg');
const args = process.argv;

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT DISTINCT teachers.name AS teachers, cohorts.name AS cohort FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assistance_requests ON students.id = student_id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE cohorts.name = '${args[2]}'
GROUP BY (teachers, cohort)
ORDER BY teachers;
`)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.cohort}: ${user.teachers}`);
    });
  })
  .catch(err => console.error('query error', err.stack));