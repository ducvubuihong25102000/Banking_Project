USE [Bank]
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE [name] = 'Transactions' AND [xtype] = 'U')
	CREATE TABLE [Transactions](
		[Transactions_index] INT IDENTITY(1,1) PRIMARY KEY,
		[date] DATE NOT NULL,
		[start_account] INT NOT NULL, --Account_index
		[end_account] INT NOT NULL, --Account_index
		[transaction_type] INT NOT NULL,
		[amount] FLOAT NOT NULL,
		[message] NVARCHAR(200),
		[status] INT NOT NULL,
	)

ALTER TABLE [Transactions] ADD CONSTRAINT [df_status] DEFAULT 2 FOR [status]
ALTER TABLE [Transactions] ADD CONSTRAINT [df_date] DEFAULT GETDATE() FOR [date]
ALTER TABLE [Transactions] ADD CONSTRAINT [min_amount] CHECK ([amount] > 0)