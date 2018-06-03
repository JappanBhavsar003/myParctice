-- Transaction 1

BEGIN TRAN
UPDATE TableA SET Name = 'Mark Transaction 1'
where id = 1

COMMIT TRANSACTION

