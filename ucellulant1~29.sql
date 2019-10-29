SELECT ROWNUM-6 mydigit FROM dual
CONNECT BY LEVEL <= 10000000
order by dbms_random.random