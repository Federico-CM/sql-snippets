-- ============================================================
-- File: window-functions-row-number.sql
-- Examples of ROW_NUMBER() window function usage in SQL
-- ============================================================

-- 1. Basic ROW_NUMBER()
-- Assigns a unique sequential number to each row
SELECT
    employee_id,
    first_name,
    ROW_NUMBER() OVER (ORDER BY employee_id) AS row_num
FROM employees;

-- 2. ROW_NUMBER() with ordering
-- Row numbers are assigned based on salary (highest first)
SELECT
    employee_id,
    first_name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 3. ROW_NUMBER() with PARTITION BY
-- Row numbers reset for each department
SELECT
    employee_id,
    first_name,
    department_id,
    ROW_NUMBER() OVER (
        PARTITION BY department_id
        ORDER BY employee_id
    ) AS dept_row_num
FROM employees;

-- 4. ROW_NUMBER() to find the first row per group
-- Returns the first employee (by hire date) in each department
SELECT
    employee_id,
    first_name,
    department_id,
    hire_date
FROM (
    SELECT
        employee_id,
        first_name,
        department_id,
        hire_date,
        ROW_NUMBER() OVER (
            PARTITION BY department_id
            ORDER BY hire_date
        ) AS rn
    FROM employees
) AS ranked
WHERE rn = 1;

-- 5. ROW_NUMBER() for deduplication
-- Keeps only one row per email address
SELECT
    employee_id,
    first_name,
    email
FROM (
    SELECT
        employee_id,
        first_name,
        email,
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY employee_id
        ) AS rn
    FROM employees
) AS deduped
WHERE rn = 1;

-- 6. ROW_NUMBER() with joins
-- Numbers employees within each department by salary
SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    ROW_NUMBER() OVER (
        PARTITION BY d.department_name
        ORDER BY e.salary DESC
    ) AS dept_salary_rank
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;

-- 7. ROW_NUMBER() for pagination
-- Returns rows 11–20 ordered by employee_id
SELECT
    *
FROM (
    SELECT
        employee_id,
        first_name,
        ROW_NUMBER() OVER (ORDER BY employee_id) AS rn
    FROM employees
) AS numbered
WHERE rn BETWEEN 11 AND 20;
 
