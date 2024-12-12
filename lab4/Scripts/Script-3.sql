
insert into clients (name, email) values 
('Иван Иванов', 'ivan@example.com'),
('Петр Петров', 'petr@example.com'),
('Сидор Сидоров', 'sidor@example.com'),
('Алексей Алексеев', 'aleksey@example.com'),
('Мария Мариева', 'maria@example.com');

select * from logs;

insert into services (name, description, cost, duration) values
('Замена масла', 'Полная замена масла в двигателе', 1000.00, interval '1 hour'),
('Ремонт тормозов', 'Замена тормозных колодок и дисков', 2500.00, interval '2 hours'),
('Ремонт трансмиссии', 'Проверка и ремонт трансмиссии', 5000.00, interval '3 hours'),
('Диагностика', 'Компьютерная диагностика автомобиля', 1500.00, interval '1 hour'),
('Замена колес', 'Замена зимних на летние колеса', 800.00, interval '30 minutes');


insert into parts (name, price, quantity) values 
('Масло моторное', 500.00, 10),
('Тормозные колодки', 1200.00, 5),
('Тормозные диски', 1500.00, 3),
('Фильтр масляный', 300.00, 20),
('Шины', 4000.00, 4);

-- select * from parts p ;



-- for test


update clients
set name = 'Максим Владимирович'
where client_id = 1;

select * from clients;

update services 
set cost = cost + 500 
where service_id = 2;

delete from services 
where name = 'Диагностика';

insert into services (name, description, cost, duration) values
('Диагностика', 'Компьютерная диагностика автомобиля', 1500.00, interval '1 hour');

select * from services s 

insert into schedule (client_id, service_id, service_time) values 
(1, 1, '2024-11-07 10:00:00'),  -- Иван Иванов, Замена масла
(2, 2, '2024-11-07 12:00:00'), -- Петр Петров, Ремонт тормозов
(3, 3, '2024-11-07 15:00:00');  -- Сидор Сидоров, Ремонт трансмиссии

-- select * from schedule s ;

-- select * from logs;


insert into schedule (client_id, service_id, service_time) values 
(4, (select service_id from services s where s.name = 'Диагностика'), '2024-11-07 10:30:00'); -- Алексей Алексеев, Диагностика (конфликт с Замена масла)

insert into schedule (client_id, service_id, service_time) values
(5, 5, '2024-11-07 13:00:00'); -- Мария Мариева, Замена колес (конфликт с Ремонт трансмиссии)

insert into schedule (client_id, service_id, service_time)
values (1, 3, '2024-12-07 17:48:00');  

insert into schedule (client_id, service_id, service_time)
values (1, (select service_id from services s where s.name = 'Диагностика'), '2024-12-10 17:08:00');  

select calculate_repair_cost(
    array[1, 2],  
    array[1, 2]   
) as total_cost;


select * from admin_view;
select * from client_view;


select * from rating;