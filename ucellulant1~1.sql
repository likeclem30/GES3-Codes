declare
BEGIN
  FOR item IN (
    select replace(messagecontent,')','') as newMsg,INBOUNDGESMESSAGEID
    from g3_inboundgesmessages where sourceaddress=2348032207536
  )
 LOOP
  update g3_inboundgesmessages set messagecontent= item.newMsg where inboundgesmessageid=item.INBOUNDGESMESSAGEID;
  END LOOP;
END;


