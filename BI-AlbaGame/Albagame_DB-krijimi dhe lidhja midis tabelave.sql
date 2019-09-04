
-- përdorim databazën Albagame_DB1 si databazë burim

use Albagame_DB1

-- krijojmë tabelën Adresat_filial ku do të ruajmë adresat e filialeve
-- të cilat duhen për të ruajtur vendndodhjen e filialeve përkatëse të kompanisë

CREATE TABLE [dbo].[Adresat_filial](
	[filial_addr_ID] [int] IDENTITY(1,1) NOT NULL,
	[shteti] [varchar](30) NULL,
	[qyteti] [varchar](30) NULL,
	[adresa] [varchar](200) NULL,
	[kodi_postar] [varchar](100) NULL)

-- ndërtojmë tabelën e adresave të klientëve aktualë të kompanisë
-- do të ruajmë informacionin e nevojshëm në lidhje me vendndodhjen e tyre
-- ky informacion duhet pasi është e nevojshme për të dërguar produktin tek klienti 

CREATE TABLE [dbo].[Adresat_klient](
	[addr_klient_id] [int] IDENTITY(1,1) NOT NULL,
	[adresa] [varchar](200) NULL,
	[shteti] [varchar](30) NULL,
	[qyteti] [varchar](30) NULL,
	[kodi_postar] [varchar](30) NULL)

-- ndërtojmë tabelën e blerjeve ku do të ruajmë informacionin e nevojshëm
-- në lidhje me blerjen e një produkti (kjo mund të konsiderohet edhe si një faturë)

CREATE TABLE [dbo].[Blerje](
	[blerje_ID] [int] IDENTITY(1,1) NOT NULL,
	[klient_ID] [int] NULL,
	[produkt_ID] [int] NULL,
	[sasia] [int] NULL,
	[çmimi_total] [float] NULL,
	[ulje] [int] NULL,
	[data_blerje] [date] NULL,
	[garancia] [varchar](50) NULL,
	[Vlera] [money] NULL,
	[porosi_ID] [int] NULL,
	[staf_ID] [int] NULL)

-- krijimi i tabelës së ndërmjetme midis filialeve dhe produkteve
-- lidhja është shumë me shumë (pra shumë produkte ndodhen njëkohësisht në shumë filiale)

CREATE TABLE [dbo].[filial_produkt](
	[filial_produkt_ID] [int] IDENTITY(1,1) NOT NULL,
	[produkt_ID] [int] NULL,
	[filial_ID] [int] NULL)

-- krijimi i tabelës së filialeve ku do të ruajmë të dhënat përkatëse të
-- filaleve përkatëse të vetë kompanisë

CREATE TABLE [dbo].[Filialet](
	[filial_ID] [int] IDENTITY(1,1) NOT NULL,
	[filial_addr_ID] [int] NULL,
	[emër] [varchar](50) NULL,
	[përshkrim] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[numër_kontakti] [varchar](100) NULL,
	[webpage] [varchar](100) NULL)

-- krijimi i tabelës së kategorive ku do të ruajmë kategoritë
-- në lidhje me produktet e ndryshme

CREATE TABLE [dbo].[Kategoritë](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](50) NULL)

-- krijimi i tabelës së klientëve ku do të ruajmë informacionet e nevojshme në lidhje me ta

CREATE TABLE [dbo].[Klientët](
	[klient_id] [int] IDENTITY(1,1) NOT NULL,
	[addr_klient_id] [int] NULL,
	[emër] [varchar](30) NULL,
	[mbiemër] [varchar](30) NULL,
	[datëlindje] [date] NULL,
	[email] [varchar](30) NULL,
	[numër_kontakti] [varchar](30) NULL,
	[gjinia] [varchar](30) NULL)

-- krijimi i tabelës së manaxherëve 
-- punonjësit kanë manaxherin (drejtuesin) e tyre përkatës

CREATE TABLE [dbo].[Manaxherët](
	[man_ID] [int] IDENTITY(1,1) NOT NULL,
	[emër] [varchar](30) NULL,
	[mbiemër] [varchar](30) NULL,
	[datëlindje] [date] NULL,
	[gjinia] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[numër_kontakti] [varchar](20) NULL,
	[paga_lekë] [int] NULL,
	[arsimi] [varchar](50) NULL,
	[niveli] [varchar](50) NULL)

-- krijimi i tabelës së porosisë ku do të ruajmë të dhënat e porosive 
-- të realizuara nga klientët në lidhje me produkte të ndryshme

CREATE TABLE [dbo].[Porosi](
	[P_O_ID] [int] IDENTITY(1,1) NOT NULL,
	[klient_ID] [int] NULL,
	[produkt_ID] [int] NULL,
	[Emër] [varchar](50) NULL,
	[sasia] [int] NULL,
	[çmimi_total] [float] NULL,
	[P_O_date] [date] NULL)

-- krijimi i tabelës së produkteve ku do të ruajmë informacionet e nevojshme 
-- për produktet përkatëse

CREATE TABLE [dbo].[Produktet](
	[produkt_ID] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](100) NULL,
	[përshkrim_produkti] [varchar](100) NULL,
	[çmimi] [float] NULL,
	[category_id] [int] NULL,
	[tipi] [varchar](100) NULL)

-- krijimi i tabelës së punonjësve ku do të ruajmë informacionet e nevojshme në lidhje me ta

CREATE TABLE [dbo].[Punonjësit](
	[staf_ID] [int] IDENTITY(1,1) NOT NULL,
	[filial_ID] [int] NULL,
	[emër] [varchar](30) NULL,
	[mbiemër] [varchar](30) NULL,
	[datëlindje] [date] NULL,
	[gjinia] [varchar](20) NULL,
	[email] [varchar](50) NULL,
	[numër_kontakti] [varchar](20) NULL,
	[pozicioni] [varchar](50) NULL,
	[paga_lekë] [int] NULL,
	[arsimi] [varchar](50) NULL,
	[niveli] [varchar](50) NULL,
	[manaxheri] [varchar](50) NULL,
	[man_ID] [int] NULL)


-- kryejmë lidhjet midis tabelave të krijuara më sipër

ALTER TABLE Klientët
ADD FOREIGN KEY (addr_klient_id) REFERENCES Adresat_klient(addr_klient_id);

ALTER TABLE Porosi
ADD FOREIGN KEY (klient_ID) REFERENCES Klientët(klient_ID);

ALTER TABLE Porosi
ADD FOREIGN KEY (produkt_ID) REFERENCES Produktet(produkt_ID);

ALTER TABLE Blerje
ADD FOREIGN KEY (produkt_ID) REFERENCES Produktet(produkt_ID);

ALTER TABLE Blerje
ADD FOREIGN KEY (klient_ID) REFERENCES Klientët(klient_ID);

ALTER TABLE Blerje
ADD FOREIGN KEY (porosi_ID) REFERENCES Porosi(klient_ID);

ALTER TABLE Blerje
ADD FOREIGN KEY (staf_ID) REFERENCES Punonjësit(staf_ID);

ALTER TABLE Produktet
ADD FOREIGN KEY (category_ID) REFERENCES Kategoritë(category_ID);

ALTER TABLE filial_produkt
ADD FOREIGN KEY (produkt_ID) REFERENCES Produktet(produkt_ID);

ALTER TABLE filial_produkt
ADD FOREIGN KEY (filial_ID) REFERENCES Filialet(filial_ID);

ALTER TABLE Filialet
ADD FOREIGN KEY (filial_addr_ID) REFERENCES Adresat_filial(filial_addr_ID);

ALTER TABLE Punonjësit
ADD FOREIGN KEY (filial_ID) REFERENCES Filialet(filial_ID);

ALTER TABLE Punonjësit
ADD FOREIGN KEY (man_ID) REFERENCES Manaxherët(man_ID);

