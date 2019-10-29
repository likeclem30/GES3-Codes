create table g4_fmer_total_rpt as
select f.stateid,count(f.farmerid) fmer_rpt
from g3_farmers f

---and   f.farmerid = t.FARMERID
group by f.stateid;

select sum(rout_rpt) tt
from g4_fmer_rout_rpt;


select * from g4_fmer_total_rpt order by 1;