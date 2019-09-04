create procedure mbush_FAKT_blerje_fillim3 as

begin

insert into FAKT_blerje(id_punonjes,id_porosi,id_produkt,id_koha,xhiro_mujore,numri_porosi_mujore) 
select dp.id dim_punonjes,dd.id dim_porosia,da.id dim_produkt,dk.id dim_koha,

sum(F.Vlera) xhiro_mujore,count(F.porosi_ID) numri_porosi_mujore
from Albagame_DB1.dbo.Blerje F 

join dim_porosia dd on dd.porosi_burim = F.porosi_ID join dim_punonjes dp on dp.punonjes_burim=F.staf_ID

join dim_produkt da on da.produkt_burim = F.produkt_ID

join dim_koha dk on (dk.viti=YEAR(F.data_blerje) and dk.muaji=month(F.data_blerje)) group by dd.id,dp.id,da.id,dk.id

end

exec mbush_FAKT_blerje_fillim3
