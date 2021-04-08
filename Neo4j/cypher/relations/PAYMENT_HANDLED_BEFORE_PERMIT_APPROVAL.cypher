match (handled:PrepaidtravelcostEvent {activity: 'Payment Handled' }),
(permitApproved:PrepaidtravelcostEvent {activity: 'Permit FINAL_APPROVED by SUPERVISOR' })
where datetime(
{ epochMillis: apoc.date.parse(handled.completeTimestamp,
'ms', 'yyyy-MM-dd HH:mm:ss.S') })
< datetime(
{ epochMillis: apoc.date.parse(permitApproved.completeTimestamp,
'ms', 'yyyy-MM-dd HH:mm:ss.S') })

and handled.caseId = permitApproved.caseId
Create (handled)
-[r:PAYMENT_HANDLED_BEFORE_PERMIT_APPROVAL]
->(permitApproved);
