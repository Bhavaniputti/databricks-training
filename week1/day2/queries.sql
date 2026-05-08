-- Query 1
select *from Employees;

-- Query 2
select emp_name,salary from Employees;

-- Query 3
select emp_name,department from Employees;

-- Query 4
select *from Employees where department='IT';

-- Query 5
select emp_name,experience from Employees;

-- Query 6
select *from Employees where salary>70000;

-- Query 7
select *from Employees where city='Hyderabad';

-- Query 8
select *from Employees where experience<4;

-- Query 9
select *from Employees where department='Finance';

-- Query 10
select *from Employees where salary=52000;

-- Query 11
select department,sum(salary) as total_salary from Employees group by department;

-- Query 12
select department,avg(salary) as average_salary from Employees group by department;

-- Query 13
select city,count(emp_id)as people from Employees group by city;

-- Query 14
select department,max(salary)as max_salary from Employees group by department;

-- Query 15
select department,min(experience)as min_experience from Employees group by department;

-- Query 16
select department,count(*) as total_employees from Employees group by department having count(*)>3;

-- Query 17
select department,avg(salary) from Employees group by department having avg(salary)>60000;

-- Query 18
select city,count(*) as employees from Employees group by city having count(*)>2;

-- Query 19
select department,sum(salary) as total_salary from Employees group by department having sum(salary)>200000;

-- Query 20
select department,max(salary) as max_salary from Employees group by department having max(salary)>90000;

-- Query 21
select *from Employees order by salary desc limit 5;

-- Query 22
select *from Employees order by experience desc limit 3;

-- Query 23
select salary from Employees where department='Finance' order by salary desc limit 2;

-- Query 24
select * from Employees where city='Hyderabad' limit 4;

-- Query 25
select *from Employees order by salary desc limit 1;

-- Query 26
select distinct department from Employees;

-- Query 27
select distinct city from Employees;

-- Query 28
select distinct salary from Employees;

-- Query 29
select distinct department,city from Employees;

-- Query 30
select distinct experience from Employees;

-- Query 31
select *from Employees where salary>=80000;

-- Query 32
select *from Employees where experience<=3;

-- Query 33
select *from Employees where salary<>45000;

-- Query 34
select *from Employees where salary<50000;

-- Query 35
select *from Employees where experience>5;

-- Query 36
select * from Employees where department='IT' and salary>70000;

-- Query 37
select * from Employees where city='Hyderabad' or city='Bangalore';

-- Query 38
select * from Employees where department='HR' and experience<3;

-- Query 39
select * from Employees where salary>60000 or experience>6;

-- Query 40
select *from Employees where department<>'Sales';

-- Query 41
select *from Employees where city in('Hyderabad','Mumbai');

-- Query 42
select *from Employees where department in('IT','Finance');

-- Query 43
select *from Employees where city not in('Chennai','Pune');

-- Query 44
select *from Employees where salary in(45000,75000,91000);

-- Query 45
select *from Employees where department not in('HR','Sales');

-- Query 46
select *from Employees where salary between 50000 and 80000;

-- Query 47
select *from Employees where experience between 3 and 6;

-- Query 48
select *from Employees where emp_id between 105 and 112;

-- Query 49
select *from Employees where salary not between 40000 and 60000;

-- Query 50
select *from Employees where experience between 2 and 4;

-- Query 51
select *from Employees where emp_name like 'R%';

-- Query 52
select *from Employees where emp_name like '%a';

-- Query 53
select *from Employees where emp_name like '%v%';

-- Query 54
select emp_name,city from Employees where city like 'B%';

-- Query 55
select emp_name,department from Employees where department like '%s';
