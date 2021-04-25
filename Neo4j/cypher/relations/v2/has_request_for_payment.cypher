match (item), (b:RequestForPayment)
where item.rfpId = b.id
create (item) - [r:HAS_RFP] -> (b);
