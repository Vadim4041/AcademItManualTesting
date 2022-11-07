DROP DATABASE Workers;
CREATE DATABASE Workers;

USE Workers;

CREATE TABLE department
(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL       
);

CREATE TABLE employee
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT,
    chief_id INT,
    name VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (chief_id) REFERENCES employee(id)
);

INSERT INTO department(name)
VALUES ('department1'), ('department2'), ('department3'), ('department4');

INSERT INTO employee(name, salary, department_id, chief_id)
VALUES ('worker1(Chief)', 50000, 3, NULL),
('worker2', 30000, 1, NULL),
('worker3', 20000, 2, 1),
('worker4', 80000, 3, NULL),
('worker5', 90000, 3, 1),
('worker6', 90000, 3, 1),
('Путин А.А.', 180000, 1, NULL),
('Мишустин А.А.', 177000, 2, NULL),
('Медведев А.А.', 177000, 3, NULL),
('Егоров Е.Е.', 110000, 1, 1),
('Артемов А.А.', 125000, 1, 1),
('Пашин П.П.', 175000, 2, 2),
('Иванов И.И.', 185000, 2, 2),
('Петров П.П.', 140000, 3, 3),
('Никитин Н.Н.', 140000, 3, 3),
('Александров А.А', 100000, 1, NULL),
('Неяскин П.Ю.', 105000, 2, NULL);
/*
-- 1.	Вывести список сотрудников в формате: Сотрудник, Отдел сотрудника, Руководитель, Отдел руководителя.
SELECT e.name, dep.name AS employeeDepartment, chief.name AS chiefName, d_chief.name AS chiefDepartment
FROM employee AS e
LEFT JOIN employee AS chief
	ON e.chief_id = chief.id
LEFT JOIN department AS d_chief
	ON d_chief.id = chief.department_id
INNER JOIN department AS dep
	ON dep.id = e.department_id;

-- 2.	Вывести список сотрудников, получающих заработную плату, большую чем у непосредственного руководителя
SELECT e.name AS richEmployee, e.salary, chief.name AS chiefName, chief.salary AS chiefSalary
FROM employee AS e
INNER JOIN employee AS chief
	ON e.chief_id = chief.id
WHERE e.salary > chief.salary;

-- 3 Вывести список сотрудников, получающих максимальную заработную плату в своем отделе
SELECT e.department_id, e.name, e.salary
FROM
	(SELECT department_id, MAX(salary) AS maxSalary
	FROM employee
	GROUP BY department_id) AS m
INNER JOIN employee AS e
	ON e.salary = m.maxSalary AND e.department_id = m.department_id;

-- 4.	Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек
SELECT d.id, COUNT(e.department_id) AS count
FROM department AS d
LEFT JOIN employee AS e
	ON e.department_id = d.id
GROUP BY d.id
HAVING COUNT(e.department_id) <= 3;

-- 5.	Вывести список сотрудников, не имеющих назначенного руководителя, работающего в том же отделе
SELECT e.name
FROM employee AS e
LEFT JOIN employee AS chief
	ON e.chief_id = chief.id AND e.department_id = chief.department_id
WHERE chief.id IS NULL;
*/
-- 6.	Вывести список наименований отделов с максимальной суммарной зарплатой сотрудников
SELECT q3.name, q2.maxDepSumSalary
FROM
(SELECT MAX(q1.depSumSalary) AS maxDepSumSalary
FROM 
	(SELECT d.name, SUM(e.salary) AS depSumSalary
	FROM employee AS e
	INNER JOIN department AS d
		ON e.department_id = d.id
	GROUP BY d.name) AS q1) AS q2
INNER JOIN (SELECT d.name, SUM(e.salary) AS depSumSalary
	FROM employee AS e
	INNER JOIN department AS d
		ON e.department_id = d.id
	GROUP BY d.name) AS q3
	ON q2.maxDepSumSalary = q3.depSumSalary;
/*
-- 7.	Вывести ФИО сотрудника(ов), получающего третью по величине зарплату в организации

SELECT *
FROM employee AS e
WHERE e.department_id IS NOT NULL AND
(SELECT COUNT(e1.name)
FROM employee AS e1
WHERE e1.salary > e.salary) = 3 - 1;
