DELETE FROM DimAgjentRezervimi;

 SELECT * from DimAgjentRezervimi
--Mbushja e dimensionit agjent rezervimi

--Mbushja e nivelit total

INSERT INTO DimAgjentRezervimi(totali)
VALUES ('Totali agjenteve');
UPDATE DimAgjentRezervimi SET id_total = id WHERE totali IS NOT NULL;

--Mbushja e nivelit shtet

INSERT INTO DimAgjentRezervimi(id_total,totali,shteti)
SELECT R.id_total,R.totali,S.shteti
FROM DimAgjentRezervimi R CROSS JOIN HotelDatabaze.dbo.Rajon S
ORDER BY S.rajon_id;
UPDATE DimAgjentRezervimi SET id_shtet = id WHERE shteti IS NOT NULL;



--Mbushja e nivelit qytet

INSERT INTO DimAgjentRezervimi(id_total,totali,id_shtet,shteti,qyteti)
SELECT A.id_total,A.totali,A.id_shtet,A.shteti,K.qyteti
FROM DimAgjentRezervimi A JOIN (SELECT * FROM HotelDatabaze.dbo.Qyteti Q JOIN HotelDatabaze.dbo.Rajon R ON Q.id_shtet = R.rajon_id ) K ON A.shteti = K.shteti 
ORDER BY K.qytet_id;
UPDATE DimAgjentRezervimi SET id_qytet = id WHERE qyteti IS NOT NULL;

--Mbushja e nivelit adrese

INSERT INTO DimAgjentRezervimi(id_total,totali,id_shtet,shteti,id_qytet,qyteti,agjent_adrese,agjent_adrese_burim)
SELECT D.id_total,D.totali,D.id_shtet,D.shteti,D.id_qytet,D.qyteti,S.adresa,S.adrese_id 
FROM DimAgjentRezervimi D JOIN (SELECT * FROM HotelDatabaze.dbo.Adrese A JOIN HotelDatabaze.dbo.Qyteti Q ON A.id_qytet = Q.qytet_id ) S ON D.qyteti = S.qyteti
ORDER BY S.adrese_id;
UPDATE DimAgjentRezervimi SET id_adrese = id WHERE agjent_adrese_burim IS NOT NULL;


--Mbushja e nivelit menaxher

INSERT INTO DimAgjentRezervimi(id_total,totali,id_shtet,shteti,id_qytet,qyteti,id_adrese,agjent_adrese,agjent_adrese_burim,menaxher_emer,menaxher_mbiemer,menaxher_mosha,menaxher_telefon,menaxher_email,menaxher_burim)
SELECT D.id_total,D.totali,D.id_shtet,D.shteti,D.id_qytet,D.qyteti,D.id_adrese,D.agjent_adrese,D.agjent_adrese_burim,A.a_emer,A.a_mbiemer,A.a_moshe,A.a_telefon,A.a_email,A.agjent_id 
FROM DimAgjentRezervimi D JOIN HotelDatabaze.dbo.AgjentRezervimi A ON D.agjent_adrese_burim = A.a_adrese 
WHERE A.agjent_id IN (SELECT raporton_tek FROM HotelDatabaze.dbo.AgjentRezervimi )
ORDER BY A.agjent_id;
UPDATE DimAgjentRezervimi SET id_menaxher = id WHERE menaxher_burim IS NOT NULL;

--Mbushja e nivelit agjent

INSERT INTO DimAgjentRezervimi(id_total,totali,id_shtet,shteti,id_qytet,qyteti,id_adrese,agjent_adrese,agjent_adrese_burim,id_menaxher,
menaxher_emer,menaxher_mbiemer,menaxher_mosha,menaxher_telefon,menaxher_email,menaxher_burim,
agjent_emer,agjent_mbiemer,agjent_mosha,agjent_gjini,agjent_telefon,agjent_email,agjent_burim)
SELECT D.id_total,D.totali,D.id_shtet,D.shteti,D.id_qytet,D.qyteti,D.id_adrese,D.agjent_adrese,D.agjent_adrese_burim,D.id_menaxher,D.menaxher_emer,
D.menaxher_mbiemer,D.menaxher_mosha,D.menaxher_telefon,D.menaxher_email,D.menaxher_burim,A.a_emer,A.a_mbiemer,A.a_moshe,A.a_gjini,A.a_telefon,A.a_email,A.agjent_id
FROM DimAgjentRezervimi D JOIN HotelDatabaze.dbo.AgjentRezervimi A ON D.menaxher_burim = A.raporton_tek
ORDER BY A.agjent_id;
UPDATE DimAgjentRezervimi SET id_agjent = id WHERE agjent_burim IS NOT NULL;



--Query ndihme


SELECT * FROM DimAgjentRezervimi;

DELETE FROM DimAgjentRezervimi