USE [master]
GO
/****** Object:  Database [Ladada]    Script Date: 3/19/2024 7:51:18 AM ******/
CREATE DATABASE [Ladada]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ladada', FILENAME = N'D:\Ladada.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ladada_log', FILENAME = N'D:\Ladada_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Ladada] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ladada].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ladada] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ladada] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ladada] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ladada] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ladada] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ladada] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ladada] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ladada] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ladada] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ladada] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ladada] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ladada] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ladada] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ladada] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ladada] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ladada] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ladada] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ladada] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ladada] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ladada] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ladada] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ladada] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ladada] SET RECOVERY FULL 
GO
ALTER DATABASE [Ladada] SET  MULTI_USER 
GO
ALTER DATABASE [Ladada] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ladada] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ladada] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ladada] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ladada] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ladada', N'ON'
GO
USE [Ladada]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/19/2024 7:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [int] NOT NULL,
	[CusName] [nvarchar](50) NOT NULL,
	[PhoneNum] [char](11) NOT NULL,
	[Del_Info] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Phuong]    Script Date: 3/19/2024 7:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phuong](
	[Phuong_ID] [int] NOT NULL,
	[Phuong] [nvarchar](50) NOT NULL,
	[Quan_ID] [int] NOT NULL,
 CONSTRAINT [PK_Phuong] PRIMARY KEY CLUSTERED 
(
	[Phuong_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quan]    Script Date: 3/19/2024 7:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quan](
	[Quan_ID] [int] NOT NULL,
	[Quan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Quan] PRIMARY KEY CLUSTERED 
(
	[Quan_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (1, N'An Hòa', 1)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (2, N'Cái Khế', 1)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (3, N'An Nghiệp', 1)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (4, N'An Thới', 2)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (5, N'Bùi Hữu Nghĩa', 2)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (6, N'Bình Thủy', 2)
INSERT [dbo].[Quan] ([Quan_ID], [Quan]) VALUES (1, N'Ninh Kiều')
INSERT [dbo].[Quan] ([Quan_ID], [Quan]) VALUES (2, N'Bình Thủy')
INSERT [dbo].[Quan] ([Quan_ID], [Quan]) VALUES (3, N'Cái Răng')
ALTER TABLE [dbo].[Phuong]  WITH CHECK ADD  CONSTRAINT [FK_Phuong_Quan] FOREIGN KEY([Quan_ID])
REFERENCES [dbo].[Quan] ([Quan_ID])
GO
ALTER TABLE [dbo].[Phuong] CHECK CONSTRAINT [FK_Phuong_Quan]
GO
USE [master]
GO
ALTER DATABASE [Ladada] SET  READ_WRITE 
GO
