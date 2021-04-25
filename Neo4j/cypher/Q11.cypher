match (p:PermitLogEntryRelationship)
where exists((p) - [:PERMIT_HAS_DECLARATION_APPROVED] -> ())
and exists((p) - [:PERMIT_HAS_PREPAID] -> ())
return count(distinct p.decNumber);
