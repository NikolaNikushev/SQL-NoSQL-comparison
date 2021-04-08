select count(distinct pler.dec_number)
from bpi_final.permit_log_entry_relationship pler
         left join bpi_final.prepaidtravelcosts_event pe on (pe.permit_id = pler.case_id)
         left join bpi_final.domesticdeclaration_event de
                   on (de.declarationnumber = pler.dec_number and
                       de.activity in (
                                       'Declaration FINAL_APPROVED by DIRECTOR',
                                       'Declaration FINAL_APPROVED by SUPERVISOR'
                           ))
         inner join bpi_final.internationaldeclaration_event ie
                    on (ie.declarationnumber = pler.dec_number and
                        ie.activity in (
                                        'Declaration FINAL_APPROVED by DIRECTOR',
                                        'Declaration FINAL_APPROVED by SUPERVISOR'
                            ))
where pe.id is null
