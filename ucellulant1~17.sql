Declare 
f_request varchar2(100);
v_camid number;
v_camid2 number;

begin

select G3_COMPLAINTS_SEQ.nextval into v_camid from dual;


insert into g3_complaints(COMID,FULLNAME ,PHONENUMBER  ,SUBJECT ,DEPARTMENT  ,PRIORITY,MESSAGE ,ADMINNAME ,ADMINPHONE,DATEMODIFIED,DATECREATED)
                   values(v_camid,:FULLNAME,:PHONE,:SUBJECT,:DEPARTMENT,:PRIORITY,:MESSAGE,:ADMINNAME,:ADMINPHONE,systimestamp,systimestamp);



---returning :id into v_camid2;

commit;
:status := 'YES';

sys.htp.htmlopen;
  sys.htp.headopen;
  sys.htp.title('Farmers Redemption Details');
  sys.htp.headclose;
  sys.htp.bodyopen;




      sys.htp.print('Your Complain has been logged  ' || 'Successfully' || '<p/>');
      
      sys.htp.print('You will get a reply shortly      : ' || 'Thank You' || '<p/>');



sys.htp.print('ID : ' ||:ID || '<p/>');

sys.htp.print('STATUS : ' ||'YES'|| '<p/>');
   
      
     
      


sys.htp.print('</ul>');
  sys.htp.bodyclose;
  sys.htp.htmlclose;

end;