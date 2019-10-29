select * from g3_farmers_rollout;



797333 21


select distinct d.dealerid 
from g3_rout_wards_mapping d,g3_farmers_rollout r
where d.rolloutid = r.rolloutid
and   r.farmerid = 797333
and   r.rolloutid = 21;