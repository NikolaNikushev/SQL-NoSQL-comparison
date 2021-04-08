match (a:PermitLogEntryRelationship {activity: 'Start trip'}), (b:PermitLogEntryRelationship {activity: 'End trip'})
where a.caseId = b.caseId
return avg(duration.inDays(
datetime({ epochMillis: apoc.date.parse(a.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') }),
datetime({ epochMillis: apoc.date.parse(b.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') })
).days);
