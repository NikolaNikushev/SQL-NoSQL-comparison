match (pr1:PermitLogEntryRelationship { activity: 'Start trip' })
match (pr2:PermitLogEntryRelationship { activity: 'Permit APPROVED by ADMINISTRATION'  })
where pr1.caseId = pr2.caseId and pr1.decNumber = pr2.decNumber
and pr1.completeTimestamp < pr2.completeTimestamp
return count(distinct pr1.caseId);