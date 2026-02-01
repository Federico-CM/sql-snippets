-- ============================================================
-- File: running-totals.sql
-- Examples of SQL running total window functions
-- Using SUM(), COUNT(), and AVG() with OVER()
-- ============================================================

-- 1. Basic running total
-- Cumulative salary ordered by employee_id
SELECT
    employee_id,
    first_name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
    ) AS running_salary_total
FROM employees;

-- 2. Running total ordered by salary
-- Shows accumulation from highest to lowest salary
SELECT
    employee_id,
    first_name,
    salary,
    SUM(salary) OVER (
        ORDER BY salary DESC
    ) AS running_salary_total
FROM employees;

-- 3. Running total with PARTITION BY
-- Resets running total for each department
SELECT
    employee_id,
    first_name,
    department_id,
    salary,
    SUM(salary) OVER (
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS dept_running_salary_total
FROM employees;

-- 4. Explicit window frame (ROWS)
-- Includes all rows from start up to the current row
SELECT
    employee_id,
    first_name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_salary_total
FROM employees;

-- 5. Running COUNT()
-- Counts employees as rows accumulate
SELECT
    employee_id,
    first_name,
    COUNT(*) OVER (
        ORDER BY employee_id
    ) AS running_employee_count
FROM employees;

-- 6. Running AVERAGE
-- Cumulative average salary
SELECT
    employee_id,
    first_name,
    salary,
    AVG(salary) OVER (
        ORDER BY employee_id
    ) AS running_avg_salary
FROM employees;

-- 7. Excluding the current row
-- Running total up to the previous row only
SELECT
    employee_id,
    first_name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
    ) AS prior_salary_total
FROM employees;

-- 8. Running totals with dates
-- Common in financial or event-based tables
SELECT
    order_id,
    order_date,
    amount,
    SUM(amount) OVER (
        ORDER BY order_date
    ) AS running_order_total
FROM orders;

-- 9. Running total with joins
-- Cumulative salary per department name
SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    e.salary,
    SUM(e.salary) OVER (
        PARTITION BY d.department_name
        ORDER BY e.salary DESC
    ) AS dept_running_salary_total
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;

-- 10. Running total vs moving window
-- Last 3 rows only (not a full running total)
SELECT
    employee_id,
    first_name,
    salary,
    SUM(salary) OVER (
        ORDER BY employee_id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3_row_salary
FROM employees;
 
