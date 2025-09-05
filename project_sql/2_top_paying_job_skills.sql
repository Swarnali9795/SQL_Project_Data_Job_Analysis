/* 
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from the first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which high-paying jobs demand certain sills,
    helping job seekers understand which skills to develop that align with top salaries.
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Singapore' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
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
Here’s a summary of the skills frequency insights from the Data Analyst roles in your file:
Most demanded skills (4 mentions each):
SQL, Python, Tableau → these form the core toolkit for querying, analysis, and visualization.
Frequently mentioned (2–3 mentions):
Excel (3), R (2), AWS (2), Power BI (2), Flow (2) → highlights importance of spreadsheets, statistics, cloud, BI tools, and automation.
Occasionally mentioned (1 mention each):
Spark, Hadoop, Word, PowerPoint, Looker → show added value in big data, reporting, and diverse BI platforms.
Overall insight:
The skillset for Data Analysts in 2023 is a blend of traditional (SQL, Excel), programming/statistics (Python, R), modern BI (Tableau, Power BI), 
and emerging cloud/big data tools (AWS, Spark, Hadoop). Soft skills like reporting and presentation are still relevant, but technical versatility 
is the main priority.

[
  {
    "job_id": 1235922,
    "job_title": "Research Scientist - Energy System",
    "salary_year_avg": "149653.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1439800,
    "job_title": "Research Scientist - Thermal Systems",
    "salary_year_avg": "149653.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 1439800,
    "job_title": "Research Scientist - Thermal Systems",
    "salary_year_avg": "149653.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1121066,
    "job_title": "Research Scientist - Instrumented Living Spaces",
    "salary_year_avg": "149653.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 1121066,
    "job_title": "Research Scientist - Instrumented Living Spaces",
    "salary_year_avg": "149653.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 1013035,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "ADDX",
    "skills": "sql"
  },
  {
    "job_id": 1013035,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "ADDX",
    "skills": "python"
  },
  {
    "job_id": 1013035,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "ADDX",
    "skills": "aws"
  },
  {
    "job_id": 1013035,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "ADDX",
    "skills": "excel"
  },
  {
    "job_id": 1013035,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "ADDX",
    "skills": "power bi"
  },
  {
    "job_id": 1013035,
    "job_title": "Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "ADDX",
    "skills": "flow"
  },
  {
    "job_id": 226924,
    "job_title": "Data Analyst, Mobile",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "sql"
  },
  {
    "job_id": 226924,
    "job_title": "Data Analyst, Mobile",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "python"
  },
  {
    "job_id": 226924,
    "job_title": "Data Analyst, Mobile",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "r"
  },
  {
    "job_id": 226924,
    "job_title": "Data Analyst, Mobile",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "tableau"
  },
  {
    "job_id": 1147623,
    "job_title": "Carbon Data Analyst, FiscalNote ESG Solutions",
    "salary_year_avg": "111175.0",
    "company_name": "FiscalNote",
    "skills": "excel"
  },
  {
    "job_id": 1147623,
    "job_title": "Carbon Data Analyst, FiscalNote ESG Solutions",
    "salary_year_avg": "111175.0",
    "company_name": "FiscalNote",
    "skills": "tableau"
  },
  {
    "job_id": 1147623,
    "job_title": "Carbon Data Analyst, FiscalNote ESG Solutions",
    "salary_year_avg": "111175.0",
    "company_name": "FiscalNote",
    "skills": "word"
  },
  {
    "job_id": 1147623,
    "job_title": "Carbon Data Analyst, FiscalNote ESG Solutions",
    "salary_year_avg": "111175.0",
    "company_name": "FiscalNote",
    "skills": "powerpoint"
  },
  {
    "job_id": 1295805,
    "job_title": "Data Analyst, Mobile (12 months Fixed Term contract)",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "sql"
  },
  {
    "job_id": 1295805,
    "job_title": "Data Analyst, Mobile (12 months Fixed Term contract)",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "python"
  },
  {
    "job_id": 1295805,
    "job_title": "Data Analyst, Mobile (12 months Fixed Term contract)",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "r"
  },
  {
    "job_id": 1295805,
    "job_title": "Data Analyst, Mobile (12 months Fixed Term contract)",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "spark"
  },
  {
    "job_id": 1295805,
    "job_title": "Data Analyst, Mobile (12 months Fixed Term contract)",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "hadoop"
  },
  {
    "job_id": 1295805,
    "job_title": "Data Analyst, Mobile (12 months Fixed Term contract)",
    "salary_year_avg": "111175.0",
    "company_name": "2K",
    "skills": "tableau"
  },
  {
    "job_id": 501111,
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen",
    "skills": "tableau"
  },
  {
    "job_id": 501111,
    "job_title": "Fraud Data Analyst",
    "salary_year_avg": "111175.0",
    "company_name": "Adyen",
    "skills": "looker"
  },
  {
    "job_id": 292547,
    "job_title": "Market Data Specialist, Feeds",
    "salary_year_avg": "109500.0",
    "company_name": "Jane Street",
    "skills": "linux"
  },
  {
    "job_id": 367728,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "ADDX",
    "skills": "sql"
  },
  {
    "job_id": 367728,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "ADDX",
    "skills": "python"
  },
  {
    "job_id": 367728,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "ADDX",
    "skills": "aws"
  },
  {
    "job_id": 367728,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "ADDX",
    "skills": "excel"
  },
  {
    "job_id": 367728,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "ADDX",
    "skills": "power bi"
  },
  {
    "job_id": 367728,
    "job_title": "Data Analyst",
    "salary_year_avg": "105000.0",
    "company_name": "ADDX",
    "skills": "flow"
  }
]
*/