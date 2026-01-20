-- ============================================================
-- File: left-join.sql
-- Examples of LEFT JOIN usage in SQL
-- ============================================================

-- 1. Basic LEFT JOIN between two tables
-- Returns all rows from the left table, even if no match exists
SELECT
    employees.employee_id,
    employees.first_name,
    departments.department_name
FROM employees
LEFT JOIN departments
    ON employees.department_id = departments.department_id;

-- 2. LEFT JOIN using table aliases
SELECT
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id;

-- 3. LEFT JOIN with multiple join conditions
-- Preserves all shipments, even if no matching warehouse is found
SELECT
    s.shipment_id,
    s.shipment_date,
    w.warehouse_name
FROM shipments AS s
LEFT JOIN warehouses AS w
    ON s.warehouse_id = w.warehouse_id
   AND s.region_code = w.region_code;

-- 4. LEFT JOIN across three tables
-- Keeps all employees, even if department or location is missing
SELECT
    e.first_name,
    d.department_name,
    l.location_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
LEFT JOIN locations AS l
    ON d.location_id = l.location_id;

-- 5. LEFT JOIN with filtering on the right table
-- Note: filtering in WHERE can turn a LEFT JOIN into an INNER JOIN
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';

-- 6. LEFT JOIN with filtering that preserves non-matching rows
-- Move the condition into the JOIN to keep all employees
SELECT
    e.first_name,
    e.last_name,
    d.department_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
   AND d.department_name = 'Engineering';

-- 7. LEFT JOIN with aggregation
-- Includes departments with zero employees
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM departments AS d
LEFT JOIN employees AS e
    ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 8. Finding rows with no match (anti-join pattern)
-- Employees who are not assigned to any department
SELECT
    e.employee_id,
    e.first_name,
    e.last_name
FROM employees AS e
LEFT JOIN departments AS d
    ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

