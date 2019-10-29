create or replace function return_table (idr)
return t_nested_table as
  v_ret   t_nested_table;
begin
  v_ret  := t_nested_table();

  v_ret.extend;
  v_ret(v_ret.count) := t_col(idr, 'one');

 
  return v_ret;
end return_table;