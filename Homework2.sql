-- Exercise 3a
SELECT COUNT(*)
FROM empires E
WHERE E.Empire = 'Great Britain';

SELECT COUNT(*)
FROM empires E
WHERE E.Empire = 'Iberian';

-- Exercise 3b
SELECT COUNT(*)
FROM (
	SELECT CC.CountryCode
	FROM countries_continents CC 
		JOIN countries_continents C2 ON CC.CountryCode = C2.CountryCode
	WHERE C2.Continent = 'Asia'
	GROUP BY CC.CountryCode
	HAVING COUNT(*) > 1
) X;

-- Exercise 3c
SELECT SUM(SpanishSpeaking)
FROM (
	SELECT CO.Code, CO.Population * CL.Percentage / 100.0 AS SpanishSpeaking
	FROM countries CO
		JOIN countries_continents CC ON CO.Code = CC.CountryCode
		JOIN countries_languages CL ON CO.Code = CL.CountryCode
	WHERE CO.Population > 80000000
		AND CC.Continent = 'North America'
		AND CL.Language = 'Spanish'
) X;

SELECT SUM(SpanishSpeaking)
FROM (
	SELECT CO.Code, CO.Population * CL.Percentage / 100.0 AS SpanishSpeaking
	FROM countries CO
		JOIN countries_continents CC ON CO.Code = CC.CountryCode
		JOIN countries_languages CL ON CO.Code = CL.CountryCode
	WHERE CO.Population > 50000000
		AND CC.Continent = 'Europe'
		AND CL.Language = 'Spanish'
) X;

-- Exercise 3d
SELECT COUNT(*)
FROM (
	SELECT CL.language
	FROM empires E
		JOIN countries_languages CL ON E.CountryCode = CL.CountryCode
	WHERE E.Empire = 'Benelux'
	GROUP BY CL.language
	HAVING COUNT(E.CountryCode) = (
		SELECT COUNT(*)
		FROM empires E
		WHERE E.Empire = 'Benelux'
	)
) X;

SELECT COUNT(*)
FROM (
	SELECT CL.language
	FROM empires E
		JOIN countries_languages CL ON E.CountryCode = CL.CountryCode
	WHERE E.Empire = 'Danish Empire'
	GROUP BY CL.language
	having COUNT(E.CountryCode) = (
		SELECT COUNT(*)
		FROM empires E
		WHERE E.Empire = 'Danish Empire'
	)
) X;