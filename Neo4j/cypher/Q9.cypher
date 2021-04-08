Match (a:PrepaidtravelcostEvent)-[r:PAYMENT_HANDLED_BEFORE_APPROVAL]->(b1:PrepaidtravelcostEvent),
 (a)-[r2:PAYMENT_HANDLED_BEFORE_PERMIT_APPROVAL]->(b2)
Return count(distinct a.caseId);
