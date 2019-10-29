select 
t.TRANSACTIONID   ,        
t.CREDIT                   ,        
t.DEBIT                    ,        
t.BUNDLECONTENTID          ,        
t.BUNDLEID                 ,        
t.REQUESTID                ,        
replace(replace(STATUSID,1,'SUCCESSFUL'),2,'PENDING') Statusid                ,        
t.SERVICEID                ,        
i.INPUTname INPUTS                  ,        
upper(replace(replace(replace(f.f_name,'<',null),'_',' '),'null',' ')) Debit_Fmer                ,        
upper(a.dealername) CreditDEALER                 ,        
t.SUPPLIERID               ,        
t.PHONEnumber            ,        
t.ROLLOUTID                ,        
t.FIELDSTAFFID             ,        
t.AMOUNT                   ,        
t.INSERTEDBY               ,        
t.DATEMODIFIED             ,  
t.DATEMODIFIED     TimeModified        , 
t.DATECREATED              ,  
t.VCID                     ,        
t.REMARKS                  , 
t.PAYLOAD                  , 
t.SOURCEADDRESS,
s.statename,
l.lganame            
from g3_transactions t,g3_inputs i,g3_agrodealers a,g3_farmers f,g3_states s,g3_lga l
where t.inputID = i.inputID(+) 
and  t.dealerid =  a.dealerid(+)
and  t.farmerid = f.farmerid(+)
and  f.stateid = s.stateid(+)
and  f.lgaid  = l.lgaid(+)
and upper(t.payload) not like 'GES%' 
and  to_char(t.datecreated,'DAY') = to_char(sysdate,'DAY');
