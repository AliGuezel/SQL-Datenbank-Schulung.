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

-- ################ SAKILA #########################

-- JOIN (INNER JOIN) 

-- Welche Schauspieler spielen mit in dem Film "AGENT TRUMAN"?
-- Benötigte Tabellen: actor, film_actor, film

SELECT actor.first_name, actor.last_name
FROM actor 
JOIN film_actor
ON actor.actor_id = film_actor.actor_id
JOIN film 
ON film_actor.film_id = film.film_id
WHERE film.title = 'AGENT TRUMAN';

-- In welchen Filmen hat der Schauspieler ED CHASE mitgespielt?
-- Benötigte Tabellen: film, film_actor, actor
SELECT film.title 
FROM film
JOIN film_actor 
ON film.film_id = film_actor.film_id
JOIN actor 
ON film_actor.actor_id = actor.actor_id 
WHERE actor.first_name = 'ED'
AND actor.last_name = 'CHASE';

-- Welche Filme befinden sich in der Kategorie 'Drama'?
-- Benötigte Tabellen: film, film_category, category
SELECT film.title 
FROM film 
JOIN film_category 
ON film.film_id = film_category.film_id 
JOIN category 
ON film_category.category_id = category.category_id
WHERE category.name = 'Drama';

-- In welcher Kategorie befindet sich der Film 'ALABAMA DEVIL'?
-- Benötigte Tabellen: category, film_category, film 

SELECT category.name -- Was wird gesucht?
FROM category 
JOIN film_category 
ON category.category_id = film_category.category_id
JOIN film 
ON film_category.film_id = film.film_id 
WHERE film.title = 'ALABAMA DEVIL'; -- Einschränkung

-- Spaltenalias
SELECT category.name AS Kategorie 
FROM category 
JOIN film_category 
ON category.category_id = film_category.category_id
JOIN film 
ON film_category.film_id = film.film_id 
WHERE film.title = 'ALABAMA DEVIL';

-- Tabellenalias
SELECT c.name 
FROM category AS c
JOIN film_category AS fc
ON c.category_id = fc.category_id
JOIN film AS f
ON fc.film_id = f.film_id 
WHERE f.title = 'ALABAMA DEVIL';

-- Datensatz einfügen 
INSERT INTO login (benutzer,passwort) VALUES ('karlheinz','geheim');
INSERT INTO login VALUES (NULL,'susi','bekannt');

-- Datensatz aktualisieren 
UPDATE login 
SET passwort='neu' 
WHERE benutzer='susi';

-- Datensatz löschen 
DELETE FROM login WHERE benutzer='susi';
