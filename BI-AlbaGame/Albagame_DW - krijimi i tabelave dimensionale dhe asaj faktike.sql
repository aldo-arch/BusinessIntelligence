
-- fillimisht përdorim  Albagame_DW
 
 use Albagame_DW

 -- krijimi i tabelës dimensionale në lidhje me produktet
 -- bazuar nga atributet e nevojshme nga tabelat e databazës burim 
 -- në lidhje me produktet kemi marrë këto kolona

create table dim_produkt (
id int identity(1,1) primary key not null, 
id_total int null,
totali nvarchar (50) null, 
kategori_ID int,
kategori_name varchar (100),
filial_ID int,
filial_emer varchar (100),
id_produkt int,
emer_produkt varchar (100),
pershkrim_produkti varchar (100),
cmim_produkt float,
tipi_produkt varchar (100),
produkt_burim int)

 -- krijimi i tabelës dimensionale në lidhje me punonjësit
 -- bazuar nga atributet e nevojshme nga tabelat e databazës burim 
 -- në lidhje me punonjësit kemi marrë këto kolona

create table dim_punonjes (
id int identity(1,1) primary key not null, 
id_total int null,
totali nvarchar (50) null, 
manaxher_ID int,
emer_manaxher varchar (50),
punonjes_ID int,
emer_punonjes varchar (30),
punonjes_mbiemer varchar (30),
datelindje_punonjes date,
email_punonjes varchar (30),
numer_kontakti varchar (30),
punonjes_burim int)


 -- krijimi i tabelës dimensionale në lidhje me kohën
 -- këtu do të kemi informacionet e nevojshme në lidhje me kohën
 -- të ndara sipas kolonave përkatëse

create table dim_koha (
id int identity (1,1) primary key not null,
id_totali int,
totali nvarchar(50), id_muaji int, muaji int, id_viti int, viti int,
pershkrim nvarchar(10) );

 -- krijimi i tabelës faktike në lidhje me blerjet
 -- bazuar nga atributet e nevojshme nga tabelat e databazës burim 
 -- në lidhje me blerjet kemi marrë këto kolona

create table FAKT_blerje (
id_punonjes int,
id_porosi int,
id_produkt  int,
id_koha int,
xhiro_mujore float,
numri_porosi_mujore int
)

-- krijimi i tabelës dimensionale të porosisë
-- bazuar në atributet e nevojshme nga tabelat e databazës burim
-- në lidhje me porositë kemi marrë këto kolona

CREATE TABLE [dbo].[dim_porosia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_total] [int] NULL,
	[totali] [nvarchar](50) NULL,
	[klient_ID] [int] NULL,
	[klient_name] [varchar](100) NULL,
	[porosi_id] [int] NULL,
	[emer_porosi] [varchar](100) NULL,
	[cmim_total] [float] NULL,
	[data] [date] NULL,
	[porosi_burim] [int] NULL)
