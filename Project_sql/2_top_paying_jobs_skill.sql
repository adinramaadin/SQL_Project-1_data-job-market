/*
Question: What skills are requited for the top-paying data analyst jobs?
- Use the top 10 highest-paying '%Data%' jobs from first query
- Add the specific skills required for these roles
- Why? it provides a detailed look at which high-paying jobs demand certain skills,
    - helping job seekers understand which skills to develop that align with top salaries
*/

SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.job_location,
    job_postings_fact.job_schedule_type,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_country,
    job_postings_fact.job_posted_date,
    company_dim.name AS company_name
FROM
    job_postings_fact
LEFT JOIN
    company_dim
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title LIKE '%Data%' 
    AND (job_postings_fact.job_location LIKE '%Indonesia%' OR job_country = 'Indonesia')
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC;