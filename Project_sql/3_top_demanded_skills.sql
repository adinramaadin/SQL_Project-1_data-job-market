/*
Questions: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst
- Focus on all job postings.
- Why? Retrieves the tops 5 skills with the highest demand in the job market,
    - providing insights into the most valuablke skills for job seekers.
*/

SELECT 
    skills,
    count(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title LIKE '%Data%'
    AND (job_postings_fact.job_location LIKE '%Indonesia%' OR job_country = 'Indonesia')
GROUP BY
    skills
ORDER BY
    demand_count DESC