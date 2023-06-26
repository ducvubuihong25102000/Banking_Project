USE [Bank]
GO
IF NOT EXISTS(SELECT * FROM sysobjects WHERE [name] = 'Account' AND [xtype] = 'U')
	CREATE TABLE [Accounts]
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


ALTER TABLE [Accounts] ADD CONSTRAINT [df_account_type] DEFAULT 1 FOR [account_type]
ALTER TABLE [Accounts] ADD CONSTRAINT [df_created_on] DEFAULT GETDATE() FOR [created_on]
ALTER TABLE [Accounts] ADD CONSTRAINT [df_balance] DEFAULT 50000.00 FOR [balance]

CREATE TRIGGER [df_credit_limit] ON [Accounts]
AFTER INSERT
AS
BEGIN 
	UPDATE  [Accounts]
	SET [credit_balance] = [balance]
	FROM [Accounts]
	WHERE [Accounts].[credit_balance] = NULL
END
GO		