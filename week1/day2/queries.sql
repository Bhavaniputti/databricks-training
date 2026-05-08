**Query #1**

    -- 1.Display all employee details.
    select *from Employees;


**Query #2**

    select emp_name,salary from Employees;


**Query #3**

    select emp_name,department from Employees;


**Query #4**

    select *from Employees where department='IT';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #5**

    select emp_name,experience from Employees;

| emp_name | experience |
| -------- | ---------- |
| Rahul    | 5          |
| Anjali   | 3          |
| Kiran    | 6          |
| Sneha    | 4          |
| Aman     | 2          |
| Ravi     | 8          |
| Divya    | 3          |
| Meena    | 2          |
| Arjun    | 5          |
| Pooja    | 4          |
| Vikas    | 3          |
| Nisha    | 7          |
| Tarun    | 2          |
| Kavya    | 9          |
| Manoj    | 4          |

---
**Query #6**

    select *from Employees where salary>70000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #7**

    select *from Employees where city='Hyderabad';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #8**

    select *from Employees where experience<4;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |

---
**Query #9**

    select *from Employees where department='Finance';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #10**

    select *from Employees where salary=52000;

| emp_id | emp_name | department | salary | city | experience |
| ------ | -------- | ---------- | ------ | ---- | ---------- |
| 111    | Vikas    | HR         | 52000  | Pune | 3          |

---
**Query #11**

    select department,sum(salary) as total_salary from Employees group by department;

| department | total_salary |
| ---------- | ------------ |
| Finance    | 304000       |
| HR         | 136000       |
| IT         | 382000       |
| Sales      | 155000       |

---
**Query #12**

    select department,avg(salary) as average_salary from Employees group by department;

| department | average_salary |
| ---------- | -------------- |
| Finance    | 76000.0        |
| HR         | 45333.3333     |
| IT         | 76400.0        |
| Sales      | 51666.6667     |

---
**Query #13**

    select city,count(emp_id)as people from Employees group by city;

| city      | people |
| --------- | ------ |
| Bangalore | 3      |
| Chennai   | 3      |
| Hyderabad | 4      |
| Mumbai    | 3      |
| Pune      | 2      |

---
**Query #14**

    select department,max(salary)as max_salary from Employees group by department;

| department | max_salary |
| ---------- | ---------- |
| Finance    | 91000      |
| HR         | 52000      |
| IT         | 97000      |
| Sales      | 61000      |

---
**Query #15**

    select department,min(experience)as min_experience from Employees group by department;

| department | min_experience |
| ---------- | -------------- |
| Finance    | 4              |
| HR         | 2              |
| IT         | 3              |
| Sales      | 2              |

---
**Query #16**

    select department,count(*)as
    total_employees from Employees group by department having count(*)>3;

| department | total_employees |
| ---------- | --------------- |
| Finance    | 4               |
| IT         | 5               |

---
**Query #17**

    select department,max(salary) from Employees group by department having max(salary)>60000;

| department | max(salary) |
| ---------- | ----------- |
| Finance    | 91000       |
| IT         | 97000       |
| Sales      | 61000       |

---
**Query #18**

    select city,count(*) as employees from Employees group by city having count(*) >2;

| city      | employees |
| --------- | --------- |
| Bangalore | 3         |
| Chennai   | 3         |
| Hyderabad | 4         |
| Mumbai    | 3         |

---
**Query #19**

    select department,sum(salary) as total_salary from Employees group by department having sum(salary)>200000;

| department | total_salary |
| ---------- | ------------ |
| Finance    | 304000       |
| IT         | 382000       |

---
**Query #20**

    select department,max(salary) as max_salary from Employees group by department having max(salary)>90000;

| department | max_salary |
| ---------- | ---------- |
| Finance    | 91000      |
| IT         | 97000      |

---
**Query #21**

    select *from Employees order by salary desc limit 5;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |

---
**Query #22**

    select *from Employees order by experience desc limit 3;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #23**

    select salary from Employees where department='Finance' order by salary desc limit 2;

| salary |
| ------ |
| 91000  |
| 88000  |

---
**Query #24**

    select * from Employees where city='Hyderabad' limit 4;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #25**

    select *from Employees order by salary desc limit 1;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #26**

    select distinct department from Employees;

| department |
| ---------- |
| IT         |
| HR         |
| Finance    |
| Sales      |

---
**Query #27**

    select distinct city from Employees;

| city      |
| --------- |
| Hyderabad |
| Chennai   |
| Bangalore |
| Pune      |
| Mumbai    |

---
**Query #28**

    select distinct salary from Employees;

| salary |
| ------ |
| 75000  |
| 45000  |
| 82000  |
| 67000  |
| 39000  |
| 91000  |
| 55000  |
| 48000  |
| 61000  |
| 73000  |
| 52000  |
| 88000  |
| 46000  |
| 97000  |
| 58000  |

---
**Query #29**

    select distinct department,city from Employees;

| department | city      |
| ---------- | --------- |
| IT         | Hyderabad |
| HR         | Chennai   |
| IT         | Bangalore |
| Finance    | Hyderabad |
| HR         | Pune      |
| Finance    | Mumbai    |
| IT         | Chennai   |
| Sales      | Bangalore |
| Sales      | Hyderabad |
| IT         | Mumbai    |
| Finance    | Bangalore |
| Sales      | Chennai   |

---
**Query #30**

    select distinct experience from Employees;

| experience |
| ---------- |
| 5          |
| 3          |
| 6          |
| 4          |
| 2          |
| 8          |
| 7          |
| 9          |

---
**Query #31**

    select *from Employees where salary>=80000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #32**

    select *from Employees where experience<=3;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |

---
**Query #33**

    select *from Employees where salary<>45000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #34**

    select *from Employees where salary<50000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |

---
**Query #35**

    select *from Employees where experience>5;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #36**

    select * from Employees where department='IT' and salary>70000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #37**

    select * from Employees where city='Hyderabad' or city='Bangalore';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #38**

    select * from Employees where department='HR' and experience<3;

| emp_id | emp_name | department | salary | city | experience |
| ------ | -------- | ---------- | ------ | ---- | ---------- |
| 105    | Aman     | HR         | 39000  | Pune | 2          |

---
**Query #39**

    select * from Employees where salary>60000 or experience >6;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #40**

    select *from Employees where department <> 'Sales';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #41**

    select *from Employees where city in('Hyderabad', 'Mumbai');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #42**

    select *from Employees where department in('IT', 'Finance');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #43**

    select *from Employees where city not in('Chennai', 'Pune');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #44**

    select *from Employees where salary in(45000, 75000, 91000);

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |

---
**Query #45**

    select *from Employees where department not in('HR', 'Sales');

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #46**

    select *from Employees where salary BETWEEN 50000 AND 80000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #47**

    select *from Employees where experience BETWEEN 3 AND 6;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #48**

    select *from Employees where emp_id BETWEEN 105 AND 112;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |

---
**Query #49**

    select *from Employees where salary NOT BETWEEN 40000 AND 60000;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 103    | Kiran    | IT         | 82000  | Bangalore | 6          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 109    | Arjun    | Sales      | 61000  | Hyderabad | 5          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #50**

    select *from Employees where experience BETWEEN 2 AND 4;

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 102    | Anjali   | HR         | 45000  | Chennai   | 3          |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 105    | Aman     | HR         | 39000  | Pune      | 2          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 113    | Tarun    | Sales      | 46000  | Chennai   | 2          |
| 115    | Manoj    | Finance    | 58000  | Mumbai    | 4          |

---
**Query #51**

    select *from Employees where emp_name like 'R%';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 101    | Rahul    | IT         | 75000  | Hyderabad | 5          |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |

---
**Query #52**

    select *from Employees where emp_name like '%a';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 104    | Sneha    | Finance    | 67000  | Hyderabad | 4          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 108    | Meena    | Sales      | 48000  | Bangalore | 2          |
| 110    | Pooja    | IT         | 73000  | Mumbai    | 4          |
| 112    | Nisha    | Finance    | 88000  | Bangalore | 7          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #53**

    select *from Employees where emp_name like '%v%';

| emp_id | emp_name | department | salary | city      | experience |
| ------ | -------- | ---------- | ------ | --------- | ---------- |
| 106    | Ravi     | Finance    | 91000  | Mumbai    | 8          |
| 107    | Divya    | IT         | 55000  | Chennai   | 3          |
| 111    | Vikas    | HR         | 52000  | Pune      | 3          |
| 114    | Kavya    | IT         | 97000  | Hyderabad | 9          |

---
**Query #54**

    select emp_name,city from Employees where city like 'B%';

| emp_name | city      |
| -------- | --------- |
| Kiran    | Bangalore |
| Meena    | Bangalore |
| Nisha    | Bangalore |

---
**Query #55**

    select emp_name ,department from Employees where department like '%s';

| emp_name | department |
| -------- | ---------- |
| Meena    | Sales      |
| Arjun    | Sales      |
| Tarun    | Sales      |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
