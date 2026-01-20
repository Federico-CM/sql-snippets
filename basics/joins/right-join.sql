-- ============================================================
-- File: right-join.sql
-- Examples of RIGHT JOIN usage in SQL
-- ============================================================

-- 1. Basic RIGHT JOIN between two tables
-- Returns all rows from the right table, even if no match exists
SELECT
    employees.employee_id,
    employees.first_name,
    departments.department_name
FROM employees
RIGHT JOIN departments
    ON employees.department_id = departments.department_id;

-- 2. RIGHT JOIN using table aliases
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id;

-- 3. RIGHT JOIN with multiple join conditions
-- Preserves all warehouses, even if no matching shipment is found
SELECT
    s.shipment_id,
    s.shipment_date,
    w.warehouse_name
FROM shipments AS s
RIGHT JOIN warehouses AS w
    ON s.warehouse_id = w.warehouse_id
   AND s.region_code = w.region_code;

-- 4. RIGHT JOIN across three tables
-- Keeps all locations, even if departments or employees are missing
SELECT
    e.first_name,
    d.department_name,
    l.location_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id
RIGHT JOIN locations AS l
    ON d.location_id = l.location_id;

-- 5. RIGHT JOIN with filtering on the left table
-- Note: filtering in WHERE can negate the RIGHT JOIN effect
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.last_name = 'Smith';

-- 6. RIGHT JOIN with filtering that preserves non-matching rows
-- Move the condition into the JOIN clause
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id
   AND e.last_name = 'Smith';

-- 7. RIGHT JOIN with aggregation
-- Includes employees not assigned to any department (if supported by schema)
SELECT
    e.employee_id,
    COUNT(d.department_id) AS department_count
FROM departments AS d
RIGHT JOIN employees AS e
    ON e.department_id = d.department_id
GROUP BY e.employee_id;

-- 8. Finding rows with no match (anti-join pattern)
-- Departments that have no employees
SELECT
    d.department_id,
    d.department_name
FROM employees AS e
RIGHT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

-- ------------------------------------------------------------
-- Note:
-- RIGHT JOIN is functionally equivalent to swapping tables
-- and using LEFT JOIN. For clarity, using LEFT JOIN is sometimes better.
-- ------------------------------------------------------------
 
