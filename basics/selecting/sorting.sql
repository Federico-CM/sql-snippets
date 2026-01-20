-- ============================================================
-- File: basic-sorting.sql
-- Sorting results in SQL using ORDER BY
-- ============================================================

-- 1. Basic sorting (ascending is default)
-- ORDER BY can be expensive on large tables without indexes
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary;

-- 2. Explicit ascending order (easier to read)
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary ASC;

-- 3. Descending order
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC;

-- 4. Sort by multiple columns
-- First by department (A–Z), then by salary (high to low)
SELECT first_name, last_name, department, salary
FROM employees
ORDER BY department ASC, salary DESC;

-- 5. Sort using column position (not recommended for readability)
-- Sorts by the 3rd selected column (salary)
SELECT first_name, last_name, salary
FROM employees
ORDER BY 3 DESC;

-- 6. Sort by an alias
SELECT
    first_name,
    last_name,
    salary * 12 AS annual_salary
FROM employees
ORDER BY annual_salary DESC;

-- 7. Sorting with NULL values
-- PostgreSQL syntax shown
SELECT first_name, last_name, bonus
FROM employees
ORDER BY bonus DESC NULLS LAST;

-- 8. Sort with LIMIT (top-N queries)
-- Get top 5 highest-paid employees
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 9. Random sorting (use carefully!)
-- PostgreSQL / SQLite
SELECT *
FROM employees
ORDER BY RANDOM();

-- MySQL equivalent:
-- ORDER BY RAND();
