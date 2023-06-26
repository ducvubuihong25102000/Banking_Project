USE [Bank]
GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE [name] = 'Customer' AND [xtype] = 'U')
	CREATE TABLE [Customers](
		[Cust_index] INT IDENTITY(1,1) PRIMARY KEY,
		[cust_Id] NVARCHAR(20) NOT NULL,
		[birth] DATE NOT NULL,
		[address] NVARCHAR(100) NOT NULL,
		[district] NVARCHAR(100) NOT NULL,
		[ward] NVARCHAR(100) NOT NULL,
		[city] NVARCHAR(100) NOT NULL,
		[Branch_index] INT,
	);
GO
--ALTER TABLE [Customer] ADD CONSTRAINT [PK_CUSTOMER_CUST_INDEX] PRIMARY KEY CLUSTERED 
--	(
--		[Cust_index] ASC
--	) NOT ENFORCED 
--);