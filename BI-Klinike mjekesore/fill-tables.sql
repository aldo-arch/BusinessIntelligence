create procedure mbush_pacienti_fillim
as
begin

--mbushja e nivelit total
insert into dim_pacienti (totali) values ('Totali i pacienteve')
update dim_pacienti set id_total=id

--mbushja e nivelit qytet

insert into dim_pacienti (id_total,Totali,emer_qyteti)
select  distinct dp.id_total,dp.Totali,isnull(p.Qyteti,'I panjohur')
from KLINIKE_MJEKESORE.dbo.Pacient p cross join dim_pacienti dp

update dim_pacienti set id_qyteti=id where emer_qyteti is not null


--Mbushja e nivelit pacient
insert into dim_pacienti(id_total,totali,id_qyteti,emer_qyteti,
	emer,mosha,gjinia,simptomat,pacient_burim)
select d.id_total,d.Totali,d.id_qyteti,d.emer_qyteti,
	dp.emri,dp.Mosha,dp.Gjinia,dp.Simptomat,dp.SSN
from dim_pacienti d join KLINIKE_MJEKESORE.dbo.Pacient dp 
on (d.emer_qyteti=dp.Qyteti)
order by d.emer_qyteti,dp.Emri

update dim_pacienti set id_pacient=id where pacient_burim is not null

end
go



--exec mbush_doktor_fillim

create procedure mbush_doktor_fillim
as
begin

--mbushja e nivelit total
insert into dim_doktori(totali) values ('Totali i doktoreve')
update dim_doktori set id_total=id

--mbushja e nivelit pavion

insert into dim_doktori(id_total,Totali,emer_pavioni)
select  distinct dd.id_total,dd.Totali,isnull(d.Emri_Pavionit,'I panjohur')
from KLINIKE_MJEKESORE.dbo.Doktori d cross join dim_doktori dd

update dim_doktori set id_pavioni=id where emer_pavioni is not null
insert into dim_doktori(nr_pavioni) select NR_Paviont from KLINIKE_MJEKESORE.dbo.Pavioni

--Mbushja e nivelit doktor
insert into dim_doktori(id_total,Totali,id_pavioni,emer_pavioni,
	emer,kontakti,specializimi,doktor_burim)
select d.id_total,d.Totali,d.id_pavioni,d.emer_pavioni,
	dd.Emri,dd.kontakti,dd.Specializimi,dd.ID_Doktori
from dim_doktori d join KLINIKE_MJEKESORE.dbo.Doktori dd 
on (d.emer_pavioni=dd.Emri_Pavionit) 
order by d.emer_pavioni,dd.Emri
insert into dim_doktori(nr_pavioni) select NR_Paviont from KLINIKE_MJEKESORE.dbo.Pavioni

update dim_doktori set id_doktori=id where doktor_burim is not null

end
go




create procedure mbush_analiza_fillim
as
begin

--mbushja e nivelit total
insert into dim_analiza(totali) values ('Totali i analizave')
update dim_analiza set id_totali=id

--mbushja e nivelit laborator
insert into dim_analiza(id_totali,totali,nr_lab)
select  distinct A.id_totali,A.Totali,isnull(da.Nr_Lab,'I panjohur')
from KLINIKE_MJEKESORE.dbo.Analiza da cross join dim_analiza A
insert into dim_analiza(tip_lab) select Tipi_Lab from KLINIKE_MJEKESORE.dbo.Laboratori
update dim_analiza set id_laborator=id where nr_lab is not null

--Mbushja e nivelit kategori
insert into dim_analiza(id_totali,totali,id_laborator,nr_lab,
	kategoria)
select A.id_totali,A.totali,A.id_laborator,A.nr_lab,
	da.Kategoria
from dim_analiza A join KLINIKE_MJEKESORE.dbo.Analiza da
on (A.nr_lab=da.Nr_Lab)
order by A.nr_lab,da.Kategoria
insert into dim_analiza(tip_lab) select Tipi_Lab from KLINIKE_MJEKESORE.dbo.Laboratori

update dim_analiza set id_kategori=id where kategoria is not null

--mbushja e nivelit analiza

insert into dim_analiza(id_totali,totali,id_laborator,nr_lab,id_kategori,kategoria,cmimi,diagnoza,analiza_burim)	
select A.id_totali,A.totali,A.id_laborator,A.nr_lab,A.id_kategori,A.kategoria,da.cmimi,
da.diagnoza,da.Nr_Analizes
from dim_analiza A join KLINIKE_MJEKESORE.dbo.Analiza da on (A.kategoria=da.Kategoria)
update dim_analiza set id_analiza=id where analiza_burim is not null
	insert into dim_analiza(tip_lab) select Tipi_Lab from KLINIKE_MJEKESORE.dbo.Laboratori
end
go



--exec mbush_koha_fillim
create procedure mbush_koha_fillim
as
begin

--mbushim nivelit total
insert into koha(totali) values ('Total i kohes')
update koha set id_totali=id

--mbushja e nivelit vit
declare @vit int
set @vit=2002
while @vit<=2018
begin
insert into koha(id_totali,totali,viti)
values (1,'Total i kohes',@vit)

set @vit=@vit+1
end

update koha set id_viti=id where viti is not null

--mbushja e nivelit muaj


declare @muaj int
set @vit=2002
while @vit<=2018
begin
	set @muaj=1
	while @muaj<=12
	begin
		insert into koha(viti,muaji,pershkrim)
		values (@vit,@muaj,'Muaji '+cast(@muaj as nvarchar))
		set @muaj=@muaj+1
	end
	set @vit=@vit+1
end

update muaj
set 
	muaj.id_totali=vit.id_totali,
	muaj.totali=vit.totali,
	muaj.id_viti=vit.id_viti,
	muaj.id_muaji=muaj.id
from koha as muaj join koha as vit
on (muaj.viti=vit.viti and muaj.muaji is not null and vit.muaji is null)

end
go



////////////
create procedure mbush_vizitat_fillim
as
begin
insert into vizitat(doktori,pacienti,analiza,koha,totali_pageses_muaj,nr_pacienteve_muaj,sasi_analizameshpeshte)
select dd.id_doktori,dp.id_pacient,da.id_analiza,dk.id,
sum(f.CMIMI_ANALIZES+f.Pag_Doktorit) pagesa,count(SSN) shuma
from  Northwind.dbo.[Order Details] od 
	join Northwind.dbo.Orders o on od.OrderID=o.OrderID
	join Produkti dp on dp.produkt_burim=od.ProductID
	join Punonjes dpun on dpun.Pun_burim=o.EmployeeID
	join Klienti dk on dk.Klient_burim=o.CustomerID
	join Koha dko on (dko.Viti=YEAR(o.OrderDate) and dko.Muaji=month(o.orderdate))
group by dp.id,dk.id,dko.id,dpun.id
end
go

alter table KLINIKE_MJEKESORE.dbo.Fatura add nr_analizes int foreign key references Analiza (Nr_Analizes)
select f.SSN ,sum(f.CMIMI_ANALIZES+f.Pag_Doktorit) pagesa from KLINIKE_MJEKESORE.dbo.Fatura f group by f.SSN
select SSN,count(SSN) NR_PACIENTEVE FROM KLINIKE_MJEKESORE.dbo.Fatura GROUP BY SSN 
select a.SSN,count(a.Nr_Analizes) sasia FROM  KLINIKE_MJEKESORE.dbo.Analiza a GROUP BY a.nr_analizes,a.SSN




create procedure mbush_vizitat_fillim
as
begin
insert into vizitat(doktori,pacienti,analiza,koha,totali_pageses_muaj,nr_pacienteve_muaj,sasi_analizameshpeshte)
select dd.id doktori,dp.id pacient,da.id analiza,dk.id koha,
sum(F.CMIMI_ANALIZES+F.Pag_Doktorit) pagesa,count(F.SSN) SASI_PACIENT, 
count(F.nr_analizes) analiza
from  KLINIKE_MJEKESORE.dbo.Fatura F
join dim_doktori dd on dd.doktor_burim=F.Id_doktori
join dim_pacienti dp on dp.pacient_burim=F.SSN
join dim_analiza da on da.analiza_burim=F.nr_analizes
join koha dk on (dk.viti=YEAR(F.data_leshimit) and dk.muaji=month(F.data_leshimit))
group by dd.id,dp.id,da.id,dk.id
end 
go


////////insert ne tablene fatura 
insert into KLINIKE_MJEKESORE.dbo.Fatura(CMIMI_ANALIZES,Pag_Doktorit,SSN,data_leshimit,Nr_Recetes,Id_doktori,nr_analizes)
 values (20,25,4451234660,GETDATE(),202,'DD-45998498-58AL',6);

