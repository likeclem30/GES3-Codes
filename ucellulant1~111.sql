select distinct d.dealerid 
from g3_rout_wards_mapping d,g3_farmers r
where d.rolloutid = r.rolloutid
and   r.farmerid = 797333
and   r.rolloutid = 21;



select * from g3_rout_wards_mapping;

CREATE INDEX g3_farmers_sid_lid_wid ON g3_farmers (stateid,lgaid,wardid);


select distinct d.dealerid
from g3_rout_wards_mapping d,g3_farmers f
where d.stateid  = f.stateid
and   d.lgaid    = f.lgaid
and   d.wardid   = f.wardid
and   d.vcid     = 1
and   f.farmerid = 797333; 