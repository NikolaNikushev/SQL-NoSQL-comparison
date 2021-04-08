Match (de1:DomesticdeclarationEvent {activity: 'Declaration APPROVED by PRE_APPROVER'})
Match (de2:DomesticdeclarationEvent {activity: 'Declaration FINAL_APPROVED by SUPERVISOR'})
where de1.completeTimestamp < de2.completeTimestamp and de2.caseId = de1.caseId
return count(distinct de1.caseId);
