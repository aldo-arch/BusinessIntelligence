--Krijim databaze per hotelin

CREATE TABLE Rajon
(
rajon_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
shteti VARCHAR(50),
);

CREATE TABLE Qyteti
(
qytet_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
qyteti VARCHAR(50),
id_shtet INT
);

CREATE TABLE Adrese
(
adrese_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
adresa VARCHAR(50),
zip_code VARCHAR(50),
id_qytet INT
);

CREATE TABLE Visitor
(
visitor_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
v_emer VARCHAR(50),
v_mbiemer VARCHAR(50),
v_moshe INT,
v_gjini VARCHAR(20),
v_telefon VARCHAR(50),
v_email VARCHAR(50),
v_adrese INT

);

CREATE TABLE AgjentRezervimi
(
agjent_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
a_emer VARCHAR(50),
a_mbiemer VARCHAR(50),
a_moshe INT,
a_gjini VARCHAR(20),
a_telefon VARCHAR(50),
a_email VARCHAR(50),
a_adrese INT
);


CREATE TABLE Hotel
(
hotel_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
hotel_emer VARCHAR(50),
hotel_stars VARCHAR(50),
hotel_telefon VARCHAR(50),
hotel_fax VARCHAR(50),
hotel_email VARCHAR(50),
hotel_website VARCHAR(50),
hotel_adrese INT
);

CREATE TABLE Dhome
(
dhome_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
dhome_numer INT,
dhome_pershkrim VARCHAR(50),
dhome_siperfaqje INT,
dhome_status INT,
dhome_kategori INT,
hotel_id INT
);

CREATE TABLE Rezervim
(
rezervim_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
hotel_id INT,
visitor_id INT,
agjent_id INT,
date_rezervimi DATE,
date_rezervim_mbarim DATE,
dhome_id INT,
tarife INT,

rezervim_status INT
);



CREATE TABLE RezervimStatus
(
rezervim_status_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
rezervim_status VARCHAR(50),
rezervim_pershkrim VARCHAR(50),
rezervim_aktiv VARCHAR(50)
);

CREATE TABLE DhomeKategori
(
dhome_kategori_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
kategori_dhome VARCHAR(50),
kategori_pershkrim VARCHAR(50),
);

CREATE TABLE DhomeStatus
(
dhome_status_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
dhome_status VARCHAR(50),
dhome_status_pershkrim VARCHAR(50),
);