match (a:DomesticdeclarationEvent)
merge (dec:Declaration {number: a.declarationnumber, caseId: a.caseId})
return dec;

match (a:InternationaldeclarationEvent)
merge (dec:Declaration {number: a.declarationnumber, caseId: a.caseId})
return dec;

match (a:DomesticdeclarationEvent), (d:Declaration)
where a.declarationnumber = d.number
create (a) - [r:TO_DECLARATION] -> (d);


match (a:InternationaldeclarationEvent), (d:Declaration)
where a.declarationnumber = d.number
create (a) - [r:TO_DECLARATION] -> (d);


