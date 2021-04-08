match (pe:PermitEntity)
where pe.overspent = 'true' and toFloat(pe.overspentamount) > 0.15 * toFloat(pe.requestedbudget)

return count(*);

