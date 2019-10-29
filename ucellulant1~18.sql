select f.farmerid
from dry_rice_farmers_2014_redemp r,g3_farmers f
where r.stateid = f.stateid
and   r.lgaid   = f.lgaid
and   r.serial_number = f.serial_number
and   f.farmerid not in(select farmerid from g3_farmers_value_chain);