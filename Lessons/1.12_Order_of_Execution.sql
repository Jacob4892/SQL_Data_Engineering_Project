SELECT
    cd.name as company_name,
    COUNT(jpf.job_id) as posting_count
FROM
    job_postings_fact as jpf
LEFT JOIN
    company_dim as cd
    ON jpf.company_id = cd.company_id
WHERE 
    jpf.job_country = 'United States'
GROUP BY
    cd.name
HAVING 
    COUNT(jpf.job_id) > 3000
ORDER BY 
    COUNT(jpf.job_id) DESC
;



EXPLAIN ANALYZE SELECT
    cd.name as company_name,
    COUNT(jpf.job_id) as posting_count
FROM
    job_postings_fact as jpf
LEFT JOIN
    company_dim as cd
    ON jpf.company_id = cd.company_id
WHERE 
    jpf.job_country = 'United States'
GROUP BY
    cd.name
HAVING 
    COUNT(jpf.job_id) > 3000
ORDER BY 
    COUNT(jpf.job_id) DESC
;