select 'ID','STATUS','NO' from dual;

create table g3_recon_jigawa_0203_02_15_bk as select ;
delete from g3_reconcilation where stateid = 18;

commit;

declare
obj json := json();
begin
obj.put(’test’, json_value(’function() {return 1;}’, esc => false ));
obj.print;
end;




insert into g3_complaints(COMID,FULLNAME ,PHONENUMBER  ,SUBJECT ,DEPARTMENT  ,PRIORITY,MESSAGE ,ADMINNAME ,ADMINPHONE,DATEMODIFIED,DATECREATED)
                   values(G3_COMPLAINTS_SEQ.nextval,:FULLNAME,:PHONE,:SUBJECT,:DEPARTMENT,:PRIORITY,:MESSAGE,:ADMINNAME,:ADMINPHONE,systimestamp,systimestamp);

commit;


select * from g3_recon_jigawa_0203_02_15_bk;