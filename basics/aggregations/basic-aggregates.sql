 -- ============================================================
-- File: basic-aggregates.sql
-- Examples of basic aggregate functions in SQL
-- ============================================================

-- 1. COUNT
-- Returns the total number of employees
SELECT
    COUNT(*) AS total_employees
FROM employees;

-- 2. COUNT with column (ignores NULLs)
-- Returns the number of employees with a department assigned
SELECT
    COUNT(department_id) AS employees_with_department
FROM employees;

-- 3. SUM
-- Returns the total salary paid to all employees
SELECT
    SUM(salary) AS total_salary
FROM employees;

-- 4. AVG
-- Returns the average salary of all employees
SELECT
    AVG(salary) AS average_salary
FROM employees;

-- 5. MIN
-- Returns the lowest salary
SELECT
    MIN(salary) AS lowest_salary
FROM employees;

-- 6. MAX
-- Returns the highest salary
SELECT
    MAX(salary) AS highest_salary
FROM employees;

-- 7. DISTINCT with aggregates
-- Returns the number of unique job titles
SELECT
    COUNT(DISTINCT job_title) AS unique_job_titles
FROM employees;

-- 8. Aggregates with WHERE filtering
-- Returns the average salary for Engineering employees only
SELECT
    AVG(salary) AS engineering_avg_salary
FROM employees
WHERE department_id = 10;

-- 9. Aggregates with expressions
-- Returns total compensation including bonus
SELECT
    SUM(salary + bonus) AS total_compensation
FROM employees;

-- 10. Multiple aggregates in one query
-- Returns overall employee statistics
SELECT
    COUNT(*) AS total_employees,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees;

