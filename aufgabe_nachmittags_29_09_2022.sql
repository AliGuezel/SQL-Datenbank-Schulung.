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
-- Beispiel mit View:
CREATE VIEW sakila.max_rental_rate AS SELECT * FROM film ORDER BY rental_rate DESC LIMIT 15;
SELECT * FROM max_rental_rate ORDER BY title;

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
JOIN film_actor 
ON film.film_id = film_actor.film_id 
JOIN actor 
ON film_actor.actor_id = actor.actor_id
WHERE film.title = 'ACE GOLDFINGER';
-- b) Welche Filme befinden sich in der Kategorie "Sci-Fi"? 
SELECT film.title
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON category.category_id = film_category.category_id
WHERE category.name='Sci-fi';
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