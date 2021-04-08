Match (a:PermitLogEntryRelationship)-[r:DECLARATION_SUBMIT_THEN_PERMIT_APPROVED]->(b:PermitLogEntryRelationship)
where datetime({ epochMillis: apoc.date.parse(a.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') }) > datetime({ epochMillis: apoc.date.parse(b.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') })
return count(DISTINCT a.caseId);
