SELECT
    jpf.job_id,
    cd.name AS company_name,
    jpf.job_title_short,
    jpf.job_location
FROM 
    job_postings_fact as jpf
FULL JOIN 
    company_dim as cd
    ON jpf.company_id = cd.company_id
LIMIT 10; 

SELECT  
    sd.skill_id,
    sjd.job_id,
    sd.skills,
    sd.type
FROM 
    skills_dim as sd
LEFT JOIN
    skills_job_dim as sjd
    ON sd.skill_id = sjd.skill_id
LIMIT 10;

SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM 
    job_postings_fact as jpf
LEFT JOIN
    skills_job_dim as sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN 
    skills_dim as sd
    ON sjd.skill_id = sd.skill_id
;


SELECT
    jpf.job_id,
    jpf.job_title_short,
    sjd.skill_id,
    sd.skills
FROM 
    job_postings_fact as jpf
INNER JOIN
    skills_job_dim as sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN 
    skills_dim as sd
    ON sjd.skill_id = sd.skill_id
;


SELECT *
FROM skills_dim
limit 10;


