Select upper(res_typename) v,res_typeid i
from g3_response_type
;

select * from G3_RESPONSES;

select res_typeid
from g3_responses
group by res_typeid
having count(*) > 2;

select count(*) tt from dry_rice_farmers_2014_redemp;