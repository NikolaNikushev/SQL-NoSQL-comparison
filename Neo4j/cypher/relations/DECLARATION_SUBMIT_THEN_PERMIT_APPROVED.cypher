match (a:PermitLogEntryRelationship
{activity: 'Declaration SUBMITTED by EMPLOYEE'}),
(b:PermitLogEntryRelationship)
where a.caseId = b.caseId and b.activity in ['Permit FINAL_APPROVED by DIRECTOR',
'Permit FINAL_APPROVED by SUPERVISOR']
Create (a)
-[r:DECLARATION_SUBMIT_THEN_PERMIT_APPROVED]
->(b);
