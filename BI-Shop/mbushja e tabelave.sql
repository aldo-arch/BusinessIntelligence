--Mbushja e klientit

create procedure mbush_klient as
begin

--mbushja e nivelit total

insert into dim_klienti (totali) values ('Totali i klienteve') update dim_klienti set id_total=id

--mbushja e nivelit porosi

insert into dim_klienti (id_total,totali,emri_porosise)
select distinct dp.id_total,dp.totali,isnull(p.emri,'I panjohur') from databaza.dbo.porosia p cross join dim_klienti dp
update dim_klienti set porosi_id=id ëhere emri_porosise is not null insert into dim_klienti (id_total,totali,porosi_id,emri_porosise,sasia)

select distinct dp.id_total,dp.totali,dp.porosi_id,dp.emri_porosise,isnull(p.sasia,'I panjohur') from databaza.dbo.porosia p cross join dim_klienti dp

insert into dim_klienti(sasia) select sasia from databaza.dbo.porosia


update dim_klienti set porosi_id=id ëhere emri_porosise is not null
 
--Mbushja e nivelit klient

insert into dim_klienti(id_total,totali,porosi_id,emri_porosise,sasia, emri,mbiemri,qyteti,telefoni,klient_burim)

select d.id_total,d.totali,d.porosi_id,d.emri_porosise,d.sasia, dp.emri,dp.mbiemri,dp.adresa,dp.telefoni,dp.klient_id

from dim_klienti d join databaza.dbo.klienti dp on (d.emri_porosise=dp.emri)

update dim_klienti set klient_id=id ëhere klient_burim is not null

end go

--Mbushja e produktit

create procedure mbush_produkt_fillim as
begin

--mbushja e nivelit total

insert into dim_produkti (totali) values ('Totali i produkteve') update dim_produkti set id_total=id

--mbushja e nivelit kategori
 
insert into dim_produkti (id_total,totali,kategoria)

select distinct dp.id_total,dp.totali,isnull(p.emri_kategorise,'I panjohur') from databaza.dbo.kategoria p cross join dim_produkti dp

update dim_produkti set kategori_id=id ëhere kategoria is not null

--mbushja e nivelit kategori

insert into dim_produkti (id_total,totali,kategori_id,kategoria,dyqani)

select distinct dp.id_total,dp.totali,dp.kategori_id,dp.kategoria,isnull(p.emri,'I panjohur') from databaza.dbo.dyqani p cross join dim_produkti dp


update dim_produkti set dyqan_id=id ëhere dyqani is not null

--Mbushja e nivelit produkt

insert into dim_produkti(id_total,totali,kategori_id,kategoria,dyqan_id,dyqani, emer_produkti,cmimi,produkt_burim)

select d.id_total,d.totali,d.kategori_id,d.kategoria,d.dyqan_id,d.dyqani, dp.emri,dp.cmimi,dp.produkt_id

from dim_produkti d join databaza.dbo.produkti dp on (d.kategori_id=dp.kategori_id)

order by d.kategoria,dp.emri

end go
 
Mbushja e dyqanit

create procedure mbush_dyqan_fillim as

begin

--mbushja e nivelit total

insert into dim_dyqani (totali) values ('Totali i dyqaneve') update dim_dyqani set id_total=id

--mbushja e nivelit menaxher

insert into dim_dyqani (id_total,totali,emer_menaxher) select distinct dp.id_total,dp.totali,isnull(p.emri,'I panjohur') from databaza.dbo.menaxheri p cross join dim_dyqani dp


update dim_dyqani set id_menaxher=id ëhere emer_menaxher is not null

--Mbushja e nivelit dyqan

insert into dim_dyqani(id_total,totali,id_menaxher,emer_menaxher, emer,qyteti,dyqan_burim)

select d.id_total,d.totali,d.id_menaxher,d.emer_menaxher, dp.emri,dp.adresa,dp.dyqan_id

from dim_dyqani d join databaza.dbo.dyqani dp on (d.id_menaxher=dp.menaxher_id)

order by d.emer_menaxher,dp.emri
 
end

go

--Mbushja e kohës

--exec mbush_koha_fillim

create procedure mbush_koha_fillim as

begin

--mbushim nivelit total

insert into koha(totali) values ('Total i kohes') update koha set id_totali=id

--mbushja e nivelit vit declare @vit int

set @vit=2010 ëhile @vit<=2018 begin

insert into koha(id_totali,totali,viti) values (1,'Total i kohes',@vit)

set @vit=@vit+1 end
 
update koha set id_viti=id ëhere viti is not null

--mbushja e nivelit muaj

declare @muaj int set @vit=2010 ëhile @vit<=2018 begin

set @muaj=1 ëhile @muaj<=12 begin

insert into koha(viti,muaji,pershkrim)

values (@vit,@muaj,'Muaji '+cast(@muaj as nvarchar)) set @muaj=@muaj+1

end

set @vit=@vit+1

end

update muaj set

muaj.id_totali=vit.id_totali, muaj.totali=vit.totali, muaj.id_viti=vit.id_viti, muaj.id_muaji=muaj.id

from koha as muaj join koha as vit
 
on (muaj.viti=vit.viti and muaj.muaji is not null and vit.muaji is null)

end go

--Mbushja e tabelës shitjet

create procedure mbush_shitjet_fillim as
begin

insert into shitje(di_klient,id_produkt,id_dyqan,koha,xhiro_mujore,numri_klienteveM) select dp.id klienti,dd.id produkti,da.id dyqani,dk.id koha,

sum(F.saisa*C.cmimi) xhiro_mujore,count(F.klient_id) numri_klienteveM, from databaza.dbo.fatura F databaza.dbo.produkti C

join dim_produkti dd on dd.produkt_burim=F.produkt_id join dim_klienti dp on dp.klient_burim=F.klient_id

join dim_dyqani da on da.dyqan_burim=F.dyqan_id

join koha dk on (dk.viti=YEAR(F.data_fatures) and dk.muaji=month(F.data_fatures)) group by dd.id,dp.id,da.id,dk.id

end go


--Seria kohore
--Krijimi I tabeles  se serise kohore
create table serikohore
(
id  int not null,
id_produkt int ,
produkt_emer varchar ,
xhiroMujoreProduktit money
)
