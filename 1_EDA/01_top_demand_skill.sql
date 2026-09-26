/*
Question: What are the most in-demand skills for data engineers?
- Join job postings to inner join table similar to query 2
- Identify the top 10 in-demand skills for data engineers
- Focus on remote job postings
- Why? Retrieves the top 10 skills with the highest demand in the remote job market,
    providing insights into the most valuable skills for data engineers seeking remote work
*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sd.skill_id = sjd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = true
GROUP BY
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 10;

/*
│   skills   │ median_salary │ demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ sql        │      130000.0 │        29221 │
│ python     │      135000.0 │        28776 │
│ aws        │      137320.0 │        17823 │
│ azure      │      128000.0 │        14143 │
│ spark      │      140000.0 │        12799 │
│ airflow    │      150000.0 │         9996 │
│ snowflake  │      135500.0 │         8639 │
│ databricks │      132750.0 │         8183 │
│ java       │      135000.0 │         7267 │
│ gcp        │      136000.0 │         6446 │


*/