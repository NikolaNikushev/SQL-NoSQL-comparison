match (p:PermitLogEntryRelationship)
where p.caseId = p.id and (p.permitId = '' or p.permitId is null)
create (p)-[:PERMIT_ENTITY]->(p:PermitEntity);
