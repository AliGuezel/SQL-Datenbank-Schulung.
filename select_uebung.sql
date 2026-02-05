-- SELECT (Auswahl von Datensätzen)
-- * steht für alle Spalten 
SELECT * from city;

-- Nur die Spalte name und population auswählen
select name,population from city;

-- WHERE-Klausel 
select * from city CountryCode = 'NLD';

-- Vergleichsoperatoren:
-- >, >=, <, <=, =, !=

-- Alle Städte anzeigen mit einer Bevölkerungszahl von über 1 Mio. Einwohnern
select * from city where population > 1000000;
select name, population from city where population > 1000000;

-- Verknüpfungsoperatoren:
-- AND (oder &&) und OR (oder ||)
select *from city where population > 400000 and CountryCode = 'NLD';

-- Zeigen Sie alle Länder an, die auf dem Kontinent "Africa" liegen und 
-- eine Bevölkerungszahl von über 20 Mio Einwohnern haben.
select * from country where population > 20000000 and continent = 'africa';

-- Zeigen Sie alle Länder die in "North America" liegen 
-- und alle Länder die in "Europe" liegen mit einer Lebenserwartung von über 71 Jahren 
select * from country where lifeexpectancy > 71 and (continent = 'north america' or continent 'south america');

-- ORDER BY (Sortierung)
-- Aufsteigende Sortierung (ASC)
select * from city order by name asc;
select * from city order by name;

-- Absteigende Sortierung (DESC)
select * from city order population DESC;

-- Sortierung mehrerer Spalten 
select * from kunde order by nachname, vorname;

-- LIMIT 
-- Die ersten 5 Datensätze 
select * from city limit 5;

-- Ab dem dritten Datensatz, werden 7 Datensätze ausgewählt 
select * from city limit 2,7;

-- SELECT ... FROM ... [WHERE ...] [ORDER BY ...] [LIMIT ...]

-- Zeigen Sie die 12 Länder mit der höchsten Einwohnerzahl an 
select * from country order by population DESC limit 12;
-- BETWEEN-Operator 
select * from city where population between 500000 and 600000;

-- ohne BETWEEN-Operator
select * from city where population >= 500000 and population <=  600000;

-- IN-Operator 
select * from country where continent in('north america', 'south america', 'asia');

-- ohne IN-Operator 
select * from country where continent='north america' or continent='south america' or 'asia';

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
select max(population) from country;

-- min() liefert den kleinsten Wert einer Spalte zurück 
select min(population) from country;

-- avg() liefert den Durchschnittswert einer Spalte
select avg(lifeexpectancy) from country;

-- sum() liefert die Summe einer Spalte 
select sum(population) from country;

-- rand() liefert eine Zufallszahl im Bereich von 0 bis kleiner 1
select rand();

-- Liefert einen zufälligen Datensatz
select * from country order by rand() limit 1;

-- https://dev.mysql.com/doc/refman/8.0/en/functions.html




--------------------------------------------------------------------------------------------
-- Alle nachfolgenden Aufgaben gelten für die world-Datenbank.

-- a) Alle Städte mit einer Einwohnerzahl von über 2 Mio.
select * from city where population > 2000000;

-- b) Die sieben Länder mit der höchsten Lebenserwartung.
select * from country order by lifeexpectancy DESC limit 7;

-- c) Welche Länder wurden nach 1920 unabhängig? Sortiert nach dem Jahr der Unabhängigkeit absteigend.
select * from country where IndepYear >=1920 order by IndepYear DESC;

-- d) Alle Städte mit dem CountryCode NLD und einer Bevölkerungszahl von über 100.000
select * from city where CountryCode = 'NLD' and population > 100000;

-- e) Nur die Städtenamen, deren Städte eine Einwohnerzahl von 200.000 bis 300.000 besitzen
select * from city where population between 200.000 and 300.000;

-- f) Welche Länder haben die Regierungsform "Republic" oder "Federal Republic" oder "Monarchy"?
select * from country where governmentform in("Republic","Federal Republic","Monarchy");

-- h) Welche 3 Länder in Süd-Amerika haben die höchste Einwohnerzahl?
select * from country where continent = 'south america' order by population DESC limit 3;

-- i) Welche Länder wurden von 1900 bis 1910 oder von 1960 bis 1970 unabhängig?
select * from country where IndepYear between 1900 and 1910 or IndepYear between 1960 and 1970;

-- j) Welche Länder aus Nord-Amerika und Süd-Amerika haben eine Bevölkerungszahl von über 8 Mio.
select * from country where continent in('north america','south america') and population > 8000000;
select * from country where (continent = 'north america' or continent = 'south america') and population > 8000000;

-- k) Welche Länder in Europa und welche Länder in Afrika haben eine durchschnittliche 
select * from country where continent in('europa','africa') and lifeexpectancy between 60 and 70;

-- Lebenserwartung von 60 bis 70 Jahren?
select count(*) from country where continent='europe';

-- l) Wie viele Länder gibt es auf dem Kontinent Europa?
select count('europe') from country;

-- m) Welche Ländernamen enden mit "um"?
select * from country order by name asc %um;

-- Optionale (freiwillige) Aufgabe "SQL Island" durchspielen:
-- https://sql-island.informatik.uni-kl.de/

------------------------------------------------------------------------------------------

-- Alle folgenden SQL-Aufgaben beziehen sich auf die sakila-Datenbank, Tabelle film

-- a) Alle Filme auswählen, die eine Ausleihgebühr (rental_rate) von 0.99 - 2.99 haben und 
-- mit dem Buchstaben B beginnen.
select * from film where (rental_rate between 0.99 and 2.99) and title like 'B%';

-- b) Alle Filme mit einer Länge von 30 bis 65 Minuten. Sortiert nach der Filmlänge (length) aufsteigend.
select * from film where length between 30 and 65 order by length asc;

-- c) Welche Filme besitzen das Special Feature "Trailers"?
select * from film where special_features like '%Trailers%';

-- d) Welche Filme haben eine Länge von 40 bis 60 Minuten und haben eine Ausleihgebühr von genau 4.99? 
-- Sortieren Sie die Ausgabe nach der Filmlänge aufsteigend
select * from film where (length between 40 and 60) and rental_rate = 4.99 order by length;

-- e) Welche 15 Filme haben die höchste Ausleihgebühr (rental_rate)?
select * from film order by rental_rate desc limit 15;

-- f) Wie viele Filme besitzen das Rating "G"?
select count(*) from film where rating = 'G';

-- g) Wie hoch ist die durchschnittliche Leihgebühr (rental_rate) aller Filme?
select avg(rental_rate) from film;

-- h) Einen zufälligen Filmtitel auswählen.
select title from film order by rand() limit 1;


-- Sakila-Aufgaben mit Join 
-- a) Welche Schauspieler haben mitgespielt in dem Film "ACE GOLDFINGER"?
-- Benötigte Tabellen: film, film_actor, actor
select actor.first_name, actor. last_name
from film
Join film_actor 
on film.film_id = film_actor.film_id
Join actor
on film_actor.actor_id = actor.actor_id
where film.title = 'ACE GOLDFINGER';

-- b) Welche Filme befinden sich in der Kategorie "Sci-Fi"? 
select film.title
from film
join film_category
on film.film_id = film_category.film_id
join category
on film_category.category_id = category.category_id
where category.name = 'Sci-Fi';

-- c) Welche Filme befinden sich merkwürdigerweise in der Kategorie Children,
--    obwohl Sie keine Altersfreigabe für Kinder (rating = "NC-17") besitzen 
select film.title, film.rating
from film
join film_category
on film.film_id = film_category.film_id
join category
on category.category_id = film_category.category_id
where category.name= 'Children' and rating='NC-17';

-- d) Wie viele Schauspieler haben mitgespielt in dem Film 'ALICE FANTASIA'?
select count(*)
from actor
join film_actor
on actor.actor_id = film_actor.actor_id
join film
on film_actor.film_id = film.film_id
where film.title = 'ALICE FANTASIA';

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

-- Welcher schauspieler spielen mit in dem Film "AGENT TRUMAN"?
-- Benötigte Tabellen: actor,film_actor, film


-- In Welchen Filmen hat der Schauspieler ED CHASE mitgespielt?
-- Benötigte Tabellen: film,film_actor,actor



-- Welche Filme befinden sich in der Kategorie 'Drama?
-- Benötigte Tabellen: film,film_category,category


-- In welcher Kategorie befindet sich der Film ' ALABAMA DEVIL' ?
-- Benötigte Tabellen: category,film_category,film


-- Spaltenalias


--Tabellenalias


-- Datensatz einfügen

-- Datensatz aktualisieren

-- Datensatz löschen
