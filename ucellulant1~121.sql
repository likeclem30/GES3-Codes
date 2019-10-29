select STATENAME,
LGA,
lga_count wallet_count,
RCSL_TOTAL_FMERS_RDM,
total_fmer_rc_ew,

AVG_CS_V_PERCENTAGE,   
RID rc_count,      
TOTAL_EW_PAYLOAD,      
TOTAL_TRAN_EW_SD_FT,      
FMER_REDEEM_EW,     
AMOUNT_PAY_AGD_EW,     
RCSL_QTY_RDM,     
SCM_INVENT, 

RCSL_AGD_PAY,     
ADVISORY_NOTE_PAY,
round((nvl(rcsl_total_fmers_rdm,1)/nvl(total_fmer_rc_ew,1))*100,1) rcsl_total_fmer_ew_total_perc,
round((rcsl_total_fmers_rdm/nvl(total_ew_payload,1))*100,1) rcsl_t_fmer_ew_payload_perc,
round((rcsl_total_fmers_rdm/(FMER_REDEEM_EW+1)*100),1) rcsl_t_fmer_ew_rfmer_perc,
round((nvl(rcsl_total_fmers_rdm,1)/nvl(lga_count,1))*100,1) rcsl_fmer_wallet_total_perc,
round((advisory_note_pay/rcsl_agd_pay)*100,1) advisory_n_rcsl_agd_pay

from b_recon
where total_fmer_rc_ew <> 0 ;


select advisory_note_pay from b_recon order by 1;

update b_recon
set FMER_REDEEM_EW = 1
where FMER_REDEEM_EW = 0;

commit;