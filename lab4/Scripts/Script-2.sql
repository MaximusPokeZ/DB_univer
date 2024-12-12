create or replace view admin_view as
select 

    c.client_id,
    c.name as client_name,
    c.email,
    s.service_id,
    s.name as service_name,
    sc.service_time,
    sc.service_time + s.duration as service_end_time
    
from clients c
	join schedule sc on c.client_id = sc.client_id
		join services s on sc.service_id = s.service_id;
    	

create or replace view client_view as
select
    c.client_id,
    sc.service_time,
    (sc.service_time + s.duration) as end_time,  
    (s.duration) as service_duration  
from clients c
	join schedule sc on sc.client_id = c.client_id 
		join services s on s.service_id = sc.service_id;



create or replace view rating as
select 
    c.client_id,
    c.name as client_name,
    count(s.shedule_id) as "Total number of services"
from clients c 
    join schedule s on c.client_id = s.client_id 
group by c.client_id 
order by count(s.shedule_id) desc;


	
	