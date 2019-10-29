create or replace function insert_complain (p_id in NUMBER)
return number
is
    l_count number;
begin
-- First, check to see if the user is in the user table
select count(*) into l_count from FARMERS_REDEMP where msisdn = p_sourceaddress;
     if l_count > 0 then
         --l_count := 1;
          return 1;
                else
                  return 0;
                  ----  l_count := 0;
    end if;
  end;