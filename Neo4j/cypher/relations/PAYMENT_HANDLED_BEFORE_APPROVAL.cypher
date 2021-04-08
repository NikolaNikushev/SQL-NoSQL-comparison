match (handled:PrepaidtravelcostEvent {activity: 'Payment Handled'}),
(approval:PrepaidtravelcostEvent {activity: 'Request For Payment FINAL_APPROVED by SUPERVISOR' })
where datetime(
{ epochMillis: apoc.date.parse(handled.completeTimestamp,
'ms', 'yyyy-MM-dd HH:mm:ss.S') })
>  datetime(
{ epochMillis: apoc.date.parse(approval.completeTimestamp,
'ms', 'yyyy-MM-dd HH:mm:ss.S') })
and handled.caseId = approval.caseId
Create (handled)
-[r:PAYMENT_HANDLED_BEFORE_APPROVAL]
->(approval);
