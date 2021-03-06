/* SQL to create the tables for the SCD Processing example.     */
/* This script should be run once to set up the example tables. */
/* It creates the following tables:                             */
/* - Customer_Master is the master dimension table in the Data  */
/*     Warehouse.                                               */
/* - Customer_Source is the current version of the dimension    */
/*     table as extracted from the source system.               */
/* - Customer_Master_Temp is a copy of Customer_Master that the */
/*     script uses to restore Customer_Master to its original   */
/*     state, all ready for you to re-run the code.             */
/* Copyright 2002, 2003 InfoDynamics LLC                        */
/* Copyright 2004, 2005 InfoDynamics LLC and Kimball Group      */
/* v 2006-11-07 - data changed to show Type 1 and 2 in same row */

IF OBJECT_ID (N'dbo.Customer_Master') IS NOT NULL
    DROP Table dbo.Customer_Master

CREATE TABLE [dbo].[Customer_Master] (
	[Customer_Key] [int] IDENTITY (1, 1) NOT NULL ,
	[Source_Cust_ID] [char] (10) NOT NULL ,
	[First_Name] [varchar] (10) NULL ,
	[Last_Name] [varchar] (15) NOT NULL ,
	[Address] [varchar] (15) NOT NULL ,
	[City] [varchar] (15) NOT NULL ,
	[State] [char] (2) NOT NULL ,
	[Zip] [varchar] (10) NOT NULL ,
	[Eff_date] [datetime] NOT NULL ,
	[End_date] [datetime] NOT NULL ,
	[Current_Flag] [char] (2) NOT NULL ,
	[Change_Reason] [char] (20) NOT NULL 
) ON [PRIMARY]
GO


IF OBJECT_ID (N'dbo.Customer_Master_Temp') IS NOT NULL
    Drop Table dbo.Customer_Master_Temp

CREATE TABLE [dbo].[Customer_Master_Temp] (
	[Source_Cust_ID] [char] (10) NOT NULL ,
	[First_Name] [varchar] (10) NOT NULL ,
	[Last_Name] [varchar] (15) NOT NULL ,
	[Address] [varchar] (15) NOT NULL ,
	[City] [varchar] (15) NOT NULL ,
	[State] [char] (2) NOT NULL ,
	[Zip] [varchar] (10) NOT NULL ,
	[Eff_date] [datetime] NOT NULL ,
	[End_date] [datetime] NOT NULL ,
	[Current_Flag] [char] (2) NOT NULL ,
	[Change_Reason] [char] (20) NOT NULL 
) ON [PRIMARY]
GO

insert into Customer_Master_Temp values ('3233A2','Jennifer','Finch',
'666 Gardenia','Menlo Park','CA','94025','3/31/1999','12/31/2199','y','NW')
insert into Customer_Master_Temp values ('3742E2','Harry','Chevy',
'400 Olive','Dallas','TX','75201','5/5/1999','9/17/2000','n','NW')
insert into Customer_Master_Temp values ('4848B3','Delta','Breeze',
'1214 Wateree','Kingsport','TN','37662','7/22/2000','1/2/2001','n','NW')
insert into Customer_Master_Temp values ('3742E2','Harry','Chevy',
'329 Bush','Houston','TX','77207','9/18/2000','12/31/2199','y','CT ZP')
insert into Customer_Master_Temp values ('4848B3','Delta','Dawn',
'1214 Wateree','Kingsport','TN','37662','1/3/2001','12/31/2199','y','LN')
insert into Customer_Master_Temp values ('5545G2','Joanie','Jones',
'434 Apple','Madison','WI','53709','3/17/2001','4/1/2002','n','NW')
insert into Customer_Master_Temp values ('5545G2','Joanie','Jones',
'2100 22nd','Wyandotte','MI','48192','4/2/2002','12/31/2199','y','CT ST ZP')

insert into Customer_Master 
Select * from Customer_Master_Temp
GO

IF OBJECT_ID (N'dbo.Customer_Source') IS NOT NULL
    Drop Table dbo.Customer_Source
CREATE TABLE [dbo].[Customer_Source] (
	[Source_Cust_ID] [char] (10) NOT NULL ,
	[First_Name] [char] (10) NOT NULL ,
	[Last_Name] [char] (15) NOT NULL ,
	[Address] [char] (15) NOT NULL ,
	[City] [char] (15) NOT NULL ,
	[State] [char] (2) NOT NULL ,
	[Zip] [varchar] (10) NOT NULL 
) ON [PRIMARY]
GO
insert into Customer_Source values ('3233A2','Jennifer','Finch','446 Garden',
'Menlo Park','NJ','08837')
insert into Customer_Source values ('5237F2','Jeff','Smith',
'277 Newbury','Boston','MA','02115')
insert into Customer_Source values ('3742E2','Harrison','Chevy',
'329 Bush','Houston','TX','77207')
insert into Customer_Source values ('4848B3','Delta','Dawn',
'1213 Wateree','Kingsport','TN','37662')
insert into Customer_Source values ('5545G2','Joan','Ellis',
'2100 22nd','Wyandotte','MI','48192')

