create table galleries(
	gallery_id bigint generated always as identity primary key,
	name varchar(100) not null,
	location text
);

create table artists(
	artist_id bigint generated always as identity primary key,
	name varchar(200) not null,
	birth_date date,
	country varchar(100)
);


create table art_objects(
	art_object_id bigint generated always as identity primary key,
	title varchar(100) not null,
	artist_id bigint,
	gallery_id bigint,
	date_of_creation date,
	foreign key (artist_id) references artists(artist_id),
	foreign key (gallery_id) references galleries(gallery_id)
);


create table visitors(
	visitor_id bigint generated always as identity primary key,
	name varchar(100),
	gender varchar(10),
	birth_date DATE
);

create table visits (
    visit_id bigint generated always as identity primary key,
    visitor_id bigint,
    gallery_id bigint,
    visit_date timestamp,
    foreign key (visitor_id) references visitors(visitor_id),
    foreign key (gallery_id) references galleries(gallery_id)
);

create table excursions(
	excursion_id bigint generated always as identity primary key,
	gallery_id bigint,
	date_of_excursion date,
	duration interval,
	max_visitors int,
	foreign key (gallery_id) references galleries(gallery_id)
);












