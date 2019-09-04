--TABELA E DIMENSIONIT KLIENT

create table dim_klienti (

id int identity(1,1) primary key not null, id_total int null,

totali nvarchar (50) null, porosi_id int, emri_porosise varchar(30), sasia int,

klient_id int, emri varchar(30),

mbiemri varchar(30)null, qyteti varchar(100) null, telefoni varchar (30), klient_burim int

);

--TABELA E DIMENSIONIT PRODUKT

create table dim_produkti (
id int identity(1,1) primary key not null, id_total int null,
totali nvarchar (50) null, kategori_id int, kategoria varchar(30)null, dyqan_id int,
dyqani varchar(30),
produkt_id int,
emer_produkti varchar(30)null,
cmimi money,
produkt_burim int
);

--TABELA E DIMENSIONIT DYQAN

create table dim_dyqani (
id int identity(1,1) primary key not null, id_total int null,
totali nvarchar (50) null, id_menaxher int, emer_menaxher varchar(30), dyqan_id int ,
emer varchar(30), qyteti varchar(30)null, dyqan_burim int
);

--TABELA E KOHËS

create table koha (
id int identity (1,1) primary key not null,
id_totali int,
totali nvarchar(50), id_dita int,
dita int, id_muaji int, muaji int, id_viti int, viti int,
pershkrim nvarchar(10) );

--TABELA E SHITJEVE

create table dim_shitjet ( id_klient int,
id_produkt int, id_dyqan int, koha date,
xhiro_mujore money, numri_klienteveM int, );
