FUNCTION g3_fmers_stock_check_3_1 (p_dealerid in number,p_inputid in NUMBER)
return number
is
    l_stock_bal number;
    l_stock_bal_v number;

BEGIN
     BEGIN

select sum(nvl(quantity,0) - nvl(qty_decrease,0))  into l_stock_bal
from g3_stocklevel l,g3_agrodealers a,g3_inputs i
where l.agrodealerid = a.dealerid
and   l.inputid =  i.inputid
and   i.inputid =  p_inputid
and   a.dealerid = p_dealerid;

     
if l_stock_bal <> 0 then
     
     l_stock_bal_v := l_stock_bal ;
     
     else
       
    l_stock_bal_v := 0 ;

end if;


EXCEPTION
   WHEN others THEN
    l_stock_bal_v := 0;
END;
RETURN l_stock_bal_v;
END g3_fmers_stock_check_3_1;