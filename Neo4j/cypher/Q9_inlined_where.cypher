Match (b2) <- [:PAYMENT_HANDLED_BEFORE_PERMIT_APPROVAL]
-(a:PrepaidtravelcostEvent)
-[:PAYMENT_HANDLED_BEFORE_APPROVAL] -> (:PrepaidtravelcostEvent)
Return count(distinct a.caseId);
