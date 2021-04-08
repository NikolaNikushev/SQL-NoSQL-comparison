match (a:Activity {activity: 'Start trip'})<-[r:HAS_ACTIVITY]-(b:PermitLogEntryRelationship)
match (a2:Activity {activity: 'End trip'})<-[r2:HAS_ACTIVITY]-(b2:PermitLogEntryRelationship {caseId: b.caseId, decNumber: b.decNumber})
return max(duration.inDays(
datetime({ epochMillis: apoc.date.parse(b.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') }),
datetime({ epochMillis: apoc.date.parse(b2.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') })
).days);
