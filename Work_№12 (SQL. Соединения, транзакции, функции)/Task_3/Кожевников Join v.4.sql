USE world;

-- 1
-- SELECT * FROM country
-- CROSS JOIN city;

-- 2
SELECT country.Code, country.Name AS countryName, city.name AS capitalName
FROM country
INNER JOIN city
	ON city.id = country.Capital;

-- 3
SELECT city.Name, city.Population, city.CountryCode, country.Name
FROM city
INNER JOIN country
	ON country.code = city.CountryCode;

-- 4
SELECT country.Continent, COUNT(city.CountryCode) AS Cities
FROM country
LEFT JOIN city
	ON country.code = city.CountryCode
GROUP BY country.Continent;

-- 5

SELECT c.name, COUNT(cl.isOfficial) AS officialLanguagesCount
FROM country AS c
LEFT JOIN countrylanguage AS cl
	ON c.code = cl.countryCode AND cl.isOfficial = 'T'
GROUP BY c.name
ORDER BY officialLanguagesCount DESC;