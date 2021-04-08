select count(distinct p.case_id)
from bpi_final.permit_log_entry_relationship p
         left join bpi_final.internationaldeclaration_event ide
                   on (ide.permit_id = p.case_id and ide.activity = 'Declaration SUBMITTED by EMPLOYEE')
where p.activity in (
                     'Permit FINAL_APPROVED by DIRECTOR',
                     'Permit FINAL_APPROVED by SUPERVISOR'
    )

  and p.complete_timestamp < ide.complete_timestamp
