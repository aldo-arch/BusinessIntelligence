
create procedure [dbo].[mbush_porosi_fillim3] as
begin


insert into dim_porosia (totali) values ('Totali i porosive') update dim_porosia set id_total=id


--mbushja e nivelit klient
 
insert into dim_porosia (id_total,totali,klient_name)

select distinct dp.id_total,dp.totali,isnull(p.emër,'I panjohur') from Albagame_DB1.dbo.Klientët p cross join dim_porosia dp


update dim_porosia set klient_ID=id where klient_name is not null


--Mbushja e nivelit porosi

insert into dim_porosia(id_total,totali,klient_ID,klient_name,porosi_id,emer_porosi,cmim_total,data,porosi_burim)

select d.id_total,d.totali,d.klient_ID,d.klient_name,dp.P_O_ID,dp.Emër, dp.çmimi_total,dp.P_O_date,dp.P_O_ID

from dim_porosia d join Albagame_DB1.dbo.Porosi dp on (d.klient_ID=dp.klient_ID)

end 
