-- 1)	In welchem Jahr wurde der Name Aaden am häufigsten vergeben?
-- Gebe das Jahr und die Anzahl(Spalte count) 2007 1267
SELECT year, max(count) FROM `baby_names` WHERE name='Aaden';

-- 2)	Wie viele unterschiedliche Namen gibt es, die genau 5 Zeichen haben?
-- Setze bei der Lösung auch die length() – Funktion ein, Achtung sollte Baby nicht Babynames heißen
SELECT SUM(count) FROM `baby_names` WHERE year =2000;

-- 4)	Versuche eine Abfrage zu erzeugen, die Name, Anzahl und Jahr berücksichtigt und folgende Ausgabe liefert:
SELECT concat(name,': ',count,', ', year) as Übersicht FROM `baby_names`;

-- 5)	Für die Abfrage soll eine zusätzliche Spalte Datum mit aktuellem Datum dargestellt werden. Die Tabelle soll nicht verändert werden! Erstelle eine Select-Abfrage.
SELECT *, CURRENT_DATE() as Datum FROM `baby_names`;

-- 6)	Erzeuge ein Select, dass uns den Babynamen und die Zeichenzahl ausgibt.
SELECT name as Babyname, length(name) as Zeichenzahl FROM `baby_names`;