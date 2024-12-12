create table logs (
	log_id bigint generated always as identity primary key,
	operation varchar(100) not null,
	details text,
	table_name varchar(100),
	log_time timestamp default current_timestamp
);




create table clients (
	client_id bigint generated always as identity primary key,
	name varchar (100),
	email varchar (30) not null
);

create table services (
    service_id bigint generated always as identity primary key,
    name varchar (100) not null,
    description text,
    cost decimal (10, 2) not null,
    duration interval not null
);


create table parts (
    part_id bigint generated always as identity primary key,
    name varchar(100) not null,
    price decimal(10, 2) not null,
    quantity int not NULL,
    total_price decimal(15,2)
);


create table schedule (
	shedule_id bigint generated always as identity primary key,
	client_id bigint references clients(client_id),
	service_id bigint references services(service_id),
	service_time timestamp not null unique
);






