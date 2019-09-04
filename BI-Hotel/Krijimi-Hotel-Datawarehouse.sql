
DROP TABLE DimVisitor;
DROP TABLE DimAgjentRezervimi;
DROP TABLE DimDhome;
DROP TABLE DimKoha;
DROP TABLE FaktRezervime;
--Krijimi datawarehouse per sistem rezervimi hoteli

--Krijimi dimensionit Visitor

CREATE TABLE DimVisitor
(
id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
id_total INT,
totali VARCHAR(50),
id_shtet INT,
shteti VARCHAR(50),
id_qytet INT,
qyteti VARCHAR(50),
id_adrese INT,
adrese VARCHAR(50),
adrese_burim INT,
id_visitor INT,
visitor_emer VARCHAR(50),
visitor_mbiemer VARCHAR(50),
visitor_moshe INT,
visitor_gjini VARCHAR(20),
visitor_telefon VARCHAR(50),
visitor_email VARCHAR(50),
visitor_zip_code INT,
visitor_burim INT
);

--Krijimi dimensionit AgjentRezervimi

CREATE TABLE DimAgjentRezervimi
(
id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
id_total INT,
totali VARCHAR(50),
id_shtet INT,
shteti VARCHAR(50),
id_qytet INT,
qyteti VARCHAR(50),
id_adrese INT,
agjent_adrese VARCHAR(50),
agjent_adrese_burim VARCHAR(50),
id_menaxher INT,
menaxher_emer VARCHAR(50),
menaxher_mbiemer VARCHAR(50),
menaxher_mosha INT,
menaxher_telefon VARCHAR(50),
menaxher_email VARCHAR(50),
menaxher_burim INT,
id_agjent INT,
agjent_emer VARCHAR(50),
agjent_mbiemer VARCHAR(50),
agjent_mosha INT,
agjent_gjini VARCHAR(20),
agjent_telefon VARCHAR(50),
agjent_email VARCHAR(50),
agjent_burim INT
);

--Krijimi dimensionit dhome

CREATE TABLE DimDhome
(
id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
id_totali INT,
totali VARCHAR(50),
id_shtet INT,
shteti VARCHAR(50),
id_qytet INT,
qyteti VARCHAR(50),
id_adrese INT,
hotel_adrese VARCHAR(50),
adrese_burim INT,
id_hotel INT,
hotel_emer VARCHAR(50),
hotel_stars VARCHAR(50),
hotel_telefon VARCHAR(50),
hotel_fax VARCHAR(50),
hotel_email VARCHAR(50),
hotel_website VARCHAR(50),
hotel_burim INT,
id_dhome INT,
dhome_numer INT,
dhome_pershkrim VARCHAR(50),
dhome_siperfaqe INT,
dhome_burim INT
);

--Krijimi dimensionit Kohe

CREATE TABLE DimKoha
(
id INT PRIMARY KEY IDENTITY(1,1),
id_total INT,
totali VARCHAR(50),
id_vit INT,
viti INT,
viti_pershkrim VARCHAR(50),
id_muaj INT,
muaji INT,
muaj_pershkrim VARCHAR(50),
id_dite INT,
dite INT,

);


--Krijimi tabeles faktike

CREATE TABLE FaktRezervime
(
agjent INT,
vizitor INT,
dhome INT,
date_rezervimi INT,
date_leshimi INT,
kohe_rezervimi INT,
sasi_dhoma INT,
tarife INT,
total INT
);