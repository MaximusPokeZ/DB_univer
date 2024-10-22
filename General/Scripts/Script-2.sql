-- 3
select * from inventory i order by production_date;    -- desc в обратном 


-- 4
select * from orders o 
where order_date between '2024-10-01' and '2024-11-01' and status = 'delivered';

-- 5
select 
	p.purchase_id,
	m.material_name,
	s.supplier_name,
	s.country,
	p.quantity_ordered,
	p.price_per_unit,
	(p.quantity_ordered * p.price_per_unit) as total_cost
from purchases p 
	join suppliers s on p.supplier_id = s.supplier_id 
		join materials m on p.material_id = m.material_id
			where (p.quantity_ordered * p.price_per_unit) between 10 and 24000;
			
		
-- 6
update orders o
set total_price = (
	select sum(total_price)
	from order_items oi
	where oi.order_id = o.order_id
);


-- 7
alter table "tables" add column total_quantity int; -- также для остальных таблиц

update "tables" t
set total_quantity = (
select 
	sum(i.quantity)
	from inventory i where i.product_id = t.table_id and i.product_type_id = t.product_type_id  
);

select 
t.product_name,
t.total_quantity
from "tables" t;





-- 8
select 
o.order_id,
o.client_id,
o.status,
o.order_date,
sum(oi.quantity) as total_quantity
from order_items oi 
	join orders o on oi.order_id = o.order_id 
			group by o.order_id, o.client_id, o.order_date, o.status
		having sum(oi.quantity) > 5 order by sum(oi.quantity) desc ; -- фильтрует после группировки
		
		
		
-- 9
update materials 
set price_per_unit = 10
where material_id = 2 and supplier_id = 2;
		

-- 10
delete from order_items 
where order_id in (
    select order_id 
    from orders 
    where status = 'delivered' 
    and order_date < now() - interval '1 year'
);

delete from orders 
where status = 'delivered' and order_date < now() - interval '1 year'; 





-- 11
select 
p.purchase_id,
p.supplier_id,
s.supplier_name,
p.material_id,
m.material_name,
p.order_date
from purchases p 
	join suppliers s on p.supplier_id = s.supplier_id 
		join materials m on m.material_id  = p.material_id 
			where p.supplier_id in (1, 2);
		
		
		
-- 12
select * from orders o order by o.order_date offset 3 limit 5;


-- 13

select * from order_materials om;

select 
order_id,
avg(total_cost) as average_material_cost
from 
    order_materials
group by 
    order_id;


-- 14

select * from orders o order by o.order_delivered;



-- 15

select * from purchases p ;

select  
s.supplier_id,
s.supplier_name,
s.country,
count(p.supplier_id) as count_of_purchases
from suppliers s 
	join purchases p on s.supplier_id = p.supplier_id 
		group by s.supplier_id 
			order by count(p.supplier_id) desc;
		


