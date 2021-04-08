CREATE INDEX activity_index_rfp FOR (n:RequestforpaymentEvent) ON (n.activity);
CREATE INDEX activity_index_prep FOR (n:PrepaidtravelcostEvent) ON (n.activity);
CREATE INDEX activity_index_die FOR (n:InternationaldeclarationEvent) ON (n.activity);
CREATE INDEX activity_index_dde FOR (n:DomesticdeclarationEvent) ON (n.activity);
CREATE INDEX activity_index_perlog FOR (n:PermitLogEntryRelationship) ON (n.activity);
