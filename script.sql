USE [master]
GO
/****** Object:  Database [Vegetable_Store]    Script Date: 10/29/2021 5:20:15 PM ******/
CREATE DATABASE [Vegetable_Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vegetable_Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Vegetable_Store.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Vegetable_Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Vegetable_Store_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Vegetable_Store] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vegetable_Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vegetable_Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vegetable_Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vegetable_Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vegetable_Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vegetable_Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vegetable_Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vegetable_Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vegetable_Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vegetable_Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vegetable_Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vegetable_Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vegetable_Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vegetable_Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vegetable_Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vegetable_Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vegetable_Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vegetable_Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vegetable_Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vegetable_Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vegetable_Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vegetable_Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vegetable_Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vegetable_Store] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vegetable_Store] SET  MULTI_USER 
GO
ALTER DATABASE [Vegetable_Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vegetable_Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vegetable_Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vegetable_Store] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Vegetable_Store] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Vegetable_Store]
GO
/****** Object:  Table [dbo].[tblCategorys]    Script Date: 10/29/2021 5:20:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategorys](
	[categoryID] [nvarchar](50) NOT NULL,
	[categoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCategorys] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 10/29/2021 5:20:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [nvarchar](50) NOT NULL,
	[orderID] [nvarchar](50) NOT NULL,
	[productID] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 10/29/2021 5:20:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[date] [nvarchar](50) NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 10/29/2021 5:20:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[categoryID] [nvarchar](50) NOT NULL,
	[descr] [nvarchar](50) NOT NULL,
	[img] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[statusID] [nvarchar](1) NOT NULL,
	[expiration] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 10/29/2021 5:20:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [nvarchar](1) NOT NULL,
	[statusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 10/29/2021 5:20:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[roleID] [nvarchar](2) NOT NULL,
	[statusID] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (N'56506195-b72c-4385-ba2e-aab46ab9e7fb', N'Root')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (N'9919db30-bd7a-46c0-87c1-b0dd1922faa1', N'Mushroom')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (N'9dd3cff3-416b-4084-bb27-71af1f50100a', N'Test add')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (N'c0ba6929-529c-4113-bda5-62dfc0aee1cf', N'Vegetable')
INSERT [dbo].[tblCategorys] ([categoryID], [categoryName]) VALUES (N'ddce186e-e76e-467c-b5be-969db12e747c', N'Fruit')
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'58zxw8kr-2uxq-g1qr-v6yu-5ivh', N'9ryn247b-2qmq-ocyg-86e7-9wy2', N'5c4ee836-3c67-4314-a0e7-7978754091cd', 1, 10000)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'e482c491-00f5-4927-bfae-35cb0c4484b9', N'300a4d89-5392-4bb8-bc13-49283f10c8e3', N'23acc6d1-2e8e-4eb0-9306-266088e1cdb6', 1, 16000)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (N'g9n0he50-pfa6-cety-aibo-8v8x', N'9ryn247b-2qmq-ocyg-86e7-9wy2', N'23acc6d1-2e8e-4eb0-9306-266088e1cdb6', 1, 16000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'123', N'user', N'24/12/2021', 16000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'300a4d89-5392-4bb8-bc13-49283f10c8e3', N'user', N'23/10/2021', 16000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'9ryn247b-2qmq-ocyg-86e7-9wy2', N'user', N'25/10/2021', 26000)
INSERT [dbo].[tblOrders] ([orderID], [userID], [date], [total]) VALUES (N'hhv0sg7i-n8sg-jc1u-dwkh-9yy1', N'user', N'24/10/2021', 5000)
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'23acc6d1-2e8e-4eb0-9306-266088e1cdb6', N'Apple', N'ddce186e-e76e-467c-b5be-969db12e747c', N'Táo', N'https://vnn-imgs-f.vgcloud.vn/2020/12/13/13/thuc-hu-cau-noi-mot-qua-tao-giup-ban-luon-khoe-manh.jpg', 40, 16000, N'0', N'22/12/2021')
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'454488f4-f957-4437-863c-0470e8fb7053', N'Straw mushrooms', N'9919db30-bd7a-46c0-87c1-b0dd1922faa1', N'Nấm rơm', N'https://ngonaz.com/wp-content/uploads/2021/06/gia-nam-rom-2.jpg', 100, 20000, N'0', N'22/12/2021')
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'5c4ee836-3c67-4314-a0e7-7978754091cd', N'Cabbage', N'c0ba6929-529c-4113-bda5-62dfc0aee1cf', N'Bắp cải', N'https://farm24h.vn/wp-content/uploads/2020/04/BAPCAITRON.jpg', 20, 10000, N'0', N'22/12/2021')
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'8a3ae4b9-16dd-46e3-bc01-50569935d635', N'Mango', N'ddce186e-e76e-467c-b5be-969db12e747c', N'Xoài', N'https://media.ex-cdn.com/EXP/media.nongnghiep.vn/files/f1/2019/5/19/xoi-2151935697.jpg', 50, 11300, N'0', N'22/12/2021')
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'9ab96063-3212-43a0-9627-9e52ab371bcd', N'Lemon ', N'ddce186e-e76e-467c-b5be-969db12e747c', N'Chanh vàng', N'https://cdn-img-v2.webbnc.net/media/4678/Tin%20T%E1%BB%A9c/chanh-vang-da-lat.jpg', 100, 45000, N'0', N'22/12/2021')
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'9fe3f5b0-cf8e-49fa-afe5-532cfae7e5a9', N'Green onion', N'c0ba6929-529c-4113-bda5-62dfc0aee1cf', N'Hành lá', N'https://media-cdn.laodong.vn/Storage/NewsPortal/2020/9/30/840429/Hanh-La-Tot-Suc-Khoe.jpg', 100, 1000, N'0', N'22/12/2021')
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'bdda928b-d49c-4c15-8b6b-57394e7fc873', N'Corn', N'56506195-b72c-4385-ba2e-aab46ab9e7fb', N'Ngô ', N'https://minhcaumart.vn/media/com_eshop/products/NGONGOT.jpg', 100, 20000, N'0', N'22/12/2021')
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'cdc2bfbd-32c9-4cfd-920d-5cb4fe643dbe', N'Fatty mushrooms', N'9919db30-bd7a-46c0-87c1-b0dd1922faa1', N'Nấm mỡ', N'https://namxanh.vn/wp-content/uploads/2021/03/nam-mo-3.jpg', 100, 60000, N'0', N'22/21/2021')
INSERT [dbo].[tblProducts] ([productID], [name], [categoryID], [descr], [img], [quantity], [price], [statusID], [expiration]) VALUES (N'd29a11bc-c01a-4d6a-b85e-7ad782eed7d7', N'Tomato', N'56506195-b72c-4385-ba2e-aab46ab9e7fb', N'Quả cà chua', N'https://www.vtechfarms.com/UploadedFiles/Products/ca%20chua%20(9)_cecp.jpg', 100, 15000, N'0', N'22/12/2021')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'0', N'AVAILABLE')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (N'1', N'DISABLE')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [roleID], [statusID]) VALUES (N'admin', N'Admin', N'12345', N'Khu Công Nghệ Cao, Long Thạnh Mỹ, Hồ Chí Minh', N'028 7300 5589', N'AD', N'0')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [roleID], [statusID]) VALUES (N'test', N'test acc', N'12345', N'a', N'021346789', N'US', N'0')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [roleID], [statusID]) VALUES (N'user', N'User', N'12345', N'Khu Công Nghệ Cao, Long Thạnh Mỹ, Hồ Chí Minh', N'028 7300 5588', N'US', N'0')
INSERT [dbo].[tblUsers] ([userID], [name], [password], [address], [phone], [roleID], [statusID]) VALUES (N'user1', N'Tráº§n Minh Thuáº­n', N'12345', N'95/9 ÄÆ°á»ng HÃ ng Tre, Quáº­n 9, tpHCM', N'0794284022', N'US', N'0')
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategorys] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategorys] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategorys]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [Vegetable_Store] SET  READ_WRITE 
GO
