

--Mbushja tabeles faktike FactRezervime

DELETE FROM FaktRezervime;

INSERT INTO FaktRezervime(agjent,vizitor,dhome,date_rezervimi,date_leshimi,kohe_rezervimi,tarife,total)
SELECT D1.id_agjent,D2.id_visitor,D3.id_dhome,D4.id,D5.id,F.periudha,K.tarife,SUM(tarife * periudha) totali
FROM (SELECT * FROM HotelDatabaze.dbo.Rezervim R ) K
JOIN DimAgjentRezervimi D1 ON K.agjent_id = D1.agjent_burim
JOIN DimVisitor D2 ON K.visitor_id = D2.visitor_burim
JOIN DimDhome D3 ON K.dhome_id = D3.dhome_burim
JOIN DimKoha D4 ON D4.viti = YEAR(K.date_rezervimi) AND D4.muaji = MONTH(K.date_rezervimi) AND D4.dite = DAY(K.date_rezervimi)
JOIN DimKoha D5 ON D5.viti = YEAR(K.date_rezervim_mbarim) AND D5.muaji = MONTH(K.date_rezervim_mbarim) AND D5.dite = MONTH(K.date_rezervim_mbarim) 
JOIN (SELECT SUM(MONTH(date_rezervim_mbarim)-MONTH(date_rezervimi)) periudha,rezervim_id  FROM HotelDatabaze.dbo.Rezervim GROUP BY rezervim_id ) F ON K.rezervim_id = F.rezervim_id
GROUP BY D1.id_agjent,D2.id_visitor,D3.id_dhome,D4.id,D5.id,K.sasi_dhome,K.tarife,F.periudha;


--query ndihme

SELECT * FROM FaktRezervime;


SELECT DISTINCT * FROM (SELECT DISTINCT * FROM HotelDatabaze.dbo.Rezervim R LEFT JOIN HotelDatabaze.dbo.RezervimDhome D ON R.rezervim_id = D.id_rezervim ) K
JOIN DimAgjentRezervimi D1 ON K.agjent_id = D1.agjent_burim
JOIN DimVisitor D2 ON K.visitor_id = D2.visitor_burim
JOIN DimDhome D3 ON K.dhome_id = D3.dhome_burim
JOIN DimKoha D4 ON D4.viti = YEAR(K.date_rezervimi) AND D4.muaji = MONTH(K.date_rezervimi) AND D4.dite = DAY(K.date_rezervimi)
JOIN DimKoha D5 ON D5.viti = YEAR(K.date_rezervim_mbarim) AND D5.muaji = MONTH(K.date_rezervim_mbarim) AND D5.dite = MONTH(K.date_rezervim_mbarim) 
JOIN (SELECT SUM(MONTH(date_rezervim_mbarim)-MONTH(date_rezervimi)) periudha,rezervim_id  FROM HotelDatabaze.dbo.Rezervim GROUP BY rezervim_id ) F ON K.id_rezervim = F.rezervim_id
GROUP BY D1.id_agjent,D2.id_visitor,D3.id_dhome,D4.id,D5.id,K.sasi_dhome,K.tarife


SELECT * FROM FaktRezervime;

SELECT * 
FROM HotelDatabaze.dbo.Rezervim R JOIN DimAgjentRezervimi K ON R.agjent_id = K.agjent_burim