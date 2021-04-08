CREATE INDEX domesticdeclaration_event_activity_idx      ON bpi_final_indexed.domesticdeclaration_event      (activity);
CREATE INDEX internationaldeclaration_event_activity_idx ON bpi_final_indexed.internationaldeclaration_event (activity);
CREATE INDEX permit_log_entry_relationship_activity_idx  ON bpi_final_indexed.permit_log_entry_relationship  (activity);
CREATE INDEX prepaidtravelcosts_event_activity_idx       ON bpi_final_indexed.prepaidtravelcosts_event       (activity);
CREATE INDEX requestforpayment_event_activity_idx        ON bpi_final_indexed.requestforpayment_event        (activity);
