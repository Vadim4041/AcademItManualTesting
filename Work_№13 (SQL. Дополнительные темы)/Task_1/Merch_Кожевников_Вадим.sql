USE merchandising;

-- 1)	Выведите ФИО всех мерчендайзеров из сибирского региона
SELECT m.lastName, m.firstName, m.middleName
FROM merchandiser AS m
INNER JOIN city AS c
	ON c.id = m.cityId
INNER JOIN region AS r
	ON c.regionId = r.id AND r.name = 'Сибирский';

-- 2)	Выведите информацию о POSm, у которых не задан комментарий
SELECT id, name, format, price
FROM posmitem
WHERE comment IS NULL;

-- 3)	Для каждого города выведите название города и число мерчендайзеров из этого города. Если там 0 мерчендайзеров, то должно вывестись 0
SELECT c.name, COUNT(m.id) AS merchandiserInCityCount
FROM city AS c
LEFT JOIN merchandiser AS m
	ON m.cityId = c.id
GROUP BY c.name;

-- 4)	Для каждого региона выведите название региона и число мерчендайзеров из этого региона. Если там 0 мерчендайзеров, то должно вывестись 0
SELECT r.name, COUNT(m.id) AS merchandiserInRegionCount
FROM merchandiser AS m
RIGHT JOIN city AS c
	ON c.id = m.cityId
RIGHT JOIN region AS r
	ON c.regionId = r.id
GROUP BY r.name;

-- 5)	Посчитайте сколько единиц каждого вида POsm еще осталось разместить и сколько было размещено
SELECT posmitem.id, placeposmtask.status, SUM(placeposmtask.posmSetsCount * posmsetitem.posmItemsCount) AS itemsCountPerStatus
FROM posmitem
LEFT JOIN posmsetitem
	ON posmitem.id = posmsetitem.posmItemId
LEFT JOIN formposmsettask
	ON posmsetitem.posmSetId = formposmsettask.posmSetId
LEFT JOIN placeposmtask
	ON placeposmtask.formPosmSetTaskId = formposmsettask.id
GROUP BY posmitem.id, placeposmtask.status;

-- 6)	Посчитайте сколько единиц каждого вида POSm было отправлено каждому агенту
SELECT posmitem.id, placeposmtask.agentCode, SUM(placeposmtask.posmSetsCount * posmsetitem.posmItemsCount) AS itemsCountPerAgent
FROM posmitem
LEFT JOIN posmsetitem
	ON posmitem.id = posmsetitem.posmItemId
LEFT JOIN formposmsettask
	ON posmsetitem.posmSetId = formposmsettask.posmSetId
LEFT JOIN placeposmtask
	ON placeposmtask.formPosmSetTaskId = formposmsettask.id
GROUP BY posmitem.id, placeposmtask.agentCode;

-- 7)	Посчитайте, сколько у каждого мерчендайзера задач «в работе» и «выполнено». Если 0, то должно вывестись 0
SELECT m.id, CONCAT(m.lastName, ' ', m.firstName, ' ', m.middleName) AS fullName, COUNT(status1.status) AS tasksInProgress, COUNT(status2.status)  AS tasksCompleted
FROM merchandiser AS m
LEFT JOIN placeposmtask AS status1
	ON m.id = status1.merchandiserId AND status1.status = 1
LEFT JOIN placeposmtask AS status2
	ON m.id = status2.merchandiserId AND status2.status = 2
GROUP BY m.id;

-- 8)	Найдите агентов, у которых более 2 задач на размещение, выведите для каждого из них количество задач
SELECT placeposmtask.agentCode, COUNT(placeposmtask.agentCode) tasksCountPerAgent
FROM placeposmtask
GROUP BY placeposmtask.agentCode
HAVING COUNT(placeposmtask.agentCode) > 2;