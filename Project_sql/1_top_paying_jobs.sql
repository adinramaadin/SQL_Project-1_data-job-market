/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying "%Data Analyst%" roles that are available in Indonesia,
- Focuses on job postings with specified salaries (remove nulls),
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment opportunities 
*/

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'job_postings_fact';

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
    job_title LIKE '%Data Analyst%' 
    AND (job_postings_fact.job_location LIKE '%Indonesia%' OR job_country = 'Indonesia')
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

