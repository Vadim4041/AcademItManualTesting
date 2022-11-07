USE world;

-- 1
SELECT Name, District
FROM city;

-- 2
SELECT * FROM city
WHERE CountryCode = 'RUS'
ORDER BY name;

-- 3
SELECT * FROM city
WHERE CountryCode IN ('ESP', 'PRT', 'GRC')
ORDER BY name DESC;

-- 4
SELECT * FROM city
WHERE Population BETWEEN 300000 AND 500000;

-- 5
SELECT * FROM city
WHERE Name LIKE 'A%';

-- 6
SELECT * FROM city
WHERE Name LIKE '%A%';

-- 7
SELECT * FROM city
WHERE Population >= 1000000 AND CountryCode = 'RUS';

-- 8
SELECT * FROM city
WHERE (Name LIKE 'A%' AND CountryCode = 'ESP')
	OR (CountryCode = 'GRC' AND Population < 200000);