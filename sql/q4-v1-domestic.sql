select count(distinct de1.case_id)
from bpi_final.domesticdeclaration_event de1,
     bpi_final.domesticdeclaration_event de2
where de1.activity = 'Declaration APPROVED by PRE_APPROVER'
  and de2.activity = 'Declaration FINAL_APPROVED by SUPERVISOR'
  and de1.complete_timestamp < de2.complete_timestamp
  and de2.case_id = de1.case_id
