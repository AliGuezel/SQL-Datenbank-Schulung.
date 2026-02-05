-- Wie viele Datensätze gibt es insgesamt in der Tabelle baby_names?
select count(*)  from baby_names bn ; -- 220636

-- Wie viele männliche Personen gibt es?
select sum(count) from baby_names bn where gender = "m" ;-- 158554036
select count(*) from baby_names bn where gender = "m" ; -- 94322

-- Wie heißt der Name dessen Datensatz die id 280 hat?
select name from baby_names where id = 280; -- Elijah

-- Welches ist die höchste Jahreszahl bei der Spalte year?
select max(year) from baby_names bn ; -- 2014

-- Welcher Baby-Name wurde in einem bestimmten Jahr exakt 19250-mal vergeben?
select name, year from baby_names bn where count = 19250; -- Sandra, 1964

-- Wie viele Datensätze gibt es, ab einschließlich dem Jahr 2000?
select count(*) from baby_names bn where year >= 2000; -- 51454

-- Wie viele männliche Personen wurden im Jahr 2010 geboren?
select sum(`count`) from baby_names bn  where `year` = 2010 and gender = "m"; -- 1694352

-- Wie viele männliche Personen wurden im Jahr 2010 geboren, die „Alex“ heißen?
select count from baby_names bn where  `year` =2010 and name = "Alex" and gender ="m"; -- 4428

-- Wie viele unterschiedliche Namen gibt es? 
select count(distinct name) from baby_names bn ; -- 6809

-- Gebe alle Datensätze der Tabelle baby_names nach Namen und nach Jahr sortiert aus. 
select * from baby_names bn order by name , year; -- 

-- Gebe nur Datensätze aus, die 3-Stellige Id’s haben und mit 1 beginnen.
select * from baby_names bn where id between 100 and 199;
select * from baby_names bn where id like '1__' ; -- 

-- Gebe nur weibliche Namen aus, die mit „An“ oder mit „Be“ beginnen. 
select name from baby_names where name like "An%" or name like "Be%";
select distinct name from baby_names bn where gender = "f" and (name like "An%" or name like "Be%") order by name;











