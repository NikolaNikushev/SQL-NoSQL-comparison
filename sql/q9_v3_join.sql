select count(distinct ptc.case_id)
from bpi_final.prepaidtravelcosts_event ptc
         left join bpi_final.prepaidtravelcosts_event ptc2 on (ptc2.case_id = ptc.case_id and
                                                               ptc2.activity = 'Request For Payment FINAL_APPROVED by SUPERVISOR')
         left join bpi_final.permit_log_entry_relationship ptc3
                   on (ptc3.travel_permit_id = ptc.permit_id and ptc3.activity = 'Permit FINAL_APPROVED by SUPERVISOR')
where ptc.activity = 'Payment Handled'
  and TO_TIMESTAMP(ptc.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS') >
      TO_TIMESTAMP(ptc2.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS')
  and TO_TIMESTAMP(ptc.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS') <
      TO_TIMESTAMP(ptc3.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS')
