create or replace function return_table(idr in number) return t_nested_table as
  v_ret   t_nested_table;
begin
  v_ret  := t_nested_table();

  v_ret.extend;
  v_ret(v_ret.count) := t_col(idr  ID2,'YES' status);
  
  
---select  :ID  ID,'YES' status from dual
  
  return v_ret;
end return_table;