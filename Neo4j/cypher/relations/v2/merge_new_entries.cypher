match (a:RequestforpaymentEvent)
merge (ac:Activity {activity: a.activity})
return ac;

match (a:PrepaidtravelcostEvent)
merge (ac:Activity {activity: a.activity})
return ac;

match (a:PermitLogEntryRelationship)
merge (ac:Activity {activity: a.activity})
return ac;

match (a:InternationaldeclarationEventt)
merge (ac:Activity {activity: a.activity})
return ac;

match (a:DomesticdeclarationEvent)
merge (ac:Activity {activity: a.activity})
return ac;
