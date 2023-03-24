--1. Создайте таблицу employees_82
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
CREATE TABLE employees_82 (
    id serial primary key,
    employee_name VARCHAR(50) NOT NULL
);

--2. Наполнить таблицу employee_82 70 строками
insert into employees_82 (employee_name)
values ('Aiden'), 
       ('Alexa'), 
       ('Amelia'), 
       ('Arianna'), 
       ('Aurora'), 
       ('Ava'), 
       ('Benjamin'), 
       ('Caleb'), 
       ('Cameron'), 
       ('Charlotte'), 
       ('Chloe'), 
       ('Christian'), 
       ('Christopher'), 
       ('Claire'), 
       ('Daisy'), 
       ('Daniel'), 
       ('David'), 
       ('Dominic'), 
       ('Dylan'), 
       ('Elena'), 
       ('Elizabeth'), 
       ('Ella'), 
       ('Ellie'), 
       ('Emily'), 
       ('Emma'), 
       ('Ethan'), 
       ('Evelyn'), 
       ('Gabriel'), 
       ('Grace'), 
       ('Hailey'), 
       ('Hannah'), 
       ('Harper'), 
       ('Isabella'), 
       ('Jack'), 
       ('Jackson'), 
       ('Jacob'), 
       ('James'), 
       ('Jasmine'), 
       ('Jayden'), 
       ('Joseph'), 
       ('Joshua'), 
       ('Julian'), 
       ('Katherine'), 
       ('Landon'), 
       ('Lauren'), 
       ('Leah'), 
       ('Liam'), 
       ('Lily'), 
       ('Logan'), 
       ('Lucas'), 
       ('Madison'), 
       ('Mason'), 
       ('Matthew'), 
       ('Mia'), 
       ('Michael'), 
       ('Natalie'), 
       ('Nathan'), 
       ('Nicholas'), 
       ('Noah'), 
       ('Olivia'), 
       ('Penelope'), 
       ('Rachel'), 
       ('Ryan'), 
       ('Samantha'), 
       ('Sarah'), 
       ('Savannah'), 
       ('Sophia'), 
       ('Stella'), 
       ('Victoria'), 
       ('William')

select * from employees_82;

--3.Создать таблицу salary_082
--- id. Serial  primary key,
--- monthly_salary. Int, not null
CREATE TABLE salary_082 (
    id serial primary key,
    monthly_salary int NOT NULL
);

--4.Наполнить таблицу salary_082 15 строками
insert into salary_082 (monthly_salary)
values (500), 
       (1000), 
       (1500), 
       (2000), 
       (2500), 
       (3000), 
       (3500), 
       (4000), 
       (4500), 
       (5000),
       (5500),
       (6000),
       (6500),
       (7000),
       (7500);
       
select * from salary_082;

--5. Создать таблицу employee_salary_82
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
CREATE TABLE employee_salary_82 (
    id serial primary key,
    employee_id int not null unique,
    salary_id int not null
);
select * from employee_salary_82;

--6. Наполнить таблицу employee_salary_82 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary_82 (id, employee_id, salary_id)
values (default, 1, 5), 
       (default, 3, 8), 
       (default, 4, 10), 
       (default, 2, 2),
       (default, 22, 6), 
       (default, 49, 5),
       (default, 23, 8),
       (default, 71, 1),
       (default, 30, 10), 
       (default, 21, 16), 
       (default, 39, 9), 
       (default, 53, 15), 
       (default, 52, 12), 
       (default, 100, 12),
       (default, 51, 9),
       (default, 61, 10),
       (default, 18, 11), 
       (default, 17, 16), 
       (default, 96, 9),
       (default, 43, 11), 
       (default, 42, 7), 
       (default, 55, 13), 
       (default, 13, 14), 
       (default, 60, 3),
       (default, 11, 1), 
       (default, 81, 2), 
       (default, 32, 4),
       (default, 87, 1), 
       (default, 89, 13), 
       (default, 68, 8), 
       (default, 16, 12), 
       (default, 44, 4),
       (default, 99, 9), 
       (default, 88, 1), 
       (default, 40, 2), 
       (default, 113, 3), 
       (default, 31, 9), 
       (default, 72, 12),
       (default, 33, 1),
       (default, 15, 5);

select * from employee_salary_82;

--7. Создать таблицу roles_82
--- id. Serial  primary key,
--- role_name. int, not null, unique
CREATE TABLE roles_82 (
    id serial primary key,
    role_name int not null unique
);
select * from roles_82;

--8. Поменять тип столбца role_name с int на varchar(30)
alter table roles_82 
alter column role_name type varchar(30);

--9. Наполнить таблицу roles_82 20 строками
insert into roles_82 (role_name)
values ('Junior Python developer'), 
       ('Middle Python developer'),
	   ('Senior Python developer'),
	   ('Junior Java developer'),
	   ('Middle Java developer'),
	   ('Senior Java developer'),
	   ('Junior JavaScript developer'),
	   ('Middle JavaScript developer'),
	   ('Senior JavaScript developer'),
	   ('Junior Manual QA engineer'),
	   ('Middle Manual QA engineer'),
	   ('Senior Manual QA engineer'),
	   ('Project Manager'),
	   ('Desinger'),
	   ('HR'),
	   ('CEO'),
	   ('Sales manager'),
	   ('Junior Automation QA engineer'),
	   ('Middle Automation QA engineer'),
	   ('Senior Automation QA engineer');
select * from roles_82;	  
	  
--10. Создать таблицу roles_employee_082
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
CREATE TABLE roles_employee_082 (
    id serial primary key,
    employee_id int not null unique, 
    role_id int not null, 
    foreign key (employee_id) 
    references employees_82 (id),
    foreign key (role_id) 
    references roles_82 (id)
);
select * from roles_employee_082;

--11. Наполнить таблицу roles_employee_082 40 строками
insert into roles_employee_082 (employee_id, role_id)
values (1, 17), 
       (16, 2), 
       (21, 15), 
       (31, 11), 
       (2, 18), 
       (28, 5), 
       (22, 12), 
       (17, 3), 
       (3, 16), 
       (32, 7), 
       (4, 10), 
       (30, 14), 
       (18, 1), 
       (29, 19), 
       (19, 8), 
       (33, 2), 
       (5, 13), 
       (27, 6), 
       (34, 17), 
       (6, 4),
       (15, 17), 
       (20, 2), 
       (7, 15), 
       (35, 11), 
       (37, 18), 
       (23, 5), 
       (36, 12), 
       (8, 3), 
       (24, 16), 
       (14, 7), 
       (9, 10), 
       (13, 14), 
       (38, 1), 
       (40, 19), 
       (10, 8), 
       (25, 2), 
       (39, 13), 
       (11, 6), 
       (26, 17), 
       (12, 4);
      
select * from roles_employee_082;      

      





