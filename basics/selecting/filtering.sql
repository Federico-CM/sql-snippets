 -- ============================================================
-- File: filtering.sql
-- Filtering techniques in SQL (WHERE, AND/OR, BETWEEN, IN, NULLs)
-- ============================================================

-- 1. Basic equality filter
SELECT first_name, last_name, department
FROM employees
WHERE department = 'Engineering';

-- 2. Multiple conditions (AND)
SELECT first_name, last_name, salary
FROM employees
WHERE department = 'Engineering'
  AND salary > 70000;

-- 3. OR conditions
SELECT first_name, last_name, department
FROM employees
WHERE department = 'HR'
   OR department = 'Finance';

-- 4. Combining AND + OR (use parentheses!)
SELECT first_name, last_name, salary, department
FROM employees
WHERE (department = 'Sales' OR department = 'Marketing')
  AND salary > 60000;

-- 5. Filtering with BETWEEN
-- Inclusive range
SELECT first_name, last_name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 80000;

-- 6. Filtering with IN
SELECT first_name, last_name, department
FROM employees
WHERE department IN ('HR', 'Finance', 'Legal');

-- 7. Filtering NULL values
SELECT first_name, last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- 8. Filtering NOT NULL values
SELECT first_name, last_name, email
FROM employees
WHERE email IS NOT NULL;

-- 9. Negating conditions (NOT)
-- Some people use <> instead of =
SELECT first_name, last_name, department
FROM employees
WHERE NOT department = 'Engineering';

-- 10. Filtering with LIKE (starts with, ends with, contains)
-- Starts with 'A'
SELECT first_name, last_name
FROM employees
WHERE first_name LIKE 'A%';

-- Ends with 'son' e.g. Petterson
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%son';

-- Contains 'senior'
SELECT first_name, last_name
FROM employees
WHERE job_title LIKE '%senior%';

-- 11. Filtering with comparison on dates
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '2020-01-01';

-- 12. Using boolean expressions in WHERE
SELECT first_name, last_name, active
FROM employees
WHERE active = TRUE;

-- 13. Excluding rows with NOT IN
SELECT first_name, last_name, department
FROM employees
WHERE department NOT IN ('Sales', 'Marketing');

-- 14. Complex filters with multiple columns
SELECT first_name, last_name, department, salary
FROM employees
WHERE (department = 'Engineering' AND salary > 90000)
   OR (department = 'Product' AND salary > 100000);

