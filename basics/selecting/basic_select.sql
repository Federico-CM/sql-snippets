-- ============================================================
-- File: basic-select.sql
-- Basic SELECT usage in SQL
-- ============================================================

-- 1. Select all columns from a table
-- Use * sparingly!
SELECT *
FROM employees;

-- 2. Select specific columns
SELECT first_name, last_name, department
FROM employees;

-- 3. Rename (alias) columns
SELECT 
    first_name AS given_name,
    last_name AS surname
FROM employees;

-- 4. Use simple expressions (calculated columns)
SELECT
    first_name,
    last_name,
    salary,
    salary * 12 AS annual_salary
FROM employees;

-- 5. Remove duplicate rows
SELECT DISTINCT department
FROM employees;

-- 6. Sorting results
-- ASC is default
SELECT first_name, last_name, department
FROM employees
ORDER BY salary DESC;

-- 7. Filtering rows (basic WHERE clause)
SELECT first_name, last_name, salary
FROM employees
WHERE department = 'Sales';

-- 8. Filtering using comparison operators
SELECT first_name, last_name, salary
FROM employees
WHERE salary > 50000;

-- 9. Filtering using text patterns (LIKE)
SELECT first_name, last_name, salary
FROM employees
WHERE email LIKE '%@gmail.com';

-- 10. Limiting results (syntax varies by database)
-- PostgreSQL, MySQL, SQLite:
SELECT *
FROM employees
LIMIT 10;

-- SQL Server equivalent:
-- SELECT TOP 10 * FROM employees;

-- Oracle equivalent:
-- SELECT * FROM employees FETCH FIRST 10 ROWS ONLY;
 
