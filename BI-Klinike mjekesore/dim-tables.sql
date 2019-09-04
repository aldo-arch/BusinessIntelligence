create table dim_doktori (
id int identity(1,1) primary key not null,
id_total int null,
Totali nvarchar(50) null,
id_pavioni int null,
emer_pavioni varchar(25),
nr_pavioni int,
id_doktori int,
emer varchar(30),
kontakti int,
specializimi varchar(20),
doktor_burim int
);

create table dim_pacienti (
id int identity(1,1) primary key not null,
id_total int null,
totali nvarchar (50) null,
id_qyteti int,
emer_qyteti varchar(100) null,
id_pacient int,
emer varchar(30),null,
mosha int,
gjinia char(1),
simptomat varchar(30) null,
pacient_burim int
);

create table dim_analiza (
id int identity (1,1) primary key not null,
id_totali int null,
totali nvarchar(50) null,
id_laborator int null,
tip_lab varchar(20) null,
nr_lab int
id_kategori int null,
kategoria varchar(20),
id_analiza int,
nr_analize int
diagnoza varchar(30),
analiza_burim int
);

create table koha (
id int identity (1,1) primary key not null,
id_totali int,
totali nvarchar(50),
id_dita int,
dita int,
id_muaji int,
muaji int,
id_viti int,
viti int,
pershkrim nvarchar(10)
);


create table vizitat (
doktori int not null,
pacienti int not null,
analiza int not null,
koha int not null,
totali_pageses/muaj money not null,
nr_pacienteve/muaj int not null,
sasi_analizameshpeshte int not null

);
