select STATENAME,
LGA,
total_fmer_rc_ew,
AVG_CS_V_PERCENTAGE,   
RID,      
TOTAL_EW_PAYLOAD,      
TOTAL_TRAN_EW_SD_FT,      
FMER_REDEEM_EW,     
AMOUNT_PAY_AGD_EW,     
RCSL_TOTAL_FMERS_RDM,     
RCSL_QTY_RDM,     
SCM_INVENT, 

RCSL_AGD_PAY,     
ADVISORY_NOTE_PAY,
round((nvl(rcsl_total_fmers_rdm,1)/nvl(total_fmer_rc_ew,1))*100,1) rcsl_total_fmer_ew_total_perc,
round((rcsl_total_fmers_rdm/nvl(total_ew_payload,1))*100,1) rcsl_t_fmer_ew_payload_perc,

from b_recon
where total_fmer_rc_ew <> 0 ;


--order by 15 desc;






create table b_recon as
select statename,replace(translate(upper(lganame),'~1234567890','~'),'_','') lga,
sum(nvl(total_fmer_rc_ew,1)) total_fmer_rc_ew,
round(avg(cs_verification),1) avg_cs_v_percentage,
count(distinct rolloutid) rid,
sum(nvl(fmer_payload,1) + nvl(dealer_payload,1)) total_ew_payload,
sum(nvl(total_tran_ew,1)) total_tran_ew_sd_ft,
nvl(sum(nvl(fmer_redeem_ew,1)),1) fmer_redeem_ew,
--total_ew_payload - fmer_redeem_ew fmer_fail_redeem_ew, 
---sum(nvl(epay_seed_fert,0)) epay_seed_fert,
sum(nvl(amount_pay_agd_ew,1)) amount_pay_agd_ew,
sum(nvl(rcsl_total_fmers_rdm,1)) rcsl_total_fmers_rdm,
sum(nvl(rcsl_qty_rdm,1)) rcsl_qty_rdm,
sum(nvl(rcsl_scm_field_inv,1)) scm_invent,
sum(nvl(rcsl_agd_pay,1)) rcsl_agd_pay,
sum(nvl(cs_v_pay,1)) Advisory_note_pay

from g3_reconcilation r,g3_states s,g3_lga l
where r.stateid = s.stateid
and   r.lgaid   = l.lgaid
group by statename,lganame
order by 1,2;
select statename,lga,rcsl_total_fmers_rdm,total_fmer_rc_ew from b_recon order by 4;