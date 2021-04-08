match (declaration:InternationaldeclarationEvent), (permitLog:PermitLogEntryRelationship)
where declaration.activity in ['Declaration FINAL_APPROVED by DIRECTOR', 'Declaration FINAL_APPROVED by SUPERVISOR']
and permitLog.decNumber = declaration.declarationnumber
Create (permitLog)-[r:PERMIT_HAS_DECLARATION_APPROVED]->(declaration)
return type(r);

