/*
Question: What skills are requited for the top-paying data analyst jobs?
- Use the 'Data Analyst' jobs list from first query and limit it as only provides top 10 highest paying jobs
- Add the specific skills required for these roles
- Why? it provides a detailed look at which jobs demand certain skills,
    - helping job seekers understand which skills to develop that align according to each salaries
*/

WITH top_paying_jobs AS (SELECT
    job_postings_fact.job_id,
    job_postings_fact.job_title,
    job_postings_fact.salary_year_avg,
    job_postings_fact.job_country,
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
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
[
  {
    "job_id": 176019,
    "job_title": "Data Analyst - Merchant Success",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "BukuWarung",
    "skills": "sql"
  },
  {
    "job_id": 176019,
    "job_title": "Data Analyst - Merchant Success",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "BukuWarung",
    "skills": "python"
  },
  {
    "job_id": 176019,
    "job_title": "Data Analyst - Merchant Success",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "BukuWarung",
    "skills": "r"
  },
  {
    "job_id": 714818,
    "job_title": "Senior Data Analyst - Fraud",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "Moladin",
    "skills": "sql"
  },
  {
    "job_id": 714818,
    "job_title": "Senior Data Analyst - Fraud",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "Moladin",
    "skills": "python"
  },
  {
    "job_id": 714818,
    "job_title": "Senior Data Analyst - Fraud",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "Moladin",
    "skills": "r"
  },
  {
    "job_id": 714818,
    "job_title": "Senior Data Analyst - Fraud",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "Moladin",
    "skills": "sas"
  },
  {
    "job_id": 714818,
    "job_title": "Senior Data Analyst - Fraud",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "Moladin",
    "skills": "sas"
  },
  {
    "job_id": 1146075,
    "job_title": "Senior Data Analyst - User Trust",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "BukuWarung",
    "skills": "sql"
  },
  {
    "job_id": 1146075,
    "job_title": "Senior Data Analyst - User Trust",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "BukuWarung",
    "skills": "python"
  },
  {
    "job_id": 1146075,
    "job_title": "Senior Data Analyst - User Trust",
    "salary_year_avg": "111175.0",
    "job_country": "Indonesia",
    "company_name": "BukuWarung",
    "skills": "r"
  },
  {
    "job_id": 1516589,
    "job_title": "Customer Loyalty SLA Control Tower & Data Analyst",
    "salary_year_avg": "105000.0",
    "job_country": "Indonesia",
    "company_name": "Ninja Van",
    "skills": "excel"
  },
  {
    "job_id": 413113,
    "job_title": "Data Analyst - Consumer Lending",
    "salary_year_avg": "105000.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "sql"
  },
  {
    "job_id": 413113,
    "job_title": "Data Analyst - Consumer Lending",
    "salary_year_avg": "105000.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "python"
  },
  {
    "job_id": 413113,
    "job_title": "Data Analyst - Consumer Lending",
    "salary_year_avg": "105000.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "tableau"
  },
  {
    "job_id": 413113,
    "job_title": "Data Analyst - Consumer Lending",
    "salary_year_avg": "105000.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "looker"
  },
  {
    "job_id": 869889,
    "job_title": "(Operation) Data Analyst Manual Activity",
    "salary_year_avg": "102500.0",
    "job_country": "Indonesia",
    "company_name": "Ninja Van",
    "skills": "sql"
  },
  {
    "job_id": 869889,
    "job_title": "(Operation) Data Analyst Manual Activity",
    "salary_year_avg": "102500.0",
    "job_country": "Indonesia",
    "company_name": "Ninja Van",
    "skills": "excel"
  },
  {
    "job_id": 1367719,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_country": "Indonesia",
    "company_name": "Stockbit",
    "skills": "sql"
  },
  {
    "job_id": 1367719,
    "job_title": "Data Analyst",
    "salary_year_avg": "100500.0",
    "job_country": "Indonesia",
    "company_name": "Stockbit",
    "skills": "tableau"
  },
  {
    "job_id": 1467344,
    "job_title": "Data Analyst - Junior",
    "salary_year_avg": "77017.5",
    "job_country": "Indonesia",
    "company_name": "Samsung Electronics",
    "skills": "sql"
  },
  {
    "job_id": 1467344,
    "job_title": "Data Analyst - Junior",
    "salary_year_avg": "77017.5",
    "job_country": "Indonesia",
    "company_name": "Samsung Electronics",
    "skills": "python"
  },
  {
    "job_id": 1467344,
    "job_title": "Data Analyst - Junior",
    "salary_year_avg": "77017.5",
    "job_country": "Indonesia",
    "company_name": "Samsung Electronics",
    "skills": "aws"
  },
  {
    "job_id": 1467344,
    "job_title": "Data Analyst - Junior",
    "salary_year_avg": "77017.5",
    "job_country": "Indonesia",
    "company_name": "Samsung Electronics",
    "skills": "excel"
  },
  {
    "job_id": 182865,
    "job_title": "Data Analyst",
    "salary_year_avg": "75067.5",
    "job_country": "Indonesia",
    "company_name": "Trusting Social",
    "skills": "sql"
  },
  {
    "job_id": 182865,
    "job_title": "Data Analyst",
    "salary_year_avg": "75067.5",
    "job_country": "Indonesia",
    "company_name": "Trusting Social",
    "skills": "python"
  },
  {
    "job_id": 182865,
    "job_title": "Data Analyst",
    "salary_year_avg": "75067.5",
    "job_country": "Indonesia",
    "company_name": "Trusting Social",
    "skills": "r"
  },
  {
    "job_id": 182865,
    "job_title": "Data Analyst",
    "salary_year_avg": "75067.5",
    "job_country": "Indonesia",
    "company_name": "Trusting Social",
    "skills": "hadoop"
  },
  {
    "job_id": 182865,
    "job_title": "Data Analyst",
    "salary_year_avg": "75067.5",
    "job_country": "Indonesia",
    "company_name": "Trusting Social",
    "skills": "excel"
  },
  {
    "job_id": 1110700,
    "job_title": "Data Analyst (Junior/Entry-level) - Campaign Management",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "r"
  },
  {
    "job_id": 277216,
    "job_title": "Data Analyst",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "Gravel",
    "skills": "python"
  },
  {
    "job_id": 277216,
    "job_title": "Data Analyst",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "Gravel",
    "skills": "bigquery"
  },
  {
    "job_id": 521352,
    "job_title": "Data Analyst - Ads and Promo Platform",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "sql"
  },
  {
    "job_id": 521352,
    "job_title": "Data Analyst - Ads and Promo Platform",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "python"
  },
  {
    "job_id": 521352,
    "job_title": "Data Analyst - Ads and Promo Platform",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "bigquery"
  },
  {
    "job_id": 521352,
    "job_title": "Data Analyst - Ads and Promo Platform",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "gitlab"
  },
  {
    "job_id": 521352,
    "job_title": "Data Analyst - Ads and Promo Platform",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "asana"
  },
  {
    "job_id": 521352,
    "job_title": "Data Analyst - Ads and Promo Platform",
    "salary_year_avg": "57500.0",
    "job_country": "Indonesia",
    "company_name": "GoTo Group",
    "skills": "slack"
  }
]
*/