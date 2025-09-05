/*
Question: What are the top skills based on salary?
- Look at the average yearly associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries.
- Why? It reveals how different skills impact salary levels for data analysts,
    and helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
    AND job_location = 'Singapore'
GROUP BY 
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Here are some **quick insights and trends** from the **top-paying skills for Data Analysts** based on your list:

---
**Key Trends**

1. **Big Data & Engineering Pay Premium**
   * **Spark (\$121K), Hadoop (\$84K)** top the list.
   * Analysts with big data processing expertise are paid **well above average**, as these skills overlap with data engineering.

2. **Specialized BI/Visualization Tools Lead to Higher Salaries**
   * **Looker (\$111K), Qlik (\$100K), Tableau (\$95K), Power BI (\$87K)**.
   * Less common tools like **Looker & Qlik** command higher pay than the mainstream Tableau/Power BI, likely due to **rarity + niche demand**.

3. **Programming & Analytics Libraries Boost Earnings**
   * **Python (\$103K), R (\$94K), JavaScript (\$98K)**.
   * Within Python ecosystem: **NumPy & Pandas (\$100K each)** show that **data wrangling & computation expertise** adds value.

4. **Statistical & Legacy Tools Still Pay Well**
   * **SAS (\$100K), SPSS (\$99K)** → though older, these tools remain valuable in industries like finance, pharma, and government.

5. **Cloud Skills Show Mixed Returns**
   * **AWS (\$92K)** pays higher than **Azure/GCP (\$73K each)**.
   * Suggests AWS is the **most in-demand for analysts**, while Azure/GCP may be seen as more specialized or less required at analyst level.

6. **Office/Collaboration Tools Surprisingly Appear**
   * **Word & PowerPoint (\$105K), Excel (\$100K), Zoom, Slack (\$100K)**.
   * Likely reflects **job postings that list broad tool use**, not that these alone drive pay.
   * Suggests analysts in high-paying industries still rely on strong **communication and reporting skills**.

---

**Summary Insight**

* **Highest paying Data Analyst jobs** skew toward **big data (Spark, Hadoop), niche BI (Looker, Qlik), and advanced programming (Python, NumPy, Pandas)**.
* **Mainstream tools (SQL, Tableau, Power BI)** pay solid but lower than niche/engineering-heavy skills.
* **Cloud (AWS) and statistical tools (SAS, SPSS)** provide additional salary boosts.
* Soft skills/tools (Excel, Word, PowerPoint, Slack) still matter—analysts are **not only coders but communicators**.

---
*/