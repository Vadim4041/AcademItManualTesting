USE world;

-- 1
SELECT DISTINCT Continent
FROM country
WHERE SurfaceArea >= 950000;

-- 2
SELECT * FROM country
ORDER BY SurfaceArea DESC
LIMIT 5;

-- 3
SELECT * FROM country
ORDER BY SurfaceArea DESC
LIMIT 5, 5;