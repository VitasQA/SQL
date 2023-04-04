select * from employees_82;
select * from salary_082;
select * from employee_salary_82;
select * from roles_82;
select * from roles_employee_082;

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary
from employee_salary_82
join employees_82 on employee_salary_82.employee_id = employees_82.id
join salary_082 on employee_salary_82.salary_id = salary_082.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary
from employee_salary_82
join employees_82 on employee_salary_82.employee_id = employees_82.id
join salary_082 on employee_salary_82.salary_id = salary_082.id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary, employee_name
from employee_salary_82
left join employees_82 on employee_salary_82.employee_id = employees_82.id 
join salary_082 on employee_salary_82.salary_id = salary_082.id 
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.
select monthly_salary, employee_name
from employee_salary_82
left join employees_82 on employee_salary_82.employee_id = employees_82.id 
join salary_082 on employee_salary_82.salary_id = salary_082.id 
where employee_name is null and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select monthly_salary, employee_name
from employee_salary_82
join salary_082 on employee_salary_82.salary_id = salary_082.id
right join employees_82 on employee_salary_82.employee_id = employees_82.id 
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_employee_082.role_id = roles_82.id 
join employees_82 on roles_employee_082.employee_id = employees_82.id; 

-- 7. Вывести имена и должность только Java разработчиков.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Java developer%';

-- 8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Python developer%';

-- 9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%QA engineer%';

-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Manual QA engineer%';

-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Automation QA%';

-- 12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Java%';

-- 16. Вывести зарплаты Python разработчиков
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Python developer%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior Python developer%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Middle JavaScript developer%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Senior Java developer%';

-- 20. Вывести зарплаты Junior QA инженеров
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select AVG(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%JavaScript developer%';

-- 23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%QA engineer%';

-- 24. Вывести максимальную ЗП QA инженеров
select MAX(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%QA engineer%';

-- 25. Вывести количество QA инженеров
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id  = roles_employee_082.employee_id 
join salary_082 on employee_salary_82.salary_id = salary_082.id 
where role_name like '%developer%';

-- 29. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ
select  employee_name, role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on roles_employee_082.employee_id = employee_salary_82.employee_id 
join employees_82 on roles_employee_082.employee_id = employees_82.id  
join salary_082 on employee_salary_82.employee_id  = salary_082.id 
order by monthly_salary;

-- 30. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ îò 1700 äî 2300
select employee_name, role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on roles_employee_082.employee_id = employee_salary_82.employee_id 
join employees_82 on roles_employee_082.employee_id = employees_82.id  
join salary_082 on employee_salary_82.employee_id = salary_082.id 
where monthly_salary between 1700 and 2300
order by monthly_salary;


-- 31. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ ìåíüøå 2300
select employee_name, role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on roles_employee_082.employee_id = employee_salary_82.employee_id 
join employees_82 on roles_employee_082.employee_id = employees_82.id  
join salary_082 on employee_salary_82.employee_id = salary_082.id 
where monthly_salary < 2300
order by monthly_salary;

-- 32. Âûâåñòè èìåíà, äîëæíîñòè è ÇÏ âñåõ ñïåöèàëèñòîâ ïî âîçðàñòàíèþ ó ñïåöèàëèñòîâ ó êîòîðûõ ÇÏ ðàâíà 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on roles_employee_082.employee_id = employee_salary_82.employee_id 
join employees_82 on roles_employee_082.employee_id = employees_82.id  
join salary_082 on employee_salary_82.employee_id = salary_082.id 
where monthly_salary in(1100, 1500, 2000)
order by monthly_salary;

