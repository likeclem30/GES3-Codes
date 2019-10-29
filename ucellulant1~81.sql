FUNCTION g3_fmer_Reg_check_3_1 (p_sourceaddress in NUMBER)
return number
is
    l_farmerid number;
    l_farmerid_v number;

BEGIN
     BEGIN
-- First, check to see if the user is in the user table
    
    select farmerid into l_farmerid from g3_farmers
    where msisdn = p_sourceaddress;

---CREATE INDEX g3_fieldstaff_ph_agd ON g3_fieldstaff (agrodealerid, phonenumber,stateid,lgaid);
---CREATE INDEX g3_agrodealers_ph_agd ON g3_agrodealers (phonenumber,stateid,lgaid);
     
if l_farmerid is not null then
     
     l_farmerid_v := l_farmerid ;
     
     else
       
    l_farmerid_v := 0 ;

end if;


EXCEPTION
   WHEN others THEN
    l_farmerid_v := 0;
END;

RETURN l_farmerid_v;

END g3_fmer_Reg_check_3_1;