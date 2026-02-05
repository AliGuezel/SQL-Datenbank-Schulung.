
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


--  die GROUP BY anweisung fasst Datensätze mit identischen Werten in der angegebenen Feldliste zu einem einzigen Datensatz zusammen. 
SELECT artikelbezeichung, firmename, preis 
FROM artikel 
JOIN artikel_lieferant ON artikel.art_id = artikel_lieferant.art_id
JOIN lieferant ON lieferant.lfa_id = artikel_lieferant.lfa_id
WHERE ak_lagerbestand < meldbestand
GROUP BY preis ASC;


-- die Mit dieser Funktion frage ich den preis vom Artikel ab
SELECT COUNT(ak_lagerbestand) FROM artikel;


-- Nach ORDER BY können mehrere Spaltennummern in einer Liste angegeben werden. Außerdem können in derselben Liste Spaltennamen und Spaltennummern verwendet werden.
SELECT vorname, nachname, tel, email, lfa_id
FROM ansprechpartner
ORDER BY 1, 4 DESC;


-- Die SQL MAX Funktion ermittelt den höchsten Wert einer Tabellenspalte und liefert ihn zurück.
SELECT MAX(ak_lagerbestand) FROM artikel;


-- Diese Anweisung wird nach dem Löschen einer Zeile in der Tabelle 'artikel' ausgeführt und aktualisiert 'Artikelanzahl' in der Tabelle, Indem es den Wert um 1 reduziert.
DELETE  FROM artikel WHERE art_id = 3;

SELECT * FROM artikel;










