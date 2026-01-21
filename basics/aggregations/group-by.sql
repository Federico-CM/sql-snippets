-- ============================================================
-- File: group-by.sql
-- Examples of GROUP BY usage in SQL
-- ============================================================

-- 1. Basic GROUP BY with COUNT
-- Counts the number of employees in each department
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

-- 2. GROUP BY with multiple columns
-- Groups employees by department and job title
SELECT
    department_id,
    job_title,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id, job_title;

-- 3. GROUP BY with aggregation functions
-- Calculates average, minimum, and maximum salary per department
SELECT
    department_id,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;

-- 4. GROUP BY with HAVING clause
-- Returns only departments with more than 5 employees
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

-- 5. GROUP BY with date functions
-- Groups orders by year and month
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);

-- 6. GROUP BY with JOIN
-- Counts employees per department name
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 7. GROUP BY with SUM
-- Calculates total sales per customer
SELECT
    customer_id,
    SUM(order_total) AS total_spent
FROM orders
GROUP BY customer_id;
 
