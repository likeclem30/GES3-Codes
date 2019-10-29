SELECT YEAR i,YEAR n
FROM (select 1990 YEAR from dual) YYYY
MODEL
  DIMENSION BY (YEAR)
  MEASURES (YEAR v)
  RULES UPSERT
  (v[FOR YEAR FROM 2012 TO 2020 INCREMENT 1] = 1)
order by 1 desc;