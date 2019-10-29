select count(r.stateid) tt
---,r.lgaid,r.wardid,r.serial_number
from dry_rice_farmers_2014_redemp r,g3_farmers f
where r.stateid = f.stateid
and   r.lgaid   = f.lgaid
and   r.serial_number <> f.serial_number
and   r.lgaid = 100
and   r.stateid = 5
and   r.processedid is null;
--order by 4
---and   f.farmerid not in(select farmerid from g3_farmers_value_chain);