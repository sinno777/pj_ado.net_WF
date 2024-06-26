USE [master]
GO
/****** Object:  Database [Ladada]    Script Date: 10/04/2024 20:54:58 ******/
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
/****** Object:  Table [dbo].[Order_Status]    Script Date: 10/04/2024 20:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[Status_ID] [int] NOT NULL,
	[Status_Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/04/2024 20:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [varchar](12) NOT NULL,
	[CusName] [nvarchar](50) NOT NULL,
	[PhoneNum] [char](11) NOT NULL,
	[Del_Info] [nvarchar](255) NOT NULL,
	[User_ID] [varchar](12) NOT NULL,
	[Status_ID] [int] NOT NULL,
 CONSTRAINT [PK_Orders_1] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phuong]    Script Date: 10/04/2024 20:54:58 ******/
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
/****** Object:  Table [dbo].[Quan]    Script Date: 10/04/2024 20:54:58 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 10/04/2024 20:54:58 ******/
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
/****** Object:  Table [dbo].[User_Roles]    Script Date: 10/04/2024 20:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Roles](
	[User_ID] [varchar](12) NOT NULL,
	[Role_ID] [int] NOT NULL,
 CONSTRAINT [PK_User_Roles] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC,
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/04/2024 20:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_ID] [varchar](12) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Order_Status] ([Status_ID], [Status_Name]) VALUES (0, N'REJECT')
INSERT [dbo].[Order_Status] ([Status_ID], [Status_Name]) VALUES (1, N'APPROVED')
INSERT [dbo].[Order_Status] ([Status_ID], [Status_Name]) VALUES (2, N'PENDING')
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
INSERT [dbo].[User_Roles] ([User_ID], [Role_ID]) VALUES (N'K12345', 0)
INSERT [dbo].[User_Roles] ([User_ID], [Role_ID]) VALUES (N'K54321', 1)
GO
INSERT [dbo].[Users] ([User_ID], [Username], [Password]) VALUES (N'K12132', N'c2', N'123123')
INSERT [dbo].[Users] ([User_ID], [Username], [Password]) VALUES (N'K12133', N'c1', N'123123')
INSERT [dbo].[Users] ([User_ID], [Username], [Password]) VALUES (N'K12345', N'admin', N'123123')
INSERT [dbo].[Users] ([User_ID], [Username], [Password]) VALUES (N'K54321', N'cus', N'123123')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ReversePK]    Script Date: 10/04/2024 20:54:58 ******/
ALTER TABLE [dbo].[User_Roles] ADD  CONSTRAINT [UQ_ReversePK] UNIQUE NONCLUSTERED 
(
	[Role_ID] ASC,
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status_ID] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[Order_Status] ([Status_ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status_ID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_User_ID] FOREIGN KEY([User_ID])
REFERENCES [dbo].[Users] ([User_ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_User_ID]
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
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 10/04/2024 20:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AuthenticateUser]
    @inputUsername VARCHAR(20),
    @inputPassword VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @UserID VARCHAR(12);

    IF EXISTS (
        SELECT User_ID
        FROM Users
        WHERE Username = @inputUsername COLLATE SQL_Latin1_General_CP1_CS_AS AND Password = @inputPassword COLLATE SQL_Latin1_General_CP1_CS_AS
    )
    BEGIN
        -- Lấy User_ID của người dùng đã xác thực thành công
        SELECT @UserID = User_ID
        FROM Users
        WHERE Username = @inputUsername COLLATE SQL_Latin1_General_CP1_CS_AS AND Password = @inputPassword COLLATE SQL_Latin1_General_CP1_CS_AS;

        -- Trả về User_ID
        SELECT @UserID AS User_ID;
    END
    ELSE
    BEGIN
        SELECT '-1' AS User_ID;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuan]    Script Date: 10/04/2024 20:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetQuan]
as	
	select * from Quan Order By Quan
return
GO
/****** Object:  StoredProcedure [dbo].[usp_GetUserRoles]    Script Date: 10/04/2024 20:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetUserRoles]
    @User_ID VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT u.User_ID AS User_ID,
           r.RoleName AS RoleName,
           r.Role_ID AS Role_ID
    FROM Users u
    INNER JOIN User_Roles ur ON u.User_ID = ur.User_ID
    INNER JOIN Roles r ON r.Role_ID = ur.Role_ID
    WHERE u.User_ID = @User_ID;
END;
GO
USE [master]
GO
ALTER DATABASE [Ladada] SET  READ_WRITE 
GO
