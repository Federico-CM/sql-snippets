-- ============================================================
-- File: non_correlated.sql
-- Examples of NON-correlated subqueries in SQL
-- (inner query can run independently of the outer query)
-- ============================================================

-- 1. Non-correlated subquery with comparison
-- Returns employees who earn more than the overall average salary
SELECT
    employee_id,
    name,
    salary,
    department_id
FROM employees
WHERE salary >
      (
          SELECT AVG(salary)
          FROM employees
      );

-- 2. Non-correlated subquery with EXISTS (global check)
-- Returns all employees if there exists at least one department with 2+ employees
SELECT
    e.employee_id,
    e.name
FROM employees e
WHERE EXISTS
      (
          SELECT 1
          FROM employees
          GROUP BY department_id
          HAVING COUNT(*) >= 2
      );

-- 3. Non-correlated subquery with NOT EXISTS (global check)
-- Returns all employees only if no department has 2+ employees (rare, but valid non-correlated)
SELECT
    e.employee_id,
    e.name,
    e.department_id
FROM employees e
WHERE NOT EXISTS
      (
          SELECT 1
          FROM employees
          GROUP BY department_id
          HAVING COUNT(*) >= 2
      );

-- 4. Non-correlated subquery with MAX
-- Returns employees who earn the highest salary in the whole company
SELECT
    employee_id,
    name,
    salary,
    department_id
FROM employees
WHERE salary =
      (
          SELECT MAX(salary)
          FROM employees
      );

-- 5. Non-correlated subquery with MIN
-- Returns employees who earn the lowest salary in the whole company
SELECT
    employee_id,
    name,
    salary,
    department_id
FROM employees
WHERE salary =
      (
          SELECT MIN(salary)
          FROM employees
      );

-- 6. Non-correlated subquery with IN + COUNT (department filter computed independently)
-- Returns employees who work in departments with more than 5 employees
SELECT
    e.employee_id,
    e.name,
    e.department_id
FROM employees e
WHERE e.department_id IN
      (
          SELECT department_id
          FROM employees
          GROUP BY department_id
          HAVING COUNT(*) > 5
      );

-- 7. Non-correlated subquery with AVG and filtering (fixed cutoff date)
-- Returns employees whose salary is above the average salary of employees hired before 2020-01-01
SELECT
    e.employee_id,
    e.name,
    e.salary,
    e.hire_date
FROM employees e
WHERE e.salary >
      (
          SELECT AVG(salary)
          FROM employees
          WHERE hire_date < '2020-01-01'
      );


-- 8. Non-correlated subquery in SELECT clause (scalar constant)
-- Shows each employee along with the overall average salary (same value for every row)
SELECT
    e.employee_id,
    e.name,
    e.salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS company_avg_salary
FROM employees e;

-- 9. Non-correlated subquery with EXISTS + condition (global check)
-- Returns all employees if there exists at least one employee below 50,000 salary
SELECT
    e.employee_id,
    e.name,
    e.salary
FROM employees e
WHERE EXISTS
      (
          SELECT 1
          FROM employees
          WHERE salary < 50000
      );

-- 10. Multiple NON-correlated conditions
-- Returns employees whose salary is:
-- higher than the company average AND lower than the company maximum
SELECT
    employee_id,
    name,
    salary
FROM employees
WHERE salary >
      (
          SELECT AVG(salary)
          FROM employees
      )
  AND salary <
      (
          SELECT MAX(salary)
          FROM employees
      );
 
