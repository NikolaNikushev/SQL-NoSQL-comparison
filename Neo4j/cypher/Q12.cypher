match (a:PermitEntity)
WITH a, sum(toFloat(a.overspentamount)) as overspentTotal
RETURN a.projectNumber, max(overspentTotal) as overspent
order by overspent DESC
LIMIT 1;
