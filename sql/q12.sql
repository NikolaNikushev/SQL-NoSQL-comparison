select project_number, max(overspentamount)
from (
         select project_number, sum((replace(overspentamount, ',', '.') || 0)::float) as overspentamount
         from bpi_final.permit_entity pe2
         group by 1
     ) as result
group by 1
order by 2 DESC limit 1
