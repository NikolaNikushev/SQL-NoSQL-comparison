match (pr1:PermitLogEntryRelationship)
match (pr2:PermitLogEntryRelationship)
where pr1.activity = 'End trip' and pr2.activity = 'Declaration SUBMITTED by EMPLOYEE'
and pr1.decNumber = pr2.decNumber and (pr1.completeTimestamp < pr2.completeTimestamp or pr1.completeTimestamp > pr2.completeTimestamp)
and pr1.caseId  = pr2.caseId

return count(distinct pr1.caseId);
