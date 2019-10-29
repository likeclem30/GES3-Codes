select statename,sum(fmer_rpt) frpt,sum(tran_rpt) t_rpt,sum(rout_rpt) r_rpt,sum(agd_pay) agd_pay
from g4_fmer_tran_rpt t,g4_fmer_rout_rpt r,g4_fmer_recon_rpt f,g4_fmer_total_rpt a,g3_states s
where t.stateid = r.stateid
and   t.stateid = f.stateid
and   t.stateid = a.stateid
and   t.stateid  = s.stateid
---and   t.stateid  =  
group by statename
order by 1;