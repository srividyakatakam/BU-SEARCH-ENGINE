USE [master]
GO
/****** Object:  Database [Student_Search_Engine]    Script Date: 05-10-2019 13:52:50 ******/
CREATE DATABASE [Student_Search_Engine]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student_Search_Engine', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Student_Search_Engine.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Student_Search_Engine_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Student_Search_Engine_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Student_Search_Engine] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student_Search_Engine].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student_Search_Engine] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student_Search_Engine] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student_Search_Engine] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Student_Search_Engine] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student_Search_Engine] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET RECOVERY FULL 
GO
ALTER DATABASE [Student_Search_Engine] SET  MULTI_USER 
GO
ALTER DATABASE [Student_Search_Engine] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student_Search_Engine] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student_Search_Engine] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student_Search_Engine] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Student_Search_Engine] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Student_Search_Engine', N'ON'
GO
USE [Student_Search_Engine]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 05-10-2019 13:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[queries]    Script Date: 05-10-2019 13:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[queries](
	[Qid] [int] IDENTITY(1,1) NOT NULL,
	[Query] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student]    Script Date: 05-10-2019 13:52:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[contact] [int] NULL,
	[email] [varchar](100) NULL,
	[ssc_percentage] [decimal](18, 2) NULL,
	[hsc_percentage] [decimal](18, 2) NULL,
	[graduation] [decimal](18, 2) NULL,
	[post_graduation] [decimal](18, 2) NULL,
	[technical_skills] [varchar](max) NULL,
	[extracurricular] [varchar](max) NULL,
	[date_of_birth] [varchar](50) NULL,
	[gender] [varchar](50) NULL,
	[language] [varchar](max) NULL,
	[hobbies] [varchar](max) NULL,
	[nationality] [varchar](50) NULL,
	[address] [varchar](max) NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[admin] ([username], [password]) VALUES (N'admin', N'admin')
INSERT [dbo].[admin] ([username], [password]) VALUES (N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[queries] ON 

INSERT [dbo].[queries] ([Qid], [Query]) VALUES (1, N'students with 63 percentages')
INSERT [dbo].[queries] ([Qid], [Query]) VALUES (2, N'reading hobbies')
INSERT [dbo].[queries] ([Qid], [Query]) VALUES (3, N'ssc_percentage More then 62')
SET IDENTITY_INSERT [dbo].[queries] OFF
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([Sid], [name], [contact], [email], [ssc_percentage], [hsc_percentage], [graduation], [post_graduation], [technical_skills], [extracurricular], [date_of_birth], [gender], [language], [hobbies], [nationality], [address]) VALUES (101, N'test', 987654321, N'test@gmail.com', CAST(63.55 AS Decimal(18, 2)), CAST(70.96 AS Decimal(18, 2)), CAST(66.23 AS Decimal(18, 2)), CAST(65.33 AS Decimal(18, 2)), N'java', N'streetplay winner', N'09-02-1995', N'male', N'engish', N'reading', N'indian', N'mumbai')
INSERT [dbo].[student] ([Sid], [name], [contact], [email], [ssc_percentage], [hsc_percentage], [graduation], [post_graduation], [technical_skills], [extracurricular], [date_of_birth], [gender], [language], [hobbies], [nationality], [address]) VALUES (102, N'test1', 987654321, N'test1@gmail.com', CAST(62.35 AS Decimal(18, 2)), CAST(77.20 AS Decimal(18, 2)), CAST(92.04 AS Decimal(18, 2)), CAST(63.32 AS Decimal(18, 2)), N'c#', N'cricket winner', N'10-02-1995 00:00:00', N'male', N'engish', N'reading', N'indian', N'mumbai')
INSERT [dbo].[student] ([Sid], [name], [contact], [email], [ssc_percentage], [hsc_percentage], [graduation], [post_graduation], [technical_skills], [extracurricular], [date_of_birth], [gender], [language], [hobbies], [nationality], [address]) VALUES (103, N'test2', 987654321, N'test2@gmail.com', CAST(61.17 AS Decimal(18, 2)), CAST(83.43 AS Decimal(18, 2)), NULL, CAST(59.56 AS Decimal(18, 2)), N'python', N'tennis winner', N'11-02-1995 00:00:00', N'male', N'engish', N'reading', N'indian', N'mumbai')
INSERT [dbo].[student] ([Sid], [name], [contact], [email], [ssc_percentage], [hsc_percentage], [graduation], [post_graduation], [technical_skills], [extracurricular], [date_of_birth], [gender], [language], [hobbies], [nationality], [address]) VALUES (104, N'test3', 987654321, N'test3@gmail.com', CAST(59.97 AS Decimal(18, 2)), CAST(62.79 AS Decimal(18, 2)), CAST(65.62 AS Decimal(18, 2)), CAST(85.35 AS Decimal(18, 2)), N'html', N'streetplay winner', N'12-02-1995 00:00:00', N'male', N'engish', N'reading', N'indian', N'mumbai')
SET IDENTITY_INSERT [dbo].[student] OFF
USE [master]
GO
ALTER DATABASE [Student_Search_Engine] SET  READ_WRITE 
GO
