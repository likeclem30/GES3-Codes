FUNCTION g3_fmer_cen_check_3_1 (p_farmerid in NUMBER, p_vcid in NUMBER)
return number
is
    l_dealerid number;
    l_dealerid_v number;
    
BEGIN
     BEGIN


select distinct d.dealerid into l_dealerid
from g3_rout_wards_mapping d,g3_farmers f
where d.stateid  = f.stateid
and   d.lgaid    = f.lgaid
and   d.wardid   = f.wardid
and   d.vcid     = p_vcid
and   f.farmerid = p_farmerid; 

--CREATE INDEX g3_farmers_sid_lid_wid ON g3_farmers (stateid,lgaid,wardid);

 ---   select distinct max(rolloutid) into l_dealerid from g3_farmers_rollout where farmerid = p_farmerid and vcid = p_vcid;


     
if l_dealerid is not null then
     
     l_dealerid_v := l_dealerid ;
     
     else
       
    l_dealerid_v := 0 ;

end if;


EXCEPTION
   WHEN others THEN
    l_dealerid_v := 0;
END;
RETURN l_dealerid_v;
END g3_fmer_act_check_3_1;   
