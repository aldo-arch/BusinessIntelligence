
DELETE FROM DimKoha
			

SELECT * FROM DimKoha;
--mbushja dimensionit kohe

--mbushja nivelit total

INSERT INTO DimKoha(totali) VALUES('Totali kohes');
UPDATE DimKoha SET id_total = id WHERE totali IS NOT NULL;

--mbushja e nivelit vit

DECLARE @vit INT;
SET @vit = 2000;

WHILE @vit <= 2018
BEGIN
   INSERT INTO DimKoha(id_total,totali,viti,viti_pershkrim)
   SELECT id_total,totali,@vit,'Vit pershkrim'
   FROM DimKoha
   WHERE viti IS NULL
   SET @vit = @vit + 1;
END
UPDATE DimKoha SET id_vit = id WHERE viti_pershkrim IS NOT NULL;


--mbushja e nivelit muaj

DECLARE @viti INT
SET @viti = 2000;

WHILE @viti <= 2018
BEGIN
  DECLARE @muaji INT;
  SET @muaji = 1;
  WHILE @muaji <= 12
	BEGIN
     INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,muaji,muaj_pershkrim)
     SELECT id_total,totali,id_vit,viti,viti_pershkrim,@muaji,
	 case @muaji when 1 then 'Janar' when 2 then 'Shkurt'
					when 3 then 'Mars' when 4 then 'Prill'
					when 5 then 'Maj' when 6 then 'Qershor'
					when 7 then 'Korrik' when 8 then 'Gusht'
					when 9 then 'Shtator' when 10 then 'Tetor'
					when 11 then 'Nentor' when 12 then 'Dhjetor'
     END
	 FROM DimKoha
	 WHERE viti = @viti AND muaji IS NULL
	 SET @muaji = @muaji + 1;
	END
	SET @viti = @viti + 1;
END;
UPDATE DimKoha SET id_muaj = id WHERE muaj_pershkrim IS NOT NULL;

--Mbushja e nivelit dite

DECLARE @vite INT;
SET @vite = 2000;

WHILE @vite < 2018
BEGIN
   DECLARE @muaj INT;
   SET @muaj = 1;

   WHILE @muaj <= 12
   BEGIN
	      DECLARE @dita INT;
			 	  
		  IF @muaj = 1
		  BEGIN
		  SET @dita = 1;
		      WHILE @dita <= 31
		         BEGIN
			         
		             INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		             SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		             FROM DimKoha
		             WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				     SET @dita = @dita + 1;
			     END
		   END

		   IF @muaj = 2
		    BEGIN
			SET @dita = 1;
		     IF (@vite % 4 = 0 AND @vite % 100 <> 0) OR @vite % 400 = 0
			    WHILE @dita < 29
				     BEGIN
					    
		                INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		                SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		                FROM DimKoha
		                WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				        SET @dita = @dita + 1;
			         END
			 ELSE
			      WHILE @dita < 28
				     BEGIN
					    
		                INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		                SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		                FROM DimKoha
		                WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				        SET @dita = @dita + 1;
			         END
		     END
		  
		  IF @muaj = 3
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 31
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
		   END
		  
		  
		  IF @muaj = 4
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 30
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
			 END
		  
		  IF @muaj = 5
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 31
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
			 END
		   
		  
		  IF @muaj = 6
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 30

		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
			 END
		  
		  IF @muaj = 7
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 31
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
			 END
		   
		  IF @muaj = 8
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 31
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END 
			 END
		  
		  IF @muaj = 9
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 30
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
			 END
		 
		  IF @muaj = 10
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 31
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
			 END
		   
		  IF @muaj = 11
		  BEGIN
		  SET @dita = 1;
		   WHILE @dita <= 30
		   
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
			 END
		  
		  IF @muaj = 12
		   BEGIN
		   SET @dita = 1;
		   WHILE @dita <= 31
		     BEGIN
			 
		        INSERT INTO DimKoha(id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,dite)
		        SELECT id_total,totali,id_vit,viti,viti_pershkrim,id_muaj,muaji,muaj_pershkrim,@dita
		        FROM DimKoha
		        WHERE viti = @vite AND muaji = @muaj AND dite IS NULL;
				SET @dita = @dita + 1;
			 END
		  
		   
		   END
		   

		   SET @muaj = @muaj + 1;
	END

    SET @vite = @vite + 1;
END;
UPDATE DimKoha SET id_dite = id WHERE dite IS NOT NULL;

				    
		  


--query ndihme 

SELECT * FROM DimKoha;

