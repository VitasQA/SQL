select * from employees_82;
select * from salary_082;
select * from employee_salary_82;
select * from roles_82;
select * from roles_employee_082;

-- 1. ������� ���� ���������� ��� �������� ���� � ����, ������ � ����������.
select employee_name, monthly_salary
from employee_salary_82
join employees_82 on employee_salary_82.employee_id = employees_82.id
join salary_082 on employee_salary_82.salary_id = salary_082.id;

-- 2. ������� ���� ���������� � ������� �� ������ 2000.
select employee_name, monthly_salary
from employee_salary_82
join employees_82 on employee_salary_82.employee_id = employees_82.id
join salary_082 on employee_salary_82.salary_id = salary_082.id
where monthly_salary < 2000;

-- 3. ������� ��� ���������� �������, �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select monthly_salary, employee_name
from employee_salary_82
left join employees_82 on employee_salary_82.employee_id = employees_82.id 
join salary_082 on employee_salary_82.salary_id = salary_082.id 
where employee_name is null;

-- 4. ������� ��� ���������� �������  ������ 2000 �� �������� �� ��� �� ��������. (�� ����, �� �� ������� ��� � ��������.)
select monthly_salary, employee_name
from employee_salary_82
left join employees_82 on employee_salary_82.employee_id = employees_82.id 
join salary_082 on employee_salary_82.salary_id = salary_082.id 
where employee_name is null and monthly_salary < 2000;

-- 5. ����� ���� ���������� ���� �� ��������� ��.
select monthly_salary, employee_name
from employee_salary_82
join salary_082 on employee_salary_82.salary_id = salary_082.id
right join employees_82 on employee_salary_82.employee_id = employees_82.id 
where monthly_salary is null;

-- 6. ������� ���� ���������� � ���������� �� ���������.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_employee_082.role_id = roles_82.id 
join employees_82 on roles_employee_082.employee_id = employees_82.id; 

-- 7. ������� ����� � ��������� ������ Java �������������.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Java developer%';

-- 8. ������� ����� � ��������� ������ Python �������������.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Python developer%';

-- 9. ������� ����� � ��������� ���� QA ���������.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%QA engineer%';

-- 10. ������� ����� � ��������� ������ QA ���������.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Manual QA engineer%';

-- 11. ������� ����� � ��������� ��������������� QA
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Automation QA%';

-- 12. ������� ����� � �������� Junior ������������
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior%';

-- 13. ������� ����� � �������� Middle ������������
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Middle%';

-- 14. ������� ����� � �������� Senior ������������
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Senior%';

-- 15. ������� �������� Java �������������
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Java%';

-- 16. ������� �������� Python �������������
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Python developer%';

-- 17. ������� ����� � �������� Junior Python �������������
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior Python developer%';

-- 18. ������� ����� � �������� Middle JS �������������
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Middle JavaScript developer%';

-- 19. ������� ����� � �������� Senior Java �������������
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Senior Java developer%';

-- 20. ������� �������� Junior QA ���������
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior%QA%';

-- 21. ������� ������� �������� ���� Junior ������������
select AVG(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%Junior%';

-- 22. ������� ����� ������� JS �������������
select SUM(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%JavaScript developer%';

-- 23. ������� ����������� �� QA ���������
select MIN(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%QA engineer%';

-- 24. ������� ������������ �� QA ���������
select MAX(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%QA engineer%';

-- 25. ������� ���������� QA ���������
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
where role_name like '%QA%';

-- 26. ������� ���������� Middle ������������.
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id
where role_name like '%Middle%';

-- 27. ������� ���������� �������������
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id
where role_name like '%developer%';

-- 28. ������� ���� (�����) �������� �������������.
select sum(monthly_salary)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id  = roles_employee_082.employee_id 
join salary_082 on employee_salary_82.salary_id = salary_082.id 
where role_name like '%developer%';

-- 29. ������� �����, ��������� � �� ���� ������������ �� �����������
select  employee_name, role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on roles_employee_082.employee_id = employee_salary_82.employee_id 
join employees_82 on roles_employee_082.employee_id = employees_82.id  
join salary_082 on employee_salary_82.employee_id  = salary_082.id 
order by monthly_salary;

-- 30. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� �� 1700 �� 2300
select employee_name, role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on roles_employee_082.employee_id = employee_salary_82.employee_id 
join employees_82 on roles_employee_082.employee_id = employees_82.id  
join salary_082 on employee_salary_82.employee_id = salary_082.id 
where monthly_salary between 1700 and 2300
order by monthly_salary;


-- 31. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ������ 2300
select employee_name, role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on roles_employee_082.employee_id = employee_salary_82.employee_id 
join employees_82 on roles_employee_082.employee_id = employees_82.id  
join salary_082 on employee_salary_82.employee_id = salary_082.id 
where monthly_salary < 2300
order by monthly_salary;

-- 32. ������� �����, ��������� � �� ���� ������������ �� ����������� � ������������ � ������� �� ����� 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on roles_employee_082.employee_id = employee_salary_82.employee_id 
join employees_82 on roles_employee_082.employee_id = employees_82.id  
join salary_082 on employee_salary_82.employee_id = salary_082.id 
where monthly_salary in(1100, 1500, 2000)
order by monthly_salary;

