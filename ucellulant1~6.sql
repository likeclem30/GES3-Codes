FUNCTION g3_fmer_b_input_check_3_1 (p_bundleid in number,p_inputid in number)
return number
is
    l_inputname number;
    l_inputname_v number;

    ---:= cast(p_bundleid as number);

BEGIN
     BEGIN
--First, check to see if the user is in the user table

--p_bundleid_n  := g3_Redemption_3_1_0.str2num_3_1_0(p_bundleid);


select distinct i.inputid into l_inputname from g3_bundlecontents b,g3_inputs i
where b.inputid =  i.inputid
and   b.bundleid = p_bundleid
and   b.inputid  = p_inputid;

     
if l_inputname is not null then
     
     l_inputname_v := l_inputname ;
     
     else
       
    l_inputname_v := 0 ;

end if;


EXCEPTION
   WHEN others THEN
    l_inputname_v := 0;
END;
RETURN l_inputname_v;
END g3_third_p_b_input_check_3_1;