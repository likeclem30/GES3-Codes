create table fmers_10digit_id as
select to_char(trunc(dbms_random.value(0,9999999999),0),'000000') ids
from data_sciences;

select * from fmers_10digit_id order by 1;


Oracle_11g