USE [master]
GO
/****** Object:  Database [HrPayroll]    Script Date: 28-Dec-16 10:37:43 AM ******/
CREATE DATABASE [HrPayroll]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HrPayroll', FILENAME = N'F:\SQLServer\MSSQL11.SQLEXPRESS\MSSQL\DATA\HrPayroll.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HrPayroll_log', FILENAME = N'F:\SQLServer\MSSQL11.SQLEXPRESS\MSSQL\DATA\HrPayroll_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HrPayroll] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HrPayroll].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HrPayroll] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HrPayroll] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HrPayroll] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HrPayroll] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HrPayroll] SET ARITHABORT OFF 
GO
ALTER DATABASE [HrPayroll] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HrPayroll] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HrPayroll] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HrPayroll] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HrPayroll] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HrPayroll] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HrPayroll] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HrPayroll] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HrPayroll] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HrPayroll] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HrPayroll] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HrPayroll] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HrPayroll] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HrPayroll] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HrPayroll] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HrPayroll] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HrPayroll] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HrPayroll] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HrPayroll] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HrPayroll] SET  MULTI_USER 
GO
ALTER DATABASE [HrPayroll] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HrPayroll] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HrPayroll] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HrPayroll] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HrPayroll]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 28-Dec-16 10:37:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DeptId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentCode] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 28-Dec-16 10:37:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[DesId] [int] IDENTITY(1,1) NOT NULL,
	[DesignationCode] [varchar](50) NOT NULL,
	[DesignationName] [varchar](50) NOT NULL,
	[DepartmentCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation_1] PRIMARY KEY CLUSTERED 
(
	[DesignationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 28-Dec-16 10:37:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](50) NOT NULL,
	[LName] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[DateOfJoin] [date] NULL,
	[PresentAddress] [varchar](200) NULL,
	[PermanentAddress] [varchar](200) NULL,
	[NationalId] [varchar](20) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DeptId], [DepartmentCode], [DepartmentName]) VALUES (1, N'gits-001', N'Hr Department')
INSERT [dbo].[Department] ([DeptId], [DepartmentCode], [DepartmentName]) VALUES (2, N'gits-002', N'Software Department')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([DesId], [DesignationCode], [DesignationName], [DepartmentCode]) VALUES (1, N'Hr-001', N'Account', N'gits-001')
INSERT [dbo].[Designation] ([DesId], [DesignationCode], [DesignationName], [DepartmentCode]) VALUES (2, N'sw-001', N'Junior Software Engineer', N'gits-002')
INSERT [dbo].[Designation] ([DesId], [DesignationCode], [DesignationName], [DepartmentCode]) VALUES (3, N'sw-002', N'Software Engineer', N'gits-002')
INSERT [dbo].[Designation] ([DesId], [DesignationCode], [DesignationName], [DepartmentCode]) VALUES (4, N'sw-003', N'Senior Software Engineer', N'gits-002')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmpId], [FName], [LName], [DateOfBirth], [DateOfJoin], [PresentAddress], [PermanentAddress], [NationalId]) VALUES (2, N'Yeasin', N'Arafat', NULL, NULL, N'Dhaka', N'Dhaka', NULL)
INSERT [dbo].[Employee] ([EmpId], [FName], [LName], [DateOfBirth], [DateOfJoin], [PresentAddress], [PermanentAddress], [NationalId]) VALUES (4, N'Yeasin', N'Arafat', CAST(0xDB3A0B00 AS Date), CAST(0x2A3C0B00 AS Date), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([EmpId], [FName], [LName], [DateOfBirth], [DateOfJoin], [PresentAddress], [PermanentAddress], [NationalId]) VALUES (5, N'Yeasin', N'Arafat', CAST(0xDB3A0B00 AS Date), CAST(0x2A3C0B00 AS Date), N'Dhaka', N'Dhaka', NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
ALTER TABLE [dbo].[Designation]  WITH CHECK ADD  CONSTRAINT [FK_Designation_Designation] FOREIGN KEY([DepartmentCode])
REFERENCES [dbo].[Department] ([DepartmentCode])
GO
ALTER TABLE [dbo].[Designation] CHECK CONSTRAINT [FK_Designation_Designation]
GO
USE [master]
GO
ALTER DATABASE [HrPayroll] SET  READ_WRITE 
GO
