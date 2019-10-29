create table farmers_per_lga as
select stateid,lgaid,count(*) tt
from g3_farmers
group by stateid,lgaid;



select * from farmers_per_lga;