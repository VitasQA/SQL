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

-- 2. Âûâåñòè âñåõ ðàáîòíèêîâ ó êîòîðûõ ÇÏ ìåíüøå 2000.
select employee_name, monthly_salary
from employee_salary_82
join employees_82 on employee_salary_82.employee_id = employees_82.id
join salary_082 on employee_salary_82.salary_id = salary_082.id
where monthly_salary < 2000;

-- 3. Âûâåñòè âñå çàðïëàòíûå ïîçèöèè, íî ðàáîòíèê ïî íèì íå íàçíà÷åí. (ÇÏ åñòü, íî íå ïîíÿòíî êòî å¸ ïîëó÷àåò.)
select monthly_salary, employee_name
from employee_salary_82
left join employees_82 on employee_salary_82.employee_id = employees_82.id 
join salary_082 on employee_salary_82.salary_id = salary_082.id 
where employee_name is null;

-- 4. Âûâåñòè âñå çàðïëàòíûå ïîçèöèè  ìåíüøå 2000 íî ðàáîòíèê ïî íèì íå íàçíà÷åí. (ÇÏ åñòü, íî íå ïîíÿòíî êòî å¸ ïîëó÷àåò.)
select monthly_salary, employee_name
from employee_salary_82
left join employees_82 on employee_salary_82.employee_id = employees_82.id 
join salary_082 on employee_salary_82.salary_id = salary_082.id 
where employee_name is null and monthly_salary < 2000;

-- 5. Íàéòè âñåõ ðàáîòíèêîâ êîìó íå íà÷èñëåíà ÇÏ.
select monthly_salary, employee_name
from employee_salary_82
join salary_082 on employee_salary_82.salary_id = salary_082.id
right join employees_82 on employee_salary_82.employee_id = employees_82.id 
where monthly_salary is null;

-- 6. Âûâåñòè âñåõ ðàáîòíèêîâ ñ íàçâàíèÿìè èõ äîëæíîñòè.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_employee_082.role_id = roles_82.id 
join employees_82 on roles_employee_082.employee_id = employees_82.id; 

-- 7. Âûâåñòè èìåíà è äîëæíîñòü òîëüêî Java ðàçðàáîò÷èêîâ.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Java developer%';

-- 8. Âûâåñòè èìåíà è äîëæíîñòü òîëüêî Python ðàçðàáîò÷èêîâ.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Python developer%';

-- 9. Âûâåñòè èìåíà è äîëæíîñòü âñåõ QA èíæåíåðîâ.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%QA engineer%';

-- 10. Âûâåñòè èìåíà è äîëæíîñòü ðó÷íûõ QA èíæåíåðîâ.
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Manual QA engineer%';

-- 11. Âûâåñòè èìåíà è äîëæíîñòü àâòîìàòèçàòîðîâ QA
select employee_name, role_name
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employees_82 on employees_82.id = roles_employee_082.employee_id
where role_name like '%Automation QA%';

-- 12. Âûâåñòè èìåíà è çàðïëàòû Junior ñïåöèàëèñòîâ
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior%';

-- 13. Âûâåñòè èìåíà è çàðïëàòû Middle ñïåöèàëèñòîâ
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Middle%';

-- 14. Âûâåñòè èìåíà è çàðïëàòû Senior ñïåöèàëèñòîâ
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Senior%';

-- 15. Âûâåñòè çàðïëàòû Java ðàçðàáîò÷èêîâ
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Java%';

-- 16. Âûâåñòè çàðïëàòû Python ðàçðàáîò÷èêîâ
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Python developer%';

-- 17. Âûâåñòè èìåíà è çàðïëàòû Junior Python ðàçðàáîò÷èêîâ
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior Python developer%';

-- 18. Âûâåñòè èìåíà è çàðïëàòû Middle JS ðàçðàáîò÷èêîâ
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Middle JavaScript developer%';

-- 19. Âûâåñòè èìåíà è çàðïëàòû Senior Java ðàçðàáîò÷èêîâ
select employee_name, role_name, monthly_salary
from roles_employee_082
join employees_82 on employees_82.id = roles_employee_082.employee_id 
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Senior Java developer%';

-- 20. Âûâåñòè çàðïëàòû Junior QA èíæåíåðîâ
select role_name, monthly_salary
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
join salary_082 on salary_082.id = employee_salary_82.salary_id
where role_name like '%Junior%QA%';

-- 21. Âûâåñòè ñðåäíþþ çàðïëàòó âñåõ Junior ñïåöèàëèñòîâ
select AVG(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%Junior%';

-- 22. Âûâåñòè ñóììó çàðïëàò JS ðàçðàáîò÷èêîâ
select SUM(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%JavaScript developer%';

-- 23. Âûâåñòè ìèíèìàëüíóþ ÇÏ QA èíæåíåðîâ
select MIN(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%QA engineer%';

-- 24. Âûâåñòè ìàêñèìàëüíóþ ÇÏ QA èíæåíåðîâ
select MAX(monthly_salary)
from employee_salary_82 es
join salary_082 s on s.id = es.salary_id
join roles_employee_082 re on re.employee_id = es.employee_id 
join roles_82 r on r.id = re.role_id 
where role_name like '%QA engineer%';

-- 25. Âûâåñòè êîëè÷åñòâî QA èíæåíåðîâ
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id 
where role_name like '%QA%';

-- 26. Âûâåñòè êîëè÷åñòâî Middle ñïåöèàëèñòîâ.
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id 
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id
where role_name like '%Middle%';

-- 27. Âûâåñòè êîëè÷åñòâî ðàçðàáîò÷èêîâ
select count(role_name)
from roles_employee_082
join roles_82 on roles_82.id = roles_employee_082.role_id
join employee_salary_82 on employee_salary_82.employee_id = roles_employee_082.employee_id
where role_name like '%developer%';

-- 28. Âûâåñòè ôîíä (ñóììó) çàðïëàòû ðàçðàáîò÷èêîâ.
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

