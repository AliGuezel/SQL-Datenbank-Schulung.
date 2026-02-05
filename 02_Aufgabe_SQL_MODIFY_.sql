/* 1) Erweitere die Tabelle farben um eine Spalte date_time (das Date-Time Feld benötigt die Option: Null Wert). 
Schreibe eine INSERT -Statement, das einen neuen Farbwert speichert. 
Für die Spalte date_time soll automatisch das aktuelle Datum und die Urzeit gespeichert werden. Suche dazu die passende Funktion.
*/
INSERT INTO farbe (name, hexwert, date_time) 
VALUES ('blau','#455432', now() );

/* 2) Die Tabelle categories hat bei title einen Eintrag: „Kinder- und Jugendbücher“. Verändere diesen Eintrag mit UPDATE, so dass nur noch Kinder-, Jugendbücher in diesem Feld steht.
Notiere den SQL Befehl.
*/
UPDATE `categories` SET `title`='Kinder-, Jugendbücher' WHERE id=5;
UPDATE `categories` SET `title`=REPLACE(title, 'und', ' ,');

/* 3) Verändere in der Tabelle categories den Titel Krimis zu Krimi
*/
UPDATE `categories` SET `title`='Krimi' WHERE title='Krimis';
UPDATE `categories`  SET `title` = 'Krimi' WHERE id = 2;

/* 4) Wandle alle Inhalte von title und address in Grußbuchstaben um. Benutze UPDATE und eine geeignete Funktion.
 Wandle alle  Inhalte von title und address  in Grußbuchstaben um.
*/
UPDATE `locations` SET `title`=UPPER(title),`address`=UPPER(title);

/* 5) Füge in die Tabelle farbe einige Werte ein, die als hexwert kein „#“ am Anfang besitzen.
Schreibe eine DELETE-Anweisung, die alle Datensätze löscht, die keine Raute (#) am Anfang haben.
*/
INSERT INTO `farbe` (`id`, `name`, `hexwert`, `date_time`) 
VALUES (NULL, 'black', '000000', NULL), (NULL, 'white', 'ffffff', NULL);

DELETE FROM `farbe` WHERE hexwert NOT LIKE '#%';
