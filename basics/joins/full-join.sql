-- ============================================================
-- File: full-join.sql
-- Examples of FULL (OUTER) JOIN usage in SQL
-- ============================================================

-- 1. Basic FULL JOIN between two tables
-- Returns all rows from both tables, matching where possible
SELECT
    employees.employee_id,
    employees.first_name,
    departments.department_name
FROM employees
FULL JOIN departments
    ON employees.department_id = departments.department_id;

-- 2. FULL JOIN using table aliases
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees AS e
FULL JOIN departments AS d
    ON e.department_id = d.department_id;

-- 3. FULL JOIN with multiple join conditions
-- Preserves all shipments and all warehouses
SELECT
    s.shipment_id,
    s.shipment_date,
    w.warehouse_name
FROM shipments AS s
FULL JOIN warehouses AS w
    ON s.warehouse_id = w.warehouse_id
   AND s.region_code = w.region_code;

-- 4. FULL JOIN across three tables
-- Keeps all employees, departments, and locations
SELECT
    e.first_name,
    d.department_name,
    l.location_name
FROM employees AS e
FULL JOIN departments AS d
    ON e.department_id = d.department_id
FULL JOIN locations AS l
    ON d.location_id = l.location_id;

-- 5. FULL JOIN with filtering
-- Use OR and NULL checks to avoid unintentionally removing rows
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
FULL JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering'
   OR d.department_name IS NULL
   OR e.employee_id IS NULL;

-- 6. FULL JOIN with aggregation
-- Counts employees per department, including unmatched rows
SELECT
    COALESCE(d.department_name, 'No Department') AS department_name,
    COUNT(e.employee_id) AS employee_count
FROM employees AS e
FULL JOIN departments AS d
    ON e.department_id = d.department_id
GROUP BY COALESCE(d.department_name, 'No Department');

-- 7. Finding non-matching rows on either side
-- Employees without departments OR departments without employees
SELECT
    e.employee_id,
    e.first_name,
    d.department_id,
    d.department_name
FROM employees AS e
FULL JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.employee_id IS NULL
   OR d.department_id IS NULL;

-- ------------------------------------------------------------
-- Note:
-- FULL JOIN is not supported in some databases (e.g. MySQL).
-- In those systems, it can be emulated using
-- LEFT JOIN UNION RIGHT JOIN.
-- ------------------------------------------------------------
 
