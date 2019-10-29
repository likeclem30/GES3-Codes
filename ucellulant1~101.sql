select * from g3_farmers_value_chain;

farmerid,stateid,lgaid,wardid,vcid,serial_number

insert into g3_farmers_value_chain(fvcid ,farmerid  ,stateid  ,lgaid  ,wardid  ,vcid,serial_number)
select G3_FARMERS_VALUE_CHAIN_SEQ.nextval,f.farmerid,f.stateid,f.lgaid,f.wardid,61  ,f.serial_number
from dry_rice_farmers_2014_redemp r,g3_farmers f
where r.stateid = f.stateid
and   r.lgaid   = f.lgaid
and   r.serial_number = f.serial_number
and   f.farmerid not in(select farmerid from g3_farmers_value_chain);