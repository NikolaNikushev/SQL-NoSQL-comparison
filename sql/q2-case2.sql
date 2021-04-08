select count(distinct pr1.case_id)
from bpi_final.permit_log_entry_relationship pr1,
     bpi_final.permit_log_entry_relationship pr2
where pr1.activity = 'End trip'
  and pr2.activity = 'Declaration SUBMITTED by EMPLOYEE'
  and pr1.dec_number = pr2.dec_number
  and (pr1.complete_timestamp < pr2.complete_timestamp or pr1.complete_timestamp > pr2.complete_timestamp)
  and pr1.case_id = pr2.case_id
;
