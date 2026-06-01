SHOW DATABASES;

CREATE DATABASE jobs_mart;

SELECT 
    catalog_name,
    schema_name
FROM information_schema.schemata;

USE jobs_mart;

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE IF NOT EXISTS staging.priority_roles
    (
        role_id INT,
        role_name VARCHAR
    );

SELECT 
    table_catalog,
    table_name,
    table_schema
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';

