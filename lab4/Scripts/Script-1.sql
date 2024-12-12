create or replace function schedule_service_insert_func() 
returns trigger as 
$$ 
declare
    service_duration interval;
begin 

    select s.duration into service_duration from services s where s.service_id = NEW.service_id;

    if exists (select 1 from schedule s 
               where (s.service_time + (select se.duration from services se where s.service_id = se.service_id)) > NEW.service_time and (NEW.service_time + service_duration) > s.service_time) then
        raise exception 'Time not available';
    else
        return NEW; 
    end if;
end;
$$ language plpgsql;



create trigger schedule_service_insert_trigger
before insert on schedule
for each row 
execute function schedule_service_insert_func();




create or replace function calculate_repair_cost(f_services_ids bigint[], f_part_ids bigint[])
returns decimal as 
$$
declare

	total_cost decimal := 0;

begin
	
	select sum(s.cost) into total_cost
	from services s where s.service_id = any(f_services_ids);

	total_cost := total_cost + (select sum(p.price * p.quantity) from parts p where p.part_id = any(f_part_ids));

	return total_cost;

end;

$$ language plpgsql;





create or replace function calculate_total_price()
returns trigger as 
$$
begin
	NEW.total_price := NEW.quantity * NEW.price;
	return NEW;
end;
$$ language plpgsql;

create trigger trigger_insert_parts
before insert or update on parts
for each row 
execute function calculate_total_price();



-- for logs
create or replace function logs_func()
returns trigger as 
$$
declare
    details_text text;
begin

    if TG_OP = 'INSERT' then
        details_text := row_to_json(NEW)::text;
    elsif TG_OP = 'UPDATE' then
        details_text := 'OLD: ' || row_to_json(OLD)::text || ', NEW: ' || row_to_json(NEW)::text;
    elsif TG_OP = 'DELETE' then
        details_text := row_to_json(OLD)::text;
    end if;

    insert into logs (operation, details, table_name)
    values (TG_OP, details_text, TG_TABLE_NAME);

    return NULL;
end;
$$ language plpgsql;


--clients
create trigger log_insert_clients
after insert on clients
for each row
execute function logs_func();

create trigger log_update_clients
after update on clients
for each row 
execute function logs_func();

create trigger log_delete_clients
after delete on clients
for each row
execute function logs_func();



-- services
create trigger log_insert_services
after insert on services
for each row
execute function logs_func();

create trigger log_update_services
after update on services
for each row
execute function logs_func();

create trigger log_delete_services
after delete on services
for each row
execute function logs_func();


-- parts
create trigger log_insert_parts
after insert on parts
for each row
execute function logs_func();

create trigger log_update_parts
after update on parts
for each row
execute function logs_func();

create trigger log_delete_parts
after delete on parts
for each row
execute function logs_func();


--shedule

create trigger log_insert_schedule
after insert on schedule
for each row
execute function logs_func();

create trigger log_update_schedule
after update on schedule
for each row
execute function logs_func();

create trigger log_delete_schedule
after delete on schedule
for each row
execute function logs_func();








