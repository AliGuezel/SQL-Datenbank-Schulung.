-- create view total_amount_view as 
select (select name from artist a where a.id = r.artist_id) as '*Artist', 
title as 'Release' from 'release' r order by Artist;

create view artist_release_type as 
select (select name from artist a where a.id = r.artist_id) as 'Artist',
r.title as 'Release', r2.type as 'Typ'
from 'release' r
join releasetyp r2|
ON r.releasetyp_id = r2.id
order by Artist;

select (select name from artist a where a.id = r.artist_id) as 'Artist',
r.title as 'Release',
r2.Typ as 'Typ'
from 'release' r
left join releasetyp r2
on r.releasetyp_id = r2.id
order by Artist;


update `release` r set releasetyp_id = NULL where artist_id MOD 4 = 0;
update `release` r set releasetyp_id = 1 where artist_id MOD 4 = 1;
update `release` r set releasetyp_id = 2 where artist_id MOD 4 = 2;
update `release` r set releasetyp_id = 3 where artist_id MOD 4 = 3;