-- ============================================================
-- File: correlated.sql
-- Examples of correlated subqueries in SQL
-- ============================================================

-- 1. Correlated subquery with comparison
-- Returns employees who earn more than the average salary
-- of their own department
SELECT
    e.employee_id,
    e.name,
    e.salary,
    e.department_id
FROM employees e
WHERE e.salary >
      (
          SELECT AVG(e2.salary)
          FROM employees e2
          WHERE e2.department_id = e.department_id
      );

-- 2. Correlated subquery with EXISTS
-- Returns employees who belong to a department
-- that has at least one other employee
SELECT
    e.employee_id,
    e.name
FROM employees e
WHERE EXISTS
      (
          SELECT 1
          FROM employees e2
          WHERE e2.department_id = e.department_id
            AND e2.employee_id <> e.employee_id
      );

-- 3. Correlated subquery with NOT EXISTS
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

-- 4. Correlated subquery with MAX
-- Returns employees who earn the highest salary
-- in their department
SELECT
    e.employee_id,
    e.name,
    e.salary,
    e.department_id
FROM employees e
WHERE e.salary =
      (
          SELECT MAX(e2.salary)
          FROM employees e2
          WHERE e2.department_id = e.department_id
      );

-- 5. Correlated subquery with MIN
-- Returns employees who earn the lowest salary
-- in their department
SELECT
    e.employee_id,
    e.name,
    e.salary,
    e.department_id
FROM employees e
WHERE e.salary =
      (
          SELECT MIN(e2.salary)
          FROM employees e2
          WHERE e2.department_id = e.department_id
      );

-- 6. Correlated subquery with COUNT
-- Returns employees who work in departments
-- with more than 5 employees
SELECT
    e.employee_id,
    e.name,
    e.department_id
FROM employees e
WHERE
      (
          SELECT COUNT(*)
          FROM employees e2
          WHERE e2.department_id = e.department_id
      ) > 5;

-- 7. Correlated subquery with AVG and filtering
-- Returns employees whose salary is above
-- the average salary of all employees hired before them
SELECT
    e.employee_id,
    e.name,
    e.salary,
    e.hire_date
FROM employees e
WHERE e.salary >
      (
          SELECT AVG(e2.salary)
          FROM employees e2
          WHERE e2.hire_date < e.hire_date
      );

-- 8. Correlated subquery in SELECT clause
-- Shows each employee along with the average salary
-- of their department
SELECT
    e.employee_id,
    e.name,
    e.salary,
    (
        SELECT AVG(e2.salary)
        FROM employees e2
        WHERE e2.department_id = e.department_id
    ) AS department_avg_salary
FROM employees e;

-- 9. Correlated subquery with EXISTS and additional condition
-- Returns employees who earn more than at least one
-- coworker in the same department
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

-- 10. Multiple correlated conditions
-- Returns employees whose salary is both:
-- higher than their department average
-- and lower than the maximum salary in the company
SELECT
    e.employee_id,
    e.name,
    e.salary
FROM employees e
WHERE e.salary >
      (
          SELECT AVG(e2.salary)
          FROM employees e2
          WHERE e2.department_id = e.department_id
      )
  AND e.salary <
      (
          SELECT MAX(e3.salary)
          FROM employees e3
      );
 
