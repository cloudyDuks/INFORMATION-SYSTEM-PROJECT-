-- ======================================================
-- INNSYNC HOTEL DATABASE
-- ======================================================



CREATE TABLE DEPARTMENT (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL,
    department_location VARCHAR2(100)
);


CREATE TABLE ROOM (
    room_id NUMBER PRIMARY KEY,
    room_type VARCHAR2(50),
    floor_no NUMBER,
    price NUMBER(10,2) NOT NULL,
    status VARCHAR2(30) DEFAULT 'Available'
);


CREATE TABLE CUSTOMER (
    customer_id NUMBER PRIMARY KEY,
    last_name VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100),
    address VARCHAR2(200),
    phone_number VARCHAR2(20),
    id_number VARCHAR2(20) UNIQUE
);


CREATE TABLE PAYMENT (
    payment_id NUMBER PRIMARY KEY,
    amount_due NUMBER(10,2) NOT NULL,
    payment_date DATE,
    payment_method VARCHAR2(30)
);

CREATE TABLE PARKING (
    parking_id NUMBER PRIMARY KEY,
    parking_name VARCHAR2(100),
    parking_slot VARCHAR2(20) NOT NULL,
    room_id NUMBER,
    CONSTRAINT fk_parking_room FOREIGN KEY (room_id) REFERENCES ROOM(room_id)
);


CREATE TABLE STAFF (
    staff_id NUMBER PRIMARY KEY,
    last_name VARCHAR2(50) NOT NULL,
    first_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE,
    phone_number VARCHAR2(20),
    role VARCHAR2(50),
    hire_date DATE,
    department_id NUMBER NOT NULL,
    CONSTRAINT fk_staff_department FOREIGN KEY (department_id) REFERENCES DEPARTMENT(department_id)
);


CREATE TABLE RESERVATION (
    reservation_id NUMBER PRIMARY KEY,
    staff_id NUMBER NOT NULL,
    customer_id NUMBER NOT NULL,
    payment_id NUMBER,
    reservation_date DATE NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    status VARCHAR2(30) DEFAULT 'Pending',
    CONSTRAINT fk_reservation_staff FOREIGN KEY (staff_id) REFERENCES STAFF(staff_id),
    CONSTRAINT fk_reservation_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    CONSTRAINT fk_reservation_payment FOREIGN KEY (payment_id) REFERENCES PAYMENT(payment_id),
    CONSTRAINT chk_reservation_dates CHECK (check_out_date > check_in_date)
);


CREATE TABLE RESERVATION_DETAILS (
    reservation_details_id NUMBER PRIMARY KEY,
    reservation_id NUMBER NOT NULL,
    room_id NUMBER NOT NULL,
    number_of_guest NUMBER NOT NULL,
    CONSTRAINT fk_details_reservation FOREIGN KEY (reservation_id) REFERENCES RESERVATION(reservation_id),
    CONSTRAINT fk_details_room FOREIGN KEY (room_id) REFERENCES ROOM(room_id),
    CONSTRAINT chk_number_guest CHECK (number_of_guest > 0)
);



-- 1. DEPARTMENT
INSERT INTO DEPARTMENT (department_id, department_name, department_location)
 VALUES (1, 'Front Desk', 'Main Lobby');
INSERT INTO DEPARTMENT (department_id, department_name, department_location) 
VALUES (2, 'Housekeeping', 'Floor 1 Service Wing');
INSERT INTO DEPARTMENT (department_id, department_name, department_location)
 VALUES (3, 'Catering', 'Ground Floor Restaurant');
INSERT INTO DEPARTMENT (department_id, department_name, department_location) 
VALUES (4, 'Maintenance', 'Basement Room B-02');
INSERT INTO DEPARTMENT (department_id, department_name, department_location)
 VALUES (5, 'Security', 'West Wing Ground Floor');
INSERT INTO DEPARTMENT (department_id, department_name, department_location)
 VALUES (6, 'Human Resources', 'Executive Block 3rd Floor');
INSERT INTO DEPARTMENT (department_id, department_name, department_location)
 VALUES (7, 'Finance', 'Executive Block 2nd Floor');
INSERT INTO DEPARTMENT (department_id, department_name, department_location)
 VALUES (8, 'IT', 'Tech Hub Room 102');
INSERT INTO DEPARTMENT (department_id, department_name, department_location)
 VALUES (9, 'Marketing', 'Annex Building 1st Floor');
INSERT INTO DEPARTMENT (department_id, department_name, department_location)
 VALUES (10, 'Guest Relations', 'Main Lobby Desk B');

-- 2. ROOM
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (1, 'Single', 1, 1200.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (2, 'Single', 1, 1200.00, 'Occupied');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (3, 'Single', 1, 1250.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (4, 'Double', 1, 1250.00, 'Maintenance');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (5, 'Double', 2, 1500.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (6, 'Double', 2, 1500.00, 'Occupied');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (7, 'Double', 2, 1550.00, 'Cleaning');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (8, 'Double', 2, 1550.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (9, 'Deluxe', 3, 2000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (10, 'Deluxe', 3, 2100.00, 'Occupied');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (11, 'Deluxe', 3, 2000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (12, 'Deluxe', 3, 2100.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (13, 'Family', 4, 2500.00, 'Occupied');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (14, 'Family', 4, 2600.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no， price， status)
 VALUES (15, 'Family', 4， 2500.00， 'Cleaning');
INSERT INTO ROOM (room_id， room_type， floor_no， price， status)
 VALUES (16， 'Family', 4， 2600.00， 'Available');
INSERT INTO ROOM (room_id， room_type， floor_no， price， status)
 VALUES (17， 'Suite', 5， 4000.00， 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (18, 'Suite', 5, 4500.00, 'Occupied');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (19, 'Suite', 5, 5000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (20, 'Suite', 5, 5000.00, 'Reserved');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (21, 'Executive', 6, 6000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (22, 'Executive', 6, 6500.00, 'Occupied');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (23, 'Executive', 6, 6000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (24, 'Executive', 6, 7000.00, 'Reserved');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (25, 'Presidential', 7, 8000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (26, 'Presidential', 7, 8500.00, 'Occupied');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (27, 'Presidential', 7, 9000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (28, 'Presidential', 7, 9500.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (29, 'Penthouse', 8, 12000.00, 'Reserved');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (30, 'Penthouse', 8, 15000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (31, 'Penthouse', 8, 20000.00， 'Occupied');
INSERT INTO ROOM (room_id， room_type， floor_no， price， status)
 VALUES (32， 'Single', 1， 1200.00， 'Available');
INSERT INTO ROOM (room_id， room_type， floor_no， price， status)
 VALUES (33， 'Double', 2， 1500.0０， 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (34, 'Deluxe', 3, 2000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (35, 'Family', 4, 2500.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (36, 'Suite', 5, 4000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (37, 'Executive', 6, 6000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (38, 'Presidential', 7, 8000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (39, 'Penthouse', 8, 12000.00, 'Available');
INSERT INTO ROOM (room_id, room_type, floor_no, price, status)
 VALUES (40, 'Penthouse', 8, 15000.00, 'Available');

-- 3. CUSTOMER
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (1, 'Mthembu', 'Lungile', 'lungile.mthembu@gmail.com', '12 Long St, Cape Town, 8001', '082 491 7832', '8005125001081');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (2, 'Steyn', 'Gerhard', 'gerhard.steyn@yahoo.co.za', '45 Vilakazi St, Soweto, 1804', '083 734 2190', '8503225001082');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (3, 'Chetty', 'Sanjeev', 'schetty@outlook.com', '78 Florida Rd, Durban, 4001', '072 156 8943', '8807155001083');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (4, 'Molefe', 'Tshepo', 'tshepo.m@gmail.com', '23 Jan Smuts Ave, Rosebank, 2196', '084 602 3318', '9209185001084');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (5, 'Oosthuizen', 'Christo', 'coosthuizen@hotmail.com', '101 Church St, Pretoria, 0002', '079 823 4501', '8102035001085');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (6, 'Moodley', 'Natasha', 'nmoodley@yahoo.co.za', '56 Beach Rd, Gqeberha, 6013', '083 310 6729', '8906115001086');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (7, 'Bester', 'Hendrik', 'hbester@gmail.com', '89 Stamford Hill Rd, Durban, 4001', '083 957 1044', '8308255001087');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (8, 'Nene', 'Sbusiso', 'snene@live.co.za', '34 Main Rd, Paarl, 7646', '072 448 9921', '9512045001088');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (9, 'Hendricks', 'Tashreeq', 'thendricks@domain.co.za', '67 Nelson Mandela Dr, Bloemfontein, 9301', '084 119 5673', '8704305001089');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (10, 'Tshabalala', 'Nthabiseng', 'nthabi.t@gmail.com', '12 Rivonia Rd, Sandton, 2196', '082 776 2345', '9003015001090');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (11, 'Louw', 'Schalk', 'slouw@gmail.com', '88 Hatfield St, Cape Town, 8001', '083 201 8876', '8211125001091');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (12, 'Reddy', 'Priya', 'preddy@yahoo.co.za', '15 Oxford Rd, Parktown, 2193', '072 839 1120', '8809025001092');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (13, 'Mokoena', 'Karabo', 'kmokoena@outlook.com', '42 Umhlanga Rocks Dr, Durban, 4051', '084 550 3098', '9306145001093');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (14, 'Marais', 'Etienne', 'emarais@gmail.com', '9 Klerk St, Stellenbosch, 7600', '079 412 7654', '8007285001094');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (15, 'Sithole', 'Mandla', 'msithole@hotmail.com', '33 Lynnwood Rd, Pretoria, 0083', '072 963 0287', '8601055001095');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (16, 'Padayachee', 'Desigan', 'dpadayachee@yahoo.co.za', '74 Cape Rd, Mill Park, Gqeberha, 6001', '083 628 5531', '8911225001096');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (17, 'Venter', 'Liezel', 'lventer@gmail.com', '51 Musgrave Rd, Durban, 4001', '072 774 3902', '9405065001097');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (18, 'Baloyi', 'Nhlanhla', 'nbaloyi@live.co.za', '29 Victoria St, George, 6529', '084 385 7610', '8207195001098');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (19, 'Meyer', 'Dirk', 'dmeyer@domain.co.za', '90 Kloof St, Cape Town, 8001', '079 559 8234', '8710035001099');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (20, 'Khanyile', 'Zama', 'zkhanyile@gmail.com', '14 Regent Rd, Sea Point, 8005', '082 108 9923', '9908155001100');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (21, 'Smith', 'Willem', 'wsmith@outlook.com', '63 William Nicol Dr, Bryanston, 2021', '083 872 4456', '8506175001101');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (22, 'Sibiya', 'Mbali', 'msibiya@yahoo.co.za', '77 Paul Kruger St, Polokwane, 0700', '072 234 6789', '0012055001102');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (23, 'Nel', 'Riaan', 'rnel@gmail.com', '18 Chief Albert Luthuli St, Pietermaritzburg, 3201', '084 901 2234', '8109305001103');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (24, 'Adams', 'Ashraf', 'aadams@hotmail.com', '82 Monument Rd, Kempton Park, 1619', '079 304 5567', '8304115001104');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (25, 'Maseko', 'Buhle', 'bmaseko@gmail.com', '36 Voortrekker Rd, Bellville, 7535', '082 657 8901', '9211195001105');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (26, 'Swanepoel', 'Ruan', 'rswanepoel@gmail.com', '95 Beyers Naude Dr, Randburg, 2194', '083 445 1123', '8702085001106');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (27, 'Pillay', 'Sharmala', 'spillay@yahoo.co.za', '21 Elias Motsoaledi St, Nelspruit, 1200', '072 990 3345', '0208155001107');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (28, 'Cele', 'Bheki', 'bcele@outlook.com', '54 Walter Sisulu St, Potchefstroom, 2531', '084 223 7788', '8801015001108');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (29, 'van Zyl', 'Marize', 'mvanzyl@hotmail.com', '11 Strand St, Cape Town, 8001', '079 678 9012', '0910105001109');
INSERT INTO CUSTOMER (customer_id, last_name, first_name, email, address, phone_number, id_number)
 VALUES (30, 'Radebe', 'Kabelo', 'kradebe@gmail.com', '48 Helen Joseph St, Kimberley, 8301', '082 345 6789', '8407125001110');

-- PAYMENT
DELETE FROM PAYMENT;
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method) 
VALUES (1, 250.00, DATE '2026-10-01', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (2, 450.50, DATE '2026-10-02', 'Debit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (3, 180.00, DATE '2026-10-03', 'Cash');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (4, 620.00, DATE '2026-10-04', 'EFT');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (5, 310.00, DATE '2026-10-05', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (6, 500.00, DATE '2026-10-06', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (7, 150.00, DATE '2026-10-07', 'Instant EFT');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (8, 890.00, DATE '2026-10-08', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (9, 275.25, DATE '2026-10-09', 'Debit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (10, 410.00, DATE '2026-10-10', 'Cash');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (11, 320.00, DATE '2026-10-11', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (12, 195.00, DATE '2026-10-12', 'Debit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (13, 750.00, DATE '2026-10-13', 'EFT');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (14, 220.00, DATE '2026-10-14', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (15, 540.00, DATE '2026-10-15', 'Instant EFT');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (16, 160.00, DATE '2026-10-16', 'Cash');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (17, 380.00, DATE '2026-10-17', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (18, 920.00, DATE '2026-10-18', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (19, 290.00, DATE '2026-10-19', 'Debit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (20, 430.00, DATE '2026-10-20', 'EFT');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (21, 610.00, DATE '2026-10-21', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (22, 175.50, DATE '2026-10-22', 'Cash');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (23, 800.00, DATE '2026-10-23', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (24, 340.00, DATE '2026-10-24', 'Debit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (25, 490.00, DATE '2026-10-25', 'Instant EFT');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (26, 300.00, DATE '2026-10-26', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (27, 210.00, DATE '2026-10-26', 'Debit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (28, 670.00, DATE '2026-10-27', 'Credit Card');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (29, 145.00, DATE '2026-10-27', 'Cash');
INSERT INTO PAYMENT (payment_id, amount_due, payment_date, payment_method)
 VALUES (30, 520.00, DATE '2026-10-28', 'EFT');

-- 5. PARKING
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (1, 'North Lot', 'A-01', 1);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (2, 'North Lot', 'A-02', 2);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (3, 'North Lot', 'A-03', 3);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (4, 'North Lot', 'A-04', 4);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (5, 'North Lot', 'A-05', 5);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (6, 'South Garage', 'B-10', 6);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (7, 'South Garage', 'B-11', 7);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (8, 'South Garage', 'B-12', 8);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (9, 'South Garage', 'B-13', 9);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (10, 'South Garage', 'B-14', 10);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (11, 'East Plaza', 'C-01', 11);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (12, 'East Plaza', 'C-02', 12);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (13, 'East Plaza', 'C-03', 13);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (14, 'East Plaza', 'C-04', 14);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (15, 'East Plaza', 'C-05', 15);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (16, 'Underground', 'P1-01', 16);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (17, 'Underground', 'P1-02', 17);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (18, 'Underground', 'P1-03', 18);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (19, 'Underground', 'P1-04', 19);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (20, 'Underground', 'P1-05', 20);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (21, 'Underground', 'P2-01', 21);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (22, 'Underground', 'P2-02', 22);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (23, 'VIP Deck', 'V-01', 23);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (24, 'VIP Deck', 'V-02', 24);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (25, 'VIP Deck', 'V-03', 25);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (26, 'West Annex', 'W-01', 26);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (27, 'West Annex', 'W-02', 27);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (28, 'West Annex', 'W-03', 28);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (29, 'West Annex', 'W-04', 29);
INSERT INTO PARKING (parking_id, parking_name, parking_slot, room_id)
 VALUES (30, 'West Annex', 'W-05', 30);

-- 6. STAFF 
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (1, 'Ndlovu', 'Sipho', 'sipho.ndlovu@hotel.co.za', '082 491 0101', 'Receptionist', DATE '2021-03-15', 1);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (2, 'Botha', 'Johan', 'johan.botha@hotel.co.za', '083 734 0102', 'Housekeeper', DATE '2020-06-20', 2);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (3, 'Khumalo', 'Thabo', 'thabo.khumalo@hotel.co.za', '072 156 0103', 'Head Chef', DATE '2019-11-01', 3);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (4, 'van der Merwe', 'Pieter', 'pieter.vdmerwe@hotel.co.za', '084 602 0104', 'Maintenance Tech', DATE '2022-01-10', 4);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (5, 'Naidoo', 'Pravin', 'pravin.naidoo@hotel.co.za', '082 823 0105', 'Security Officer', DATE '2021-08-05', 5);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (6, 'Dlamini', 'Zanele', 'zanele.dlamini@hotel.co.za', '083 310 0106', 'HR Specialist', DATE '2018-04-12', 6);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (7, 'Pretorius', 'Willem', 'willem.pretorius@hotel.co.za', '072 957 0107', 'Accountant', DATE '2020-02-28', 7);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (8, 'Pillay', 'Kevin', 'kevin.pillay@hotel.co.za', '084 119 0108', 'Systems Admin', DATE '2022-09-15', 8);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (9, 'Mokoena', 'Lerato', 'lerato.mokoena@hotel.co.za', '082 776 0109', 'Marketing Manager', DATE '2021-05-22', 9);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (10, 'Coetzee', 'Anika', 'anika.coetzee@hotel.co.za', '083 201 0110', 'Concierge Lead', DATE '2023-01-08', 10);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (11, 'Sithole', 'Blessing', 'blessing.sithole@hotel.co.za', '072 839 0111', 'Receptionist', DATE '2022-03-19', 1);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (12, 'Venter', 'Jaco', 'jaco.venter@hotel.co.za', '084 550 0112', 'Housekeeper', DATE '2021-10-11', 2);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (13, 'Zulu', 'Bongani', 'bongani.zulu@hotel.co.za', '082 412 0113', 'Line Cook', DATE '2023-02-01', 3);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (14, 'Muller', 'Francois', 'francois.muller@hotel.co.za', '083 963 0114', 'Electrician', DATE '2020-07-14', 4);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (15, 'Mabaso', 'Jabulani', 'jabulani.mabaso@hotel.co.za', '072 628 0115', 'Guard', DATE '2019-09-30', 5);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (16, 'Fourie', 'Elize', 'elize.fourie@hotel.co.za', '084 774 0116', 'Recruiter', DATE '2022-11-05', 6);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (17, 'Patel', 'Aadil', 'aadil.patel@hotel.co.za', '082 385 0117', 'Financial Analyst', DATE '2018-01-22', 7);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (18, 'Modise', 'Kagiso', 'kagiso.modise@hotel.co.za', '083 559 0118', 'Helpdesk Tech', DATE '2023-05-12', 8);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (19, 'Daniels', 'Wayne', 'wayne.daniels@hotel.co.za', '072 108 0119', 'Sales Rep', DATE '2021-04-18', 9);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (20, 'Mahlangu', 'Ayanda', 'ayanda.mahlangu@hotel.co.za', '084 872 0120', 'Guest Host', DATE '2022-08-09', 10);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (21, 'Jacobs', 'Brent', 'brent.jacobs@hotel.co.za', '082 234 0121', 'Night Auditor', DATE '2020-12-03', 1);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (22, 'Nkosi', 'Nomvula', 'nomvula.nkosi@hotel.co.za', '083 901 0122', 'Laundry Lead', DATE '2021-06-25', 2);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (23, 'Govender', 'Strini', 'strini.govender@hotel.co.za', '072 304 0123', 'Bartender', DATE '2022-04-14', 3);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (24, 'du Plessis', 'Henk', 'henk.duplessis@hotel.co.za', '084 657 0124', 'Plumber', DATE '2019-03-27', 4);
INSERT INTO STAFF (staff_id, last_name, first_name, email, phone_number, role, hire_date, department_id)
 VALUES (25, 'Maseko', 'Siyabonga', 'siyabonga.maseko@hotel.co.za', '082 445 0125', 'Security Supervisor', DATE '2023-06-01', 5);


-- 7. RESERVATION 
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (1, 1, 1, 1, DATE '2026-09-25', DATE '2026-10-01', DATE '2026-10-03', 'Checked Out');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (2, 2, 2, 2, DATE '2026-09-26', DATE '2026-10-02', DATE '2026-10-05', 'Checked In');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (3, 1, 3, 3, DATE '2026-09-27', DATE '2026-10-03', DATE '2026-10-04', 'Checked Out');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (4, 3, 4, 4, DATE '2026-09-28', DATE '2026-10-04', DATE '2026-10-06', 'Cancelled');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (5, 1, 5, 5, DATE '2026-09-29', DATE '2026-10-05', DATE '2026-10-07', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (6, 4, 6, 6, DATE '2026-09-30', DATE '2026-10-06', DATE '2026-10-08', 'Checked In');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (7, 2, 7, 7, DATE '2026-10-01', DATE '2026-10-07', DATE '2026-10-08', 'Checked Out');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (8, 5, 8, 8, DATE '2026-10-02', DATE '2026-10-08', DATE '2026-10-10', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (9, 1, 9, 9, DATE '2026-10-03', DATE '2026-10-09', DATE '2026-10-11', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (10, 3, 10, 10, DATE '2026-10-04', DATE '2026-10-10', DATE '2026-10-12', 'Checked In');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (11, 1, 11, 11, DATE '2026-10-05', DATE '2026-10-11', DATE '2026-10-13', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (12, 2, 12, 12, DATE '2026-10-06', DATE '2026-10-12', DATE '2026-10-14', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (13, 4, 13, 13, DATE '2026-10-07', DATE '2026-10-13', DATE '2026-10-15', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (14, 1, 14, 14, DATE '2026-10-08', DATE '2026-10-14', DATE '2026-10-16', 'Pending');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (15, 5, 15, 15, DATE '2026-10-09', DATE '2026-10-15', DATE '2026-10-17', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (16, 3, 16, 16, DATE '2026-10-10', DATE '2026-10-16', DATE '2026-10-18', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (17, 1, 17, 17, DATE '2026-10-11', DATE '2026-10-17', DATE '2026-10-19', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (18, 2, 18, 18, DATE '2026-10-12', DATE '2026-10-18', DATE '2026-10-20', 'Pending');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (19, 4, 19, 19, DATE '2026-10-13', DATE '2026-10-19', DATE '2026-10-21', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (20, 1, 20, 20, DATE '2026-10-14', DATE '2026-10-20', DATE '2026-10-22', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (21, 5, 1, 21, DATE '2026-10-15', DATE '2026-10-21', DATE '2026-10-23', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (22, 3, 2, 22, DATE '2026-10-16', DATE '2026-10-22', DATE '2026-10-24', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (23, 1, 3, 23, DATE '2026-10-17', DATE '2026-10-23', DATE '2026-10-25', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (24, 2, 5, 24, DATE '2026-10-18', DATE '2026-10-24', DATE '2026-10-26', 'Pending');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (25, 4, 7, 25, DATE '2026-10-19', DATE '2026-10-25', DATE '2026-10-27', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (26, 1, 1, 26, DATE '2026-10-20', DATE '2026-10-26', DATE '2026-10-28', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (27, 3, 2, 27, DATE '2026-10-21', DATE '2026-10-27', DATE '2026-10-29', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (28, 5, 10, 28, DATE '2026-10-22', DATE '2026-10-28', DATE '2026-10-30', 'Checked In');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (29, 2, 12, 29, DATE '2026-10-23', DATE '2026-10-29', DATE '2026-10-31', 'Confirmed');
INSERT INTO RESERVATION (reservation_id, staff_id, customer_id, payment_id, reservation_date, check_in_date, check_out_date, status)
VALUES (30, 1, 5, 30, DATE '2026-10-24', DATE '2026-10-30', DATE '2026-11-01', 'Confirmed');

-- 8. RESERVATION_DETAILS
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (1, 1, 1, 1);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (2, 2, 2, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest) 
VALUES (3, 3, 3, 1);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (4, 4, 4, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (5, 5, 5, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (6, 6, 6, 3);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (7, 7, 7, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest) 
VALUES (8, 8, 8, 4);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest) 
VALUES (9, 9, 9, 1);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest) 
VALUES (10, 10, 10, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest) 
VALUES (11, 11, 11, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (12, 12, 12, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (13, 13, 13, 3);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest) 
VALUES (14, 14, 14, 1);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest) 
VALUES (15, 15, 15, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (16, 16, 16, 4);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest) 
VALUES (17, 17, 17, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (18, 18, 18, 3);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (19, 19, 19, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (20, 20, 20, 1);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (21, 21, 21, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (22, 22, 22, 3);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (23, 23, 23, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (24, 24, 24, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (25, 25, 25, 4);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (26, 26, 26, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (27, 27, 27, 2);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (28, 28, 28, 1);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (29, 29, 29, 3);
INSERT INTO RESERVATION_DETAILS (reservation_details_id, reservation_id, room_id, number_of_guest)
 VALUES (30, 30, 30, 2);

COMMIT;


SELECT * FROM reservation;

DROP TABLE reservation CASCADE CONSTRAINT PURGE;

ALTER TABLE RESERVATION MODIFY status VARCHAR2(50);

ALTER TABLE CUSTOMER ADD phone_number VARCHAR2(13);

ALTER TABLE RESERVATION RENAME COLUMN status TO booking_status;

TRUNCATE TABLE RESERVATION;

SELECT r.reservation_id, c.customer_id, c.first_name, r.check_in_date, r.status
FROM RESERVATION r
INNER JOIN CUSTOMER c ON r.customer_id = c.customer_id;