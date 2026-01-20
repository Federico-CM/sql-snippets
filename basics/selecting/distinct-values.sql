-- ============================================================
-- File: distinct-values.sql
-- Removing duplicate values with DISTINCT
-- ============================================================

-- 1. Get unique values from a single column
SELECT DISTINCT department
FROM employees;

-- 2. DISTINCT on multiple columns
-- Unique combinations of department and job title
SELECT DISTINCT department, job_title
FROM employees;

-- 3. DISTINCT with sorting
SELECT DISTINCT department
FROM employees
ORDER BY department;

-- 4. DISTINCT with WHERE
-- Unique departments in a specific location
SELECT DISTINCT department
FROM employees
WHERE location = 'New York';

-- 5. DISTINCT with expressions
-- Unique salary amounts after a calculation
SELECT DISTINCT salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

-- 6. DISTINCT with LIMIT
-- First 5 unique departments
SELECT DISTINCT department
FROM employees
ORDER BY department
LIMIT 5;

-- 7. DISTINCT vs GROUP BY (equivalent in simple cases)

-- Using DISTINCT
SELECT DISTINCT department
FROM employees;

-- Using GROUP BY
SELECT department
FROM employees
GROUP BY department;

-- 8. COUNT with DISTINCT
-- Count how many unique departments exist
SELECT COUNT(DISTINCT department) AS department_count
FROM employees;

-- 9. DISTINCT across all selected columns
-- Removes rows that are fully duplicated
-- (Be careful with wildcards!)
SELECT DISTINCT *
FROM employees;

-- 10. Common mistake: DISTINCT applies to ALL selected columns
-- This does NOT return unique departments only
SELECT DISTINCT department, salary
FROM employees;
 
