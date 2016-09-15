

/****** Object:  Table [dbo].[DimAudit]    Script Date: 9/14/2016 10:20:03 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimAudit](
	[AuditKey] [int] IDENTITY(1,1) NOT NULL,
	[ParentAuditKey] [int] NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
	[PkgName] [nvarchar](50) NOT NULL,
	[PkgGUID] [uniqueidentifier] NULL,
	[PkgVersionGUID] [uniqueidentifier] NULL,
	[PkgVersionMajor] [smallint] NULL,
	[PkgVersionMinor] [smallint] NULL,
	[ExecStartDT] [datetime] NOT NULL,
	[ExecStopDT] [datetime] NULL,
	[ExecutionInstanceGUID] [uniqueidentifier] NULL,
	[ExtractRowCnt] [bigint] NULL,
	[InsertRowCnt] [bigint] NULL,
	[UpdateRowCnt] [bigint] NULL,
	[ErrorRowCnt] [bigint] NULL,
	[TableInitialRowCnt] [bigint] NULL,
	[TableFinalRowCnt] [bigint] NULL,
	[TableMaxSurrogateKey] [bigint] NULL,
	[SuccessfulProcessingInd] [nchar](1) NOT NULL,
 CONSTRAINT [PK_dbo.DimAudit] PRIMARY KEY CLUSTERED 
(
	[AuditKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[DimAudit] ADD  DEFAULT ('Unknown') FOR [TableName]
GO

ALTER TABLE [dbo].[DimAudit] ADD  DEFAULT ('Unknown') FOR [PkgName]
GO

ALTER TABLE [dbo].[DimAudit] ADD  DEFAULT (getdate()) FOR [ExecStartDT]
GO

ALTER TABLE [dbo].[DimAudit] ADD  DEFAULT ('N') FOR [SuccessfulProcessingInd]
GO

ALTER TABLE [dbo].[DimAudit]  WITH CHECK ADD  CONSTRAINT [FK_dbo_DimAudit_ParentAuditKey] FOREIGN KEY([ParentAuditKey])
REFERENCES [dbo].[DimAudit] ([AuditKey])
GO

ALTER TABLE [dbo].[DimAudit] CHECK CONSTRAINT [FK_dbo_DimAudit_ParentAuditKey]
GO

