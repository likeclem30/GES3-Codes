----EXPLAIN PLAN FOR
----create table g4_tran_fmers_count_rpt as
SELECT s.statename,count(f.farmerid) Total_Farmers, count(t.farmerid) Transaction_total
from g3_transactions t,g3_farmers f,g3_states s
where t.farmerid = f.farmerid
and   f.stateid  = s.stateid
group by s.statename;

1610975

8807119
select * from g3_reconcilation;

select s.statename,count(distinct f.farmerid) farmers_count,count(distinct r.farmerid) farmers_Activation,
count(distinct t.farmerid) farmers_trans
from g3_transactions t,g3_farmers_rollout r,g3_farmers f,g3_states s
where t.farmerid = r.farmerid
and   t.farmerid = f.farmerid
and   f.stateid  = s.stateid
group by s.statename
order by 1;

select count(distinct r.farmerid) ts
from  g3_farmers_rollout r;


