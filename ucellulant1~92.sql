select * from g3_value_chain;


Select distinct ges_year i,ges_year n 
from G4_STAT_SUB_ALLOC a,g4_value_chain v
where a.vcid = v.vcid;
---and   a.vcid = :P35_VCID

select a.ges_year,a.vcid
from G4_STAT_SUB_ALLOC a,g3_value_chain v
where a.vcid = v.vcid;

select distinct a.ges_year
from G4_STAT_SUB_ALLOC a,G3_VALUE_CHAIN v
where a.vcid = v.VCID;

select max(vcid) vc from g3_value_chain;

select * from  G4_STAT_SUB_ALLOC;

select initcap(inputname)  n,inputid i
from g4_inputs i
where i.inputid not in(
select inputid from G4_STAT_SUB_ALLOC  
where ges_year = :P35_GES_YEAR 
and   holder   = :P35_ESCROW_ACCT_ID
and   vcid     = :P35_VCID)
and i.inputtypeid = :P35_INPUTTYPE;
order by 1

select * from g4_inputs;