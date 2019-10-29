create or replace PROCEDURE g4_Insert_2_fmer_rout (p_ges_year PLS_INTEGER,p_FARMERS_CON PLS_INTEGER,p_REDEMP_FARMERID varchar2,p_MSISDN PLS_INTEGER,p_farmerid PLS_INTEGER,p_serial_number PLS_INTEGER,p_wardid PLS_INTEGER,p_ROLLOUTID PLS_INTEGER,p_ROLLOUTNAME varchar2,p_REDEMP_CENTER varchar2,p_ROLLOUTDATE timestamp,p_BUNDLEID PLS_INTEGER,p_VCID PLS_INTEGER,p_STATEID PLS_INTEGER,p_LGAID PLS_INTEGER,p_DEALERID PLS_INTEGER,p_FIELDSTAFFID PLS_INTEGER,p_ROLLOUTSTATUS varchar2,p_RES_TYPEID PLS_INTEGER )
is

    PRAGMA AUTONOMOUS_TRANSACTION;

v_result PLS_INTEGER;
msg_response PLS_INTEGER;
v_bundle_total PLS_INTEGER;


v_first_msg varchar2(500);
v_second_msg varchar2(500);
v_third_msg varchar2(500);

v_first_msg_sent varchar2(500);
v_second_msg_sent varchar2(500);
v_third_msg_sent varchar2(500);

x_bundle_sub PLS_INTEGER;
stmt_name varchar2(3000) ;

begin
   
 stmt_name := '1.select g4_farmer_bundle_sub(p_STATEID,p_BUNDLEID) into x_bundle_sub from dual ';

 select g4_farmer_bundle_sub(p_STATEID,p_BUNDLEID,p_ges_year,p_vcid) into x_bundle_sub from dual;
 

stmt_name := '2.insert into g3_farmers_rollout ';

insert into g3_farmers_rollout(farmerid,rolloutid,bundleid,vcid,rolloutdate)
                        values(p_farmerid,p_ROLLOUTID,p_BUNDLEID,p_VCID,p_ROLLOUTDATE);
                        --commit;
                  
                          
            -------if length(nvl(p_MSISDN,0)) = 13 then
                
                stmt_name := '3.g4_response_rout (p_FARMERS_CON ,p_MSISDN,p_farmerid ';
                
               

                g4_response_rout (p_FARMERS_CON ,p_REDEMP_FARMERID,p_MSISDN,p_farmerid,p_serial_number ,p_wardid ,p_ROLLOUTID ,p_ROLLOUTNAME,p_REDEMP_CENTER,p_ROLLOUTDATE,p_BUNDLEID,p_VCID,p_STATEID,p_LGAID,p_DEALERID,p_FIELDSTAFFID,p_ROLLOUTSTATUS,p_RES_TYPEID,x_bundle_sub );

             
           ------- end if;
        
 exception
    when others then
    g4_write_log( SQLCODE,SQLERRM,stmt_name);
    ROLLBACK;
    RAISE; 
END;