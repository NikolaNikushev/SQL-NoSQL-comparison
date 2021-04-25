match (p:PermitLogEntryRelationship) - [:PERMIT_HAS_DECLARATION_APPROVED] -> ()
WHERE NOT (p) - [:PERMIT_HAS_PREPAID] -> ()
return count(distinct p.decNumber);
