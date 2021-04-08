
// With cross relationship using v1 database
match (prepaid:PrepaidtravelcostEvent),
(permLog:PermitLogEntryRelationship)
where prepaid.permitId = permLog.caseId
Create (permLog)-[r:PERMIT_HAS_PREPAID]->(prepaid);

// With tailored relationship using v2 database
match (permLog:PermitLogEntryRelationship)-[:PERMIT_ENTITY]->(p:PermitEntity)
<-[:PERMIT_ENTITY]-(prepaid:PrepaidtravelcostEvent)
Create (permLog)-[r:PERMIT_HAS_PREPAID]->(prepaid);
