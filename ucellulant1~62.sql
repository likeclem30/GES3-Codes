select concat('234',ltrim(to_char(08035837542), '0')) tt from dual;

select * from G4_STAT_SUB_ALLOC;

select sub_amount tt
from G4_STAT_SUB_ALLOC
where ges_year = 2014
and   vcid     = 1
and   holder   = 12;


declare
v_exist number;
begin
begin
select sub_amount into v_exist
from G4_STAT_SUB_ALLOC
where ges_year = :P30_GES_YEAR
and   vcid     = :P30_VCID
and   holder   = :P30_HOLDER;
exceptions
when others then
v_exist := 0;
end;

if v_exist > 0 then
   raise_application_error (-20001,'The Subsidy for these value change and year exist.');
end if;
end;