Match (pem: PermitEntity)<-[r:PERMIT_ENTITY]
-(a:PermitLogEntryRelationship
{activity: 'Declaration SUBMITTED by EMPLOYEE'})
Match (pem)<-[r2:PERMIT_ENTITY]-(a2:PermitLogEntryRelationship)
where a2.activity in ['Permit FINAL_APPROVED by DIRECTOR',
'Permit FINAL_APPROVED by SUPERVISOR']
and datetime({ epochMillis:
apoc.date.parse(a.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') }) >
datetime({ epochMillis: apoc.date.parse(a2.completeTimestamp, 'ms',
 'yyyy-MM-dd HH:mm:ss.S') })
return count(DISTINCT a.caseId);
