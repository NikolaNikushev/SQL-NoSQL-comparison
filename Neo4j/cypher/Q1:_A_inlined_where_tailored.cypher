match (pem2:PermitLogEntryRelationship {activity: 'Start trip'}) - [r1_1:PERMIT_ENTITY] -> (perEnt:PermitEntity) <- [r1:PERMIT_ENTITY]-
(pem1:PermitLogEntryRelationship {activity: 'Permit APPROVED by ADMINISTRATION'})
where pem1.completeTimestamp > pem2.completeTimestamp and pem2.caseId = pem1.caseId and pem1.decNumber = pem2.decNumber

return count(distinct pem1.decNumber);
