/*
  Benjamin Kelln 100145180
  Tyler McKay    100150187
  Kyle Sullivan  100141261
*/
DROP DATABASE if exists store;
CREATE DATABASE store;
USE store;

CREATE TABLE customer (
	cust_id int(11) NOT NULL AUTO_INCREMENT,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    dob date,
    email varchar(100) NOT NULL,
    PRIMARY KEY (cust_id)
);
CREATE TABLE phone (
	phone_id int(11) NOT NULL AUTO_INCREMENT,
    phone_number varchar(15) NOT NULL,
    cust_id int(11) NOT NULL,
    PRIMARY KEY (phone_id),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
);

CREATE TABLE cust_address (
	addr_id int(11) NOT NULL AUTO_INCREMENT,
    street_num varchar(20) NOT NULL,
    street_name varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    province varchar(50) NOT NULL,
    postal_code varchar(50) NOT NULL,
    cust_id int(11) NOT NULL,
    PRIMARY KEY (addr_id),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
);

/* 'status' is a keyword, using 'statuses' instead */
CREATE TABLE statuses (
	status_id int(11) NOT NULL AUTO_INCREMENT,
    order_status varchar(25) NOT NULL,
    PRIMARY KEY (status_id)
);

/* 'order' is a keyword, using 'orders' instead */
CREATE TABLE orders (
	order_id int(11) NOT NULL AUTO_INCREMENT,
    status_id int(11) NOT NULL,
    order_date date NOT NULL,
    order_time time NOT NULL,
    shipping_date date,
    online_order bit NOT NULL,
	street_num varchar(20),
    street_name varchar(50),
    city varchar(50),
    province varchar(50),
    postal_code varchar(50),
    cust_id int(11) NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (status_id) REFERENCES statuses(status_id) ON DELETE CASCADE,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE CASCADE
);

CREATE TABLE item (
	item_id int(11) NOT NULL AUTO_INCREMENT,
    item_name varchar(50) NOT NULL,
    stock int NOT NULL,
    category varchar(50) NOT NULL,
    price decimal(19,2) NOT NULL,
    PRIMARY KEY (item_id)
);

CREATE TABLE ordered_item (
	order_id int(11) NOT NULL,
    item_id int(11) NOT NULL,
    quantity int(11) NOT NULL,
    price decimal(19,2) NOT NULL,
	FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES item(item_id) ON DELETE CASCADE
);

/* Create statuses */
INSERT INTO statuses(order_status) VALUES ('in progress');
INSERT INTO statuses(order_status) VALUES ('cancelled');
INSERT INTO statuses(order_status) VALUES ('shipped');
INSERT INTO statuses(order_status) VALUES ('complete');

/* Creating items */
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Collar Small', 10, 'travel', 9.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Collar Medium', 10, 'travel', 10.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Collar Large', 10, 'travel', 12.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Collar Small', 10, 'travel', 9.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Collar Medium', 10, 'travel', 13.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Collar Large', 10, 'travel', 15.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Gerbil', 3, 'small animal', 21.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Rabbit', 4, 'small animal', 32.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Fancy Mouse', 3, 'small animal', 7.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Fancy Rat', 3, 'small animal', 15.50);
INSERT INTO item(item_name, stock, category, price) VALUES ('Guinea Pig', 2, 'small animal', 45.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Short-Haired Hamster', 4, 'small animal', 16.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Pink Tetra', 12, 'fish', 14.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Blue Tetra', 4, 'fish', 14.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Orange Tetra', 7, 'fish', 3.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Green Tetra', 9, 'fish', 14.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Red Tetra', 15, 'fish', 14.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Angelfish', 4, 'fish', 10.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Ghost Shrimp', 21, 'fish', 2.49);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Cat Litter Small', 7, 'food', 4.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Cat Litter Small', 5, 'food', 6.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Cat Litter Small', 10, 'food', 13.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Cat Litter Medium', 13, 'food', 7.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Cat Litter Medium', 9, 'food', 9.49);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Cat Litter Medium', 3, 'food', 19.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Cat Litter Large', 4, 'food', 9.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Cat Litter Large', 2, 'food', 17.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Cat Litter Large', 3, 'food', 42.99);
/* Cat Food */
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Cat Food Small', 13, 'food', 6.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Cat Food Small', 11, 'food', 8.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Cat Food Small', 8, 'food', 11.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Cat Food Medium', 8, 'food', 11.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Cat Food Medium', 7, 'food', 13.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Cat Food Medium', 5, 'food', 17.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Cat Food Large', 7, 'food', 23.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Cat Food Large', 4, 'food', 28.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Cat Food Large', 2, 'food', 34.49);
/* Dog Food */
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Dog Food Small', 13, 'food', 6.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Dog Food Small', 11, 'food', 8.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Dog Food Small', 8, 'food', 11.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Dog Food Medium', 8, 'food', 11.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Dog Food Medium', 7, 'food', 13.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Dog Food Medium', 5, 'food', 17.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Dog Food Large', 7, 'food', 23.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Dog Food Large', 4, 'food', 28.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Dog Food Large', 2, 'food', 34.49);
/* Fish Food */
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Fish Food Small', 13, 'food', 6.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Fish Food Small', 11, 'food', 8.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Fish Food Small', 8, 'food', 11.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Fish Food Medium', 8, 'food', 11.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Fish Food Medium', 7, 'food', 13.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Fish Food Medium', 5, 'food', 17.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Fish Food Large', 7, 'food', 23.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Fish Food Large', 4, 'food', 28.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Fish Food Large', 2, 'food', 34.49);
/* Rodent Food */
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Rodent Food Small', 13, 'food', 6.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Rodent Food Small', 11, 'food', 8.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Rodent Food Small', 8, 'food', 11.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Rodent Food Medium', 8, 'food', 11.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Rodent Food Medium', 7, 'food', 13.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Rodent Food Medium', 5, 'food', 17.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Value Rodent Food Large', 7, 'food', 23.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Economy Rodent Rodent Large', 4, 'food', 28.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Premium Rodent Food Large', 2, 'food', 34.49);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy B', 3, 'toy', 3.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy C', 3, 'toy', 2.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy D', 3, 'toy', 15.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy E', 3, 'toy', 4.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy F', 3, 'toy', 19.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy G', 3, 'toy', 1.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy H', 3, 'toy', 0.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy I', 3, 'toy', 8.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy J', 3, 'toy', 4.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy K', 3, 'toy', 2.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy L', 3, 'toy', 9.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Cat Toy M', 3, 'toy', 43.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy B', 3, 'toy', 12.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy C', 3, 'toy', 8.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy D', 3, 'toy', 21.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy E', 3, 'toy', 15.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy F', 3, 'toy', 3.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy G', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy H', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy I', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy J', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy K', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy L', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy M', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy N', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy O', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy P', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy Q', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy R', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy S', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy T', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy U', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy V', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy W', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy X', 3, 'toy', 5.99);
INSERT INTO item(item_name, stock, category, price) VALUES ('Dog Toy Y', 3, 'toy', 5.99);
/* Add Customers */
INSERT INTO customer(first_name,last_name,dob,email) VALUES ("Gareth","Frost",null,"leo.in@uteratSed.net"),("Melvin","Ramsey",null,"neque.venenatis.lacus@lobortisquam.org"),("Joel","Ross",null,"mi.pede.nonummy@Pellentesqueut.net"),("Kimberly","Battle",null,"sem@vulputateullamcorper.net"),("Kareem","Bernard",null,"ultrices.sit@amagnaLorem.co.uk"),("Hilel","Livingston",null,"Morbi.sit.amet@mollislectuspede.edu"),("Cole","Dillard",null,"felis.eget@taciti.net"),("Jescie","Olson",null,"dolor.nonummy@ascelerisque.co.uk"),("Yolanda","Whitfield","1983-05-05","semper.auctor.Mauris@disparturientmontes.com"),("Aline","Duncan","1962-05-16","Donec.dignissim@laoreet.com");
INSERT INTO customer(first_name,last_name,dob,email) VALUES ("Carson","Lynn","1959-06-20","senectus@enim.net"),("Ignatius","Montgomery","1963-08-16","dolor.vitae.dolor@Mauris.org"),("Henry","Burris","1988-09-04","in.cursus@velvenenatis.edu"),("Grady","Moody","2001-02-28","Suspendisse.tristique.neque@magnaPhasellusdolor.org"),("Gretchen","Tyler","1979-08-20","tellus.id.nunc@accumsan.ca"),("Natalie","James","1966-04-18","ultrices.a@ipsumdolor.com"),("Holly","Sampson","1966-04-01","Phasellus@Maecenasornareegestas.net"),("Damon","Gray","1981-09-07","nec.quam.Curabitur@Nullatincidunt.org"),("Genevieve","Bauer","1977-03-09","feugiat.nec.diam@dictum.org"),("Doris","Fleming","1961-02-16","sed.dui.Fusce@liberoMorbi.com");
/* Add phone numbers */
insert into phone (phone_number, cust_id) values ('477-955-4957', 13);
insert into phone (phone_number, cust_id) values ('318-204-7015', 16);
insert into phone (phone_number, cust_id) values ('993-141-8018', 1);
insert into phone (phone_number, cust_id) values ('672-685-4957', 13);
insert into phone (phone_number, cust_id) values ('121-164-2319', 17);
insert into phone (phone_number, cust_id) values ('560-706-6071', 13);
insert into phone (phone_number, cust_id) values ('953-875-9149', 10);
insert into phone (phone_number, cust_id) values ('151-912-1262', 3);
insert into phone (phone_number, cust_id) values ('464-975-0655', 6);
insert into phone (phone_number, cust_id) values ('584-314-9584', 9);
/* Add customer addresses */
INSERT INTO cust_address (street_num,street_name,city,province,postal_code,cust_id) VALUES ("170-7805", "Sem Ave","King Township","ON","M6R 9T5",7),("82", "Fermentum St.","Roxboro","QC","G5L 2C5",8),("352","Sem. Road","Estevan","SK","S9R 4V5",10),("314","Semper Road","Stratford","PE","C3M 2V7",7),("848","Et St.","Pierrefonds","QC","J6S 6G7",3),("8129","Tincidunt Ave","Lake Cowichan","BC","V0K 2K2",18),("830","Elit. St.","Greater Sudbury","ON","N4P 6N6",13),("151","Placerat Road","Batiscan","QC","G9G 9T7",10),("7161","Nibh. Road","Coaldale","AB","T2P 0R9",2),("876","Commodo Rd.","Sooke","BC","V8K 8V5",19);
INSERT INTO cust_address (street_num,street_name,city,province,postal_code,cust_id) VALUES ("5282","Cras Av.","Camrose","AB","T1W 6J4",14),("8732","Sagittis Av.","Charlottetown","PE","C2P 5A0",9),("279","Aliquet Rd.","Markham","ON","P5G 9X0",9),("612","Orci Rd.","Smoky Lake","AB","T8X 3P5",7),("973","Consequat Rd.","Baie-D'Urfé","QC","J8M 9V5",7),("789","Cursus Rd.","Cap-de-la-Madeleine","QC","H1M 9M0",20),("847","Felis, Street","Wilmont","ON","L8X 3H1",1),("5452","Duis Rd.","Richmond Hill","ON","N4E 9T4",3),("433","Scelerisque Avenue","Gravelbourg","SK","S3H 9S0",3),("4017","Luctus. Ave","Stratford","PE","C0L 9R1",2);
/* Online orders */
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2018-09-21', '17:14:59', '2018-10-2', 1, '15235', 'Namekagon', 'Lesnoy', 'NS', 'Y5V 3D1', 6);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (2, '2019-08-03', '15:49:51', null, 1, '9', 'Columbus', 'Kamloops', 'SK', 'F3P 5V1', 15);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (2, '2019-08-13', '17:40:37', null, 1, '611', 'Farragut', 'El Mida', 'AB', 'B4P 2Z1', 7);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (3, '2017-11-29', '10:10:34', '2017-12-10', 1, '00', 'Eggendart', 'Daxing', 'ON', 'B5C 3C2', 17);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2017-12-02', '19:01:33', '2017-12-13', 1, '390', 'Dwight', 'Cipatat', 'NB', 'T4C 2D1', 6);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2018-12-29', '12:40:26', '2019-1-9', 1, '89', 'Prairie Rose', 'Xintang', 'NB', 'Z4V 5F9', 4);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (3, '2019-02-23', '0:45:36', '2019-3-6', 1, '5', 'Tomscot', 'Naivasha', 'SK', 'Z4V 5F9', 7);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2018-04-22', '9:52:00', '2018-5-3', 1, '0674', 'Brown', 'Shengze', 'NS', 'Z4V 5F9', 16);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (2, '2019-03-11', '7:32:38', null, 1, '64577', 'Jenifer', 'Seogeom-ri', 'AB', 'T4C 2D1', 19);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2019-11-13', '5:26:16', '2019-11-24', 1, '6', 'Truax', 'Lazaro Cardenas', 'NS', 'Z4V 5F9', 12);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (1, '2017-11-03', '20:45:56', null, 1, '05', 'Fairfield', 'Bykhaw', 'NS', 'T4C 2D1', 17);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (2, '2019-10-17', '19:25:18', null, 1, '3007', 'Mcguire', 'Tabuc Pontevedra', 'SK', 'Z4V 5F9', 20);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2019-06-28', '13:07:46', '2019-7-9', 1, '72', 'Stang', 'Sidi Amar', 'NS', 'B4P 2Z1', 7);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (2, '2018-04-08', '22:18:47', null, 1, '41062', 'Dorton', 'Trbovlje', 'BC', 'F3P 5V1', 20);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2019-07-13', '19:10:08', '2019-7-24', 1, '2825', 'Judy', 'San Ramón', 'SK', 'F3P 5V1', 6);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (2, '2019-05-11', '3:51:18', null, 1, '370', 'Kim', 'Menanga', 'BC', 'B5C 3C2', 9);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (1, '2018-08-28', '1:13:47', null, 1, '2', 'Veith', 'Jiujie', 'BC', 'T4C 2D1', 6);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2017-12-29', '7:46:38', '2018-1-9', 1, '03', 'Welch', 'Dukay', 'SK', 'G3C 1Z6', 14);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2017-12-14', '12:31:23', '2017-12-25', 1, '9', 'Nevada', 'Jiyang', 'NS', 'B4P 2Z1', 13);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2019-02-06', '0:17:25', '2019-2-17', 1, '3911', 'Merrick', 'Nnewi', 'NS', 'F3P 5V1', 13);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (2, '2019-08-12', '16:50:31', null, 1, '35491', 'Lukken', 'Gulao', 'NB', 'T4C 2D1', 7);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (1, '2018-10-10', '23:42:45', null, 1, '06719', 'Summerview', 'Necoclí', 'NB', 'T4C 2D1', 5);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (2, '2019-04-25', '6:30:22', null, 1, '9179', 'Brentwood', 'Morelos', 'SK', 'B5C 3C2', 19);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2018-07-09', '17:18:23', '2018-7-20', 1, '7', 'Sullivan', 'Yūki', 'BC', 'T4C 2D1', 4);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2017-12-23', '7:34:03', '2018-1-3', 1, '0827', 'Milwaukee', 'Araci', 'AB', 'B5C 3C2', 20);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (1, '2018-08-09', '20:19:50', null, 1, '2', 'Kipling', 'Prince Albert', 'BC', 'B4P 2Z1', 15);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (1, '2019-02-18', '23:47:24', null, 1, '66', 'Old Gate', 'Gardawice', 'NS', 'B4P 2Z1', 13);
insert into orders (status_id, order_date, order_time, shipping_date, online_order, street_num, street_name, city, province, postal_code, cust_id) values (4, '2018-01-01', '17:52:32', '2018-1-12', 1, '10817', 'Northwestern', 'Laiyuan', 'NB', 'F3P 5V1', 5);
/* In-store orders */
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2017/01/30', '14:53:13', 0, 13);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2017/11/05', '9:38:02', 0, 12);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2018/08/20', '13:35:33', 0, 1);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2018/04/04', '16:52:31', 0, 19);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2017/05/08', '9:03:40', 0, 7);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2016/12/26', '16:24:36', 0, 18);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2017/03/30', '13:57:50', 0, 18);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2017/03/01', '15:00:37', 0, 20);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2018/07/21', '13:04:29', 0, 18);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2019/04/09', '9:15:55', 0, 4);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2018/11/26', '16:17:36', 0, 20);
insert into orders (status_id, order_date, order_time, online_order, cust_id) values (4, '2019/08/29', '12:38:08', 0, 14);
/* Connect Orders */
insert into ordered_item (order_id, item_id, quantity, price) values (39, 20, 5, 3.55);
insert into ordered_item (order_id, item_id, quantity, price) values (33, 88, 1, 12.2);
insert into ordered_item (order_id, item_id, quantity, price) values (38, 93, 2, 21.6);
insert into ordered_item (order_id, item_id, quantity, price) values (23, 43, 1, 10.32);
insert into ordered_item (order_id, item_id, quantity, price) values (20, 40, 5, 2.3);
insert into ordered_item (order_id, item_id, quantity, price) values (38, 48, 1, 13.33);
insert into ordered_item (order_id, item_id, quantity, price) values (32, 92, 3, 6.26);
insert into ordered_item (order_id, item_id, quantity, price) values (4, 36, 4, 10.89);
insert into ordered_item (order_id, item_id, quantity, price) values (27, 75, 1, 1.6);
insert into ordered_item (order_id, item_id, quantity, price) values (19, 50, 2, 14.95);
insert into ordered_item (order_id, item_id, quantity, price) values (8, 80, 3, 19.7);
insert into ordered_item (order_id, item_id, quantity, price) values (32, 54, 5, 20.07);
insert into ordered_item (order_id, item_id, quantity, price) values (22, 94, 3, 18.92);
insert into ordered_item (order_id, item_id, quantity, price) values (35, 37, 2, 13.33);
insert into ordered_item (order_id, item_id, quantity, price) values (33, 37, 5, 7.6);
insert into ordered_item (order_id, item_id, quantity, price) values (14, 14, 1, 15.01);
insert into ordered_item (order_id, item_id, quantity, price) values (25, 57, 5, 4.57);
insert into ordered_item (order_id, item_id, quantity, price) values (30, 29, 5, 21.52);
insert into ordered_item (order_id, item_id, quantity, price) values (21, 7, 5, 22.51);
insert into ordered_item (order_id, item_id, quantity, price) values (29, 30, 4, 14.18);
insert into ordered_item (order_id, item_id, quantity, price) values (15, 84, 5, 5.16);
insert into ordered_item (order_id, item_id, quantity, price) values (37, 19, 3, 1.99);
insert into ordered_item (order_id, item_id, quantity, price) values (2, 60, 4, 2.53);
insert into ordered_item (order_id, item_id, quantity, price) values (17, 16, 3, 14.02);
insert into ordered_item (order_id, item_id, quantity, price) values (8, 54, 3, 23.45);
insert into ordered_item (order_id, item_id, quantity, price) values (30, 70, 3, 1.04);
insert into ordered_item (order_id, item_id, quantity, price) values (18, 21, 2, 4.82);
insert into ordered_item (order_id, item_id, quantity, price) values (15, 93, 2, 6.34);
insert into ordered_item (order_id, item_id, quantity, price) values (30, 16, 2, 16.55);
insert into ordered_item (order_id, item_id, quantity, price) values (25, 30, 3, 3.23);
insert into ordered_item (order_id, item_id, quantity, price) values (9, 56, 4, 8.35);
insert into ordered_item (order_id, item_id, quantity, price) values (39, 73, 2, 3.18);
insert into ordered_item (order_id, item_id, quantity, price) values (7, 89, 1, 2.94);
insert into ordered_item (order_id, item_id, quantity, price) values (33, 93, 3, 21.11);
insert into ordered_item (order_id, item_id, quantity, price) values (8, 17, 5, 7.09);
insert into ordered_item (order_id, item_id, quantity, price) values (2, 10, 4, 24.37);
insert into ordered_item (order_id, item_id, quantity, price) values (18, 88, 3, 9.88);
insert into ordered_item (order_id, item_id, quantity, price) values (19, 50, 3, 21.7);
insert into ordered_item (order_id, item_id, quantity, price) values (32, 95, 2, 6.53);
insert into ordered_item (order_id, item_id, quantity, price) values (7, 15, 5, 21.48);
insert into ordered_item (order_id, item_id, quantity, price) values (19, 21, 4, 17.57);
insert into ordered_item (order_id, item_id, quantity, price) values (14, 14, 2, 22.19);
insert into ordered_item (order_id, item_id, quantity, price) values (34, 26, 2, 10.42);
insert into ordered_item (order_id, item_id, quantity, price) values (37, 46, 2, 19.33);
insert into ordered_item (order_id, item_id, quantity, price) values (34, 79, 1, 15.7);
insert into ordered_item (order_id, item_id, quantity, price) values (18, 93, 1, 1.79);
insert into ordered_item (order_id, item_id, quantity, price) values (16, 85, 1, 22.07);
insert into ordered_item (order_id, item_id, quantity, price) values (20, 14, 4, 20.64);
insert into ordered_item (order_id, item_id, quantity, price) values (25, 84, 5, 9.64);
insert into ordered_item (order_id, item_id, quantity, price) values (21, 56, 1, 8.06);
insert into ordered_item (order_id, item_id, quantity, price) values (33, 7, 1, 18.43);
insert into ordered_item (order_id, item_id, quantity, price) values (14, 83, 1, 10.01);
insert into ordered_item (order_id, item_id, quantity, price) values (35, 6, 5, 6.51);
insert into ordered_item (order_id, item_id, quantity, price) values (29, 24, 4, 7.29);
insert into ordered_item (order_id, item_id, quantity, price) values (37, 16, 2, 3.99);
insert into ordered_item (order_id, item_id, quantity, price) values (34, 56, 2, 7.71);
insert into ordered_item (order_id, item_id, quantity, price) values (11, 100, 1, 16.42);
insert into ordered_item (order_id, item_id, quantity, price) values (35, 44, 1, 14.52);
insert into ordered_item (order_id, item_id, quantity, price) values (16, 18, 3, 21.46);
insert into ordered_item (order_id, item_id, quantity, price) values (29, 54, 4, 7.84);
insert into ordered_item (order_id, item_id, quantity, price) values (39, 1, 5, 2.77);
insert into ordered_item (order_id, item_id, quantity, price) values (2, 72, 5, 9.08);
insert into ordered_item (order_id, item_id, quantity, price) values (1, 38, 4, 1.33);
insert into ordered_item (order_id, item_id, quantity, price) values (26, 50, 3, 12.36);
insert into ordered_item (order_id, item_id, quantity, price) values (15, 5, 3, 9.84);
insert into ordered_item (order_id, item_id, quantity, price) values (7, 39, 4, 7.4);
insert into ordered_item (order_id, item_id, quantity, price) values (11, 27, 1, 4.31);
insert into ordered_item (order_id, item_id, quantity, price) values (34, 2, 1, 2.6);
insert into ordered_item (order_id, item_id, quantity, price) values (17, 45, 1, 21.42);
insert into ordered_item (order_id, item_id, quantity, price) values (27, 16, 3, 1.4);
insert into ordered_item (order_id, item_id, quantity, price) values (31, 5, 5, 19.25);
insert into ordered_item (order_id, item_id, quantity, price) values (4, 11, 3, 18.39);
insert into ordered_item (order_id, item_id, quantity, price) values (19, 40, 1, 7.69);
insert into ordered_item (order_id, item_id, quantity, price) values (29, 84, 3, 14.89);
insert into ordered_item (order_id, item_id, quantity, price) values (15, 72, 5, 10.68);
insert into ordered_item (order_id, item_id, quantity, price) values (22, 75, 1, 24.79);
insert into ordered_item (order_id, item_id, quantity, price) values (24, 56, 1, 13.33);
insert into ordered_item (order_id, item_id, quantity, price) values (8, 17, 2, 13.27);
insert into ordered_item (order_id, item_id, quantity, price) values (4, 95, 5, 15.64);
insert into ordered_item (order_id, item_id, quantity, price) values (11, 12, 1, 24.21);
insert into ordered_item (order_id, item_id, quantity, price) values (18, 28, 4, 9.99);
insert into ordered_item (order_id, item_id, quantity, price) values (33, 50, 5, 9.77);
insert into ordered_item (order_id, item_id, quantity, price) values (6, 21, 2, 18.89);
insert into ordered_item (order_id, item_id, quantity, price) values (34, 24, 3, 23.37);
insert into ordered_item (order_id, item_id, quantity, price) values (24, 52, 4, 4.16);
insert into ordered_item (order_id, item_id, quantity, price) values (22, 24, 1, 8.61);
insert into ordered_item (order_id, item_id, quantity, price) values (38, 96, 1, 11.07);
insert into ordered_item (order_id, item_id, quantity, price) values (10, 68, 1, 1.42);
insert into ordered_item (order_id, item_id, quantity, price) values (30, 65, 2, 1.64);
insert into ordered_item (order_id, item_id, quantity, price) values (21, 52, 5, 12.74);
insert into ordered_item (order_id, item_id, quantity, price) values (26, 28, 1, 24.95);
insert into ordered_item (order_id, item_id, quantity, price) values (38, 95, 1, 14.37);
insert into ordered_item (order_id, item_id, quantity, price) values (29, 82, 4, 4.17);
insert into ordered_item (order_id, item_id, quantity, price) values (3, 92, 3, 16.69);
insert into ordered_item (order_id, item_id, quantity, price) values (19, 62, 2, 11.42);
insert into ordered_item (order_id, item_id, quantity, price) values (25, 78, 4, 20.13);
insert into ordered_item (order_id, item_id, quantity, price) values (18, 70, 4, 8.8);
insert into ordered_item (order_id, item_id, quantity, price) values (11, 19, 3, 13.63);
insert into ordered_item (order_id, item_id, quantity, price) values (1, 87, 5, 22.26);
insert into ordered_item (order_id, item_id, quantity, price) values (8, 6, 1, 20.52);
insert into ordered_item (order_id, item_id, quantity, price) values (20, 41, 2, 19.3);
insert into ordered_item (order_id, item_id, quantity, price) values (10, 66, 5, 2.69);
insert into ordered_item (order_id, item_id, quantity, price) values (31, 62, 5, 20.1);
insert into ordered_item (order_id, item_id, quantity, price) values (1, 54, 1, 12.51);
insert into ordered_item (order_id, item_id, quantity, price) values (32, 25, 3, 20.64);
insert into ordered_item (order_id, item_id, quantity, price) values (9, 15, 4, 19.9);
insert into ordered_item (order_id, item_id, quantity, price) values (23, 2, 1, 15.07);
insert into ordered_item (order_id, item_id, quantity, price) values (7, 41, 4, 2.51);
insert into ordered_item (order_id, item_id, quantity, price) values (28, 23, 1, 24.19);
insert into ordered_item (order_id, item_id, quantity, price) values (19, 80, 1, 13.63);
insert into ordered_item (order_id, item_id, quantity, price) values (39, 96, 2, 9.7);
insert into ordered_item (order_id, item_id, quantity, price) values (35, 77, 2, 13.05);
insert into ordered_item (order_id, item_id, quantity, price) values (35, 87, 1, 16.15);
insert into ordered_item (order_id, item_id, quantity, price) values (24, 31, 2, 17.43);
insert into ordered_item (order_id, item_id, quantity, price) values (11, 1, 3, 16.93);
insert into ordered_item (order_id, item_id, quantity, price) values (21, 78, 4, 11.07);
insert into ordered_item (order_id, item_id, quantity, price) values (27, 67, 4, 16.59);
insert into ordered_item (order_id, item_id, quantity, price) values (1, 32, 5, 5.8);
insert into ordered_item (order_id, item_id, quantity, price) values (16, 8, 5, 8.63);
insert into ordered_item (order_id, item_id, quantity, price) values (6, 30, 4, 4.94);
insert into ordered_item (order_id, item_id, quantity, price) values (21, 93, 4, 4.52);
insert into ordered_item (order_id, item_id, quantity, price) values (12, 21, 3, 12.42);
insert into ordered_item (order_id, item_id, quantity, price) values (6, 80, 5, 18.94);
insert into ordered_item (order_id, item_id, quantity, price) values (33, 34, 4, 9.36);
insert into ordered_item (order_id, item_id, quantity, price) values (10, 30, 3, 5.69);
insert into ordered_item (order_id, item_id, quantity, price) values (6, 54, 4, 11.36);
insert into ordered_item (order_id, item_id, quantity, price) values (38, 51, 1, 22.35);
insert into ordered_item (order_id, item_id, quantity, price) values (38, 77, 3, 13.54);
insert into ordered_item (order_id, item_id, quantity, price) values (40, 35, 1, 15.01);
insert into ordered_item (order_id, item_id, quantity, price) values (8, 56, 4, 22.27);
insert into ordered_item (order_id, item_id, quantity, price) values (38, 75, 2, 5.33);
insert into ordered_item (order_id, item_id, quantity, price) values (21, 76, 1, 3.87);
insert into ordered_item (order_id, item_id, quantity, price) values (9, 24, 1, 13.9);
insert into ordered_item (order_id, item_id, quantity, price) values (9, 7, 1, 19.04);
insert into ordered_item (order_id, item_id, quantity, price) values (32, 55, 5, 2.63);
insert into ordered_item (order_id, item_id, quantity, price) values (6, 6, 2, 6.46);
insert into ordered_item (order_id, item_id, quantity, price) values (22, 77, 2, 1.75);
insert into ordered_item (order_id, item_id, quantity, price) values (36, 94, 4, 15.78);
insert into ordered_item (order_id, item_id, quantity, price) values (20, 11, 1, 7.32);
insert into ordered_item (order_id, item_id, quantity, price) values (38, 29, 2, 10.86);
insert into ordered_item (order_id, item_id, quantity, price) values (37, 90, 5, 23.21);
insert into ordered_item (order_id, item_id, quantity, price) values (25, 51, 3, 8.43);
insert into ordered_item (order_id, item_id, quantity, price) values (39, 62, 2, 16.22);
insert into ordered_item (order_id, item_id, quantity, price) values (40, 94, 4, 13.8);
insert into ordered_item (order_id, item_id, quantity, price) values (27, 15, 5, 13.95);
insert into ordered_item (order_id, item_id, quantity, price) values (24, 55, 1, 5.01);
insert into ordered_item (order_id, item_id, quantity, price) values (30, 59, 1, 4.7);
insert into ordered_item (order_id, item_id, quantity, price) values (25, 89, 2, 19.75);
insert into ordered_item (order_id, item_id, quantity, price) values (34, 74, 4, 11.01);
insert into ordered_item (order_id, item_id, quantity, price) values (39, 41, 5, 16.58);
insert into ordered_item (order_id, item_id, quantity, price) values (19, 23, 5, 14.26);
insert into ordered_item (order_id, item_id, quantity, price) values (1, 16, 1, 4.77);
insert into ordered_item (order_id, item_id, quantity, price) values (8, 90, 5, 21.25);
insert into ordered_item (order_id, item_id, quantity, price) values (5, 17, 2, 24.91);
insert into ordered_item (order_id, item_id, quantity, price) values (34, 10, 2, 9.25);
insert into ordered_item (order_id, item_id, quantity, price) values (29, 65, 5, 4.76);
insert into ordered_item (order_id, item_id, quantity, price) values (31, 60, 3, 2.81);
insert into ordered_item (order_id, item_id, quantity, price) values (34, 44, 3, 10.88);
insert into ordered_item (order_id, item_id, quantity, price) values (39, 19, 3, 19.12);
insert into ordered_item (order_id, item_id, quantity, price) values (12, 57, 5, 1.45);
insert into ordered_item (order_id, item_id, quantity, price) values (9, 60, 2, 5.14);
insert into ordered_item (order_id, item_id, quantity, price) values (4, 44, 4, 2.69);
insert into ordered_item (order_id, item_id, quantity, price) values (23, 62, 4, 17.39);
insert into ordered_item (order_id, item_id, quantity, price) values (9, 98, 3, 3.91);
insert into ordered_item (order_id, item_id, quantity, price) values (2, 5, 4, 23.5);
insert into ordered_item (order_id, item_id, quantity, price) values (22, 90, 4, 23.35);
insert into ordered_item (order_id, item_id, quantity, price) values (7, 75, 3, 1.94);
insert into ordered_item (order_id, item_id, quantity, price) values (30, 17, 4, 14.62);
insert into ordered_item (order_id, item_id, quantity, price) values (39, 39, 5, 10.64);
insert into ordered_item (order_id, item_id, quantity, price) values (31, 58, 5, 7.25);
insert into ordered_item (order_id, item_id, quantity, price) values (17, 81, 2, 11.26);
insert into ordered_item (order_id, item_id, quantity, price) values (7, 82, 2, 19.89);
insert into ordered_item (order_id, item_id, quantity, price) values (13, 44, 1, 5.11);
insert into ordered_item (order_id, item_id, quantity, price) values (2, 17, 5, 21.12);
insert into ordered_item (order_id, item_id, quantity, price) values (30, 83, 5, 3.95);
insert into ordered_item (order_id, item_id, quantity, price) values (11, 34, 3, 13.61);
insert into ordered_item (order_id, item_id, quantity, price) values (37, 38, 5, 6.97);
insert into ordered_item (order_id, item_id, quantity, price) values (31, 76, 5, 21.85);
insert into ordered_item (order_id, item_id, quantity, price) values (3, 68, 3, 1.11);
insert into ordered_item (order_id, item_id, quantity, price) values (21, 17, 1, 15.8);
insert into ordered_item (order_id, item_id, quantity, price) values (12, 20, 1, 13.05);
insert into ordered_item (order_id, item_id, quantity, price) values (6, 40, 5, 21.16);
insert into ordered_item (order_id, item_id, quantity, price) values (7, 78, 4, 9.35);
insert into ordered_item (order_id, item_id, quantity, price) values (13, 93, 1, 21.26);
insert into ordered_item (order_id, item_id, quantity, price) values (37, 95, 3, 3.29);
insert into ordered_item (order_id, item_id, quantity, price) values (31, 39, 1, 8.23);
insert into ordered_item (order_id, item_id, quantity, price) values (9, 47, 2, 10.6);
insert into ordered_item (order_id, item_id, quantity, price) values (18, 99, 1, 3.14);
insert into ordered_item (order_id, item_id, quantity, price) values (33, 3, 5, 16.0);
insert into ordered_item (order_id, item_id, quantity, price) values (23, 47, 3, 4.44);
insert into ordered_item (order_id, item_id, quantity, price) values (35, 47, 5, 11.52);
insert into ordered_item (order_id, item_id, quantity, price) values (6, 97, 4, 24.12);
insert into ordered_item (order_id, item_id, quantity, price) values (12, 36, 5, 16.07);
insert into ordered_item (order_id, item_id, quantity, price) values (37, 7, 1, 19.87);
insert into ordered_item (order_id, item_id, quantity, price) values (33, 30, 2, 3.14);
insert into ordered_item (order_id, item_id, quantity, price) values (13, 88, 3, 21.18);
insert into ordered_item (order_id, item_id, quantity, price) values (8, 74, 1, 6.42);
insert into ordered_item (order_id, item_id, quantity, price) values (36, 80, 2, 24.45);
insert into ordered_item (order_id, item_id, quantity, price) values (9, 18, 3, 19.38);
insert into ordered_item (order_id, item_id, quantity, price) values (2, 22, 5, 19.49);
