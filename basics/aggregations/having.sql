-- ============================================================
-- File: having.sql
-- Examples of HAVING usage in SQL
-- ============================================================

-- 1. Basic HAVING with COUNT
-- Returns departments with more than 5 employees
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- 2. HAVING with SUM
-- Returns customers whose total spending exceeds 10,000
SELECT
    customer_id,
    SUM(order_total) AS total_spent
FROM orders
GROUP BY customer_id
HAVING SUM(order_total) > 10000;

-- 3. HAVING with AVG
-- Returns departments with an average salary above 75,000
SELECT
    department_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 75000;

-- 4. HAVING with multiple aggregate conditions
-- Returns departments with more than 10 employees
-- and a total salary budget over 1,000,000
SELECT
    department_id,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 10
   AND SUM(salary) > 1000000;

-- 5. HAVING with JOIN
-- Returns departments with at least 3 employees
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) >= 3;

-- 6. HAVING vs WHERE (comparison example)
-- WHERE filters rows before grouping
-- HAVING filters groups after aggregation
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
WHERE hire_date >= DATE '2020-01-01'
GROUP BY department_id
HAVING COUNT(*) > 2;
 
