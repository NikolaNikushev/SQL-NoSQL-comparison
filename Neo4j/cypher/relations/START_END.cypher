match (a:PermitLogEntryRelationship), (b:PermitLogEntryRelationship)
where a.activity = 'Start trip' and b.activity = 'End trip' and a.caseId = b.caseId
Create (a) - [r:START_END] -> (b);
