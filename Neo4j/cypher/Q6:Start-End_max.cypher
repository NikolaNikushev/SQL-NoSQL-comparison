Match (a) - [r:START_END] -> (b)

return max(duration.inDays(
datetime({ epochMillis: apoc.date.parse(a.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') }),
datetime({ epochMillis: apoc.date.parse(b.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') })
).days);
