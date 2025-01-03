USE [master]
GO
/****** Object:  Database [DBNoiThat]    Script Date: 6/11/2024 5:22:27 PM ******/
CREATE DATABASE [DBNoiThat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBNoiThat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBNoiThat.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBNoiThat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DBNoiThat_log.ldf' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBNoiThat] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBNoiThat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBNoiThat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBNoiThat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBNoiThat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBNoiThat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBNoiThat] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBNoiThat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBNoiThat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBNoiThat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBNoiThat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBNoiThat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBNoiThat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBNoiThat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBNoiThat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBNoiThat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBNoiThat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBNoiThat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBNoiThat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBNoiThat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBNoiThat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBNoiThat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBNoiThat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBNoiThat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBNoiThat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBNoiThat] SET  RESTRICTED_USER 
GO
ALTER DATABASE [DBNoiThat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBNoiThat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBNoiThat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBNoiThat] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBNoiThat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBNoiThat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBNoiThat', N'ON'
GO
ALTER DATABASE [DBNoiThat] SET QUERY_STORE = OFF
GO
USE [DBNoiThat]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[NumberCard] [int] NULL,
	[UserNumber] [int] NULL,
	[UserId] [int] NULL,
	[Identification] [int] NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[MetaTitle] [nvarchar](50) NULL,
	[ParId] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[EmailCC] [nvarchar](50) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credentials]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credentials](
	[CredenId] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupId] [nvarchar](50) NULL,
	[RoleId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Credentials] PRIMARY KEY CLUSTERED 
(
	[CredenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Detail] [nvarchar](max) NULL,
	[Photo] [nvarchar](max) NULL,
	[DateUpdate] [date] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[ShipName] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[ShipPhone] [int] NULL,
	[ShipEmail] [nvarchar](max) NULL,
	[UpdateDate] [datetime] NULL,
	[ShipAddress] [nvarchar](max) NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetailId] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[ProviderId] [int] NULL,
	[CateId] [int] NULL,
	[Photo] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Discount] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [int] NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [int] NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[GroupId] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroups]    Script Date: 6/11/2024 5:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroups](
	[GroupId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserGroups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Card] ON 

INSERT [dbo].[Card] ([CardId], [NumberCard], [UserNumber], [UserId], [Identification]) VALUES (1, 560, 70000, 2, 2314234)
INSERT [dbo].[Card] ([CardId], [NumberCard], [UserNumber], [UserId], [Identification]) VALUES (2, 5600, 0, 38, 174660210)
INSERT [dbo].[Card] ([CardId], [NumberCard], [UserNumber], [UserId], [Identification]) VALUES (3, 0, 0, 41, NULL)
INSERT [dbo].[Card] ([CardId], [NumberCard], [UserNumber], [UserId], [Identification]) VALUES (4, 0, 0, 43, 1)
SET IDENTITY_INSERT [dbo].[Card] OFF
GO
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (1, N'Phòng ăn', N'phong-an', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (2, N'Phòng khách', N'phong-khach', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (3, N'Phòng thờ', N'phong-tho', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (4, N'Phòng ngủ', N'phong-ngu', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (5, N'Phòng làm việc', N'phong-lam-viec', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (6, N'Bàn', N'ban', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (7, N'Kệ', N'ke', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (8, N'Nệm', N'nem', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (9, N'Phong cách Havana', N'phong-cach-havana', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (10, N'Phong cách Korea', N'phong-cach-korea', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (11, N'Bàn làm việc', N'ban-lamviec', 6)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (12, N'Bàn ăn', N'ban-an', 6)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (13, N'Bàn trang điểm', N'ban-trang-diem', 6)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (14, N'Tủ', N'Tu', 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (15, N'Tủ hồ sơ', N'Tu-ho-so', 14)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (16, N'Tủ giầy', N'Tu-giay', 14)
INSERT [dbo].[Category] ([CategoryId], [Name], [MetaTitle], [ParId]) VALUES (17, N'Tủ quần áo', N'Tu-quan-ao', 14)
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ContactId], [Content], [Status], [EmailCC]) VALUES (1, N'Chào an huy', 1, N'ngocnguyen29696@gmail.com')
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[Credentials] ON 

INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (1, N'ADMIN', N'ADD_USER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (2, N'MOD', N'ADD_NEWS')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (3, N'MOD', N'UPDATE_NEWS')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (4, N'ADMIN', N'UPDATE_USER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (5, N'ADMIN', N'DELETE_USER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (6, N'ADMIN', N'VIEW_USER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (7, N'MOD', N'DELETE_NEWS')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (8, N'MOD', N'VIEW_NEWS')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (9, N'MOD', N'VIEW_PRODUCT')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (10, N'MOD', N'ADD_PRODUCT')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (11, N'MOD', N'DELETE_PRODUCT')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (12, N'MOD', N'UPDATE_PRODUCT')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (13, N'MOD', N'ADD_CATE')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (14, N'MOD', N'UPDATE_CATE')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (15, N'MOD', N'DELETE_CATE')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (16, N'MOD', N'VIEW_CATE')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (17, N'MOD', N'ADD_PROVIDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (18, N'MOD', N'UPDATE_PROVIDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (19, N'MOD', N'DELETE_PROVIDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (20, N'MOD', N'VIEW_PROVIDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (21, N'MOD', N'SHOW_ORDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (22, N'MOD', N'MANAGER_ORDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (23, N'MOD', N'SATISTIC_ORDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (24, N'ADMIN', N'VIEW_NEWS')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (25, N'ADMIN', N'DELETE_NEWS')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (26, N'ADMIN', N'ADD_NEWS')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (27, N'ADMIN', N'UPDATE_NEWS')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (28, N'ADMIN', N'VIEW_PRODUCT')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (29, N'ADMIN', N'ADD_PRODUCT')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (30, N'ADMIN', N'DELETE_PRODUCT')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (31, N'ADMIN', N'UPDATE_PRODUCT')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (32, N'ADMIN', N'ADD_CATE')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (33, N'ADMIN', N'UPDATE_CATE')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (34, N'ADMIN', N'DELETE_CATE')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (35, N'ADMIN', N'VIEW_CATE')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (36, N'ADMIN', N'ADD_PROVIDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (37, N'ADMIN', N'UPDATE_PROVIDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (38, N'ADMIN', N'DELETE_PROVIDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (39, N'ADMIN', N'VIEW_PROVIDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (40, N'ADMIN', N'SHOW_ORDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (41, N'ADMIN', N'MANAGER_ORDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (42, N'ADMIN', N'SATISTIC_ORDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (43, N'ADMIN', N'PRINT_ORDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (44, N'MOD', N'PRINT_ORDER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (45, N'MOD', N'ADD_USER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (46, N'MOD', N'UPDATE_USER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (47, N'MOD', N'DELETE_USER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (48, N'MOD', N'VIEW_USER')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (49, N'ADMIN', N'ADD_ADMIN')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (50, N'ADMIN', N'UPDATE_ADMIN')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (51, N'ADMIN', N'DELETE_ADMIN')
INSERT [dbo].[Credentials] ([CredenId], [UserGroupId], [RoleId]) VALUES (52, N'ADMIN', N'VIEW_ADMIN')
SET IDENTITY_INSERT [dbo].[Credentials] OFF
GO
INSERT [dbo].[News] ([NewsId], [Title], [Detail], [Photo], [DateUpdate]) VALUES (1, N'Sự tích phật di lặc, cách bài trí', N' Phật Di Lặc (Bồ Tát Di Lặc) được coi là vị Phật thứ 5, vị Phật cuối cùng sẽ xuất hiện trên trái đất sau khoảng 30.000 năm nữa, thay thế Phật Thích ca Mâu Ni.', N'85c885d0-0b4f-4d1a-8d7f-03bca057bfb9dilac.jpg', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[News] ([NewsId], [Title], [Detail], [Photo], [DateUpdate]) VALUES (2, N'Làng Đông Kị đi lên từ nghề gỗ', N'Lời đầu tiên Đồ Gỗ Đồng Kỵ Cao Cấp Phú Gia xin được gửi đến tất cả các vị khách quí gần xa một lời chào,một lời chúc sức khỏe, một năm phát tài phát lộc nhất !
', N'tin2.jpg', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[News] ([NewsId], [Title], [Detail], [Photo], [DateUpdate]) VALUES (3, N'Mua đồ gỗ ngày xưa cực đắt', N'Đi khắp làng Đồng Kỵ, nhà nào cũng có một xưởng chế tác gỗ, tiếng đục tràng, bào, tiếng cưa, rồi tiếng kì kèo ngã giá với lái buôn gỗ đã tạo nên một dàn âm thanh hỗn độn.', N'tin3.jpg', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[News] ([NewsId], [Title], [Detail], [Photo], [DateUpdate]) VALUES (4, N'Nghệ nhân đục tượng Quan Văn Trường', N'Đi khắp làng Đồng Kỵ, nhà nào cũng có một xưởng chế tác gỗ, tiếng đục tràng, bào, tiếng cưa, rồi tiếng kì kèo ngã giá với lái buôn gỗ đã tạo nên một dàn âm thanh hỗn độn.', N'tin4.jpg', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[News] ([NewsId], [Title], [Detail], [Photo], [DateUpdate]) VALUES (5, N'Độc đáo lời giải lấy vợ chồng ở Đông Kị', N'NULL"Phải môn đăng hộ đối"', N'tin5.jpg', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[News] ([NewsId], [Title], [Detail], [Photo], [DateUpdate]) VALUES (6, N'Phục chế chấn phong cổ', N'Chủ nhân của một bức Trấn phong cổ có tuổi khoảng 100 năm tại phố cổ Hà Nội muốn phục chế lại trong tình trạng nhiều chi tiết bị gẫy, mất, đặc biệt là đôi nghê đã bị mất. Sau đây sẽ là công đoạn chúng tôi phục chế lại dựa trên các tác phẩm cùng thời đó.', N'tin6.jpg', CAST(N'2018-09-29' AS Date))
INSERT [dbo].[News] ([NewsId], [Title], [Detail], [Photo], [DateUpdate]) VALUES (7, N'Hội rước vào làng đông kị', N'  Hội rước pháo làng Đồng Kỵ là hoạt động tiêu biểu nhất mà người dân làng nghề giàu có nhất vùng Bắc Ninh còn lưu giữ được đến ngày nay, là nghi thức truyền thống được nhiều người dân mong đợi nhất trong suốt 3 ngày hội (mùng 4, 5, 6 tháng Giêng Âm lịch).', N'tin7.jpg', NULL)
INSERT [dbo].[News] ([NewsId], [Title], [Detail], [Photo], [DateUpdate]) VALUES (87687, N'hghfh', N'hghjhfhj', N'tham6.jpg', CAST(N'2019-04-04' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1113, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-22T13:07:47.223' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 3)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1114, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-02T00:00:00.000' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 5)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1115, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-02T00:00:00.000' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 1)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1116, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-22T13:07:56.433' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 5)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1117, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-02T00:00:00.000' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 1)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1118, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-03T00:00:00.000' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 3)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1119, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-03T00:00:00.000' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 1)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1120, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-03T00:00:00.000' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 1)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1121, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-22T00:00:00.000' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 1)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1122, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-22T14:18:02.297' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 1)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1123, N'Đặng Văn Sâm', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-22T14:20:24.470' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 5)
INSERT [dbo].[Order] ([OrderId], [ShipName], [UserId], [ShipPhone], [ShipEmail], [UpdateDate], [ShipAddress], [StatusId]) VALUES (1124, N'aaaa', 39, 968012687, N'dangvansam98@gmail.com', CAST(N'2021-03-22T14:21:27.920' AS DateTime), N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1131, 1113, 123, 13, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1132, 1114, 4, 5600000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1133, 1114, 32231, 213, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1134, 1115, 4, 5600000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1135, 1115, 32231, 213, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1136, 1116, 14, 5600000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1138, 1118, 72, 56000000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1139, 1118, 89, 7000000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1140, 1118, 18, 5600000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1141, 1119, 18, 4480000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1142, 1120, 17, 4480000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1143, 1120, 16, 4480000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1144, 1121, 6, 4480000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1145, 1122, 227, 2000000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1146, 1123, 227, 2000000, 1)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1147, 1124, 227, 2000000, 200)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (1, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 143, 1, 1, N'thumb_1376992505.jpg', CAST(N'2019-03-20' AS Date), CAST(N'2019-04-01' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (2, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 197, 1, 1, N'thumb_1377874658.jpg', CAST(N'2019-03-06' AS Date), CAST(N'2019-04-26' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (3, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 189, 1, 1, N'thumb_1377874715.jpg', CAST(N'2019-04-11' AS Date), CAST(N'2019-04-24' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (4, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 192, 1, 1, N'thumb_1377875014.jpg', CAST(N'2019-04-25' AS Date), CAST(N'2019-06-20' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (5, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 181, 1, 1, N'thumb_1377875788.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (6, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 199, 1, 1, N'thumb_1383403794.jpg', CAST(N'2019-03-06' AS Date), CAST(N'2019-04-27' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (7, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 190, 1, 1, N'thumb_1418533069.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (8, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 200, 1, 1, N'thumb_1420469559.jpg', CAST(N'2019-04-08' AS Date), CAST(N'2019-04-25' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (9, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 198, 1, 1, N'thumb_1425355315.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (10, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 200, 1, 1, N'thumb_1425355514.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (11, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 199, 1, 1, N'thumb_1507260452.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (12, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 198, 1, 1, N'thumb_1508120608.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (13, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 200, 1, 1, N'thumb_1508120608.jpg', CAST(N'2019-03-04' AS Date), CAST(N'2019-04-26' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (14, N'Bộ bàn ăn', N'Bàn ăn sang trọng dành cho gia đình', 5600000, 199, 1, 1, N'thumb_1513578925.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (15, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 200, 1, 2, N'thumb_1513654879.jpg', CAST(N'2019-04-12' AS Date), CAST(N'2019-06-20' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (16, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 196, 1, 2, N'thumb_1513654934.jpg', CAST(N'2019-04-25' AS Date), CAST(N'2019-06-21' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (17, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 199, 1, 2, N'thumb_1513655228.jpg', CAST(N'2019-04-01' AS Date), CAST(N'2019-06-21' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (18, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 188, 1, 2, N'thumb_1513664589.jpg', CAST(N'2019-02-05' AS Date), CAST(N'2019-06-20' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (19, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 199, 1, 2, N'thumb_1513665166.jpg', CAST(N'2019-04-19' AS Date), CAST(N'2019-10-25' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (20, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 195, 1, 2, N'thumb_1513665233.jpg', CAST(N'2019-04-27' AS Date), CAST(N'2019-05-17' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (21, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 200, 1, 2, N'thumb_1513666173.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (22, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 200, 2, 2, N'thumb_1514186660.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (23, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 200, 2, 2, N'thumb_1514186977.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (24, N'Bộ đồ phòng khách', N'Phòng khách sang trọng ', 5600000, 200, 2, 2, N'thumb_1513654879.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (25, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 2, 3, N'thumb_1378371438.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (26, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 2, 3, N'thumb_1381731174.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (27, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 2, 3, N'thumb_1418223701.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (28, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 2, 3, N'thumb_1418280479.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (29, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 3, 3, N'thumb_1418615483.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (30, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 3, 3, N'thumb_1419214291.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (31, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 1, 3, N'thumb_1453199787.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (32, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 1, 3, N'thumb_1484281082.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (33, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 1, 3, N'thumb_1507260662.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (34, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 1, 3, N'thumb_1508902967.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (35, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 1, 3, N'thumb_1514192374.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (36, N'Bộ đồ phòng thờ', N'Phòng thờ sang trọng', 5600000, 200, 1, 3, N'thumb_1514192374.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (37, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1483501870.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (38, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1506927150.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (39, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1508120891.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (40, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1508377562.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (41, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1508377603.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (42, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1514186865.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (43, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1514186908.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (44, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1514954124.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (45, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1514954270.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (46, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1514954400.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (47, N'Bộ đồ phòng ngủ', N'Phòng ngủ sang trọng', 5600000, 200, 3, 4, N'thumb_1514954504.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (48, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1514954903.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (49, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1378047060.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (50, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1408955631.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (51, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1408955750.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (52, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1408956095.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (53, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1411444438.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (54, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1481619768.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (55, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1502176109.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (56, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 3, 5, N'thumb_1508377429.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (57, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 1, 5, N'thumb_1508378055.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (58, N'Bộ đồ làm việc', N'Phong cách thoải mái', 5600000, 200, 1, 5, N'thumb_1508378055.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (59, N'Bàn ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 172, 1, 11, N'ban1.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (61, N'Bàn ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 1, 11, N'ban6.jpg', CAST(N'2019-03-20' AS Date), CAST(N'2019-03-22' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (62, N'Bàn ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 192, 1, 12, N'ban5.jpg', CAST(N'2019-04-12' AS Date), CAST(N'2019-04-28' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (63, N'Bàn ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 1, 11, N'ban5.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (64, N'Bàn ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 1, 12, N'ban6.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (65, N'Bàn ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 1, 11, N'hvana1.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (66, N'Bàn ', N'Phong cách sang trọng cùng với sự tinh tế', 56000000, 200, 1, 12, N'thumb_1508120608.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (67, N'Kệ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 1, 7, N'ke1.jpg', CAST(N'2019-04-01' AS Date), CAST(N'2019-04-26' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (68, N'Kệ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 198, 1, 7, N'ke2.gif', CAST(N'2019-04-01' AS Date), CAST(N'2019-06-19' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (69, N'Kệ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 1, 7, N'ke3.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (70, N'Kệ', N'Phong cách sang trọng cùng với sự tinh tế', 56000000, 199, 1, 7, N'ke4.jpg', CAST(N'2019-04-01' AS Date), CAST(N'2019-06-27' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (71, N'Kệ', N'Phong cách sang trọng cùng với sự tinh tế', 56000000, 200, 1, 7, N'ke5.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (72, N'Kệ', N'Phong cách sang trọng cùng với sự tinh tế', 56000000, 184, 1, 7, N'ke6.jpg', CAST(N'2019-04-19' AS Date), CAST(N'2019-04-27' AS Date), 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (73, N'Kệ', N'Phong cách sang trọng cùng với sự tinh tế', 56000000, 200, 1, 7, N'ke7.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (74, N'Nệm', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 2, 8, N'nem1.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (75, N'Nệm', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 197, 2, 8, N'nem2.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (76, N'Nệm', N'Phong cách sang trọng cùng với sự tinh tế', 26000000, 200, 2, 8, N'nem3.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (77, N'Nệm', N'Phong cách sang trọng cùng với sự tinh tế', 15600000, 200, 2, 8, N'nem4.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (78, N'Nệm', N'Phong cách sang trọng cùng với sự tinh tế', 15600000, 200, 2, 8, N'nem5.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (79, N'Tủ', N'Phong cách sang trọng cùng với sự tinh tế', 15600000, 200, 2, 10, N'kore1.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (80, N'Tủ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 2, 10, N'kro2.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (81, N'Tủ', N'Phong cách sang trọng cùng với sự tinh tế', 15600000, 200, 2, 10, N'kro3.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (82, N'Tủ', N'Phong cách sang trọng cùng với sự tinh tế', 15600000, 200, 2, 10, N'kro4.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (83, N'Tủ', N'Phong cách sang trọng cùng với sự tinh tế', 16000000, 200, 2, 10, N'kro5.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (84, N'Tủ', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 2, 10, N'kro6.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (85, N'Tủ', N'Phong cách sang trọng cùng với sự tinh tế', 7600000, 200, 2, 10, N'kro7.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (86, N'Tủ', N'Phong cách sang trọng cùng với sự tinh tế', 15600000, 200, 2, 10, N'kro8.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (87, N'Tủ cá nhân', N'Phong cách sang trọng cùng với sự tinh tế', 15600000, 82, 1, 9, N'hvana.jpg', CAST(N'2019-04-18' AS Date), CAST(N'2019-04-25' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (88, N'Tủ cá nhân', N'Phong cách sang trọng cùng với sự tinh tế', 7600000, 196, 2, 9, N'hvana1.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (89, N'Tủ cá nhân', N'Phong cách sang trọng cùng với sự tinh tế', 7000000, 199, 2, 9, N'hvana2.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (90, N'Tủ cá nhân', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 2, 9, N'hvana3.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (91, N'Tủ cá nhân', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 2, 9, N'hvana4.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (92, N'Tủ cá nhân', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 2, 9, N'hvana5.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (93, N'Tủ cá nhân', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 2, 9, N'hvana6.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (94, N'Tủ cá nhân', N'Phong cách sang trọng cùng với sự tinh tế', 5600000, 200, 2, 9, N'hvana7.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (112, N'Bàn trang điểm', N'Bàn trang điểm với thiết kế sang trọng', 21342000, 233, 1, 13, N'trangdiem3.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (113, N'Bàn trang điểm', N'Bàn trang điểm', 21300000, 233, 1, 13, N'trangdiem1.jpg', CAST(N'2019-04-09' AS Date), CAST(N'2019-04-12' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (114, N'Bàn trang điểm', N'Bàn trang điểm', 2130000, 130, 1, 13, N'trangdiem2.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (123, N'132', N'13', 13, 13211, 1, 123, N'ban5.jpg', CAST(N'2019-03-21' AS Date), CAST(N'2019-03-15' AS Date), 20)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (223, N'Tủ hồ sơ', N'Tủ hồ sơ', 20000000, 200, 1, 15, N'tuhoso1.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (224, N'Tủ hồ sơ', N'Tủ hồ sơ', 2000000, 200, 1, 15, N'tuhoso2.jpg', NULL, NULL, 0)
GO
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (225, N'Tủ hồ sơ', N'Tủ hồ sơ', 2000000, 200, 1, 15, N'tuhoso3.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (226, N'Tủ hồ sơ', N'Tủ hồ sơ', 2000000, 200, 1, 15, N'tuhoso4.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (227, N'Tủ hồ sơ', N'Tủ hồ sơ', 2000000, -2, 1, 15, N'tuhoso6.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (228, N'Tủ hồ sơ', N'Tủ hồ sơ', 2000000, 200, 1, 15, N'tuhoso7.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (229, N'Tủ hồ sơ', N'Tủ hồ sơ', 20000000, 200, 1, 15, N'tuhoso8.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (230, N'Tủ giầy', N'Tủ giầy', 23000000, 300, 1, 16, N'tugiay1.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (231, N'Tủ giầy', N'Tủ giầy', 1300000, 200, 1, 16, N'tugiay2.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (232, N'Tủ giầy', N'Tủ giầy', 3200000, 200, 1, 16, N'tugiay3.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (234, N'Tủ giầy', N'Tủ giầy', 2300000, 200, 1, 16, N'tugiay4.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (235, N'Tủ giầy', N'Tủ giầy', 2000000, 200, 1, 16, N'tugiay6.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (236, N'Tủ quần áo', N'Tủ quần áo', 2300000, 200, 1, 17, N'tuquanao.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (238, N'Tủ quần áo', N'Tủ quần áo', 2300000, 200, 1, 17, N'tuquanao1.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (239, N'Tủ quần áo', N'Tủ quần áo', 230000, 200, 1, 17, N'tuquanao2.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (240, N'Tủ quần áo', N'Tủ quần áo', 23000000, 200, 1, 17, N'tuquanao3.jpg', NULL, NULL, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [Description], [Price], [Quantity], [ProviderId], [CateId], [Photo], [StartDate], [EndDate], [Discount]) VALUES (241, N'Tủ quần áo', N'Tủ quần áo', 230000, 200, 1, 17, N'tuquanao4.jpg', NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([ProviderId], [Name], [Address], [Phone]) VALUES (1, N'CÔNG TY CỔ PHẦN SÔNG LÔ', N'Thái Bình', 12343214)
INSERT [dbo].[Provider] ([ProviderId], [Name], [Address], [Phone]) VALUES (2, N'NỘI THẤT NHẬP KHẨU LAN ANH', N'HÀ NỘI', 1243234)
INSERT [dbo].[Provider] ([ProviderId], [Name], [Address], [Phone]) VALUES (3, N'ĐỒ GỖ MỸ NGHỆ BẮC NINH', N'Bắc Ninh', 22134312)
INSERT [dbo].[Provider] ([ProviderId], [Name], [Address], [Phone]) VALUES (7, N'NCC1', N'số 12, nghách 3/29, Phạm Tuấn Tài, Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 968012687)
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'ADD_ADMIN', N'thêm quản trị')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'ADD_CATE', N'thêm loại sản phẩm')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'ADD_NEWS', N'Thêm tin tức')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'ADD_PRODUCT', N'thêm sản phẩm')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'ADD_PROVIDER', N'thêm nhà cung cấp')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'ADD_USER', N'thêm người dùng')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'DELETE_ADMIN', N'xóa quản trị')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'DELETE_CATE', N'xóa loại sản phẩm')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'DELETE_NEWS', N'xóa tin tức')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'DELETE_PRODUCT', N'xóa sản phẩm')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'DELETE_PROVIDER', N'xóa nhà cung cấp')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'MANAGER_ORDER', N'quản lý hóa đơn')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'PRINT_ORDER', N'in hóa đơn')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'SATISTIC_ORDER', N'thống kê hóa đơn')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'SHOW_ORDER', N'hiển thị hóa đơn')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'UPDATE_ADMIN', N'cập nhật quản trị')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'UPDATE_CATE', N'cập nhật loại sản phẩm')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'UPDATE_NEWS', N'Cập nhật tin tức')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'UPDATE_PRODUCT', N'cập nhật sản phẩm')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'UPDATE_PROVIDER', N'cập nhật nhà cung cấp')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'UPDATE_USER', N'cập nhật người dùng')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'VIEW_ADMIN', N'hiển thị quản trị')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'VIEW_CATE', N'hiển thị loại sản phẩm')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'VIEW_NEWS', N'hiển thị tin tức')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'VIEW_PRODUCT', N'hiển thị sản phẩm')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'VIEW_PROVIDER', N'hiển thị nhà cung cấp')
INSERT [dbo].[Role] ([RoleId], [Name]) VALUES (N'VIEW_USER', N'hiển thị người dùng')
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (1, N'Đã tiếp nhận')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (2, N'Đang chờ xử lý')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (3, N'Đã xử lý')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (4, N'Đang giao hàng')
INSERT [dbo].[Status] ([StatusId], [Name]) VALUES (5, N'Đã thanh toán')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Name], [Address], [Phone], [Username], [Password], [Email], [GroupId], [Status]) VALUES (39, N'aaaa', N'Dịch Vọng Hậu, Cầu Giấy, Hà Nội', 968012687, N'sam', N'332532dcfaa1cbf61e2a266bd723612c', N'dangvansam98@gmail.com', N'USER', 1)
INSERT [dbo].[User] ([UserId], [Name], [Address], [Phone], [Username], [Password], [Email], [GroupId], [Status]) VALUES (40, N'admin', N'Hà Nội', 2222, N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'admin@gmail.com', N'ADMIN', 1)
INSERT [dbo].[User] ([UserId], [Name], [Address], [Phone], [Username], [Password], [Email], [GroupId], [Status]) VALUES (41, N'son123', N'Hải Dương', 12345, N'son', N'498d3c6bfa033f6dc1be4fcc3c370aa7', N'dangvansam98@gmail.com', N'USER', 1)
INSERT [dbo].[User] ([UserId], [Name], [Address], [Phone], [Username], [Password], [Email], [GroupId], [Status]) VALUES (42, N'Nhân Viên 1', N'Hà Nội', 123456789, N'nhanvien1', N'fcf321d09609565b7a1ce6e70f1f5056', N'nv1@gmail.com', N'MOD', 1)
INSERT [dbo].[User] ([UserId], [Name], [Address], [Phone], [Username], [Password], [Email], [GroupId], [Status]) VALUES (43, N'Nguyễn Văn Admin', N'Nghệ An', 984277907, N'Admin1', N'e10adc3949ba59abbe56e057f20f883e', N'anthonynkbq@gmail.com', N'ADMIN', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserGroups] ([GroupId], [Name]) VALUES (N'ADMIN', N'Quản trị  ')
INSERT [dbo].[UserGroups] ([GroupId], [Name]) VALUES (N'MOD', N'Quản lý   ')
INSERT [dbo].[UserGroups] ([GroupId], [Name]) VALUES (N'USER', N'Người dùng')
GO
USE [master]
GO
ALTER DATABASE [DBNoiThat] SET  READ_WRITE 
GO
