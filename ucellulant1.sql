select count(*) tt 
from g3_inboundgesmessages
where msisdn = 2348163781392
and processedid is null;


select * from g3_inboundgesmessages
--set processedid = null
where msisdn = 2348052415786;


update g3_inboundgesmessages
set processedid = null
where msisdn = 2347036003877;

commit;

