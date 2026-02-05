-- Alle nachfolgenden Aufgaben gelten für die world-Datenbank.

-- a) Alle Städte mit einer Einwohnerzahl von über 2 Mio.
SELECT * FROM city WHERE population > 2000000;
-- b) Die sieben Länder mit der höchsten Lebenserwartung.
SELECT * FROM country ORDER BY lifeexpectancy DESC LIMIT 7;
-- c) Welche Länder wurden nach 1920 unabhängig? Sortiert nach dem Jahr der Unabhängigkeit absteigend.
SELECT * FROM Country WHERE IndepYear >=1920 ORDER BY IndepYear DESC;
-- d) Alle Städte mit dem CountryCode NLD und einer Bevölkerungszahl von über 100.000
SELECT * FROM city WHERE countrycode = 'NLD' AND population > 100000;
-- e) Nur die Städtenamen, deren Städte eine Einwohnerzahl von 200.000 bis 300.000 besitzen
SELECT Name FROM City WHERE Population BETWEEN 200000 AND 300000;
-- f) Welche Länder haben die Regierungsform "Republic" oder "Federal Republic" oder "Monarchy"?
SELECT * FROM country WHERE  governmentform IN("Republic","Federal Republic","Monarchy");
-- h) Welche 3 Länder in Süd-Amerika haben die höchste Einwohnerzahl?
SELECT Name FROM Country WHERE Continent = 'South America' ORDER BY Population DESC LIMIT 3;
-- i) Welche Länder wurden von 1900 bis 1910 oder von 1960 bis 1970 unabhängig?
SELECT *
FROM Country
WHERE IndepYear BETWEEN 1900 AND 1910
OR IndepYear BETWEEN 1960 AND 1970;
-- j) Welche Länder aus Nord-Amerika und Süd-Amerika haben eine Bevölkerungszahl von über 8 Mio.
SELECT * FROM Country WHERE Continent IN ('North America','South America') AND Population > 8000000;
SELECT * 
FROM country 
WHERE (continent = 'north america' 
OR continent = 'south america') 
AND population > 8000000;
-- k) Welche Länder in Europa und welche Länder in Afrika haben eine durchschnittliche 
--    Lebenserwartung von 60 bis 70 Jahren?
SELECT * 
FROM country 
WHERE Continent IN('Europe', 'Africa') 
AND LifeExpectancy BETWEEN 60 and 70;
-- l) Wie viele Länder gibt es auf dem Kontinent Europa?
SELECT Count(*) FROM Country WHERE continent='Europe';
-- m) Welche Ländernamen enden mit "um"?
SELECT * FROM Country WHERE Name LIKE '%um';

-- Optionale (freiwillige) Aufgabe "SQL Island" durchspielen:
-- https://sql-island.informatik.uni-kl.de/