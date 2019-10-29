select msisdn,to_char(datecreated,'dd-mon-yy hh24:mi') tt ,count(*) tt2
from g3_inboundgesmessages_pos
where msisdn not in(2348134748143,2348107528515,2348106857413,2349038813691,2348133939170)
group by msisdn, to_char(datecreated,'dd-mon-yy hh24:mi')

having count(*) > 1
order by 1 desc;