USE [master]
GO
/****** Object:  Database [Ladada]    Script Date: 10/04/2024 12:37:37 ******/
CREATE DATABASE [Ladada]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ladada', FILENAME = N'D:\Ladada.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Ladada_log', FILENAME = N'D:\Ladada_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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
ALTER DATABASE [Ladada] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ladada] SET QUERY_STORE = ON
GO
ALTER DATABASE [Ladada] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Ladada]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/04/2024 12:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [varchar](12) NOT NULL,
	[CusName] [nvarchar](50) NOT NULL,
	[PhoneNum] [char](11) NOT NULL,
	[Del_Info] [nvarchar](255) NOT NULL,
	[Cus_ID] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Cus_ID] ASC,
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phuong]    Script Date: 10/04/2024 12:37:37 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quan]    Script Date: 10/04/2024 12:37:37 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/04/2024 12:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_ID] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Roles]    Script Date: 10/04/2024 12:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Roles](
	[User_ID] [int] NOT NULL,
	[Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC,
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/04/2024 12:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Orders] ([Order_ID], [CusName], [PhoneNum], [Del_Info], [Cus_ID]) VALUES (N'D47103', N'hihi', N'113        ', N'123 ksajfkls', N'K13830')
INSERT [dbo].[Orders] ([Order_ID], [CusName], [PhoneNum], [Del_Info], [Cus_ID]) VALUES (N'D83407', N'Nái', N'01313131   ', N'123 Mạc Thiên Tích', N'K32715')
INSERT [dbo].[Orders] ([Order_ID], [CusName], [PhoneNum], [Del_Info], [Cus_ID]) VALUES (N'D43292', N'Anh Khoa', N'01213131   ', N'123 An Hòa', N'K57243')
INSERT [dbo].[Orders] ([Order_ID], [CusName], [PhoneNum], [Del_Info], [Cus_ID]) VALUES (N'D94308', N'hoho', N'10001      ', N'113 môm', N'K65340')
INSERT [dbo].[Orders] ([Order_ID], [CusName], [PhoneNum], [Del_Info], [Cus_ID]) VALUES (N'D31300', N'anh khoa 113', N'11300      ', N'123 nvc', N'K69922')
INSERT [dbo].[Orders] ([Order_ID], [CusName], [PhoneNum], [Del_Info], [Cus_ID]) VALUES (N'D32075', N'sinoo', N'01311      ', N'123 an hoa', N'K82243')
GO
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (1, N'An Hòa', 1)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (2, N'Cái Khế', 1)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (3, N'An Nghiệp', 1)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (4, N'An Thới', 2)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (5, N'Bùi Hữu Nghĩa', 2)
INSERT [dbo].[Phuong] ([Phuong_ID], [Phuong], [Quan_ID]) VALUES (6, N'Bình Thủy', 2)
GO
INSERT [dbo].[Quan] ([Quan_ID], [Quan]) VALUES (1, N'Ninh Kiều')
INSERT [dbo].[Quan] ([Quan_ID], [Quan]) VALUES (2, N'Bình Thủy')
INSERT [dbo].[Quan] ([Quan_ID], [Quan]) VALUES (3, N'Cái Răng')
GO
INSERT [dbo].[Roles] ([Role_ID], [RoleName]) VALUES (0, N'Chủ shop')
INSERT [dbo].[Roles] ([Role_ID], [RoleName]) VALUES (1, N'Khách hàng')
GO
INSERT [dbo].[User_Roles] ([User_ID], [Role_ID]) VALUES (1, 0)
INSERT [dbo].[User_Roles] ([User_ID], [Role_ID]) VALUES (2, 1)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_ID], [Username], [Password]) VALUES (1, N'admin', N'123123')
INSERT [dbo].[Users] ([User_ID], [Username], [Password]) VALUES (2, N'a1', N'sa2')
INSERT [dbo].[Users] ([User_ID], [Username], [Password]) VALUES (3, N'a2', N'sa3')
INSERT [dbo].[Users] ([User_ID], [Username], [Password]) VALUES (4, N'a3', N'sa4')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [UQ_ReversePK]    Script Date: 10/04/2024 12:37:37 ******/
ALTER TABLE [dbo].[User_Roles] ADD  CONSTRAINT [UQ_ReversePK] UNIQUE NONCLUSTERED 
(
	[Role_ID] ASC,
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Phuong]  WITH CHECK ADD  CONSTRAINT [FK_Phuong_Quan] FOREIGN KEY([Quan_ID])
REFERENCES [dbo].[Quan] ([Quan_ID])
GO
ALTER TABLE [dbo].[Phuong] CHECK CONSTRAINT [FK_Phuong_Quan]
GO
ALTER TABLE [dbo].[User_Roles]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles_Role_ID] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Roles] ([Role_ID])
GO
ALTER TABLE [dbo].[User_Roles] CHECK CONSTRAINT [FK_User_Roles_Role_ID]
GO
ALTER TABLE [dbo].[User_Roles]  WITH CHECK ADD  CONSTRAINT [FK_User_Roles_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[User_Roles] CHECK CONSTRAINT [FK_User_Roles_User_ID]
GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 10/04/2024 12:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AuthenticateUser]
    @inputUsername VARCHAR(50),
    @inputPassword VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM Users
        WHERE Username = @inputUsername COLLATE SQL_Latin1_General_CP1_CS_AS AND Password = @inputPassword COLLATE SQL_Latin1_General_CP1_CS_AS
    )
    BEGIN
        SELECT 1 AS Result;
    END
    ELSE
    BEGIN
        SELECT -1 AS Result;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuan]    Script Date: 10/04/2024 12:37:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetQuan]
as	
	select * from Quan Order By Quan
return
GO
USE [master]
GO
ALTER DATABASE [Ladada] SET  READ_WRITE 
GO
