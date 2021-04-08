match (per1:PermitLogEntryRelationship)
where (per1)-[:PERMIT_APPROVED_BEFORE_START]->(:PermitLogEntryRelationship)
return count(distinct per1.caseId);
