match (pr1:PermitLogEntryRelationship {activity: 'End trip' })
match (pr2:PermitLogEntryRelationship {activity: 'Declaration SUBMITTED by EMPLOYEE', decNumber: pr1.decNumber, caseId: pr1.caseId})
where (pr1.completeTimestamp < pr2.completeTimestamp or pr1.completeTimestamp > pr2.completeTimestamp)

return count(distinct pr1.caseId);
