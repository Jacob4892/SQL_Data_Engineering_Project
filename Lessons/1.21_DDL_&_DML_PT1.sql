--.read Lessons/1.21_DDL_&_DML_PT1.sql

USE data_jobs;

DROP DATABASE IF EXISTS jobs_mart;

CREATE DATABASE IF NOT EXISTS jobs_mart;

SHOW DATABASES;

SELECT *
FROM information_schema.schemata;

USE jobs_mart;

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS jobs_mart.staging.preferred_roles
    (
        role_id INT PRIMARY KEY,
        role_name VARCHAR
    );

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';

INSERT INTO jobs_mart.staging.preferred_roles (role_id, role_name)
VALUES
    (1, 'Data Engineer'),
    (2, 'Senior Data Engineer'),
    (3, 'Software Engineer');

SELECT * 
FROM jobs_mart.staging.preferred_roles;