create or replace function insert_complain (p_id in NUMBER)
return number
is
    l_count number;
begin
-- First, check to see if the user is in the user table


insert into g3_complaints(i_d)
values(p_id);

commit;

return 1;
  end;
  
  
  