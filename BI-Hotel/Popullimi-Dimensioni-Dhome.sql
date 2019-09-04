
--Mbushja dimensionit dhome

--Mbushja nivelit total

INSERT INTO DimDhome(totali)
VALUES ('Totali dhomave');
UPDATE DimDhome SET id_totali = id WHERE totali IS NOT NULL;



--Mbushja e nivelit shtet

INSERT INTO DimDhome(id_totali,totali,shteti)
SELECT D.id_totali,D.totali,K.shteti
FROM DimDhome D CROSS JOIN HotelDatabaze.dbo.Rajon K
ORDER BY K.rajon_id;
UPDATE DimDhome SET id_shtet = id WHERE shteti IS NOT NULL;

--Mbushja e nivelit qytet

INSERT INTO DimDhome(id_totali,totali,id_shtet,shteti,qyteti)
SELECT D.id_totali,D.totali,D.id_shtet,D.shteti,K.qyteti
FROM DimDhome D JOIN (SELECT * FROM HotelDatabaze.dbo.Qyteti Q JOIN HotelDatabaze.dbo.Rajon R ON Q.id_shtet = R.rajon_id ) K ON D.shteti = K.shteti
ORDER BY K.qytet_id;
UPDATE DimDhome SET id_qytet = id WHERE qyteti IS NOT NULL;

--Mbushja e nivelit adrese

INSERT INTO DimDhome(id_totali,totali,id_shtet,shteti,id_qytet,qyteti,hotel_adrese,adrese_burim)
SELECT D.id_totali,D.totali,D.id_shtet,D.shteti,D.id_qytet,D.qyteti,K.adresa,K.adrese_id
FROM DimDhome D JOIN (SELECT * FROM HotelDatabaze.dbo.Adrese A JOIN HotelDatabaze.dbo.Qyteti Q ON A.id_qytet = Q.qytet_id ) K ON D.qyteti = K.qyteti
ORDER BY K.adrese_id;
UPDATE DimDhome SET id_adrese = id WHERE adrese_burim IS NOT NULL;

--Mbushja e nivelit hotel

INSERT INTO DimDhome(id_totali,totali,id_shtet,shteti,id_qytet,qyteti,id_adrese,hotel_adrese,adrese_burim,hotel_emer,hotel_stars,hotel_telefon,hotel_fax,hotel_email,hotel_website,hotel_burim)
SELECT D.id_totali,D.totali,D.id_shtet,D.shteti,D.id_qytet,D.qyteti,D.id_adrese,D.hotel_adrese,D.adrese_burim,K.hotel_emer,K.hotel_stars,K.hotel_telefon,
K.hotel_fax,K.hotel_email,K.hotel_website,K.hotel_id
FROM DimDhome D JOIN HotelDatabaze.dbo.Hotel K ON D.adrese_burim = K.hotel_adrese
ORDER BY K.hotel_id;
UPDATE DimDhome SET id_hotel = id WHERE hotel_burim IS NOT NULL;


--Mbushja e nivelit dhome

INSERT INTO DimDhome(id_totali,totali,id_shtet,shteti,id_qytet,qyteti,id_adrese,hotel_adrese,adrese_burim,id_hotel,hotel_emer,hotel_stars,
hotel_telefon,hotel_fax,hotel_email,hotel_website,hotel_burim,dhome_numer,dhome_pershkrim,dhome_siperfaqe,dhome_burim)
SELECT D.id_totali,D.totali,D.id_shtet,D.shteti,D.id_qytet,D.qyteti,D.id_adrese,D.hotel_adrese,D.adrese_burim,D.id_hotel,D.hotel_emer,D.hotel_stars,D.hotel_telefon,
D.hotel_fax,D.hotel_email,D.hotel_website,D.hotel_burim,K.dhome_numer,K.dhome_pershkrim,K.dhome_siperfaqje,K.dhome_id
FROM DimDhome D JOIN  HotelDatabaze.dbo.Dhome K ON D.hotel_burim = K.id_hotel
ORDER BY K.dhome_id;
UPDATE DimDhome SET id_dhome = id WHERE dhome_burim IS NOT NULL;






--Query ndihme

SELECT * FROM DimDhome;

DELETE FROM DimDhome;

