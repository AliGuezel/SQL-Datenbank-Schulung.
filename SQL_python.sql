-- AND hat mehr Priorität als OR. OR muss also in diesemFall in Klammern gesetzt werden.
SELECT title, lastname,city FROM `customers` WHERE (title='Frau Dr.' OR title='Herr Dr.') AND age < 30;
--------------------------------------------------------------------------------------

SELECT count(*) FROM `customers` WHERE age < 50;
----------------------------------------------------------------------------------------

-- Gibt nur unterschiedliche (eindeutige) Nachnamen aus
SELECT DISTINCT lastname FROM customers;
-----------------------------------------------------------------------------------------

-- Die Kombination von lastname und firstname wird nur einmal ausgegeben
SELECT DISTINCT firstname, lastname FROM customers;
-------------------------------------------------------------------------------------

-- Sucht alle Namen mit M beginnend
SELECT * 'customers' WHERE lastname LIKE '%M%';
---------------------------------------------------------------------------------------

-- Sucht alle Namen mit 2 MM innen enthalten
SELECT * 'customers' WHERE lastname LIKE '%MM%';
---------------------------------------------------------------------------------------

-- Alle E-Mails, die gmail.com sind.
SELECT * FROM `customers` WHERE email LIKE '%@gmail.com';
----------------------------------------------------------------------------------------

-- Hier werden auch die googlemail-Adressen gefunden:
SELECT * FROM `customers` WHERE email LIKE '%@g%mail.com';
------------------------------------------------------------------------------------------

-- Der IN-Operator ist vereinfacht bestimmte Abfragen. Er funktioniert ähnlich wie ein „oder“.
SELECT * FROM customers WHERE firstname IN('Lilo','Nico','Arno');
------------------------------------------------------------------------------------------------

-- Alle Personen mit dem Alter zwischen 20 und 60 (einschließlich 20 und 60). 
SELECT * FROM `customers` WHERE age BETWEEN 20 AND 60;
------------------------------------------------------------------------------------
-- lastname wird in diesem Beispiel in lname für die Ausgabe umbenannt. Die Umbenennung ist nur für die Ausgabe temporär gültig.
SELECT lastname as lname FROM `customers`;
------------------------------------------------------------------------------------------

-- Gibt den Datum und Uhrzeit aus
SELECT lastname, now() as 'DATE' FROM 'customers';
--------------------------------------------------------------------------------------------

-- gibt die länge der Namen aus
SELECT length(lastname) FROM 'customers';
----------------------------------------------------------------------------------------------

-- gibt die Namen mit 4 buchstaben aus
SELECT lastname FROM customers WHERE length(lastame) =4;
-------------------------------------------------------------------------------------------------

--Geben das aktuelle Datum oder den aktuellen Tag zurück. Lassen sich sehr schön in WHERE-Blöcken einsetzen.
SELECT * FROM 'student' WHERE  geburtsdatum < curdate()
-------------------------------------------------------------------------------------------------

-- Ermittelt alle Geburstagskinder
SELECT name FROM Tabelle WHERE DATEDIFF(CURDATE(), geburtstag) = 0;
------------------------------------------------------------------------------------------------

-- Wandelt das Standarddatumsformat von MySQL um. Die Parameter findet ihr unter der vollständigen Liste.
SELECT DATE_FORMAT(datum,'%d.%m.%Y') FROM 'student';
----------------------------------------------------------------------------------------------------

SELECT * FROM `baby_names` 
WHERE `year` < (SELECT max(year) FROM baby_names);  
--------------------------------------------------------------------------------------------------------------------------------

-- Wandelt das Standarddatumsformat von MySQL um. Die Parameter findet ihr unter der vollständigen Liste.
SELECT DATE_FORMAT(datum,'%d.%m.%Y') FROM test;
----------------------------------------------------------------------------------------------------------------------------------
-- Ermittelt die aktuelle Uhrzeit inklusive Datum. Eignet sich zum Beispiel hervorragend bei Bestellungen in einem Online-Shop,
-- wo man eine genaue Zeitangabe benötigt.
INSERT INTO bestellung (datum) VALUES(NOW());
-----------------------------------------------------------------------------------------------------------------------------------

