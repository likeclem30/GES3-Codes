create table farmers_6digit_m as
  SELECT rn
             FROM   (SELECT ROWNUM AS rn
                FROM   DUAL
                CONNECT BY LEVEL <= 15999999)
            WHERE  rn >= 000001
            ORDER  BY DBMS_RANDOM.VALUE;​