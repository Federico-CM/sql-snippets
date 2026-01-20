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

-- 8. Limiting results
-- Works in PostgreSQL, MySQL, SQLite
SELECT *
FROM employees
LIMIT 10;
