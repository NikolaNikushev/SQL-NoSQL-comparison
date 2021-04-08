match (a:InternationaldeclarationEvent
{activity: 'Declaration APPROVED by PRE_APPROVER'}),
(b:InternationaldeclarationEvent
{activity: 'Declaration FINAL_APPROVED by SUPERVISOR'})
where  a.caseId = b.caseId
Create (a)
-[r:PRE_APPROVED_BEFORE_APPROVE]
->(b);
