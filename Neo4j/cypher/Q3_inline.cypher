match (pe:PermitEntity {overspent: 'true' })
where toFloat(pe.overspentamount) > 0.15 * toFloat(pe.requestedbudget)

return count(*);

