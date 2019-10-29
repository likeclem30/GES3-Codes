declare 
  ret json;
begin
  ret := json_dyn.executeObject('select * from g3_states');
  ret.print;
end;