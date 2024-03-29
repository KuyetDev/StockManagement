USE [master]
GO
/****** Object:  Database [StockManagement]    Script Date: 7/25/2023 9:09:34 AM ******/
CREATE DATABASE [StockManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StockManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StockManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StockManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StockManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StockManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StockManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagement] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StockManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StockManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StockManagement', N'ON'
GO
ALTER DATABASE [StockManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [StockManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Stock_Management]
GO
/****** Object:  Table [dbo].[Assets]    Script Date: 7/25/2023 9:09:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[AssetName] [nvarchar](250) NOT NULL,
	[Status] [bit] NULL,
	[image] [nvarchar](250) NULL,
	[Price] [float] NOT NULL,
	[Specification] [nvarchar](250) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK__Assets__3214EC0777F6477E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowingAsset]    Script Date: 7/25/2023 9:09:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowingAsset](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BorrowDate] [date] NOT NULL,
	[AssetId] [int] NULL,
	[Status] [bit] NULL,
	[Amount] [int] NULL,
	[Quantity] [int] NOT NULL,
	[DueDate] [date] NOT NULL,
	[BorrowerId] [int] NULL,
	[RetrurnDate] [date] NULL,
	[TotalPricee] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/25/2023 9:09:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/25/2023 9:09:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/25/2023 9:09:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Addrress] [nvarchar](max) NOT NULL,
	[Status] [bit] NULL,
	[Gender] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assets] ON 

INSERT [dbo].[Assets] ([CategoryId], [AssetName], [Status], [image], [Price], [Specification], [Quantity]) VALUES (4, N'Philips H8506 ', 0, N'/headphonePhilip.jpg', 200000, N'Philips H8506 Over-Ear Wireless Headphones with Noise Canceling Pro (ANC) and Multipoint Bluetooth Connection, 60 Hours Playtime, (TAH8506BK/00)', 10)
INSERT [dbo].[Assets] ([CategoryId], [AssetName], [Status], [image], [Price], [Specification], [Quantity]) VALUES ( 5, N'Sony Alpha 7', 1, N'/cameraSony.jpg', 450000, N'Sony Alpha 7 IV Full-frame Mirrorless Interchangeable Lens Camera with 28-70mm Zoom Lens Kit', 10)
INSERT [dbo].[Assets] ([CategoryId], [AssetName], [Status], [image], [Price], [Specification], [Quantity]) VALUES ( 15, N'Logitech', 0, N'341515681_1608536579644024_6380405029560073124_n.png', 50000, N'vip', 10)
INSERT [dbo].[Assets] ([CategoryId], [AssetName], [Status], [image], [Price], [Specification], [Quantity]) VALUES ( 4, N'3434234', 0, N'/OIP.jpg', 70000, NULL, 10)
SET IDENTITY_INSERT [dbo].[Assets] OFF
GO
SET IDENTITY_INSERT [dbo].[BorrowingAsset] ON 

INSERT [dbo].[BorrowingAsset] ( [BorrowDate], [AssetId], [Status], [Amount], [Quantity], [DueDate], [BorrowerId], [RetrurnDate], [TotalPricee]) VALUES (CAST(N'2023-07-23' AS Date), 1, 0, 1, 3, CAST(N'2023-07-25' AS Date), 2, NULL, 1350000)
SET IDENTITY_INSERT [dbo].[BorrowingAsset] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (2, N'Smartphone')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (4, N'Keyboard')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (5, N'Headphone')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (6, N'Camera')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (8, N'Smartphone')
INSERT [dbo].[Categories] ([Id], [CategoryName]) VALUES (15, N'Mouse')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ( [RoleName]) VALUES (N'Admin')
INSERT [dbo].[Roles] ( [RoleName]) VALUES (N'User')
INSERT [dbo].[Roles] ( [RoleName]) VALUES (N'Admin')
INSERT [dbo].[Roles] ( [RoleName]) VALUES ( N'Admin')
INSERT [dbo].[Roles] ( [RoleName]) VALUES ( N'Admin')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ( [Username], [Password], [FirstName], [LastName], [PhoneNumber], [Addrress], [Status], [Gender], [RoleId]) VALUES (N'ad1', N'1', N'admin', N'001', 93912313, N'qweqweqwe', 1, 1, 11)
INSERT [dbo].[Users] ( [Username], [Password], [FirstName], [LastName], [PhoneNumber], [Addrress], [Status], [Gender], [RoleId]) VALUES (N'kiki', N'1', N'fanna', N'kiki', 424234, N'adawd', 1, 0, 1)
INSERT [dbo].[Users] ( [Username], [Password], [FirstName], [LastName], [PhoneNumber], [Addrress], [Status], [Gender], [RoleId]) VALUES (N'fpt', N'1', N'fpt', N'univer', 93123, N'Hola', 1, 0, 1)
INSERT [dbo].[Users] ( [Username], [Password], [FirstName], [LastName], [PhoneNumber], [Addrress], [Status], [Gender], [RoleId]) VALUES (N'user', N'1', N'user', N'user', 93123, N'Hola', 1, 0, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Assets]  WITH CHECK ADD  CONSTRAINT [FK__Assets__Category__398D8EEE] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Assets] CHECK CONSTRAINT [FK__Assets__Category__398D8EEE]
GO
ALTER TABLE [dbo].[BorrowingAsset]  WITH CHECK ADD  CONSTRAINT [FK__Borrowing__Asset__2C3393D0] FOREIGN KEY([AssetId])
REFERENCES [dbo].[Assets] ([Id])
GO
ALTER TABLE [dbo].[BorrowingAsset] CHECK CONSTRAINT [FK__Borrowing__Asset__2C3393D0]
GO
ALTER TABLE [dbo].[BorrowingAsset]  WITH CHECK ADD FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
USE [master]
GO
ALTER DATABASE [StockManagement] SET  READ_WRITE 
GO
