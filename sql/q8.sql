select count(distinct case_id)
from bpi_final.permit_log_entry_relationship p
where activity in (
                   'Permit FINAL_APPROVED by DIRECTOR',
                   'Permit FINAL_APPROVED by SUPERVISOR'
    )
  and p.complete_timestamp < (
    select complete_timestamp
    from bpi_final.permit_log_entry_relationship p2
    where p2.activity = 'Declaration SUBMITTED by EMPLOYEE'
      and p2.case_id = p.case_id
    limit 1
    )
