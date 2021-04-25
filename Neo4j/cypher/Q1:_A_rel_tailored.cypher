match (perEnt:PermitEntity) <- [r1:PERMIT_ENTITY] -
(pem1:PermitLogEntryRelationship) - [r2:HAS_ACTIVITY] -> (act1:Activity {activity: 'Permit APPROVED by ADMINISTRATION'}),
(perEnt) <- [r1_1:PERMIT_ENTITY]-
(pem2:PermitLogEntryRelationship) - [r2_2:HAS_ACTIVITY] -> (act2:Activity {activity: 'Start trip'})
where pem1.completeTimestamp > pem2.completeTimestamp and pem2.caseId = pem1.caseId and pem1.decNumber = pem2.decNumber

return count(distinct pem1.decNumber);
