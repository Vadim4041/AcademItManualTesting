USE world;

-- 1.1
SELECT Code, UPPER(Name) Name, LOWER(Continent) Continent,
	Region, SurfaceArea, IndepYear, Population, LifeExpectancy,
	GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2
FROM country
ORDER BY CHAR_LENGTH(Name) DESC;

-- 1.2
SELECT *, SQRT(SurfaceArea / PI()) equivalentRadius
FROM country
ORDER BY equivalentRadius DESC;