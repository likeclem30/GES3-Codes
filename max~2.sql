create table fmers_8digits as
select to_char(trunc(dbms_random.value(0,99))*1000000+
               trunc(randomSeq.nextval/100)*10000+
               
               trunc(randomSeq.nextval/10)*100+
               
               trunc(dbms_random.value(0,99))*100+
               mod(randomSeq.currval,100),'00000000') ftoken
from data_sciences;