match (pe:PrepaidtravelcostEvent)<-[:PERMIT_HAS_PREPAID]-(p:PermitLogEntryRelationship)-[:PERMIT_HAS_DECLARATION_APPROVED]->()
return count(distinct p.decNumber);
