select count(distinct pler.dec_number)
from bpi_final.prepaidtravelcosts_event pe
         inner join bpi_final.permit_log_entry_relationship pler on (pler.case_id = pe.permit_id)
where pler.dec_number in (
    select de.declarationnumber dec_number
    from bpi_final.domesticdeclaration_event de
    where de.activity in (
                          'Declaration FINAL_APPROVED by DIRECTOR',
                          'Declaration FINAL_APPROVED by SUPERVISOR'
        )
    union
    select ie.declarationnumber dec_number
    from bpi_final.internationaldeclaration_event ie
    where ie.activity in (
                          'Declaration FINAL_APPROVED by DIRECTOR',
                          'Declaration FINAL_APPROVED by SUPERVISOR'
        )
)
