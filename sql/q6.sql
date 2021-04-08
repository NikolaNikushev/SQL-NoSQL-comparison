select max(difference)
from (
         select max(TO_TIMESTAMP(p2.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS')) -
                (min(TO_TIMESTAMP(p.complete_timestamp, 'YYYY/MM/DD HH24:MI:SS'))
                    ) as difference

         from bpi_final.permit_log_entry_relationship p
                  inner join bpi_final.permit_log_entry_relationship p2
                             on (p.case_id = p2.case_id and p.activity = 'Start trip' and p2.activity = 'End trip')
         group by p.case_id
     )
         as result
