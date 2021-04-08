match (pr1:PermitLogEntryRelationship)
match (pr2:PermitLogEntryRelationship)
where pr1.caseId = pr2.caseId and pr1.activity = 'Start trip' and
pr2.activity = 'Permit APPROVED by ADMINISTRATION' and
pr1.decNumber = pr2.decNumber
and pr1.completeTimestamp < pr2.completeTimestamp
return count(distinct pr1.caseId);
