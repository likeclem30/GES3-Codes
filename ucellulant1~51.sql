PROCEDURE fmer3strToken_3_1(requestid IN number,request_total IN number,SOURCEADDRESS IN number,rToken IN varchar2, l_req_item varchar2,l_vcid number) IS
 
 fmerstr g3_Redemption_3_1_0.t_array;  
 
 l_req_item2       varchar2(30);
 l_req_item_n2     number;
 fmerid_reg         number;
 agdid_reg_did     number;

 fmer_agdid_cen     number;
 l_req_item_n       number;
 agdid_cen_fid      number;  
 fmer_act_bid       number;
 agd_f_act_rid      number;
 fmer_b_input_chk   number;
 agd_stock_bal      number;
 agd_fmer_cdit_bal  number;

 l_stateid         number;
 l_lgaid           number;
 l_full_sn         number;
 l_kword           varchar2(10);
 l_inputid         number;

BEGIN
    
     fmerstr         := g3_Redemption_3_1_0.split_3_1_0(rToken,' ');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
     
if is_number(l_req_item) = 'N' then
    
     --l_req_item_n   := g3_Redemption_3_1_0.str2num_3_1_0(l_req_item);
    
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
    
for i in 1..fmerstr.count
    loop
    
l_req_item2 := regexp_replace(fmerstr(i) ,'[[:space:]]*','');
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

if i = 1 then
    dbms_output.put_line('This is a Transaction type keyword '||fmerstr(i)||' PROCESSING ABORTED');
    continue;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

else
    dbms_output.put_line('This is not a Transaction type keyword '||fmerstr(i)||' check if is farmerid PROCESSING CONTINUE');     
   if l_req_item2 = l_req_item then
       dbms_output.put_line('This is a Farmer id : '||fmerstr(i)||'Not an Input. ABORTED');
    continue;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

else
    dbms_output.put_line('Processing can continue because this is not a farmer id but input '||fmerstr(i)||'Valid input pass! processing Inprogress');
fmerid_reg      := g3_Redemption_3_1_0.g3_fmer_Reg_check_3_1(SOURCEADDRESS);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

if  fmerid_reg = 0 then
    
    dbms_output.put_line('The farmer is not available\Registered in GES for Processing :'||fmerstr(i)||' ABORTED! Farmer Registration Fail');
--agd_reg_3_1_0(SOURCEADDRESS,request_total,requestid,l_req_item_n,l_vcid,l_req_item2);   


    
continue;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

else
    
 dbms_output.put_line('The Farmer is Registered/ available for Processing :'||fmerstr(i)||' Farmer Registration pass! Continue Processing ');
 fmer_agdid_cen      := g3_Redemption_3_1_0.g3_fmer_cen_check_3_1(fmerid_reg,l_vcid);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

if fmer_agdid_cen  = 0 then
    
 dbms_output.put_line('The Farmer is not in any center for this value chain :'||fmerstr(i)||' ABORTED! Farmer center fail ');
dbms_output.put_line('The Farmer id is  fmerid_reg:'||fmerid_reg||' and Agrodealer id : '||fmer_agdid_cen||'value chain id '||l_vcid);
--agd_act_3_1_0(SOURCEADDRESS,request_total,requestid,agdid_reg,l_req_item_n,l_vcid,l_req_item2);    

continue;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

else
    fmer_act_bid  := g3_Redemption_3_1_0.g3_fmer_act_check_3_1(fmerid_reg,l_vcid);
   dbms_output.put_line('The farmer has a center for this value chain Farmer id :'||fmerid_reg||' RC  pass! vcid :'||l_vcid ||' Continue Processing ');

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

if fmer_act_bid = 0 then
    dbms_output.put_line('The Farmer is not activated for this value chain. value chain id :'||l_vcid||' ABORT! Activation  Fail ');

--agd_fmer_cen_3_1_0(SOURCEADDRESS,request_total,requestid,agdid_reg,l_req_item_n,agdid_act ,l_vcid,l_req_item2);    
    
continue;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

else
  dbms_output.put_line('The Farmer is activated value chain id :'||l_vcid||' Activation pass! bundle id : '||fmer_act_bid||' Continue Processing ');
/*
 agd_f_act_rid := g3_Redemption_3_1_0.g3_third_p_f_act_check_3_1 (agdid_cen_fid,agdid_act,l_vcid);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

if agd_f_act_rid = 0 then
 dbms_output.put_line('The Farmer IS NOT ACTIVATED for this Value chain. Farmer id :'||agdid_cen_fid||'value chain key :'|| l_vcid||' ABORT.Activation for the requested VC fail ');
--agd_fmer_actn_3_1_0(SOURCEADDRESS,request_total,requestid,agdid_reg,l_req_item_n,agdid_cen_fid,agdid_act ,agd_f_act_rid,l_vcid,l_req_item2);    

continue;    
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

else
 dbms_output.put_line('The Farmer IS ACTIVATED for this Value chain. Farmer id :'||agdid_cen_fid||'value chain key :'|| l_vcid||'Rollout id :'||agd_f_act_rid ||' Continue Processing');
*/
begin
select distinct inputid into l_inputid from g3_inputs where keyword = l_req_item2;
exception
    when others then
    l_inputid := 0;
end;
dbms_output.put_line('This is the inputid :'||l_inputid);
    
    
 fmer_b_input_chk := g3_Redemption_3_1_0.g3_fmer_b_input_check_3_1(fmer_act_bid,l_inputid);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

if fmer_b_input_chk = 0 then
    dbms_output.put_line('There is no such input in the Farmer bundle :'||fmerstr(i)||' Same as '||l_req_item2||' ABORT! Invalid Bundle input ');

--agd_invalid_input_3_1_0(SOURCEADDRESS,request_total,requestid,agdid_reg,l_req_item_n,agdid_cen_fid,agdid_act ,agd_f_act_rid,l_vcid,l_req_item2);    

dbms_output.put_line('Bundle id :'||fmer_act_bid||' No of request :'||request_total||' Request id :'||requestid||' Seria No :'||l_req_item ||' Dealer id'||agdid_reg ||'Payload :'||l_req_item2||' ABORT! Invalid Bundle input ');

dbms_output.put_line('Farmer id :'||fmerid_reg||' Input id  :'||l_inputid||' bundle id :'||fmer_act_bid||' vc id :'||l_vcid ||' input id function'||fmer_b_input_chk||' ABORT! Invalid Bundle input ');

continue;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

else
    dbms_output.put_line('This input is in the Farmer bundle :'||fmerstr(i)||' Same as'||l_req_item2||'Bundle pass! Continue Processing');
agd_stock_bal := g3_Redemption_3_1_0.g3_third_p_stock_check_3_1(agdid_reg,l_inputid);
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

if agd_stock_bal <=0 then
    dbms_output.put_line('The Agrodealer input stock bal is insufficient the inventory bal is :'||agd_stock_bal||' The input is '||l_inputid||'Abort! Stock Inventory Fail');

--agd_stock_fail_3_1_0(SOURCEADDRESS,request_total,requestid,agdid_reg,l_req_item_n,agdid_cen_fid,l_inputid,agdid_act ,agd_f_act_rid,l_vcid,l_req_item2);    
continue;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
   
else
    dbms_output.put_line('The Agrodealer input stock bal is enough.The inventory bal is :'||agd_stock_bal||' The input is '||l_inputid||'Stock pass! Continue Processing');

   agd_fmer_cdit_bal := g3_Redemption_3_1_0.g3_third_p_acct_bal_3_1(agdid_cen_fid);  
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   

if agd_fmer_cdit_bal <= 0 then
    dbms_output.put_line('The Farmer has insufficient credit bal.Bal is :'||agd_fmer_cdit_bal||' The inputid is '||l_inputid||' Farmer id :'||agd_fmer_cdit_bal||'Abort Credit Fail');

  ---  agd_fail_cdit_3_1_0(SOURCEADDRESS,request_total,requestid,agdid_reg,l_req_item_n,agdid_cen_fid,l_inputid,agdid_act ,agd_f_act_rid,l_vcid,l_req_item2,agd_fmer_cdit_bal);    
continue;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------    
else
    dbms_output.put_line('The Farmer has sufficient credit bal.Bal is :'||agd_fmer_cdit_bal||' The input is '||l_inputid||' Farmer id :'||agdid_cen_fid||' Credit Pass Continue Processing');
     --agd_successful_3_1_0(SOURCEADDRESS,request_total,requestid,agdid_reg,l_req_item_n,agdid_cen_fid,l_inputid,agdid_act ,agd_f_act_rid,l_vcid,l_req_item2);    
    
    
end if;    
end if;
end if;
end if;
end if;    
end if;    
end if;    
end if;
end if;

--*/
   
end loop;

else
    
    agd_syntax_3_1_0(SOURCEADDRESS,request_total,requestid,l_req_item,l_vcid,rToken);   

   dbms_output.put_line('The Farmer Id is incorrect.Return Syntax error');
end if;
    
END fmer3strToken_3_1;
