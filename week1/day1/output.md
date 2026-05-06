**Schema (MySQL v8)**

    -- Create Department table
    CREATE TABLE Department (
        department_id INT PRIMARY KEY,
        name VARCHAR(50) NOT NULL
    );
    
    -- Create Employee table
    CREATE TABLE Employee (
        emp_id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        age INT,
        salary DECIMAL(10, 2),
        department_id INT,
        hire_date DATE,
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    
    -- Create Project table
    CREATE TABLE Project (
        project_id INT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        department_id INT,
        FOREIGN KEY (department_id) REFERENCES Department(department_id)
    );
    
    -- Insert data into Department table
    INSERT INTO Department (department_id, name) VALUES
    (1, 'IT'),
    (2, 'HR'),
    (3, 'Finance'),
    (4, 'Marketing');
    
    -- Insert data into Employee table
    INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
    (1, 'John Doe', 28, 50000.00, 1, '2020-01-15'),
    (2, 'Jane Smith', 34, 60000.00, 2, '2019-07-23'),
    (3, 'Bob Brown', 45, 80000.00, 1, '2018-02-12'),
    (4, 'Alice Blue', 25, 45000.00, 3, '2021-03-22'),
    (5, 'Charlie P.', 29, 50000.00, 2, '2019-12-01'),
    (6, 'David Green', 38, 70000.00, 4, '2022-05-18'),
    (7, 'Eve Black', 40, 55000.00, 3, '2021-08-30');
    
    -- Insert data into Project table
    INSERT INTO Project (project_id, name, department_id) VALUES
    (1, 'Project Alpha', 1),
    (2, 'Project Beta', 2),
    (3, 'Project Gamma', 1),
    (4, 'Project Delta', 3),
    (5, 'Project Epsilon', 4),
    (6, 'Project Zeta', 4),
    (7, 'Project Eta', 3);
    
    
    -- Insert additional data into Department table (if needed)
    -- No additional departments needed for this data set
    
    -- Insert additional data into Employee table to test edge cases for joins and nested queries
    INSERT INTO Employee (emp_id, name, age, salary, department_id, hire_date) VALUES
    (8, 'Frank White', 32, 48000.00, NULL, '2021-07-10'),  -- Employee without a department
    (9, 'Grace Kelly', 27, 65000.00, 1, '2018-11-13'),
    (10, 'Hannah Lee', 30, 53000.00, 4, '2020-02-25');
    
    -- Insert additional data into Project table to test edge cases for joins
    INSERT INTO Project (project_id, name, department_id) VALUES
    (8, 'Project Theta', 1),
    (9, 'Project Iota', NULL);  -- Project without a department

---
# -- Basic Queries

**Query #1**
    
    -- 1. Select all columns from the Employee table.
    SELECT * FROM Employee;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #2**

    -- 2. Select only the name and salary columns from the Employee table.
    SELECT name, salary FROM Employee;

| name        | salary  |
| ----------- | ------- |
| John Doe    | 50000.0 |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| Alice Blue  | 45000.0 |
| Charlie P.  | 50000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |
| Frank White | 48000.0 |
| Grace Kelly | 65000.0 |
| Hannah Lee  | 53000.0 |

---
**Query #3**

    -- 3. Select employees who are older than 30.
    SELECT * FROM Employee
    WHERE age > 30;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #4**

    -- 4. Select the names of all departments.
    SELECT name FROM Department;

| name      |
| --------- |
| IT        |
| HR        |
| Finance   |
| Marketing |

---
**Query #5**

    -- 5. Select employees who work in the IT department.
    SELECT e.name
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    WHERE d.name = 'IT';

| name        |
| ----------- |
| John Doe    |
| Bob Brown   |
| Grace Kelly |

---
# --String Matching Queries

**Query #6**
    
    -- 6. Select employees whose names start with 'J'.
    SELECT * FROM Employee
    WHERE name LIKE 'J%';

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |
| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |

---
**Query #7**

    -- 7. Select employees whose names end with 'e'.
    SELECT * FROM Employee
    WHERE name LIKE '%e';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #8**

    -- 8. Select employees whose names contain 'a'.
    SELECT * FROM Employee
    WHERE name LIKE '%a%';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #9**

    -- 9. Select employees whose names are exactly 9 characters long.
    SELECT * FROM Employee
    WHERE name LIKE '_________';

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |
| 7      | Eve Black | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #10**

    -- 10. Select employees whose names have 'o' as the second character.
    SELECT * FROM Employee
    WHERE name LIKE '_o%';

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe  | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |

---

# -- Date Queries

**Query #11**

    
    
    -- 11. Select employees hired in the year 2020.
    SELECT * FROM Employee
    WHERE YEAR(hire_date) = 2020;

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe   | 28  | 50000.0 | 1             | 2020-01-15 |
| 10     | Hannah Lee | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #12**

    -- 12. Select employees hired in January of any year.
    SELECT * FROM Employee
    WHERE MONTH(hire_date) = 1;

| emp_id | name     | age | salary  | department_id | hire_date  |
| ------ | -------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe | 28  | 50000.0 | 1             | 2020-01-15 |

---
**Query #13**

    -- 13. Select employees hired before 2019.
    SELECT * FROM Employee
    WHERE hire_date < '2019-01-01';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #14**

    -- 14. Select employees hired on or after March 1, 2021.
    SELECT * FROM Employee
    WHERE hire_date >= '2021-03-01';

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |

---
**Query #15**

    -- 15. Select employees hired in the last 2 years.
    SELECT * FROM Employee
    WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

There are no results to be displayed.

---

# -- Aggregate Queries

**Query #16**

 
    
    -- 16. Select the total salary of all employees.
    SELECT SUM(salary) AS total_salary
    FROM Employee;

| total_salary |
| ------------ |
| 576000.0     |

---
**Query #17**

    -- 17. Select the average salary of employees.
    SELECT AVG(salary) AS average_salary
    FROM Employee;

| average_salary |
| -------------- |
| 57600.0        |

---
**Query #18**

    -- 18. Select the minimum salary in the Employee table.
    SELECT MIN(salary) AS minimum_salary
    FROM Employee;

| minimum_salary |
| -------------- |
| 45000.0        |

---
**Query #19**

    -- 19. Select the number of employees in each department.
    SELECT department_id, COUNT(*) AS employee_count
    FROM Employee
    GROUP BY department_id;

| department_id | employee_count |
| ------------- | -------------- |
|               | 1              |
| 1             | 3              |
| 2             | 2              |
| 3             | 2              |
| 4             | 2              |

---
**Query #20**

    -- 20. Select the average salary of employees in each department.
    SELECT department_id, AVG(salary) AS average_salary
    FROM Employee
    GROUP BY department_id;

| department_id | average_salary |
| ------------- | -------------- |
|               | 48000.0        |
| 1             | 65000.0        |
| 2             | 55000.0        |
| 3             | 50000.0        |
| 4             | 61500.0        |

---

 # -- Group By Queries

**Query #21**

    
    -- 21. Select the total salary for each department.
    SELECT department_id, SUM(salary) AS total_salary
    FROM Employee
    GROUP BY department_id;

| department_id | total_salary |
| ------------- | ------------ |
|               | 48000.0      |
| 1             | 195000.0     |
| 2             | 110000.0     |
| 3             | 100000.0     |
| 4             | 123000.0     |

---
**Query #22**

    -- 22. Select the average age of employees in each department.
    SELECT department_id, AVG(age) AS average_age
    FROM Employee
    GROUP BY department_id;

| department_id | average_age |
| ------------- | ----------- |
|               | 32.0        |
| 1             | 33.3333     |
| 2             | 31.5        |
| 3             | 32.5        |
| 4             | 34.0        |

---
**Query #23**

    -- 23. Select the number of employees hired in each year.
    SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
    FROM Employee
    GROUP BY YEAR(hire_date);

| hire_year | employee_count |
| --------- | -------------- |
| 2020      | 2              |
| 2019      | 2              |
| 2018      | 2              |
| 2021      | 3              |
| 2022      | 1              |

---
**Query #24**

    -- 24. Select the highest salary in each department.
    SELECT department_id, MAX(salary) AS highest_salary
    FROM Employee
    GROUP BY department_id;

| department_id | highest_salary |
| ------------- | -------------- |
|               | 48000.0        |
| 1             | 80000.0        |
| 2             | 60000.0        |
| 3             | 55000.0        |
| 4             | 70000.0        |

---
**Query #25**

    -- 25. Select the department with the highest average salary.
    SELECT department_id, AVG(salary) AS average_salary
    FROM Employee
    GROUP BY department_id
    ORDER BY average_salary DESC
    LIMIT 1;

| department_id | average_salary |
| ------------- | -------------- |
| 1             | 65000.0        |

---

# -- Having Queries

**Query #26**
    
    -- 26. Select departments with more than 2 employees.
    SELECT department_id, COUNT(*) AS employee_count
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) > 2;

| department_id | employee_count |
| ------------- | -------------- |
| 1             | 3              |

---
**Query #27**

    -- 27. Select departments with an average salary greater than 55000.
    SELECT department_id, AVG(salary) AS average_salary
    FROM Employee
    GROUP BY department_id
    HAVING AVG(salary) > 55000;

| department_id | average_salary |
| ------------- | -------------- |
| 1             | 65000.0        |
| 4             | 61500.0        |

---
**Query #28**

    -- 28. Select years with more than 1 employee hired.
    SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
    FROM Employee
    GROUP BY YEAR(hire_date)
    HAVING COUNT(*) > 1;

| hire_year | employee_count |
| --------- | -------------- |
| 2020      | 2              |
| 2019      | 2              |
| 2018      | 2              |
| 2021      | 3              |

---

 # -- Order By Queries

**Query #29**

    -- 29. Select departments with a total salary expense less than 100000.
    SELECT department_id, SUM(salary) AS total_salary
    FROM Employee
    GROUP BY department_id
    HAVING SUM(salary) < 100000;

| department_id | total_salary |
| ------------- | ------------ |
|               | 48000.0      |

---
**Query #30**

    -- 30. Select departments with the maximum salary above 75000.
    SELECT department_id, MAX(salary) AS max_salary
    FROM Employee
    GROUP BY department_id
    HAVING MAX(salary) > 75000;

| department_id | max_salary |
| ------------- | ---------- |
| 1             | 80000.0    |

---
**Query #31**

   
    
    -- 31. Select all employees ordered by their salary in ascending order.
    SELECT *
    FROM Employee
    ORDER BY salary ASC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #32**

    -- 32. Select all employees ordered by their age in descending order.
    SELECT *
    FROM Employee
    ORDER BY age DESC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |

---
**Query #33**

    -- 33. Select all employees ordered by their hire date in ascending order.
    SELECT *
    FROM Employee
    ORDER BY hire_date ASC;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

---
**Query #34**

    -- 34. Select employees ordered by their department and then by their salary.
    SELECT *
    FROM Employee
    ORDER BY department_id, salary;

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 8      | Frank White | 32  | 48000.0 |               | 2021-07-10 |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 5      | Charlie P.  | 29  | 50000.0 | 2             | 2019-12-01 |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |

---
**Query #35**

    -- 35. Select departments ordered by the total salary of their employees.
    SELECT department_id, SUM(salary) AS total_salary
    FROM Employee
    GROUP BY department_id
    ORDER BY total_salary DESC;

| department_id | total_salary |
| ------------- | ------------ |
| 1             | 195000.0     |
| 4             | 123000.0     |
| 2             | 110000.0     |
| 3             | 100000.0     |
|               | 48000.0      |

---

# -- Join Queries

**Query #36**

   
    
    -- 36. Select employee names along with their department names.
    SELECT e.name AS employee_name, d.name AS department_name
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id;

| employee_name | department_name |
| ------------- | --------------- |
| John Doe      | IT              |
| Bob Brown     | IT              |
| Grace Kelly   | IT              |
| Jane Smith    | HR              |
| Charlie P.    | HR              |
| Alice Blue    | Finance         |
| Eve Black     | Finance         |
| David Green   | Marketing       |
| Hannah Lee    | Marketing       |

---
**Query #37**

    -- 37. Select project names along with the department names they belong to.
    SELECT p.name AS project_name, d.name AS department_name
    FROM Project p
    JOIN Department d
    ON p.department_id = d.department_id;

| project_name    | department_name |
| --------------- | --------------- |
| Project Alpha   | IT              |
| Project Gamma   | IT              |
| Project Theta   | IT              |
| Project Beta    | HR              |
| Project Delta   | Finance         |
| Project Eta     | Finance         |
| Project Epsilon | Marketing       |
| Project Zeta    | Marketing       |

---
**Query #38**

    -- 38. Select employee names and their corresponding project names.
    SELECT e.name AS employee_name, p.name AS project_name
    FROM Employee e
    JOIN Project p
    ON e.department_id = p.department_id;

| employee_name | project_name    |
| ------------- | --------------- |
| John Doe      | Project Alpha   |
| Bob Brown     | Project Alpha   |
| Grace Kelly   | Project Alpha   |
| Jane Smith    | Project Beta    |
| Charlie P.    | Project Beta    |
| John Doe      | Project Gamma   |
| Bob Brown     | Project Gamma   |
| Grace Kelly   | Project Gamma   |
| Alice Blue    | Project Delta   |
| Eve Black     | Project Delta   |
| David Green   | Project Epsilon |
| Hannah Lee    | Project Epsilon |
| David Green   | Project Zeta    |
| Hannah Lee    | Project Zeta    |
| Alice Blue    | Project Eta     |
| Eve Black     | Project Eta     |
| John Doe      | Project Theta   |
| Bob Brown     | Project Theta   |
| Grace Kelly   | Project Theta   |

---
**Query #39**

    -- 39. Select all employees and their departments, including those without a department.
    SELECT e.name AS employee_name, d.name AS department_name
    FROM Employee e
    LEFT JOIN Department d
    ON e.department_id = d.department_id;

| employee_name | department_name |
| ------------- | --------------- |
| John Doe      | IT              |
| Jane Smith    | HR              |
| Bob Brown     | IT              |
| Alice Blue    | Finance         |
| Charlie P.    | HR              |
| David Green   | Marketing       |
| Eve Black     | Finance         |
| Frank White   |                 |
| Grace Kelly   | IT              |
| Hannah Lee    | Marketing       |

---
**Query #40**

    -- 40. Select all departments and their employees, including departments without employees.
    SELECT d.name AS department_name, e.name AS employee_name
    FROM Department d
    LEFT JOIN Employee e
    ON d.department_id = e.department_id;

| department_name | employee_name |
| --------------- | ------------- |
| IT              | John Doe      |
| IT              | Bob Brown     |
| IT              | Grace Kelly   |
| HR              | Jane Smith    |
| HR              | Charlie P.    |
| Finance         | Alice Blue    |
| Finance         | Eve Black     |
| Marketing       | David Green   |
| Marketing       | Hannah Lee    |

---
**Query #41**

    -- 41. Select employees who are not assigned to any project.
    SELECT *
    FROM Employee
    WHERE department_id NOT IN (
        SELECT department_id FROM Project
    );

There are no results to be displayed.

---
**Query #42**

    -- 42. Select employees and the number of projects their department is working on.
    SELECT e.name, COUNT(p.project_id) AS project_count
    FROM Employee e
    JOIN Project p
    ON e.department_id = p.department_id
    GROUP BY e.name;

| name        | project_count |
| ----------- | ------------- |
| John Doe    | 3             |
| Bob Brown   | 3             |
| Grace Kelly | 3             |
| Jane Smith  | 1             |
| Charlie P.  | 1             |
| Alice Blue  | 2             |
| Eve Black   | 2             |
| David Green | 2             |
| Hannah Lee  | 2             |

---
**Query #43**

    -- 43. Select the departments that have no employees.
    SELECT d.name
    FROM Department d
    LEFT JOIN Employee e
    ON d.department_id = e.department_id
    WHERE e.emp_id IS NULL;

There are no results to be displayed.

---
**Query #44**

    -- 44. Select employee names who share the same department with 'John Doe'.
    SELECT name
    FROM Employee
    WHERE department_id = (
        SELECT department_id
        FROM Employee
        WHERE name = 'John Doe'
    );

| name        |
| ----------- |
| John Doe    |
| Bob Brown   |
| Grace Kelly |

---
**Query #45**

    -- 45. Select the department name with the highest average salary.
    SELECT d.name
    FROM Employee e
    JOIN Department d
    ON e.department_id = d.department_id
    GROUP BY d.name
    ORDER BY AVG(e.salary) DESC
    LIMIT 1;

| name |
| ---- |
| IT   |

---

# -- Nested and Correlated Queries

**Query #46**

    
    
    -- 46. Select the employee with the highest salary.
    SELECT *
    FROM Employee
    WHERE salary = (
        SELECT MAX(salary)
        FROM Employee
    );

| emp_id | name      | age | salary  | department_id | hire_date  |
| ------ | --------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown | 45  | 80000.0 | 1             | 2018-02-12 |

---
**Query #47**

    -- 47. Select employees whose salary is above the average salary.
    SELECT *
    FROM Employee
    WHERE salary > (
        SELECT AVG(salary)
        FROM Employee
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |

---
**Query #48**

    -- 48. Select the second highest salary from the Employee table.
    SELECT MAX(salary) AS second_highest_salary
    FROM Employee
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employee
    );

| second_highest_salary |
| --------------------- |
| 70000.0               |

---
**Query #49**

    -- 49. Select the department with the most employees.
    SELECT department_id, COUNT(*) AS employee_count
    FROM Employee
    GROUP BY department_id
    ORDER BY employee_count DESC
    LIMIT 1;

| department_id | employee_count |
| ------------- | -------------- |
| 1             | 3              |

---
**Query #50**

    -- 50. Select employees who earn more than the average salary of their department.
    SELECT e1.*
    FROM Employee e1
    WHERE salary > (
        SELECT AVG(e2.salary)
        FROM Employee e2
        WHERE e1.department_id = e2.department_id
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith  | 34  | 60000.0 | 2             | 2019-07-23 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #51**

    -- 51. Select the nth highest salary (for example, 3rd highest).
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2;

| salary  |
| ------- |
| 65000.0 |

---
**Query #52**

    -- 52. Select employees who are older than all employees in the HR department.
    SELECT *
    FROM Employee
    WHERE age > ALL (
        SELECT age
        FROM Employee
        WHERE department_id = (
            SELECT department_id
            FROM Department
            WHERE name = 'HR'
        )
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |

---
**Query #53**

    -- 53. Select departments where the average salary is greater than 55000.
    SELECT department_id, AVG(salary) AS average_salary
    FROM Employee
    GROUP BY department_id
    HAVING AVG(salary) > 55000;

| department_id | average_salary |
| ------------- | -------------- |
| 1             | 65000.0        |
| 4             | 61500.0        |

---
**Query #54**

    -- 54. Select employees who work in a department with at least 2 projects.
    SELECT *
    FROM Employee
    WHERE department_id IN (
        SELECT department_id
        FROM Project
        GROUP BY department_id
        HAVING COUNT(project_id) >= 2
    );

| emp_id | name        | age | salary  | department_id | hire_date  |
| ------ | ----------- | --- | ------- | ------------- | ---------- |
| 1      | John Doe    | 28  | 50000.0 | 1             | 2020-01-15 |
| 3      | Bob Brown   | 45  | 80000.0 | 1             | 2018-02-12 |
| 4      | Alice Blue  | 25  | 45000.0 | 3             | 2021-03-22 |
| 6      | David Green | 38  | 70000.0 | 4             | 2022-05-18 |
| 7      | Eve Black   | 40  | 55000.0 | 3             | 2021-08-30 |
| 9      | Grace Kelly | 27  | 65000.0 | 1             | 2018-11-13 |
| 10     | Hannah Lee  | 30  | 53000.0 | 4             | 2020-02-25 |

---
**Query #55**

    -- 55. Select employees who were hired on the same date as 'Jane Smith'.
    SELECT *
    FROM Employee
    WHERE hire_date = (
        SELECT hire_date
        FROM Employee
        WHERE name = 'Jane Smith'
    );

| emp_id | name       | age | salary  | department_id | hire_date  |
| ------ | ---------- | --- | ------- | ------------- | ---------- |
| 2      | Jane Smith | 34  | 60000.0 | 2             | 2019-07-23 |

---


# -- Combined Moderate Difficulty Queries

**Query #56**

    
    
    -- 56. Select the total salary of employees hired in the year 2020.
    SELECT SUM(salary) AS total_salary
    FROM Employee
    WHERE YEAR(hire_date) = 2020;

| total_salary |
| ------------ |
| 103000.0     |

---
**Query #57**

    -- 57. Select the average salary of employees in each department, ordered by the average salary in descending order.
    SELECT department_id, AVG(salary) AS average_salary
    FROM Employee
    GROUP BY department_id
    ORDER BY average_salary DESC;

| department_id | average_salary |
| ------------- | -------------- |
| 1             | 65000.0        |
| 4             | 61500.0        |
| 2             | 55000.0        |
| 3             | 50000.0        |
|               | 48000.0        |

---
**Query #58**

    -- 58. Select departments with more than 1 employee and an average salary greater than 55000.
    SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS average_salary
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) > 1
    AND AVG(salary) > 55000;

| department_id | employee_count | average_salary |
| ------------- | -------------- | -------------- |
| 1             | 3              | 65000.0        |
| 4             | 2              | 61500.0        |

---
**Query #59**

    -- 59. Select employees hired in the last 2 years, ordered by their hire date.
    SELECT *
    FROM Employee
    WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
    ORDER BY hire_date;

There are no results to be displayed.

---
**Query #60**

    -- 60. Select the total number of employees and the average salary for departments with more than 2 employees.
    SELECT department_id,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
    FROM Employee
    GROUP BY department_id
    HAVING COUNT(*) > 2;

| department_id | total_employees | average_salary |
| ------------- | --------------- | -------------- |
| 1             | 3               | 65000.0        |

---
**Query #61**

    -- 61. Select the name and salary of employees whose salary is above the average salary of their department.
    SELECT e1.name, e1.salary
    FROM Employee e1
    WHERE salary > (
        SELECT AVG(e2.salary)
        FROM Employee e2
        WHERE e1.department_id = e2.department_id
    );

| name        | salary  |
| ----------- | ------- |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |

---
**Query #62**

    -- 62. Select the names of employees who are hired on the same date as the oldest employee in the company.
    SELECT name
    FROM Employee
    WHERE hire_date = (
        SELECT hire_date
        FROM Employee
        ORDER BY age DESC
        LIMIT 1
    );

| name      |
| --------- |
| Bob Brown |

---
**Query #63**

    -- 63. Select the department names along with the total number of projects they are working on, ordered by the number of projects.
    SELECT d.name, COUNT(p.project_id) AS total_projects
    FROM Department d
    LEFT JOIN Project p
    ON d.department_id = p.department_id
    GROUP BY d.name
    ORDER BY total_projects DESC;

| name      | total_projects |
| --------- | -------------- |
| IT        | 3              |
| Finance   | 2              |
| Marketing | 2              |
| HR        | 1              |

---
**Query #64**

    -- 64. Select the employee name with the highest salary in each department.
    SELECT e1.name, e1.department_id, e1.salary
    FROM Employee e1
    WHERE salary = (
        SELECT MAX(e2.salary)
        FROM Employee e2
        WHERE e1.department_id = e2.department_id
    );

| name        | department_id | salary  |
| ----------- | ------------- | ------- |
| Jane Smith  | 2             | 60000.0 |
| Bob Brown   | 1             | 80000.0 |
| David Green | 4             | 70000.0 |
| Eve Black   | 3             | 55000.0 |

---
**Query #65**

    -- 65. Select the names and salaries of employees who are older than the average age of employees in their department.
    SELECT e1.name, e1.salary
    FROM Employee e1
    WHERE age > (
        SELECT AVG(e2.age)
        FROM Employee e2
        WHERE e1.department_id = e2.department_id
    );

| name        | salary  |
| ----------- | ------- |
| Jane Smith  | 60000.0 |
| Bob Brown   | 80000.0 |
| David Green | 70000.0 |
| Eve Black   | 55000.0 |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
