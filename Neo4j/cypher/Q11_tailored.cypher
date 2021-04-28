match (d:Declaration) <- [ra1:TO_DECLARATION] - (de),
(de) - [ra2:PERMIT_ENTITY] -> (pe:PermitEntity) <- [ra3:PERMIT_ENTITY] - (plog:PermitLogEntryRelationship) - [ra4:HAS_RFP] -> (rfp:RequestForPayment)
where de.activity in ['Declaration FINAL_APPROVED by DIRECTOR', 'Declaration FINAL_APPROVED by SUPERVISOR']
return count (distinct d.decNumber);
