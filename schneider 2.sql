CREATE DATABASE schneider;

CREATE TABLE IF NOT EXISTS artikel (
art_id INTEGER PRIMARY KEY AUTO_INCREMENT,
artikelbezeichung VARCHAR(100)  NOT NULL,
ak_lagerbestand INTEGER NOT NULL,
max_lagerbestand INTEGER not NULL,
meldbestand INTEGER not NULL
);
ALTER TABLE artikel AUTO_INCREMENT = 0;
DROP TABLE artikel;
describe artikel;

CREATE TABLE IF not EXISTS lieferant (
lfa_id INTEGER PRIMARY KEY AUTO_INCREMENT,
firmename VARCHAR(200) not NULL,
strasse VARCHAR(50) not NULL,
plz VARCHAR(50) not NULL,
ort VARCHAR(50) not NULL,
land VARCHAR(50),
tel VARCHAR (30), 
email VARCHAR (200) 
);
ALTER TABLE lieferant AUTO_INCREMENT = 0;
CREATE TABLE IF NOT EXISTS artikel_lieferant (
gebinde INTEGER not NULL,
preis DOUBLE not NULL,
art_id INTEGER not NULL,
lfa_id INTEGER not NULL,
PRIMARY KEY (art_id, lfa_id),
FOREIGN KEY (art_id) REFERENCES artikel(art_id),
FOREIGN KEY (lfa_id) REFERENCES lieferant(lfa_id)

);

CREATE TABLE IF NOT EXISTS ansprechpartner(
ansprechpartner_id INTEGER PRIMARY KEY AUTO_INCREMENT,
vorname VARCHAR(50) not NULL,
nachname VARCHAR(50) not NULL,
tel VARCHAR(50) not NULL,
email VARCHAR (200) not NULL,
lfa_id INTEGER not NULL,
FOREIGN key (lfa_id) REFERENCES lieferant(lfa_id)
);
ALTER TABLE lieferant AUTO_INCREMENT = 0;
--------------------INSERT-----------------------------
INSERT INTO artikel(artikelbezeichung, ak_lagerbestand, max_lagerbestand, meldbestand) VALUES
("Hose", 100, 300, 40),
("T-Shirt", 280, 600, 90),
("Jacke", 50, 150, 15);
INSERT INTO lieferant (firmename, strasse, plz, ort, land, tel, email) VALUES
("TOMMY HILFIGER EUROPE B.V", "Danzigerkade 165", "1013", "AMSTERDAM", "Niederlande", "00800 – 86669445", "tommy@localhost"),
("HUGO BOSS AG", "Dieselstraße 12", "72555", "Metzingen", "Deutschland", "+49(0)71231783981", "boss@localhost"),
("Zara", "Mönckebergstr. 11", "20095", "Hamburg", "", "0800 589 1603", "zara@localhost");
INSERT INTO artikel_lieferant(gebinde, preis, art_id, lfa_id) VALUES
(1, 49.99, 1, 1), 
(1, 59.99, 1, 2), 
(1, 29.99, 1, 3),
(2, 19.99, 2, 1),
(2, 25.99, 2, 2),
(2, 14.99, 2, 3);


INSERT INTO ansprechpartner(vorname, nachname, tel, email, lfa_id) VALUES
("Jens", "Scholz", "2222330", "Scholz@localhost", 3),
("Ulrich", "Schmidt", "2222331", "Schmidt@localhost", 2),
("Erwin", "schneider", "2222332", "schneider@localhost", 1),
("Severin", "Kleinert", "2222333", "kleinert@localhost", 2),
("Hans", "Buch", "2222334", "buch@localhost", 1);


-----------------SELECT--------------------------------

-- Diese Abfrage gibt die Firmen-, Artikel-, Vor- und Nachnamen aller Ansprechpartner zurück, die mit dem Lieferanten mit der ID 1 verbunden sind.
SELECT firmename AS Firma, artikelbezeichung AS Artikel, vorname AS Vorname, nachname AS Nachname 
FROM artikel 
JOIN artikel_lieferant ON artikel_lieferant.art_id = artikel.art_id 
JOIN lieferant ON lieferant.lfa_id = artikel_lieferant.lfa_id 
JOIN ansprechpartner ON ansprechpartner.lfa_id = lieferant.lfa_id
WHERE lieferant.lfa_id = 1;


-- 
SELECT artikelbezeichung AS Artikel, firmename AS Firma, tel, email 
FROM artikel 
JOIN artikel_lieferant ON artikel_lieferant.art_id = artikel.art_id 
JOIN lieferant ON lieferant.lfa_id = artikel_lieferant.lfa_id
WHERE artikel.art_id = 1;


-- Die UPDATE-Anweisung wird verwendet, um vorhandene Datensätze in Einer Tabelle zu ändern. In diesem Fall WIRD die artikel Tabelle aktualisiert, 
-- Indem der Wert in der Spalte aktueller_lagerbestand auf 50 geändert wird, aber nur für den Artikel mit der artnr(Artikelnummer) gleich 2.
UPDATE artikel set ak_lagerbestand = 60 WHERE art_id = 2;


-- die GROUP BY anweisung fasst Datensätze mit identischen Werten in der angegebenen Feldliste zu einem einzigen Datensatz zusammen. 
SELECT artikelbezeichung, firmename, preis 
FROM artikel 
JOIN artikel_lieferant ON artikel.art_id = artikel_lieferant.art_id
JOIN lieferant ON lieferant.lfa_id = artikel_lieferant.lfa_id
WHERE ak_lagerbestand < meldbestand
GROUP BY preis ASC;


-- Die SQL Syntax einer Select-Abfrage mit WHERE und LIKE kann wie folgt aufgebaut werden
SELECT Spaltenname FROM Tabellenname WHERE Spaltenname LIKE 'MUSTER'


-- die Mit dieser Funktion frage ich den preis vom Artikel ab
SELECT COUNT(ak_lagerbestand) FROM artikel;


-- Nach ORDER BY können mehrere Spaltennummern in einer Liste angegeben werden. Außerdem können in derselben Liste Spaltennamen und Spaltennummern verwendet werden.
SELECT vorname, nachname, tel, email, lfa_id
FROM ansprechpartner
ORDER BY 1, 4 DESC;

-- Die SQL MAX Funktion ermittelt den höchsten Wert einer Tabellenspalte und liefert ihn zurück.
SELECT MAX(ak_lagerbestand) FROM artikel;


-- Diese Anweisung wird nach dem Löschen einer Zeile in der Tabelle 'artikel' ausgeführt und aktualisiert 'Artikelanzahl' in der Tabelle 'stat', Indem es den Wert um 1 reduziert.
DELETE  FROM artikel WHERE art_id = 3;

SELECT * FROM artikel;


-------------------------------------------------------
mysqldump -B -R -u root schneider > schneider.sql
-------------------------------------------------------








