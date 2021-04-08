match (a:PermitLogEntryRelationship), (b:PermitLogEntryRelationship)
where a.caseId = b.caseId and a.activity = 'Start trip' and b.activity = 'End trip'
return avg(duration.inDays(
datetime({ epochMillis: apoc.date.parse(a.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') }),
datetime({ epochMillis: apoc.date.parse(b.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') })
).days);
