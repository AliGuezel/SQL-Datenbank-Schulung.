-- SELECT (Auswahl von Datensätzen)
-- * steht für alle Spalten 
SELECT * FROM city;

-- Nur die Spalte name und population auswählen
SELECT name,population FROM city;

-- WHERE-Klausel 
SELECT * FROM city WHERE countrycode = 'NLD';

-- Vergleichsoperatoren:
-- >, >=, <, <=, =, !=

-- Alle Städte anzeigen mit einer Bevölkerungszahl von über 1 Mio. Einwohnern
SELECT * FROM city WHERE population > 1000000;
SELECT name,population FROM city WHERE population > 1000000;

-- Verknüpfungsoperatoren:
-- AND (oder &&) und OR (oder ||)
SELECT * FROM city WHERE population > 400000 AND countrycode = 'NLD';

-- Zeigen Sie alle Länder an, die auf dem Kontinent "Africa" liegen und 
-- eine Bevölkerungszahl von über 20 Mio Einwohnern haben.
SELECT * FROM country WHERE population > 20000000 AND continent = 'africa';
 
-- Zeigen Sie alle Länder die in "North America" liegen 
-- und alle Länder die in "Europe" liegen mit einer Lebenserwartung von über 71 Jahren 
SELECT * 
FROM country 
WHERE lifeexpectancy > 71 
AND (continent = 'north america' OR continent = 'Europe');

-- ORDER BY (Sortierung)
-- Aufsteigende Sortierung (ASC)
SELECT * FROM city ORDER BY name;
SELECT * FROM city ORDER BY name ASC;

-- Absteigende Sortierung (DESC)
SELECT * FROM city ORDER BY population DESC; 

-- Sortierung mehrerer Spalten 
SELECT * FROM kunde ORDER BY nachname, vorname;

-- LIMIT 
-- Die ersten 5 Datensätze 
SELECT * FROM city LIMIT 5;

-- Ab dem dritten Datensatz, werden 7 Datensätze ausgewählt 
SELECT * FROM city LIMIT 2,7;

-- SELECT ... FROM ... [WHERE ...] [ORDER BY ...] [LIMIT ...]

-- Zeigen Sie die 12 Länder mit der höchsten Einwohnerzahl an 
SELECT * FROM country ORDER BY population DESC LIMIT 12;

-- BETWEEN-Operator 
SELECT * FROM city WHERE population BETWEEN 500000 AND 600000;

-- ohne BETWEEN-Operator
SELECT * FROM city WHERE population >= 500000 AND population <= 600000;

-- IN-Operator 
SELECT * FROM country WHERE continent IN('North America', 'South America', 'Asia');

-- ohne IN-Operator 
SELECT * 
FROM country 
WHERE continent='North America' 
OR continent='South America' 
OR continent='Asia';

-- LIKE-Operator 
-- % steht für beliebige Zeichen, beliebiger Länge
-- _ steht für genau ein beliebiges Zeichen
SELECT * FROM city WHERE name LIKE 'b%'; 
SELECT * FROM city WHERE name LIKE '%ar'; 
SELECT * FROM city WHERE name LIKE '%hu%'; 
SELECT * FROM city WHERE name LIKE '_a%'; 

-- MYSQL-Funktionen
-- count() liefert die Anzahl der ausgewählten Datensätze
SELECT count(*) FROM country; -- 239
SELECT count(name) FROM country; -- 239 
SELECT count(indepyear) FROM country; --192

-- max() liefert den größten Wert einer Spalte zurück 
SELECT max(population) FROM country;

-- min() liefert den kleinsten Wert einer Spalte zurück 
SELECT min(population) FROM country;

-- avg() liefert den Durchschnittswert einer Spalte
SELECT avg(lifeexpectancy) FROM country;

-- sum() liefert die Summe einer Spalte 
SELECT sum(population) FROM country;

-- rand() liefert eine Zufallszahl im Bereich von 0 bis kleiner 1
SELECT rand();

-- Liefert einen zufälligen Datensatz
SELECT * FROM country ORDER BY rand() LIMIT 1;

-- https://dev.mysql.com/doc/refman/8.0/en/functions.html




--------------------------------------------------------------------------------------------
-- Alle nachfolgenden Aufgaben gelten für die world-Datenbank.

-- a) Alle Städte mit einer Einwohnerzahl von über 2 Mio.
SELECT * FROM city WHERE population > 2000000;

-- b) Die sieben Länder mit der höchsten Lebenserwartung.
SELECT * FROM country ORDER BY lifeexpectancy DESC LIMIT 7;

-- c) Welche Länder wurden nach 1920 unabhängig? Sortiert nach dem Jahr der Unabhängigkeit absteigend.
SELECT * FROM Country WHERE IndepYear >=1920 ORDER BY IndepYear DESC

-- d) Alle Städte mit dem CountryCode NLD und einer Bevölkerungszahl von über 100.000
SELECT * FROM city WHERE countrycode = 'NLD' AND population > 100000;

-- e) Nur die Städtenamen, deren Städte eine Einwohnerzahl von 200.000 bis 300.000 besitzen
SELECT * FROM city WHERE population BETWEEN 200000 AND 300000;

-- f) Welche Länder haben die Regierungsform "Republic" oder "Federal Republic" oder "Monarchy"?
SELECT * FROM country WHERE  governmentform IN("Republic","Federal Republic","Monarchy");

-- h) Welche 3 Länder in Süd-Amerika haben die höchste Einwohnerzahl?
SELECT Name FROM Country WHERE Continent = 'South America' ORDER BY Population DESC LIMIT 3;

-- i) Welche Länder wurden von 1900 bis 1910 oder von 1960 bis 1970 unabhängig?
SELECT * FROM Country WHERE IndepYear BETWEEN 1900 AND 1910 OR IndepYear BETWEEN 1960 AND 1970;

-- j) Welche Länder aus Nord-Amerika und Süd-Amerika haben eine Bevölkerungszahl von über 8 Mio.
SELECT * FROM Country WHERE Continent IN ('North America','South America') AND Population > 8000000;
SELECT * FROM country WHERE (continent = 'north america'  OR continent = 'south america' AND population > 8000000;

-- k) Welche Länder in Europa und welche Länder in Afrika haben eine durchschnittliche 
SELECT * FROM Country WHERE Continent IN('Europe','Africa') AND LifeExpectancy BETWEEN 60 AND 70;

-- Lebenserwartung von 60 bis 70 Jahren?
SELECT Count(*) FROM Country WHERE continent='Eurpoa';

-- l) Wie viele Länder gibt es auf dem Kontinent Europa?
SELECT Count('europe') FROM Country;

-- m) Welche Ländernamen enden mit "um"?
SELECT * FROM city ORDER BY name ASC %um;

-- Optionale (freiwillige) Aufgabe "SQL Island" durchspielen:
-- https://sql-island.informatik.uni-kl.de/

------------------------------------------------------------------------------------------

-- Alle folgenden SQL-Aufgaben beziehen sich auf die sakila-Datenbank, Tabelle film

-- a) Alle Filme auswählen, die eine Ausleihgebühr (rental_rate) von 0.99 - 2.99 haben und 
-- mit dem Buchstaben B beginnen.
SELECT * FROM film WHERE (rental_rate BETWEEN 0.99 AND 2.99) AND title LIKE 'B%';

-- b) Alle Filme mit einer Länge von 30 bis 65 Minuten. Sortiert nach der Filmlänge (length) aufsteigend.
SELECT * FROM film WHERE length BETWEEN 30 AND 65 ORDER BY length ASC;

-- c) Welche Filme besitzen das Special Feature "Trailers"?
SELECT * FROM film WHERE special_features LIKE '%Trailers%';

-- d) Welche Filme haben eine Länge von 40 bis 60 Minuten und haben eine Ausleihgebühr von genau 4.99? 
-- Sortieren Sie die Ausgabe nach der Filmlänge aufsteigend
SELECT * FROM film WHERE (length BETWEEN 40 AND 60) AND rental_rate = 4.99 ORDER BY length;

-- e) Welche 15 Filme haben die höchste Ausleihgebühr (rental_rate)?
SELECT * FROM film ORDER BY rental_rate DESC LIMIT 15;

-- f) Wie viele Filme besitzen das Rating "G"?
SELECT count(*) FROM film WHERE rating = 'G';

-- g) Wie hoch ist die durchschnittliche Leihgebühr (rental_rate) aller Filme?
SELECT avg(rental_rate) FROM film;

-- h) Einen zufälligen Filmtitel auswählen.
SELECT title FROM film ORDER BY rand() LIMIT 1;

-- Sakila-Aufgaben mit Join 
-- a) Welche Schauspieler haben mitgespielt in dem Film "ACE GOLDFINGER"?
-- Benötigte Tabellen: film, film_actor, actor
SELECT actor.first_name, actor.last_name
FROM film
Join film_actor
ON film.film_id = film_actor.film_id
Join actor
ON film_actor.actor_id = actor.actor_id
WHERE film.title = 'ACE GOLDFINGER';

-- b) Welche Filme befinden sich in der Kategorie "Sci-Fi"? 
SELECT film.title
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id
WHERE category.name = 'Sci-Fi';

-- c) Welche Filme befinden sich merkwürdigerweise in der Kategorie Children,
--    obwohl Sie keine Altersfreigabe für Kinder (rating = "NC-17") besitzen 
SELECT film.title, film.rating
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON category.category_id = film_category.category_id
WHERE category.name='children' AND rating='NC-17';

-- d) Wie viele Schauspieler haben mitgespielt in dem Film 'ALICE FANTASIA'?
SELECT count(*)
FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
JOIN film
ON film_actor.film_id = film.film_id
WHERE film.title = 'ALICE FANTASIA';

-- e) Welche Schauspieler haben mitgespielt in einem Film der Kategorie "Horror"?
-- DISTINCT filtert doppelte Zeilen in der Ergebnistabelle
SELECT DISTINCT actor.first_name, actor.last_name
FROM actor
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
JOIN film
ON film_actor.film_id = film.film_id
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id
WHERE category.name = 'Horror';


-- Gibt nur unterschiedliche (eindeutige) Nachnamen aus
SELECT DISTINCT lastname FROM customers;

-- Die Kombination von lastname und firstname wird nur einmal ausgegeben
SELECT DISTINCT firstname, lastname FROM customers;

