

--------Add

insert into product_types (type_name) values ('Table');
insert into product_types (type_name) values ('Blade');
insert into product_types (type_name) values ('Rubber');
insert into product_types (type_name) values ('Ball');
insert into product_types (type_name) values ('Net');
insert into product_types (type_name) values ('Cleaning agent');
insert into product_types (type_name) values ('Glue');

---------------------------------------------- Add clients

insert into clients (client_name, email, phone_number, country, address)
values 
    ('Alice Johnson', 'alice.johnson@example.com', '+1234567890', 'USA', '123 Main St, Springfield, IL'),
    ('Bob Smith', 'bob.smith@example.com', '+0987654321', 'Canada', '456 Elm St, Toronto, ON'),
    ('Charlie Brown', 'charlie.brown@example.com', '+1122334455', 'UK', '789 Pine St, London'),
    ('Diana Prince', 'diana.prince@example.com', '+2233445566', 'Australia', '101 Maple St, Sydney'),
    ('Ethan Hunt', 'ethan.hunt@example.com', '+3344556677', 'New Zealand', '202 Oak St, Wellington'),
    ('John Doe', 'john.doe@example.com', '+1234567890', 'USA', '123 Main St, Springfield'),
    ('Jane Smith', 'jane.smith@example.com', '+1987654321', 'France', '456 Oak St, Shelbyville'),
    ('Alex Johnson', 'alex.johnson@example.com', '+1122334455', 'Germany', '789 Pine St, Capital City'),
    ('Emma Brown', 'emma.brown@example.com', '+1222333444', 'Germany', '101 Maple St, Springfield'),
    ('Michael Davis', 'michael.davis@example.com', '+1333444555', 'Norway', '202 Birch St, Shelbyville');


insert into clients (client_name, email, phone_number, country, address, registration_date)
values 
    ('Liam Williams', 'liam.williams@example.com', '+1445566778', 'USA', '789 Cedar St, Denver, CO', '2024-03-01'),
    ('Olivia Martinez', 'olivia.martinez@example.com', '+1556677889', 'Spain', '456 Willow St, Madrid', '2023-08-15'),
    ('Noah Brown', 'noah.brown@example.com', '+1667788990', 'Italy', '123 Oak St, Rome', '2022-11-20'),
    ('Sophia Wilson', 'sophia.wilson@example.com', '+1778899001', 'Canada', '101 Maple St, Vancouver', '2021-02-12'),
    ('James Johnson', 'james.johnson@example.com', '+1889900112', 'Australia', '202 Birch St, Sydney', '2020-07-30'),
    ('Ava Garcia', 'ava.garcia@example.com', '+1991001223', 'France', '303 Pine St, Paris', '2019-10-05'),
    ('Mason Miller', 'mason.miller@example.com', '+2002112334', 'Germany', '404 Elm St, Berlin', '2018-09-17'),
    ('Isabella Davis', 'isabella.davis@example.com', '+2113223445', 'UK', '505 Cherry St, London', '2017-05-22'),
    ('Lucas Rodriguez', 'lucas.rodriguez@example.com', '+2224334556', 'Mexico', '606 Palm St, Mexico City', '2016-01-10'),
    ('Mia Martinez', 'mia.martinez@example.com', '+2335445667', 'Japan', '707 Bamboo St, Tokyo', '2015-12-18');

   
-- select * from clients
   
------------ Add to products tables


------------------------------------------------ Add to tables

insert into tables (product_type_id, product_name, material, weight, dimensions, is_indoor, price)
values 
	(1, 'TTPokeZ ProTable Elite', 'High-Density Fiberboard', 150, '1500 x 1620 x 760', true, 250000.00),
	(1, 'TTPokeZ Outdoor Table Xtreme', 'Weather-Resistant Composite', 180, '1500 x 1620 x 760', false, 300000.00),
	(1, 'TTPokeZ Compact Table S1', 'Lightweight Aluminum', 75, '1200 x 600 x 750', true, 120000.00),
	(1, 'TTPokeZ Tournament Table V2', 'Bamboo', 160, '1500 x 1620 x 760', true, 280000.00),
	(1, 'TTPokeZ Family Table Fun', 'Plastic', 90, '1200 x 600 x 750', false, 95000.00);


------------------------------------------------ Add to blades

insert into blades (product_type_id, product_name, color, weight, material, thickness, price) 
values
	(2, 'TTPokeZ PowerBlade X1', 'Red', 0.080, 'Carbon Fiber', 6.5, 15000.00),
	(2, 'TTPokeZ SpeedBlade Z3', 'Black', 0.090, 'Wood + Carbon', 5.0, 12000.00),
	(2, 'TTPokeZ ControlBlade C5', 'Blue', 0.085, 'Acrylic', 5.2, 9000.00),
	(2, 'TTPokeZ PrecisionBlade P2', 'Green', 0.078, 'Bamboo', 6.0, 8000.00),
	(2, 'TTPokeZ AllRoundBlade A4', 'Yellow', 0.084, 'Composite', 5.5, 11000.00);


--truncate table blades;


------------------------------------------- Add to rubbers

insert into rubbers (product_type_id, product_name, color, rubber_type, pimples_type, material, hardness, price) 
values
    (3, 'TTPokeZ SpeedRubber Max', 'Red', 'smooth', 'short', 'Natural Rubber', 42.0, 8500.00),
    (3, 'TTPokeZ SpinControl 3000', 'Black', 'smooth', 'long', 'Synthetic Rubber', 45.0, 9000.00),
    (3, 'TTPokeZ Anti-Spin Pro', 'Blue', 'anti-spin', NULL, 'Special Composite', 30.0, 9500.00),
    (3, 'TTPokeZ Pimple Power', 'Green', 'pimples', 'short', 'Rubber Blend', 35.0, 7000.00),
    (3, 'TTPokeZ TackyGrip V1', 'Yellow', 'tacky', NULL, 'High-Performance Rubber', 40.0, 8000.00);



------------------------------------------- Add to balls

insert into balls (product_type_id, product_name, color, diameter, weight, material, price) 
values
	(4, 'TTPokeZ ProBall Elite', 'Red', 40.00, 0.050, 'Synthetic Rubber', 1200.00),
	(4, 'TTPokeZ SpinBall X', 'Blue', 40.00, 0.048, 'Plastic', 1150.00),
	(4, 'TTPokeZ PowerBall', 'Yellow', 40.00, 0.052, 'High-Durability Rubber', 1250.00),
	(4, 'TTPokeZ ControlBall', 'Green', 40.00, 0.049, 'Natural Rubber', 1100.00),
	(4, 'TTPokeZ SpeedBall', 'Black', 40.00, 0.051, 'Composite Material', 1300.00);


------------------------------------------- Add to nets

insert into nets (product_type_id, product_name, material, dimensions, length, height, is_indoor, price) 
values
	(5, 'TTPokeZ Net Pro', 'Nylon', '3.00 x 0.75 meters', 3.00, 0.75, true, 4500.00),
	(5, 'TTPokeZ Outdoor Net', 'Polyester', '3.00 x 1.00 meters', 3.00, 1.00, false, 3800.00),
	(5, 'TTPokeZ Tournament Net', 'Nylon', '3.00 x 0.80 meters', 3.00, 0.80, true, 5000.00),
	(5, 'TTPokeZ Recreational Net', 'Polyethylene', '3.00 x 0.60 meters', 3.00, 0.60, false, 3200.00),
	(5, 'TTPokeZ Multi-Sport Net', 'Nylon', '3.00 x 0.70 meters', 3.00, 0.70, true, 4700.00);


------------------------------------------- Add to cleaning_agents


insert into cleaning_agents (product_type_id, product_name, "type", volume, ingredients, price) 
values
	(6, 'TTPokeZ Table Cleaner', 'Spray', 500.00, 'Water, Ethanol, Surfactants', 1500.00),
	(6, 'TTPokeZ Rubber Cleaner', 'Liquid', 250.00, 'Water, Sodium Carbonate, Surfactants', 800.00),
	(6, 'TTPokeZ Blade Cleaner', 'Foam', 300.00, 'Isopropanol, Surfactants, Fragrance', 1200.00),
	(6, 'TTPokeZ All-Purpose Cleaner', 'Liquid', 750.00, 'Water, Acetic Acid, Surfactants', 2000.00),
	(6, 'TTPokeZ Stain Remover', 'Gel', 200.00, 'Water, Sodium Hydroxide, Surfactants', 900.00);


------------------------------------------- Add to glues

insert into glues (product_type_id, product_name, "type", volume, drying_time, price) values
	(7, 'TTPokeZ Fast Bond Glue', 'Liquid', 50.00, 2.50, 500.00),
	(7, 'TTPokeZ Strong Hold Adhesive', 'Gel', 100.00, 3.00, 800.00),
	(7, 'TTPokeZ Quick Dry Cement', 'Paste', 75.00, 1.50, 600.00),
	(7, 'TTPokeZ Wood & Rubber Adhesive', 'Liquid', 200.00, 5.00, 700.00),
	(7, 'TTPokeZ Universal Glue', 'Aerosol', 300.00, 4.00, 950.00);










------------------------------------------- Add warehouses

insert into warehouses (warehouse_name, address, manger_name, phone_number, capacity) 
values
	('Warehouse A', '1234 Elm St, Springfield, IL', 'John Doe', '+1234567890', 1000),
	('Warehouse B', '5678 Oak St, Springfield, IL', 'Jane Smith', '+0987654321', 2000),
	('Warehouse C', '9101 Maple St, Springfield, IL', 'Alice Johnson', '+1122334455', 1500);


insert into inventory (warehouse_id, product_type_id, product_id, quantity) 
values 
    (1, 1, 1, 100),  -- 100 штук TTPokeZ ProTable Elite
    (1, 1, 2, 50),   -- 50 штук TTPokeZ Outdoor Table Xtreme
    (1, 1, 3, 75),   -- 75 штук TTPokeZ Compact Table S1
    (1, 1, 4, 40),   -- 40 штук TTPokeZ Tournament Table V2
    (1, 1, 5, 30),   -- 30 штук TTPokeZ Family Table Fun
    (1, 2, 1, 200),  -- 200 штук TTPokeZ PowerBlade X1
    (1, 2, 2, 150),  -- 150 штук TTPokeZ SpeedBlade Z3
    (1, 2, 3, 300),  -- 300 штук TTPokeZ ControlBlade C5
    (1, 3, 1, 100),  -- 100 штук TTPokeZ SpeedRubber Max
    (1, 3, 2, 50),   -- 50 штук TTPokeZ SpinControl 3000
    (2, 4, 1, 200),  -- 200 штук TTPokeZ ProBall Elite
    (2, 4, 2, 150),  -- 150 штук TTPokeZ SpinBall X
    (2, 5, 1, 300),  -- 300 штук TTPokeZ Net Pro
    (2, 6, 1, 100),  -- 100 штук TTPokeZ Table Cleaner
    (2, 7, 1, 50),   -- 50 штук TTPokeZ Fast Bond Glue
    (3, 1, 1, 80),   -- 80 штук TTPokeZ ProTable Elite
    (3, 2, 1, 70);   -- 70 штук TTPokeZ PowerBlade X1
    

    
    
insert into inventory (warehouse_id, product_type_id, product_id, quantity, production_date) 
values 
    (2, 3, 1, 200, '2024-10-03 09:15:00'),  
    (2, 4, 1, 150, '2024-10-04 14:45:00'),  
    (3, 5, 1, 300, '2024-10-05 08:30:00'),  
    (1, 1, 2, 75, '2024-10-06 12:00:00'),    
    (1, 2, 2, 60, '2024-10-07 13:30:00'),    
    (2, 3, 2, 150, '2024-10-08 15:00:00'),   
    (2, 4, 2, 90, '2024-10-09 16:20:00'),    
    (3, 5, 2, 200, '2024-10-10 17:10:00');  
   
   
   
-------------------------------------
   
INSERT INTO orders (client_id, warehouse_id, order_date, order_delivered, status)
VALUES 
    (1, 1, '2024-10-01', '2024-10-03', 'delivered'),  
    (2, 2, '2024-10-02', NULL, 'shipped'),            
    (3, 1, '2024-10-05', '2024-10-06', 'delivered'),  
    (4, 3, '2024-10-10', NULL, 'cancelled'),         
    (5, 1, '2024-10-12', NULL, 'pending');  

   
-- Заказ 1 (pending)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (1, 1, 1, 1, 250000.00),  -- 1 стол TTPokeZ ProTable Elite
    (1, 2, 1, 2, 15000.00);    -- 2 лопаты TTPokeZ PowerBlade X1

-- Заказ 2 (shipped)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (2, 1, 2, 1, 300000.00),   -- 1 стол TTPokeZ Outdoor Table Xtreme
    (2, 3, 1, 1, 1200.00);     -- 1 мяч TTPokeZ ProBall Elite

-- Заказ 3 (delivered)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (3, 1, 3, 2, 120000.00),   -- 2 стола TTPokeZ Compact Table S1
    (3, 2, 2, 1, 12000.00);     -- 1 лопата TTPokeZ SpeedBlade Z3

-- Заказ 4 (cancelled)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (4, 3, 1, 3, 8500.00),      -- 3 резинки TTPokeZ SpeedRubber Max
    (4, 4, 1, 1, 1200.00);      -- 1 мяч TTPokeZ ProBall Elite

-- Заказ 5 (pending)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (5, 1, 4, 4, 280000.00),   -- 4 стола TTPokeZ Tournament Table V2
    (5, 2, 1, 1, 9000.00);      -- 1 лопата TTPokeZ ControlBlade C5
    
    
    
-- Добавление новых заказов
INSERT INTO orders (client_id, warehouse_id, order_date, order_delivered, status, total_price)
VALUES 
    (6, 2, '2024-10-03', NULL, 'shipped', 650000.000),
    (7, 3, '2024-10-07', NULL, 'pending', 350000.000),
    (8, 1, '2022-10-08', '2022-10-09', 'delivered', 1100000.000),
    (9, 2, '2023-10-11', '2023-10-12', 'delivered', 275000.000),
    (10, 3, '2024-10-15', NULL, 'pending', 600000.000);

-- Заказ 6 (shipped)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (6, 1, 2, 2, 300000.00),  -- 2 стола TTPokeZ Outdoor Table Xtreme
    (6, 4, 1, 20, 1200.00);   -- 20 мячей TTPokeZ ProBall Elite

-- Заказ 7 (pending)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (7, 1, 3, 1, 120000.00),  -- 1 стол TTPokeZ Compact Table S1
    (7, 2, 2, 5, 12000.00),   -- 5 лопат TTPokeZ SpeedBlade Z3
    (7, 3, 3, 3, 9500.00);    -- 3 накладки TTPokeZ Anti-Spin Pro

-- Заказ 8 (delivered)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (8, 1, 4, 3, 280000.00),  -- 3 стола TTPokeZ Tournament Table V2
    (8, 5, 1, 5, 4500.00),    -- 5 сеток TTPokeZ Net Pro
    (8, 6, 2, 10, 800.00);    -- 10 чистящих средств TTPokeZ Rubber Cleaner

-- Заказ 9 (shipped)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (9, 2, 5, 2, 11000.00),   -- 2 лопаты TTPokeZ AllRoundBlade A4
    (9, 4, 3, 10, 1250.00);   -- 10 мячей TTPokeZ PowerBall

-- Заказ 10 (pending)
insert into order_items (order_id, product_type_id, product_id, quantity, price_per_unit)
values 
    (10, 1, 5, 1, 95000.00),  -- 1 стол TTPokeZ Family Table Fun
    (10, 3, 4, 6, 7000.00),   -- 6 накладок TTPokeZ Pimple Power
    (10, 7, 1, 10, 500.00);   -- 10 клеев TTPokeZ Fast Bond Glue
    
    
    
    
-------------------------------------------------------------------
    
    
   
   
insert into suppliers (supplier_name, contact_person, phone_number, email, country, address, registration_date)
values
    ('Global Fibers Ltd.', 'John Doe', '+1-234-567-8901', 'johndoe@globalfibers.com', 'USA', '123 Main St, New York, NY', '2022-01-15'),
    ('Asia Woodworks Co.', 'Wang Li', '+86-987-654-3210', 'wangli@asiawoodworks.cn', 'China', '456 Beijing Rd, Beijing', '2021-06-20'),
    ('Euro Plastics Inc.', 'Maria Rossi', '+39-345-678-1234', 'm.rossi@europlastics.it', 'Italy', '789 Via Roma, Milan', '2022-11-05'),
    ('Nature Composites', 'Emma Smith', '+44-123-456-7890', 'emma.smith@naturecomposites.uk', 'UK', '101 Oxford St, London', '2020-04-10'),
    ('Pacific Metals', 'Hiroshi Tanaka', '+81-234-567-8910', 'htanaka@pacificmetals.jp', 'Japan', '202 Shibuya St, Tokyo', '2023-03-12'),
    ('Scandinavian Lumber', 'Karin Svensson', '+46-123-456-7891', 'karin@scandinlumber.se', 'Sweden', '300 Stockholm St, Stockholm', '2023-01-22'),
    ('EcoFoam Ltd.', 'Alex Johnson', '+61-234-567-8912', 'alex.j@ecofoam.au', 'Australia', '400 Kangaroo Rd, Sydney', '2021-08-30'),
    ('Advanced Composites', 'Lucas Nguyen', '+84-234-567-8913', 'lucas.nguyen@advcomposites.vn', 'Vietnam', '500 Nguyen Trai St, Hanoi', '2022-09-15');

   
insert into materials (material_name, supplier_id, quantity_in_stock, price_per_unit)
values
    ('High-Density Fiberboard', 1, 5000, 20.000),   
    ('Bamboo Sheets', 2, 3000, 15.000),             
    ('Polypropylene Granules', 3, 10000, 5.000),    
    ('Natural Resin', 4, 2000, 25.000),            
    ('Aluminum Sheets', 5, 4000, 30.000), 
    ('Scandinavian Pine Wood', 6, 2000, 18.500),    
    ('Recycled Foam', 7, 8000, 10.500),             
    ('Carbon Fiber Sheets', 8, 1500, 55.000),       
    ('Reinforced Steel Rods', 5, 3000, 45.000),     
    ('Organic Cotton Fabric', 2, 1000, 12.000),    
    ('Bio-Based Resin', 4, 500, 28.500),           
    ('Copper Sheets', 5, 2500, 40.000);             


   
insert into purchases (supplier_id, material_id, quantity_ordered, price_per_unit, order_date)
values
    (1, 1, 1000, 20.000, '2024-10-05'), 
    (2, 2, 1500, 15.000, '2024-10-08'),  
    (3, 3, 5000, 5.000, '2024-10-10'),   
    (4, 4, 800, 25.000, '2024-10-12'),   
    (5, 5, 1200, 30.000, '2024-10-15'),
   	(2, 10, 500, 12.000, '2023-10-15');  

   
   
-- for crutch   
   
insert into order_materials (order_id, material_id, quantity_used, cost_per_unit)
values
    (1, 1, 10, 5.00),  
    (1, 2, 5, 8.50),   
    (2, 1, 20, 5.00),  
    (2, 3, 2, 12.00),
    (3, 1, 15, 5.00),   
    (3, 2, 10, 7.00),   
    (4, 1, 25, 5.00),   
    (4, 3, 5, 11.00),   
    (5, 2, 30, 8.00),   
    (5, 4, 8, 15.00);  


 







