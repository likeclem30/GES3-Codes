SET SERVEROUTPUT ON
declare
 l_num number;
 begin
 l_num := dbms_random.random;
 dbms_output.put_line(l_num);
 dbms_random.seed('67890');
 l_num := dbms_random.random;
 dbms_output.put_line(l_num);
 end;