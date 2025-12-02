-- ============================================================
-- File: inner-join.sql
-- Examples of INNER JOIN usage in SQL
-- ============================================================

-- 1. Basic INNER JOIN between two tables
-- Returns rows where matching keys exist in both tables
SELECT
    employees.employee_id,
    employees.first_name,
    departments.department_name
FROM employees
INNER JOIN departments
    ON employees.department_id = departments.department_id;

-- 2. INNER JOIN using table aliases
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id;

-- 3. INNER JOIN with multiple join conditions
SELECT
    s.shipment_id,
    s.shipment_date,
    w.warehouse_name
FROM shipments AS s
INNER JOIN warehouses AS w
    ON s.warehouse_id = w.warehouse_id
   AND s.region_code = w.region_code;


-- 4. INNER JOIN across three tables
SELECT
    e.first_name,
    d.department_name,
    l.location_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
INNER JOIN locations AS l
    ON d.location_id = l.location_id;

-- 5. INNER JOIN with filtering
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';

-- 6. INNER JOIN with aggregation
SELECT
    d.department_name,
    COUNT(*) AS employee_count
FROM employees AS e
INNER JOIN departments AS d
    ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 7. INNER JOIN in a subquery
-- Find employees working in departments with more than 10 people
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
INNER JOIN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 10
) AS big_depts
    ON e.department_id = big_depts.department_id
INNER JOIN departments AS d
    ON d.department_id = e.department_id;

