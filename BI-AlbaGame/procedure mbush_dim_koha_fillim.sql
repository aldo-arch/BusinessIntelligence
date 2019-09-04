
create procedure mbush_dim_koha_fillim as

begin

--mbushim nivelit total

insert into dim_koha(totali) values ('Total i kohes') update dim_koha set id_totali=id

--mbushja e nivelit vit declare @vit int
declare @vit int

set @vit=2010 while @vit<=2018 begin

insert into dim_koha(id_totali,totali,viti) values (1,'Total i kohes',@vit)

set @vit=@vit+1 end
 
update dim_koha set id_viti=id where viti is not null

--mbushja e nivelit muaj

declare @muaj int
declare @vit int

set @vit=2010 while @vit<=2018 begin

set @muaj=1 while @muaj<=12 begin

insert into dim_koha(viti,muaji,pershkrim)

values (@vit,@muaj,'Muaji '+cast(@muaj as nvarchar)) set @muaj=@muaj+1

end

set @vit=@vit+1

end

update muaj set

muaj.id_totali=vit.id_totali, muaj.totali=vit.totali, muaj.id_viti=vit.id_viti, muaj.id_muaji=muaj.id

from dim_koha as muaj join dim_koha as vit
 
on (muaj.viti=vit.viti and muaj.muaji is not null and vit.muaji is null)

-- ekzekutimi i procedurës

exec mbush_dim_koha_fillim

end

