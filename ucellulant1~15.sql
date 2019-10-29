select * 
from g3_reconcilation r,g3_states s,g3_lga l 
where r.stateid = s.stateid
and   r.lgaid   = l.lgaid
and   r.stateid = 20;


desc 

select dealername ,r.rcsl_total_fmers_rdm
from g3_agrodealers a,g3_reconcilation r
where a.dealerid = r.dealerid
and r.lgaid = 347;

dealername

select * from g3_lga where stateid = 20;

select sum(rcsl_total_fmers_rdm) tt from g3_reconcilation where lgaid = 347;

select dealerid ,rcsl_total_fmers_rdm from g3_reconcilation where lgaid = 347;

select dealerid  from g3_reconcilation where lgaid = 347;

select 