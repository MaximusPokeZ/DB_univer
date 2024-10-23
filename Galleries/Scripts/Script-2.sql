-- 1

-- join


select
g.name as gallery_name,
count(v.visitor_id) as total_number_of_visitors,
date_trunc('hour', v.visit_date) as visit_hour
from galleries g
	join visits v on g.gallery_id = v.gallery_id 
		group by g.gallery_id, date_trunc('hour', v.visit_date) -- обезает до часа --> 15:45 ==> 15:00
			order by total_number_of_visitors desc ;
		
		
-- subquery
		
select
gallery_name, 
total_number_of_visitors,
visit_hour 
from (
	select 
	g.name as gallery_name,
	count(v.visitor_id) as total_number_of_visitors,
	date_trunc('hour', v.visit_date) as visit_hour
	from galleries g, visits v
	where g.gallery_id = v.gallery_id
	group by g.gallery_id, date_trunc('hour', v.visit_date)
	order by total_number_of_visitors desc 
) ;


-- 2

-- join

select 
g."name" as gallery_name,
a."name" as artist_name,
count(ao.art_object_id) as paints_count
from galleries g 
	join art_objects ao on g.gallery_id = ao.gallery_id 
		join artists a on a.artist_id = ao.artist_id
			group by a.artist_id, g.gallery_id 
				order by paints_count desc;

		
-- subquery
			
select
gallery_name,
artist_name,
paints_count
from (
	select
	g."name" as gallery_name,
	a."name" as artist_name,
	count(ao.art_object_id) as paints_count
	from galleries g, artists a, art_objects ao
		where g.gallery_id = ao.gallery_id and a.artist_id = ao.artist_id
			group by a.artist_id, g.gallery_id 
				order by paints_count desc
);


-- 3

-- join

select 
g."name" as gallery_name,
date_trunc('month', v.visit_date) as visit_month,
avg(extract (year from age(v.visit_date, v2.birth_date))) as average_age
from galleries g 
	join visits v on g.gallery_id = v.gallery_id
		join visitors v2 on v.visitor_id = v2.visitor_id
			where date_part('year', v.visit_date) = 2024
				group by g.gallery_id, date_trunc('month', v.visit_date)
					order by visit_month;
			
				
-- subquery
				
select 
gallery_name,
visit_month,
average_age
from (
	select
	g."name" as gallery_name,
	date_trunc('month', v.visit_date) as visit_month,
	avg(extract (year from age(v.visit_date, v2.birth_date))) as average_age
	from galleries g, visits v, visitors v2
		where g.gallery_id = v.gallery_id and v.visitor_id = v2.visitor_id and date_part('year', v.visit_date) = 2024
				group by g.gallery_id, date_trunc('month', v.visit_date)
					order by visit_month

);



-- 4


-- join

select 
g."name" as gallery_name,
count(distinct v.visitor_id) as unique_visitors
from galleries g 
	join visits v on v.gallery_id = g.gallery_id 
		where v.visit_date >= now() - interval '6 month'
			group by g.gallery_id 
				order by unique_visitors desc;

-- subquery

select 
gallery_name,
unique_visitors
from (
	select
	g."name" as gallery_name,
	count(distinct v.visitor_id) as unique_visitors
	from galleries g, visits v 
		where v.gallery_id = g.gallery_id and v.visit_date >= now() - interval '6 month'
			group by g.gallery_id 
				order by unique_visitors desc

);


		

			