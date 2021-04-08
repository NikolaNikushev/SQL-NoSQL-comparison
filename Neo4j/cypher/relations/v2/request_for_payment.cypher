match (a:PermitLogEntryRelationship)
merge (rfp:RequestForPayment {id: a.rfpId, number: a.rfpNumber})
return rfp

match (a:RequestforpaymentEvent)
merge (rfp:RequestForPayment {id: a.rfpId, number: a.rfpnumber})
return rfp

match (a:PrepaidtravelcostEvent)
merge (rfp:RequestForPayment {id: a.rfpId, number: a.rfpnumber})
return rfp


