
--TABELA PRODUKTI

CREATE TABLE produkti (
produkt_id	INT NOT NULL,
emri VARCHAR(30)    NOT NULL,
cmimi  money  NOT NULL,
kategori_id int not null, dyqan_id int not null,
FOREIGN KEY (kategori_id) REFERENCES kategoria (kategori_id) , FOREIGN KEY (dyqan_id) REFERENCES dyqani (dyqan_id) ,
PRIMARY KEY (produkt_id)
);

--TABELA MENAXHERI

CREATE TABLE menaxheri (
menaxher_id	INT NOT NULL,
emri VARCHAR(30)		NOT NULL,
mbiemri VARCHAR(30)	NOT NULL,
PRIMARY KEY (menaxher_id)
);

--TABELA POROSIA

CREATE TABLE porosia (
porosi_id	INT NOT NULL,
emri VARCHAR(30)    NOT NULL,
sasia INT   NOT NULL,
klient_id	INT NOT NULL,
FOREIGN KEY (klient_id) REFERENCES klienti (klient_id) ,
PRIMARY KEY (porosi_id)
);

--TABELA KATEGORIA

CREATE TABLE kategoria (

kategori_id	INT NOT NULL,

emri_kategorise VARCHAR(30)    NOT NULL,
PRIMARY KEY (kategori_id)

);

--TABELA KLIENTI

CREATE TABLE klienti (

klient_id	INT NOT NULL,

emri VARCHAR(30)   NOT NULL,

mbiemri VARCHAR(30)  NOT NULL,

adresa  VARCHAR(30)  NOT NULL,

telefoni VARCHAR(30) NOT NULL, porosi_id int not null,
PRIMARY KEY (klient_id)

);

--TABELA DYQANI

CREATE TABLE dyqani (

dyqan_id	INT NOT NULL,

emri VARCHAR(30)   NOT NULL,

adresa  VARCHAR(30)  NOT NULL,

menaxher_id	INT NOT NULL,

FOREIGN KEY (menaxheri_id) REFERENCES menaxheri (menaxher_id) , PRIMARY KEY (dyqan_id)
);

--TABELA FATURA

CREATE TABLE fatura ( fatura_id INT NOT NULL, produkt_id INT NOT NULL,
klient_id INT NOT NULL,
FOREIGN KEY (produkt_id) REFERENCES produkti (produkt_id) ,
FOREIGN KEY (klient_id) REFERENCES klienti (klient_id) ,
PRIMARY KEY (fatura_id)
);
