-- ============================================================
-- File: exists-not-exists.sql
-- Examples of EXISTS and NOT EXISTS subqueries in MySQL
-- ============================================================

-- 1. EXISTS (basic)
-- Returns employees who belong to a department
-- that has at least one other employee
SELECT
    e.employee_id,
    e.name,
    e.department_id
FROM employees e
WHERE EXISTS
      (
          SELECT 1
          FROM employees e2
          WHERE e2.department_id = e.department_id
            AND e2.employee_id <> e.employee_id
      );

-- 2. NOT EXISTS (basic)
-- Returns employees who are the only employee
-- in their department
SELECT
    e.employee_id,
    e.name,
    e.department_id
FROM employees e
WHERE NOT EXISTS
      (
          SELECT 1
          FROM employees e2
          WHERE e2.department_id = e.department_id
            AND e2.employee_id <> e.employee_id
      );

-- 3. EXISTS with condition
-- Returns employees who earn more than
-- at least one coworker in the same department
SELECT
    e.employee_id,
    e.name,
    e.salary
FROM employees e
WHERE EXISTS
      (
          SELECT 1
          FROM employees e2
          WHERE e2.department_id = e.department_id
            AND e2.salary < e.salary
      );

-- 4. NOT EXISTS with condition
-- Returns employees who earn the lowest salary
-- in their department
SELECT
    e.employee_id,
    e.name,
    e.salary,
    e.department_id
FROM employees e
WHERE NOT EXISTS
      (
          SELECT 1
          FROM employees e2
          WHERE e2.department_id = e.department_id
            AND e2.salary < e.salary
      );

-- 5. EXISTS with another table
-- Returns departments that have at least one employee
SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE EXISTS
      (
          SELECT 1
          FROM employees e
          WHERE e.department_id = d.department_id
      );

-- 6. NOT EXISTS with another table
-- Returns departments with no employees
SELECT
    d.department_id,
    d.department_name
FROM departments d
WHERE NOT EXISTS
      (
          SELECT 1
          FROM employees e
          WHERE e.department_id = d.department_id
      );

-- 7. EXISTS with date condition
-- Returns employees hired after at least one
-- other employee in the company
SELECT
    e.employee_id,
    e.name,
    e.hire_date
FROM employees e
WHERE EXISTS
      (
          SELECT 1
          FROM employees e2
          WHERE e2.hire_date < e.hire_date
      );

-- 8. NOT EXISTS with date condition
-- Returns the earliest-hired employee(s)
SELECT
    e.employee_id,
    e.name,
    e.hire_date
FROM employees e
WHERE NOT EXISTS
      (
          SELECT 1
          FROM employees e2
          WHERE e2.hire_date < e.hire_date
      );

-- 9. EXISTS vs IN (NULL-safe example)
-- Returns employees who belong to a department
-- that has at least one manager
SELECT
    e.employee_id,
    e.name
FROM employees e
WHERE EXISTS
      (
          SELECT 1
          FROM managers m
          WHERE m.department_id = e.department_id
      );

-- 10. NOT EXISTS (anti-join pattern)
-- Returns employees who are not managers
SELECT
    e.employee_id,
    e.name
FROM employees e
WHERE NOT EXISTS
      (
          SELECT 1
          FROM managers m
          WHERE m.employee_id = e.employee_id
      );
 
