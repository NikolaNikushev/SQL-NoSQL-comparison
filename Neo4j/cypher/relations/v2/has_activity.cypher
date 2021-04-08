match (item:PermitLogEntryRelationship), (b:Activity)
where item.activity = b.activity
create (item)-[r:HAS_ACTIVITY]->(b);
