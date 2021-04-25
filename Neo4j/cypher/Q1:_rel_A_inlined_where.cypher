match (per1:PermitLogEntryRelationship) - [:PERMIT_APPROVED_BEFORE_START]
->(:PermitLogEntryRelationship)
return count(distinct per1.caseId);
