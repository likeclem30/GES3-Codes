begin
 for x in(select stateid,lgaid,tt from farmers_per_lga)
 loop
update b_recon
set lga_count = x.tt
where stateid = x.stateid
and   lgaid   = x.lgaid;

end loop;
commit;
end;


select nvl2(fmer_redeem_ew, from g3_reconcilation order by fmer_redeem_ew;

select * from b_recon;

select count(*) tt from dry_rice_farmers_2014_redemp
where stateid = 23;

select * from g3_states;