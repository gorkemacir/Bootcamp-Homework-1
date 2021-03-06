USE [master]
GO
/****** Object:  Database [CRM]    Script Date: 22.04.2022 14:17:59 ******/
CREATE DATABASE [CRM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CRM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\CRM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CRM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\CRM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CRM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CRM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CRM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CRM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CRM] SET ARITHABORT OFF 
GO
ALTER DATABASE [CRM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CRM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CRM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CRM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CRM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CRM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CRM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CRM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CRM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CRM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CRM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CRM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CRM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CRM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CRM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CRM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CRM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CRM] SET  MULTI_USER 
GO
ALTER DATABASE [CRM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CRM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CRM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CRM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CRM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CRM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CRM] SET QUERY_STORE = OFF
GO
USE [CRM]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Account_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_name] [varchar](40) NOT NULL,
	[Account_description] [varchar](40) NOT NULL,
	[Account_phone] [int] NOT NULL,
	[Biling_address] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountContactRole]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountContactRole](
	[AccountContactRole_id] [int] IDENTITY(1,1) NOT NULL,
	[Contact_id] [int] NOT NULL,
	[Account_id] [int] NOT NULL,
 CONSTRAINT [PK_AccountContactRole] PRIMARY KEY CLUSTERED 
(
	[AccountContactRole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaign]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaign](
	[Campaign_id] [int] IDENTITY(1,1) NOT NULL,
	[Campaign_name] [varchar](40) NOT NULL,
	[Campaign_objectives] [varchar](40) NOT NULL,
	[Campaign_sponsor] [varchar](40) NOT NULL,
	[Campaign_start_date] [datetime] NOT NULL,
	[Campaign_end_date] [datetime] NOT NULL,
	[Campaign_other_details] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[Campaign_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampaignMember]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampaignMember](
	[CampaignMember_id] [int] IDENTITY(1,1) NOT NULL,
	[Campaign_id] [int] NOT NULL,
	[Lead_id] [int] NOT NULL,
	[Contact_id] [int] NOT NULL,
 CONSTRAINT [PK_CampaignMember] PRIMARY KEY CLUSTERED 
(
	[CampaignMember_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Case]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case](
	[Case_id] [int] IDENTITY(1,1) NOT NULL,
	[Contact_id] [int] NOT NULL,
 CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED 
(
	[Case_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Contact_id] [int] IDENTITY(1,1) NOT NULL,
	[Account_id] [int] NOT NULL,
	[Contact_address] [varchar](40) NOT NULL,
	[Contact_contact_details] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Contact_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[Contract_id] [int] NOT NULL,
	[Account_id] [int] NOT NULL,
	[Contract_status] [varchar](40) NOT NULL,
	[Contract_approval] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[Contract_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lead]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lead](
	[Lead_id] [int] IDENTITY(1,1) NOT NULL,
	[Lead_firstname] [varchar](40) NOT NULL,
	[Lead_surname] [varchar](40) NOT NULL,
	[Lead_other_details] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Lead] PRIMARY KEY CLUSTERED 
(
	[Lead_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opportunity]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opportunity](
	[Opportunity_id] [int] NOT NULL,
	[Account_id] [int] NOT NULL,
	[Opportunity_description] [varchar](40) NOT NULL,
	[Opportunity_details] [varchar](40) NOT NULL,
	[Opportunity_stage] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Opportunity] PRIMARY KEY CLUSTERED 
(
	[Opportunity_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OpportunityContactRole]    Script Date: 22.04.2022 14:17:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpportunityContactRole](
	[OpportunityContactRole_id] [int] IDENTITY(1,1) NOT NULL,
	[Contact_id] [int] NOT NULL,
	[Opportunity_id] [int] NOT NULL,
	[Date_time] [datetime] NOT NULL,
	[Other_details] [varchar](40) NOT NULL,
 CONSTRAINT [PK_OpportunityContactRole] PRIMARY KEY CLUSTERED 
(
	[OpportunityContactRole_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccountContactRole]  WITH CHECK ADD  CONSTRAINT [FK_AccountContactRole_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([Account_id])
GO
ALTER TABLE [dbo].[AccountContactRole] CHECK CONSTRAINT [FK_AccountContactRole_Account]
GO
ALTER TABLE [dbo].[AccountContactRole]  WITH CHECK ADD  CONSTRAINT [FK_AccountContactRole_Contact] FOREIGN KEY([Contact_id])
REFERENCES [dbo].[Contact] ([Contact_id])
GO
ALTER TABLE [dbo].[AccountContactRole] CHECK CONSTRAINT [FK_AccountContactRole_Contact]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_Campaign] FOREIGN KEY([Campaign_id])
REFERENCES [dbo].[Campaign] ([Campaign_id])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_Campaign]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_Contact] FOREIGN KEY([Contact_id])
REFERENCES [dbo].[Contact] ([Contact_id])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_Contact]
GO
ALTER TABLE [dbo].[CampaignMember]  WITH CHECK ADD  CONSTRAINT [FK_CampaignMember_Lead] FOREIGN KEY([Lead_id])
REFERENCES [dbo].[Lead] ([Lead_id])
GO
ALTER TABLE [dbo].[CampaignMember] CHECK CONSTRAINT [FK_CampaignMember_Lead]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [FK_Case_Contact] FOREIGN KEY([Contact_id])
REFERENCES [dbo].[Contact] ([Contact_id])
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [FK_Case_Contact]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([Account_id])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Account]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([Account_id])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
ALTER TABLE [dbo].[Opportunity]  WITH CHECK ADD  CONSTRAINT [FK_Opportunity_Account] FOREIGN KEY([Account_id])
REFERENCES [dbo].[Account] ([Account_id])
GO
ALTER TABLE [dbo].[Opportunity] CHECK CONSTRAINT [FK_Opportunity_Account]
GO
ALTER TABLE [dbo].[OpportunityContactRole]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityContactRole_Contact] FOREIGN KEY([Contact_id])
REFERENCES [dbo].[Contact] ([Contact_id])
GO
ALTER TABLE [dbo].[OpportunityContactRole] CHECK CONSTRAINT [FK_OpportunityContactRole_Contact]
GO
ALTER TABLE [dbo].[OpportunityContactRole]  WITH CHECK ADD  CONSTRAINT [FK_OpportunityContactRole_Opportunity] FOREIGN KEY([Opportunity_id])
REFERENCES [dbo].[Opportunity] ([Opportunity_id])
GO
ALTER TABLE [dbo].[OpportunityContactRole] CHECK CONSTRAINT [FK_OpportunityContactRole_Opportunity]
GO
USE [master]
GO
ALTER DATABASE [CRM] SET  READ_WRITE 
GO
