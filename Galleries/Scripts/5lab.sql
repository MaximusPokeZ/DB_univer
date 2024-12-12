select * from art_objects ao 

select 
a.artist_id,
a.name as artist_name,
(select count(*) from art_objects ao where ao.artist_id = artists.artist_id) as number_of_art_obj
from artists a 
order by number_of_art_obj desc;

	
select 
g.gallery_id,
g.name,
(select count(*) from art_objects ao where ao.gallery_id = g.gallery_id) as number_of_art_ob
from galleries g 
order by number_of_art_ob desc;

select 
g.gallery_id,
g."name",
(select count(*) from visits v where v.gallery_id = g.gallery_id) as number_of_visitors
from galleries g
order by number_of_visitors desc;
