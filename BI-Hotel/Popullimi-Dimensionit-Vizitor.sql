
--Mbushja e dimensionit visitor

--Mbushja e nivelit total
INSERT INTO DimVisitor(totali)
VALUES('Totali vizitoreve');
UPDATE DimVisitor SET id_total = id WHERE totali IS NOT NULL;

--Mbushja e nivelit shtet

INSERT INTO DimVisitor(id_total,totali,shteti)
SELECT V.id_total,V.totali,R.shteti
FROM HotelDatabaze.dbo.Rajon R CROSS JOIN DimVisitor V;
UPDATE DimVisitor SET id_shtet = id WHERE shteti IS NOT NULL;

--Mbushja e nivelit qytet

INSERT INTO DimVisitor(id_total,totali,id_shtet,shteti,qyteti)
SELECT V.id_total,V.totali,V.id_shtet,V.shteti,S.qyteti
FROM DimVisitor V JOIN (SELECT DISTINCT Q.qyteti,R.shteti FROM HotelDatabaze.dbo.Qyteti Q JOIN HotelDatabaze.dbo.Rajon R ON Q.id_shtet = R.rajon_id ) S ON V.shteti = S.shteti;
UPDATE DimVisitor SET id_qytet = id WHERE qyteti IS NOT NULL;

--Mbushja e nivelit adrese

INSERT INTO DimVisitor(id_total,totali,id_shtet,shteti,id_qytet,qyteti,adrese,adrese_burim)
SELECT V.id_total,V.totali,V.id_shtet,V.shteti,V.id_qytet,V.qyteti,K.adresa,K.adrese_id
FROM DimVisitor V JOIN (SELECT A.adrese_id,A.adresa,Q.qyteti FROM HotelDatabaze.dbo.Adrese A JOIN HotelDatabaze.dbo.Qyteti Q ON A.id_qytet = Q.qytet_id) K ON V.qyteti = K.qyteti
ORDER BY K.adrese_id;
UPDATE DimVisitor SET id_adrese = id WHERE adrese_burim IS NOT NULL;

--Mbushja e nivelit vizitor

INSERT INTO DimVisitor(id_total,totali,id_shtet,shteti,id_qytet,qyteti,id_adrese,adrese,adrese_burim,visitor_emer,visitor_mbiemer,
visitor_moshe,visitor_gjini,visitor_telefon,visitor_email,visitor_zip_code,visitor_burim)
SELECT V.id_total,V.totali,V.id_shtet,V.shteti,V.id_qytet,V.qyteti,V.id_adrese,V.adrese,V.adrese_burim,K.v_emer,
K.v_mbiemer,K.v_moshe,K.v_gjini,K.v_telefon,K.v_email,K.v_zip_code,K.visitor_id
FROM DimVisitor V JOIN HotelDatabaze.dbo.Visitor K ON V.adrese_burim = K.v_adrese
ORDER BY K.visitor_id;
UPDATE DimVisitor SET id_visitor = id WHERE visitor_burim IS NOT NULL;



--Query ndihme
SELECT * FROM DimVisitor;

DELETE FROM DimVisitor;