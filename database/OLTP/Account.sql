USE [Bank]
GO
IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name] = 'Account' AND [xtype] = 'U')
	CREATE TABLE [Account]
	(
		[Account_index] INT IDENTITY(1,1) PRIMARY KEY,
		[Cust_index] INT NOT NULL,
		[account_number] NVARCHAR(20) NOT NULL,
		[parent_account] NVARCHAR(20) NOT NULL,
		[user_name] NVARCHAR(30) NOT NULL,
		[password] BINARY(64) NOT NULL,
		[account_type] INT NOT NULL,
		[created_on] DATE NOT NULL,
		[bank_index] INT NOT NULL,
		[balance] FLOAT NOT NULL,
		[credit_limit] FLOAT,
	)


ALTER TABLE [Account] ADD CONSTRAINT [df_account_type] DEFAULT 1 FOR [account_type]
ALTER TABLE [Account] ADD CONSTRAINT [df_careted_on] DEFAULT GETDATE() FOR [created_on]
ALTER TABLE [Account] ADD CONSTRAINT [df_balance] DEFAULT 50000.00 FOR [balance]

ALTER TABLE [Account] ADD CONSTRAINT [fk_Customer]  FOREIGN KEY ([Cust_index]) REFERENCES Customer([Cust_index])

--CREATE TRIGGER [df_credit_limit] ON [Account]
--AFTER INSERT
--AS
--BEGIN
--	IF 
--	UPDATE 
