select * from art_objects ao;

select 
a.artist_id,
a.name as artist_name,
(select count(*) from art_objects ao where ao.artist_id = a.artist_id) as number_of_art_obj
from artists a 
order by number_of_art_obj desc;

   
create temporary table artist_artworks as
select 
distinct a.artist_id,
a.name as artist_name,
count(ao.artist_id) over (partition by a.artist_id) as number_of_art_obj
from 
    artists a
join 
    art_objects ao
on 
    a.artist_id = ao.artist_id
order by 
    number_of_art_obj desc;
   
select 
artist_id,
artist_name,
number_of_art_obj,
dense_rank() over (order by number_of_art_obj desc) as artist_rank
from 
    artist_artworks
order by 
    artist_rank;
   
----------------------
	
select 
g.gallery_id,
g.name,
(select count(*) from art_objects ao where ao.gallery_id = g.gallery_id) as number_of_art_ob
from galleries g 
order by number_of_art_ob desc;


create temporary table gallery_artworks as
select 
    distinct g.gallery_id,
    g.name,
    count(ao.gallery_id) over (partition by g.gallery_id) as number_of_art_ob
from 
    galleries g
join 
    art_objects ao
on 
    g.gallery_id = ao.gallery_id
order by 
    number_of_art_ob desc;
   
select 
gallery_id,
name,
number_of_art_ob,
dense_rank() over (order by number_of_art_ob desc) as gallery_rank
from 
    gallery_artworks
order by 
    gallery_rank;

-----------------------------

select 
g.gallery_id,
g."name",
(select count(*) from visits v where v.gallery_id = g.gallery_id) as number_of_visitors
from galleries g
order by number_of_visitors desc;


create temporary table gallery_visitors as
select 
distinct g.gallery_id,
g."name",
count(v.gallery_id) over (partition by g.gallery_id) as number_of_visitors
from 
    galleries g
join 
    visits v
on 
    g.gallery_id = v.gallery_id
order by 
    number_of_visitors desc;
   
   
   
select 
gallery_id,
"name",
number_of_visitors,
dense_rank() over (order by number_of_visitors desc) as gallery_rank
from 
    gallery_visitors
order by 
    gallery_rank;

