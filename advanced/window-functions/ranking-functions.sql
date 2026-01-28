-- ============================================================
-- File: ranking-functions.sql
-- Examples of SQL ranking window functions
-- RANK(), DENSE_RANK(), and NTILE()
-- ============================================================

-- 1. RANK()
-- Assigns a rank based on salary; ties receive the same rank
-- Gaps appear in ranking after ties
SELECT
    employee_id,
    first_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 2. DENSE_RANK()
-- Similar to RANK(), but without gaps after ties
SELECT
    employee_id,
    first_name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM employees;

-- 3. RANK() with PARTITION BY
-- Ranks employees by salary within each department
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS dept_salary_rank
FROM employees;

-- 4. DENSE_RANK() with PARTITION BY
-- Dense ranking of salaries per department
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    DENSE_RANK() OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS dept_salary_dense_rank
FROM employees;

-- 5. NTILE()
-- Divides rows into equal-sized buckets (quartiles in this example)
SELECT
    employee_id,
    first_name,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- 6. Ranking with joins
-- Ranks employees by salary within department names
SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    e.salary,
    RANK() OVER (
        PARTITION BY d.department_name
        ORDER BY e.salary DESC
    ) AS dept_salary_rank
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;

-- 7. Top-N per group using RANK()
-- Returns top 3 highest-paid employees per department
SELECT
    employee_id,
    first_name,
    department_id,
    salary
FROM (
    SELECT
        employee_id,
        first_name,
        department_id,
        salary,
        RANK() OVER (
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS rnk
    FROM employees
) AS ranked
WHERE rnk <= 3;

-- 8. Comparing RANK vs DENSE_RANK
-- Helpful for understanding gaps in ranking
SELECT
    employee_id,
    first_name,
    salary,
    RANK() OVER (ORDER BY salary DESC)       AS rank_value,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_value
FROM employees;
 
