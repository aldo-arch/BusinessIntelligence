
create procedure mbush_punonjes_fillim1 as

begin

insert into dim_punonjes (totali) values ('Totali i punonjesve') update dim_punonjes set id_total=id

--mbushja e nivelit manaxher
 
insert into dim_punonjes (id_total,totali,emer_manaxher)

select distinct dp.id_total,dp.totali,isnull(p.emër,'I panjohur') from Albagame_DB1.dbo.Manaxherët p cross join dim_punonjes dp

update dim_punonjes set manaxher_ID=id where emer_manaxher is not null

--Mbushja e nivelit punonjes

insert into dim_punonjes(id_total,totali,manaxher_ID,emer_manaxher,punonjes_ID,emer_punonjes,punonjes_mbiemer,datelindje_punonjes,email_punonjes,numer_kontakti,punonjes_burim)

select d.id_total,d.totali,d.manaxher_ID,d.emer_manaxher,staf_ID, dp.emër, dp.mbiemër,dp.datëlindje,email,dp.numër_kontakti,staf_ID

from dim_punonjes d join Albagame_DB1.dbo.Punonjësit dp on (d.manaxher_ID=dp.man_ID)

end 

--ekzekutimi i procedurës

 exec mbush_punonjes_fillim1
