// Match (pe:PermitLogEntryRelationship)
// where pe.activity in [
// 'Permit APPROVED by ADMINISTRATION',
// 'Permit APPROVED by BUDGET OWNER',
// 'Permit APPROVED by PRE_APPROVER',
// 'Permit APPROVED by SUPERVISOR',
// 'Permit FINAL_APPROVED by DIRECTOR',
// 'Permit FINAL_APPROVED by SUPERVISOR'
// ]
// and datetime({ epochMillis: apoc.date.parse(pe.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') }) <= datetime({ epochMillis: apoc.date.parse('2018-10-20 10:35:54.000', 'ms', 'yyyy-MM-dd HH:mm:ss.S') }) and
//  datetime({ epochMillis: apoc.date.parse(pe.completeTimestamp, 'ms', 'yyyy-MM-dd HH:mm:ss.S') }) >= datetime({ epochMillis: apoc.date.parse('2016-07-13 14:32:51.000', 'ms', 'yyyy-MM-dd HH:mm:ss.S') })
//
// return count(DISTINCT pe.caseId);

Match (pe:PermitLogEntryRelationship)
where pe.activity in [
'Permit APPROVED by ADMINISTRATION',
'Permit APPROVED by BUDGET OWNER',
'Permit APPROVED by PRE_APPROVER',
'Permit APPROVED by SUPERVISOR',
'Permit FINAL_APPROVED by DIRECTOR',
'Permit FINAL_APPROVED by SUPERVISOR'
]
and pe.completeTimestamp <= '2018-10-20 10:35:54.000' and
pe.completeTimestamp >= '2016-07-13 14:32:51.000'

return count(DISTINCT pe.caseId);

