select concat(farmerid,',') fid,count(*) tt
from g3_farmers_value_chain
group by farmerid
order by 2 desc;


select count(*) tt from g3_farmers_value_chain;
--where farmerid = 2589473;

commit;


DELETE FROM g3_farmers_value_chain  WHERE ROWID NOT IN (SELECT   MIN (ROWID) FROM g3_farmers_value_chain GROUP BY farmerid)