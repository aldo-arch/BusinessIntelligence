create procedure mbush_produkt_fillim as

begin

--mbushja e nivelit total

insert into dim_produkti (totali) values ('Totali i produkteve') update dim_produkti set id_total=id

--mbushja e nivelit kategori
 
insert into dim_produkti (id_total,totali,kategori_name)

select distinct dp.id_total,dp.totali,isnull(p.category_name,'I panjohur') from Albagame_DB1.dbo.Kategoritë p cross join dim_produkt dp

update dim_produkt set kategori_ID=id where kategori_name is not null

--mbushja e nivelit filial
insert into dim_produkti(id_total,totali,kategori_id,kategoria,filial_emer)
select d.id_total,d.totali,d.kategori_ID,d.kategori_name,isnull(f.emër,'I panjohur') from Albagame_DB1.dbo.Filialet f cross join dim_produkt dp

--Mbushja e nivelit produkt

insert into dim_produkti(id_total,totali,kategori_ID,kategori_name,filial_ID,filial_emer,emer_produkt,pershkrim_produkti,cmim_produkt,tip_produkt,produkt_burim)

select d.id_total,d.totali,d.kategori_id,d.kategoria,d.filial_ID,d.filial_emer, dp.product_name,dp.përshkrim_produkti,dp.tipi,dp.produkt_ID

from dim_produkt d join Albagame_DB1.dbo.Produktet dp on (d.kategori_ID=dp.category_id)

order by d.kategori_name,dp.category_name

end
