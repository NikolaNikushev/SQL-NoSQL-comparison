select count(*)
from bpi_final.permit_entity pe
where overspent = 'true'
  and (replace(overspentamount, ',', '') || 0)::float > 0.15 * (replace(requestedbudget , ',' ,'') || 0)::float
