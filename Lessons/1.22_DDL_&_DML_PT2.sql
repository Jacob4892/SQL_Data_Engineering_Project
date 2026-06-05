/*          
DESCRIBE    Easy way to pull all the column names to place in the SELECT statement of the Creation of the job_postings_flat Table
SELECT 
    jpf.*,
    cd.*
FROM data_jobs.job_postings_fact as jpf
LEFT JOIN data_jobs.company_dim as cd
ON cd.company_id = jpf.company_id
;
*/

--.read Lessons/1.22_DDL_&_DML_PT2.sql

--Creating job_postings_flat Table in staging schema of Jobs mart
CREATE OR REPLACE TABLE staging.job_postings_flat AS
SELECT 
    jpf.job_id,
    jpf.job_title_short,
    jpf.job_title,
    jpf.job_location,
    jpf.job_via,
    jpf.job_schedule_type,
    jpf.job_work_from_home,
    jpf.search_location,
    jpf.job_posted_date,
    jpf.job_no_degree_mention,
    jpf.job_health_insurance,
    jpf.job_country,
    jpf.salary_rate,
    jpf.salary_year_avg,
    jpf.salary_hour_avg,
    cd.name AS company_name
FROM data_jobs.job_postings_fact AS jpf
LEFT JOIN data_jobs.company_dim AS cd
    ON cd.company_id = jpf.company_id;

SELECT * 
FROM jobs_mart.staging.job_postings_flat
LIMIT 50;

--Creating view of priority_jobs_flat_view for the staging schema of Jobs Mart
CREATE OR REPLACE VIEW staging.priority_jobs_flat_view AS
SELECT 
    jpf.*
From staging.job_postings_flat AS jpf
LEFT JOIN staging.priority_roles as pr
ON jpf.job_title_short = pr.role_name
WHERE pr.priority_lvl = 1;

SELECT * 
FROM staging.priority_jobs_flat_view
LIMIT 50;