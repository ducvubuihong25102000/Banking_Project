-- Customers 1-N-> Account
ALTER TABLE [Accounts] ADD CONSTRAINT [fk_Customer]  FOREIGN KEY ([Cust_index]) REFERENCES Customer([Cust_index])

-- Accounts 1-N-> Trandsactions
ALTER TABLE [Transactions] ADD CONSTRAINT [fk_Account] FOREIGN KEY ([start_account]) REFERENCES Accounts([Account_index])