---------------------Client

create table clients(
	client_id bigint generated always as identity primary key,
	client_name varchar(100) not null,
	email varchar(100) not null unique,
	phone_number varchar(20),
	country varchar(50),
	address varchar(200),
	registration_date date not null default current_date
);




 -- alter table client rename column adress to address 

 -- select * from product_types

------------------------------------ Type of products

create table product_types(
	product_type_id int generated always as identity primary key,
	type_name varchar(100) not null
);

-- drop table product_types CASCADE

create table tables(
	table_id bigint generated always as identity primary key,
	product_type_id int not null,
	product_name varchar(100) not NULL,
	material varchar(30),
	weight decimal(7, 3),
	dimensions varchar(100),
	is_indoor boolean,
	price decimal(10, 3),
	foreign key (product_type_id) references product_types(product_type_id)
);


create table blades(
	blade_id bigint generated always as identity primary key,
	product_type_id int not null,
	product_name varchar(100) not NULL,
	color varchar(20),
	weight decimal(5, 3),
	material varchar(30),
	thickness decimal (4, 2),
	price decimal(10, 3),
	foreign key (product_type_id) references product_types(product_type_id)
);


create table rubbers(
	rubber_id bigint generated always as identity primary key,
	product_type_id int not null,
	product_name varchar(100) not NULL,
	color varchar(20),
	rubber_type varchar(50), -- "smooth", "anti-spin", "pimples", "tacky"
	pimples_type varchar(50), -- "short", "long"
	material varchar(30),
	hardness decimal (3, 1),
	price decimal(10, 3),
	foreign key (product_type_id) references product_types(product_type_id)
);


create table balls (
    ball_id bigint generated always as identity primary key,
    product_type_id bigint not NULL,
    product_name varchar(100) not NULL,
    color varchar(20),
    diameter decimal(4, 2),    
    weight decimal(5, 2),      
    material varchar(100),   
    price decimal(10, 3),
    foreign key (product_type_id) references product_types(product_type_id)
);


create table nets(
	net_id bigint generated always as identity primary key,
	product_type_id int not null,
	product_name varchar(100) not NULL,
	material varchar(30),
	dimensions varchar(100),
	length decimal(5, 2),
	height decimal(4, 2),
	is_indoor boolean,
	price decimal(10, 3),
	foreign key (product_type_id) references product_types(product_type_id)
);


create table cleaning_agents (
	cleaning_agent_id bigint generated always as identity primary key,
	product_type_id int not null,
	product_name varchar(100) not NULL,
    type varchar(100),        
    volume decimal(5, 2),
    ingredients TEXT,   
    price decimal(10, 3),
    foreign key (product_type_id) references product_types(product_type_id)
);


create table glues (
    glue_id bigint generated always as identity primary key,
    product_type_id int not NULL,
    product_name varchar(100) not NULL,
    type varchar(100),        
    volume decimal(5, 2),      
    drying_time decimal(4, 2),
    price decimal(10, 3),
    foreign key (product_type_id) references product_types(product_type_id)
);


 

-- alter table blades add column product_name varchar(100) not NULL;


-- alter table blades alter column price type decimal(10, 3);


------------------------------ Warehouse

create table warehouses(
	warehouse_id bigint generated always as identity primary key,
	warehouse_name varchar(100),
	address text not null,
	manger_name varchar(200),
	phone_number varchar(50),
	capacity bigint
);


create table inventory (
    inventory_id bigint generated always as identity primary key,
    warehouse_id bigint not NULL,
    product_type_id int not NULL,
    product_id bigint not NULL,
    quantity int not NULL,
    production_date timestamp not NULL default current_timestamp,
    foreign key (warehouse_id) references warehouses (warehouse_id),
    foreign key (product_type_id) references product_types(product_type_id)
);


------------------------------ Orders

create table orders (
    order_id bigint generated always as identity primary key,
    client_id bigint not null,
    warehouse_id bigint not null,
    order_date date not null default current_date,
    order_delivered date,
    status varchar(50) not null, -- "pending", "shipped", "delivered", "cancelled"
    total_price decimal(15, 3),
    foreign key (client_id) references clients(client_id),
    foreign key (warehouse_id) references warehouses(warehouse_id)
);

create table order_items (
    order_item_id bigint generated always as identity primary key,
    order_id bigint not null,
    product_type_id int not null,
    product_id bigint not null,
    quantity int not null,
    price_per_unit decimal(10, 3) not null, 
    total_price decimal(15, 3) not null, -- (quantity * price_per_unit) use trigger
    foreign key (order_id) references orders(order_id),
    foreign key (product_type_id) references product_types(product_type_id)
);

-- add trigger to calculate total_price

create or replace function calculate_total_price()
returns trigger as $$
begin 
	new.total_price := new.quantity * new.price_per_unit;
	return new;
end;
$$ language plpgsql;


create trigger calculate_total_price_trigger
before insert or update on order_items
for each row
execute function calculate_total_price();



------------ suppliers and materials

create table suppliers (
    supplier_id bigint generated always as identity primary key,
    supplier_name varchar(100) not NULL,
    contact_person varchar(100),
    phone_number varchar(20),
    email varchar(100),
    country varchar(100),
    address varchar(200),
    registration_date date not NULL default current_date
);

create table materials (
    material_id bigint generated always as identity primary key,
    material_name varchar(100) not NULL,
    supplier_id bigint not NULL,
    quantity_in_stock int not NULL,
    price_per_unit decimal(10, 3) NOT NULL,
    foreign key (supplier_id) references suppliers(supplier_id)
);

create table purchases (
    purchase_id bigint generated always as identity primary key,
    supplier_id bigint not NULL,
    material_id bigint not NULL,
    quantity_ordered int not NULL,
    price_per_unit decimal(10, 3) NOT NULL,
    order_date date not NULL default current_date,
    foreign key (supplier_id) references suppliers(supplier_id),
    foreign key (material_id) references materials(material_id)
);



-- crutch


create table order_materials (
    order_material_id bigint generated always as identity primary key,
    order_id bigint not null,
    material_id bigint not null,
    quantity_used int not null,
    cost_per_unit decimal(10, 3) not null, -- цена за единицу материала на момент использования
    total_cost decimal(15, 3) not null, -- quantity_used * cost_per_unit, можно использовать триггер
    foreign key (order_id) references orders(order_id),
    foreign key (material_id) references materials(material_id)
);


create or replace function calculate_total_material_cost()
returns trigger as 
$$
begin
	new.total_cost = new.quantity_used * new.cost_per_unit;
	return new;

end;
$$ language plpgsql;

create trigger calculate_total_material_cost_trigger
before insert or update on order_materials
for each row 
execute function calculate_total_material_cost();
