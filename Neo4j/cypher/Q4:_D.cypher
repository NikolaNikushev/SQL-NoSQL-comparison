Match (de1:InternationaldeclarationEvent)
Match (de2:InternationaldeclarationEvent)
where de1.activity = 'Declaration APPROVED by PRE_APPROVER' and de2.activity = 'Declaration FINAL_APPROVED by SUPERVISOR'
and de1.completeTimestamp > de2.completeTimestamp and de2.caseId = de1.caseId
return count(distinct de1.caseId);
