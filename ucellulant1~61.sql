create or replace function return_table 
return t_nested_table as
  v_ret   t_nested_table;
begin
  v_ret  := t_nested_table();

  v_ret.extend;
  v_ret(v_ret.count) := t_col(1, 'one');

  v_ret.extend;
  v_ret(v_ret.count) := t_col(2, 'two');

  v_ret.extend;
  v_ret(v_ret.count) := t_col(3, 'three');

  return v_ret;
end return_table;