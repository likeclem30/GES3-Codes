SELECT  sum(tt) tt
from state_lga_ward_count s,g3_wards w,g3_rout_wards_mapping m
where s.wardid = w.wardid
and   s.wardid = m.wardid
and   m.dealerid = 1091;



select * from g3_rout_wards_mapping where dealerid = 1091;


select * from g3_rout_wards_mapping where lgaid = 129;

update g3_rout_wards_mapping
set dealerid = 1091
where rolloutid = 1777;

commit;