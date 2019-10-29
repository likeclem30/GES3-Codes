FUNCTION g3_fmer_act_check_3_1 (p_farmerid in NUMBER, p_vcid in NUMBER)
return number
is
    l_bundleid number;
    l_bundleid_v number;
    
BEGIN
     BEGIN


    select distinct max(bundleid) into l_bundleid from g3_farmers_rollout where farmerid = p_farmerid and vcid = p_vcid;


     
if l_bundleid is not null then
     
     l_bundleid_v := l_bundleid ;
     
     else
       
    l_bundleid_v := 0 ;

end if;


EXCEPTION
   WHEN others THEN
    l_bundleid_v := 0;
END;
RETURN l_bundleid_v;
END g3_fmer_act_check_3_1; 