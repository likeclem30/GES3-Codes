select count(*) tt from g3_farmers_rollout where farmerid not in(select farmerid from g3_farmers);