-- 1)	Wie viele Datensätze gibt es insgesamt in der Tabelle baby_names?
select count(id) from baby_names;

-- 2)	Wie viele männliche Personen gibt es?
select count(id) from baby_names where gender = "M";

-- 3)	Wie heißt der Name dessen Datensatz die id 280 hat?
select name from baby_names where id = 280;

-- 4)	Welches ist die höchste Jahreszahl bei der Spalte year?
select max(year) from baby_names;

-- 5)	Welcher Baby-Name wurde in einem bestimmten Jahr exakt 19250-mal vergeben?
select name, sum(count) as count, year from baby_names order by year having count = 19250;

-- 6)	Wie viele Datensätze gibt es, ab einschließlich dem Jahr 2000?
select count(id) from baby_names where year >= 2000;

-- 7)	Wie viele männliche Personen wurden im Jahr 2010 geboren?
select count(id) from baby_names where year = 2010 and gender = "M";

-- 8)	Wie viele männliche Personen wurden im Jahr 2010 geboren, die „Alex“ heißen?
select count(id) from baby_names where year = 2012 and name = "Alex";

-- 9)	Wie viele unterschiedliche Namen gibt es? 
select distinct count(name) from baby_names;

-- 10)	Gebe alle Datensätze der Tabelle baby_names nach Namen und nach Jahr sortiert aus. 
select name, year, gender from baby_names order by name, year;

-- 11)	Gebe nur Datensätze aus, die 3-Stellige Id’s haben und mit 1 beginnen.
select * from baby_name  where id between 100 and 199;

-- 12)	Gebe nur weibliche Namen aus, die mit „An“ oder mit „Be“ beginnen. 
select name from baby_names where name like "An%" or name like "Be%";

