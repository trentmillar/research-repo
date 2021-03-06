USE BLPDB
GO

SET NOCOUNT ON
GO

--CREATE TABLES - Security Model
CREATE TABLE [agency].[USER_COMPARTMENT_CLASSIFICATION](
	[CLASSIFICATION_ID] [int] NOT NULL,
	[COMPARTMENT_ID] [int] NOT NULL,
	[USER_ID] [int] NOT NULL,
	CONSTRAINT [UQ_COMP_CLASS] UNIQUE ([COMPARTMENT_ID],[USER_ID])
) 
GO

CREATE TABLE [agency].[CLASSIFICATION](
	[CLASSIFICATION_ID] [int] IDENTITY(1,1) NOT NULL,
	[CLASSIFICATION_NAME] [nvarchar](50) NOT NULL
)
GO

CREATE TABLE [agency].[COMPARTMENT](
	[COMPARTMENT_ID] [int] IDENTITY(1,1) NOT NULL,
	[COMPARTMENT_NAME] [nvarchar](50) NOT NULL
)
GO

CREATE TABLE [agency].[USER](
	[USER_ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_NAME] VARCHAR(50) NOT NULL,
	[USER_PASSWORD] VARCHAR(20) NOT NULL,
	[CLASSIFICATION_ID] INT NOT NULL DEFAULT(1)
)
GO

-- CREATE CONSTARINTS
ALTER TABLE [agency].[CLASSIFICATION] ADD PRIMARY KEY CLUSTERED([CLASSIFICATION_ID] ASC)
GO

ALTER TABLE [agency].[COMPARTMENT] ADD PRIMARY KEY CLUSTERED ([COMPARTMENT_ID] ASC)
GO

ALTER TABLE [agency].[USER] ADD PRIMARY KEY CLUSTERED ([USER_ID] ASC )
GO

ALTER TABLE [agency].[USER] ADD FOREIGN KEY([CLASSIFICATION_ID])
	REFERENCES [agency].[CLASSIFICATION] ([CLASSIFICATION_ID])
GO

ALTER TABLE [agency].[USER_COMPARTMENT_CLASSIFICATION] ADD FOREIGN KEY([CLASSIFICATION_ID])
	REFERENCES [agency].[CLASSIFICATION] ([CLASSIFICATION_ID])
GO

ALTER TABLE [agency].[USER_COMPARTMENT_CLASSIFICATION] ADD FOREIGN KEY([COMPARTMENT_ID])
	REFERENCES [agency].[COMPARTMENT] ([COMPARTMENT_ID])
GO

ALTER TABLE [agency].[USER_COMPARTMENT_CLASSIFICATION] ADD FOREIGN KEY([USER_ID])
		REFERENCES [agency].[USER] ([USER_ID])
GO