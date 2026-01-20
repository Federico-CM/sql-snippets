-- ============================================================
-- File: cross-join.sql
-- Examples of CROSS JOIN usage in SQL
-- ============================================================

-- 1. Basic CROSS JOIN between two tables
-- Returns the Cartesian product (every row combined with every row)
SELECT
    employees.first_name,
    departments.department_name
FROM employees
CROSS JOIN departments;

-- 2. CROSS JOIN using table aliases
SELECT
    e.first_name,
    d.department_name
FROM employees AS e
CROSS JOIN departments AS d;

-- 3. CROSS JOIN with a small lookup table
-- Commonly used to generate combinations (e.g., sizes and colors)
SELECT
    p.product_name,
    v.variant_name
FROM products AS p
CROSS JOIN variants AS v;

-- 4. CROSS JOIN with filtering
-- Technically a CROSS JOIN followed by a WHERE condition
-- (equivalent to an INNER JOIN, but less explicit)
SELECT
    e.first_name,
    d.department_name
FROM employees AS e
CROSS JOIN departments AS d
WHERE e.department_id = d.department_id;

-- 5. Generating all date and category combinations
-- Useful for reporting and gap analysis
SELECT
    d.calendar_date,
    c.category_name
FROM calendar_dates AS d
CROSS JOIN categories AS c;

-- 6. CROSS JOIN with aggregation
-- Count all possible employee–department combinations
SELECT
    COUNT(*) AS total_combinations
FROM employees
CROSS JOIN departments;

-- 7. Using CROSS JOIN to expand rows
-- Assign every employee to every training session
SELECT
    e.employee_id,
    e.first_name,
    t.training_name
FROM employees AS e
CROSS JOIN trainings AS t;

-- ------------------------------------------------------------
-- Note:
-- CROSS JOIN does not use an ON clause.
-- Careful: row counts grow multiplicatively.
-- ------------------------------------------------------------
 
