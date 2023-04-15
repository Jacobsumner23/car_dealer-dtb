CREATE TABLE Car (
  car_id SERIAL PRIMARY KEY,
  VIN VARCHAR(17),
  make VARCHAR(25),
  model VARCHAR(100),
  Color VARCHAR(50),
  car_year VARCHAR(4)
);

CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  billing_info VARCHAR(20),
  address VARCHAR(150)
);

CREATE TABLE sales_person(
  sales_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);

CREATE TABLE Invoice (
  invoice_id SERIAL PRIMARY KEY,
  date_ DATE default CURRENT_DATE,
  sales_id INTEGER not null,
  customer_id INTEGER not null,
  car_id INTEGER not null,
  foreign key(sales_id) references sales_person(sales_id),
  foreign key(customer_id) references Customer(customer_id),
  foreign key(car_id) references Car(car_id)
);

CREATE TABLE Mechanic (
  mechanic_id SERIAL PRIMARY KEY ,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);

CREATE TABLE Parts (
  part_id SERIAL PRIMARY KEY,
  part_number VARCHAR(100),
  cost NUMERIC(8,2)
);

CREATE TABLE service_ticket (
  service_ticket_id SERIAL PRIMARY KEY,
  service_date DATE,
  labor_hours NUMERIC(8,2),
  cost NUMERIC(8,2),
  mechanic_id INTEGER not null,
  customer_id INTEGER not null,
  car_id INTEGER not null,
  part_id INTEGER,
  foreign key(mechanic_id) references Mechanic(mechanic_id),
  foreign key(customer_id) references Customer(customer_id),
  foreign key(car_id) references Car(car_id),
  foreign key(part_id) references Parts(part_id)
);

CREATE TABLE service_history (
  service_record_id SERIAL PRIMARY KEY,
  service_dates DATE,
  foreign key(service_ticket_id) references service_ticket(service_ticket_id)
);
--no service history created i keep getting errors for the reference key not being valid i tried using the car_id or service ticket_id and neither would work 

select * from car 
select * from Customer
select * from sales_person
select * from Invoice
select * from Mechanic
select * from Parts 
select * from service_ticket
--Car inserts
insert into car(car_id, VIN, make, model, color, car_year
) values (1,'TR54V71269PN14001','Honda','NSX','Red','2004');

insert into car(car_id, VIN, make, model, color, car_year
) values (2,'GV523H1709PK19144','Ford','Mustang','Dark-Grey','1998');

insert into car(car_id, VIN, make, model, color, car_year
) values (3,'FG4782R23599LM002','Chevy','Silverado','White','2022');

insert into car(car_id, VIN, make, model, color, car_year
) values (4,'S8900031DFV12442X','Jeep','Wrangler','Tan','2009');

insert into car(car_id, VIN, make, model, color, car_year
) values (5,'BN500Z2166P709011','Toyota','Land_Cruiser','Forest-Green','1999');
--customer inserts
insert into Customer(customer_id, first_name, last_name, billing_info, address
) values (1,'Jim','Belushi','1800-3400-4446-1111' ,'99 Belushi Farms blvd, ID, 70021');

insert into Customer(customer_id, first_name, last_name, billing_info, address
) values (2,'Tom','Cruise','5500-0000-9900-1900' ,'MI3 dr Clear Water, FL, 18022');

insert into Customer(customer_id, first_name, last_name, billing_info, address
) values (3,'Jenn','Anniston','3400-0222-1126-0000' ,'13495 PCH, Malibu ,CA ,90343');
--sales person info
insert into sales_person(sales_id, first_name, last_name)
values (1,'Steve','Sharripa');

insert into sales_person(sales_id, first_name, last_name)
values (2,'Joe','Bananas');
--invoice inserts
insert into invoice(invoice_id, date_, sales_id, customer_id, car_id) 
values(1,'02/19/22',2,2,1);

insert into invoice(invoice_id, date_, sales_id, customer_id, car_id) 
values(2,'11/01/21',1,2,5);

insert into invoice(invoice_id, date_, sales_id, customer_id, car_id) 
values(3,'03/09/23',2,1,4);

insert into invoice(invoice_id, date_, sales_id, customer_id, car_id) 
values(4,'08/12/20',1,3,2);

insert into invoice(invoice_id, date_, sales_id, customer_id, car_id) 
values(5,'05/05/22',2,1,3);
--mechanic inserts
insert into mechanic(mechanic_id, first_name, last_name)
values(1,'Greesy','Steve');

insert into mechanic(mechanic_id, first_name, last_name)
values(2,'Burnt','Chrysler');

insert into mechanic(mechanic_id, first_name, last_name)
values(3,'Ben','Afleck');

--part inserts
insert into parts(part_id, part_number, cost)
values(1,'#FG3099',11.95);

insert into parts(part_id, part_number, cost)
values(2,'#W181905',55.99);

insert into parts(part_id, part_number, cost)
values(3,'#FF14599',109.90);

insert into parts(part_id, part_number, cost)
values(4,'#Z4050',335.70);
--service tickets
insert into service_ticket(service_ticket_id, service_date, labor_hours, cost, mechanic_id, customer_id, car_id, part_id) 
values(	1, '04/05/22', 2.0, 65.00, 1, 3, 2, 2);

insert into service_ticket(service_ticket_id, service_date, labor_hours, cost, mechanic_id, customer_id, car_id, part_id) 
values(	2, '04/05/22', 0.5, 20.00, 2, 3, 2, 1);

insert into service_ticket(service_ticket_id, service_date, labor_hours, cost, mechanic_id, customer_id, car_id, part_id) 
values(	3, '04/01/23', 6.5, 250.00, 3, 1, 3, 4);

insert into service_ticket(service_ticket_id, service_date, labor_hours, cost, mechanic_id, customer_id, car_id, part_id) 
values(	4, '12/20/21', 3.0, 90.00, 1, 2, 1, 3);

--no insert for service history yet
