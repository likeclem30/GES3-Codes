select * from g3_fieldstaff
where fieldstaffid in(2166,2167);


select 'Hello ' || {person} || ' from APEX' greeting from dual;


select 'Hello ' || :person || ' from APEX' greeting from dual;

SELECT * from table AS JSON;

gallery values(:name,:contentType,:body)

create table gallery(
fname varchar2(50),
fcontent varchar2(50),
fbody    varchar2(50));