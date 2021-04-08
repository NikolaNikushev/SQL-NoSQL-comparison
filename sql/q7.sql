select count(distinct case_Id)
from bpi_final.permit_log_entry_relationship p
where activity in (
                   'Permit APPROVED by ADMINISTRATION',
                   'Permit APPROVED by BUDGET OWNER',
                   'Permit APPROVED by PRE_APPROVER',
                   'Permit APPROVED by SUPERVISOR',
                   'Permit FINAL_APPROVED by DIRECTOR',
                   'Permit FINAL_APPROVED by SUPERVISOR'
    )
  and TO_TIMESTAMP(complete_timestamp, 'YYYY/MM/DD HH24:MI:SS') <=
      TO_TIMESTAMP('2018-10-20 10:35:54.000', 'YYYY/MM/DD HH24:MI:SS')
  and TO_TIMESTAMP(complete_timestamp, 'YYYY/MM/DD HH24:MI:SS') >=
      TO_TIMESTAMP('2016-07-13 14:32:51.000', 'YYYY/MM/DD HH24:MI:SS')
