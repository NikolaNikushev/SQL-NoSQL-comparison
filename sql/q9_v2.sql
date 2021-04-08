select count(distinct ptc.case_id)
from bpi_final.prepaidtravelcosts_event ptc
where ptc.activity = 'Payment Handled'
  and TO_TIMESTAMP(ptc.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS') > (
    select TO_TIMESTAMP(ptc2.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS')
    from bpi_final.prepaidtravelcosts_event ptc2
    where ptc.case_id = ptc2.case_id
      and ptc2.activity = 'Request For Payment FINAL_APPROVED by SUPERVISOR'
)
  and TO_TIMESTAMP(ptc.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS') < (
    select TO_TIMESTAMP(pler.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS')
    from bpi_final.permit_log_entry_relationship pler
    where ptc.permit_id  = pler.travel_permit_id
      and pler.activity = 'Permit FINAL_APPROVED by SUPERVISOR'
    order by complete_timestamp desc
    limit 1
    )
