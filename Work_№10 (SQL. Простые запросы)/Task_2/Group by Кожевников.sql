USE world;

-- 1
SELECT CountryCode, COUNT(*)
FROM city
GROUP BY CountryCode;

-- 2
SELECT CountryCode, COUNT(*)
FROM city
GROUP BY CountryCode
HAVING COUNT(*) >= 2;

-- 3
SELECT CountryCode, COUNT(*)
FROM city
WHERE population >= 1000000
GROUP BY CountryCode
HAVING COUNT(*) >= 2;

-- 4
SELECT CountryCode, AVG(Population) average
FROM city
GROUP BY CountryCode
ORDER BY average DESC;