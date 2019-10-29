create table g4_fmer_recon_rpt as
select stateid,sum(rcsl_agd_pay) agd_pay 
from g3_reconcilation
group by stateid
order by 1;

create table g4_fmer_tran_rpt as
select f.stateid,count(t.farmerid) tran_rpt
from g3_transactions t,g3_farmers f
where t.farmerid = f.farmerid
group by f.stateid;

drop table g4_fmer_tran_rpt;

delete from g3_reconcilation
where reconid = 2897;


select * from g4_fmer_recon_rpt;


select * from g4_fmer_tran_rpt;