select f.stateid,f.lgaid,f.wardid,count(*) tt
from g3_farmers f,g3_inboundgesmessages m
where f.msisdn = m.msisdn
group by f.stateid,f.lgaid,f.wardid;