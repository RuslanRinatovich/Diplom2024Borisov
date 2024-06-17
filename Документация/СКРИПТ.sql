USE [master]
GO
/****** Object:  Database [WindowRepairDB]    Script Date: 17.06.2024 16:20:19 ******/
CREATE DATABASE [WindowRepairDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WindowRepairDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WindowRepairDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WindowRepairDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\WindowRepairDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WindowRepairDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WindowRepairDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WindowRepairDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WindowRepairDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WindowRepairDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WindowRepairDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WindowRepairDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WindowRepairDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WindowRepairDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WindowRepairDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WindowRepairDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WindowRepairDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WindowRepairDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WindowRepairDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WindowRepairDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WindowRepairDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WindowRepairDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WindowRepairDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WindowRepairDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WindowRepairDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WindowRepairDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WindowRepairDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WindowRepairDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WindowRepairDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WindowRepairDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WindowRepairDB] SET  MULTI_USER 
GO
ALTER DATABASE [WindowRepairDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WindowRepairDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WindowRepairDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WindowRepairDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WindowRepairDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WindowRepairDB] SET QUERY_STORE = OFF
GO
USE [WindowRepairDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 17.06.2024 16:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 17.06.2024 16:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[DateOrder] [datetime] NOT NULL,
	[Total] [int] NOT NULL,
	[Paid] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 17.06.2024 16:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Pricelist] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 17.06.2024 16:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.06.2024 16:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](100) NULL,
	[Price] [int] NOT NULL,
	[Color] [nvarchar](60) NOT NULL,
	[Size] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Weapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.06.2024 16:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 17.06.2024 16:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17.06.2024 16:20:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Пластиковые окна')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Остекление')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'Жалюзи')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Рулонные шторы')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (5, N'Москитные сетки')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (6, N'Рольставни')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (7, N'Маркизы и навесы')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (8, N'Фурнитура')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (3, N'bulat', CAST(N'2024-06-17T15:49:37.000' AS DateTime), 7400, 1)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (4, N'dan', CAST(N'2024-06-17T15:52:45.000' AS DateTime), 9600, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderService] ON 

INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (52, 3, 1, 71)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (53, 3, 1, 70)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (54, 3, 1, 98)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (55, 4, 1, 70)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (56, 4, 5, 71)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (57, 4, 1, 24)
SET IDENTITY_INSERT [dbo].[OrderService] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (1, N'DIY Moderno88889', N'Портал DIY - «сделай сам» (англ. Do It Yourself) предназначен для декоративного оформления межкомнатного проема.', N'1portal-moderno-grey-wood-1640355494.jpg', 9000, N'Grey Wood', N'2100*900', 2)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (3, N'DIY Moderno', N'ортал DIY - «сделай сам» (англ. Do It Yourself) предназначен для декоративного оформления межкомнатного проема.', N'portal-moderno-brown-dreamline-1640171941.jpg', 3486, N'Brown Dreamline', N'2100*900', 3)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (5, N'Бравo', N'Универсальная межкомнатная арка с отделкой Винил.', N'6011371eae5180.54502753.jpg', 5572, N'Milano Vero', N'230*70-150*40', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (6, N'Бравo', N'Универсальная межкомнатная арка с отделкой Винил.', N'601020d0ce08c2.78902131.jpg', 5572, N'Italiano Vero', N'230*70-150*40', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (10, N'Бравo', N'Универсальная межкомнатная арка с отделкой Винил.', N'6011372bd75453.85558939.jpg', 5572, N'Dark Barnwood', N'230*70-150*40', 1)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (12, N'Техно', N'Стальной дверной блок с открыванием наружу. Поставляется с правым и левым открыванием.', N'born1', 23492, N'Букле черное/Cappuccino Veralinga', N'205*86 205*96', 2)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (15, N'Мило', N'Стальной дверной блок с открыванием наружу. Поставляется с правым и левым открыванием.', N'milo1.jpg', 22092, N'Букле черное/Cappuccino Veralinga', N'205*86 205*96', 2)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (17, N'Флэш Kale', N'Стальной дверной блок, окрашенный в белый цвет, с открыванием наружу. Поставляется с правым и левым открыванием.', N'fleshcale.jpg', 28672, N'Шагрень белая/Off-white', N'205*86 205*96', 2)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (19, N'Браво-21', N'Рамочные (царговые) двери изготовлены из ЛВЛ (англ. Laminated Veneer Lumber, LVL) или высококачественного соснового бруса и плитных материалов, без пустот. Бескромочная технология производства. Крепеж из закаленной стали надежно фиксирует детали двери в 8 точках (у других производителей, как правило, не более 4).', N'bravo1.jpg', 5782, N'Snow Melinga', N'200*60 200*70 200*80 200*90', 3)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (20, N'Браво-21', N'Рамочные (царговые) двери изготовлены из ЛВЛ (англ. Laminated Veneer Lumber, LVL) или высококачественного соснового бруса и плитных материалов, без пустот. Бескромочная технология производства. Крепеж из закаленной стали надежно фиксирует детали двери в 8 точках (у других производителей, как правило, не более 4).', N'bravo2.jpg', 5782, N'Grey Melinga', N'200*60 200*70 200*80 200*90', 3)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (21, N'Скинни-12', N'Брус хвойных пород, МДФ, сотовый наполнитель.', N'skinni.jpg', 7847, N'Dark Barnwood', N'200*60 200*70 200*80 200*90', 3)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (23, N'Скинни-12', N'Брус хвойных пород, МДФ, сотовый наполнитель.', N'skinniw.jpg', 7707, N'П-23 (Белый)', N'200*60 200*70 200*80 200*90', 3)
INSERT [dbo].[Product] ([Id], [Title], [Description], [Photo], [Price], [Color], [Size], [CategoryId]) VALUES (28, N'Лайт', N'Межкомнатная дверь из закаленного сатинированного стекла, с еврокромкой', N'lait.jpg', 7266, N'Белое Сатинато', N'200*60 200*70 200*80 200*90', 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Title]) VALUES (1, N'администратор')
INSERT [dbo].[Role] ([Id], [Title]) VALUES (2, N'клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (6, N'Расширение дверных проемов', 1, 2000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (7, N'Уменьшить дверной проём', 1, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (8, N'Установка готовых арок', 1, 5400)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (9, N'Замена замка на пластиковой двери', 2, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (10, N'Замена петель на пластиковых дверях', 2, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (11, N'Замена ручки на пластиковой балконной двери', 2, 300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (12, N'Замена стекла балконной двери', 2, 3000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (13, N'Замена стеклопакета в пластиковой двери', 2, 3000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (14, N'Замена уплотнителя на балконной двери', 2, 300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (15, N'Регулировка пластиковых дверей балкона', 2, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (16, N'Ремонт балконных дверей', 2, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (17, N'Ремонт деревянной балконной двери', 2, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (18, N'Ремонт замка пластиковой двери', 2, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (19, N'Ремонт пластиковых дверей', 2, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (20, N'Ремонт ручки балконной двери', 2, 3000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (21, N'Установка алюминиевых дверей', 2, 3000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (22, N'Установка балконных дверей', 2, 3000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (23, N'Врезка дверного глазка', 3, 678)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (24, N'Демонтаж металлических дверей', 3, 2400)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (25, N'Замена входных дверей', 3, 6300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (26, N'Замена дверных замков Гардиан', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (27, N'Замена замка Чиза', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (28, N'Замена замков Superlock', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (29, N'Замена замков Мультилок', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (30, N'Замена личинки в замке входной двери', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (31, N'Замена личинки замка Мультилок', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (32, N'Замена личинки Моттура', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (33, N'Замена накладки на входной двери', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (34, N'Замена сувальдного замка в металлической двери', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (35, N'Заменить замок входной двери', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (36, N'Монтаж откосов на входные двери', 3, 4500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (37, N'Перекодировка замка Cisa', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (38, N'Покраска дверей', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (39, N'Поменять замок Мастер‑Лок', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (40, N'Ремонт входной двери Multilock', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (41, N'Ремонт дверей Бульдорс', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (42, N'Ремонт замка входной двери', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (43, N'Ремонт замков Cisa', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (44, N'Ремонт личинки замка', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (45, N'Ремонт магнитных замков на двери', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (46, N'Ремонт металлической двери', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (47, N'Ремонт накладного замка', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (48, N'Ремонт сувальдного замка', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (49, N'Установить входную дверь Гардиан', 3, 6300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (50, N'Установить входную дверь Форпост', 3, 6300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (51, N'Установить замок на входную дверь', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (52, N'Установка врезного замка', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (53, N'Установка дверного доводчика', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (54, N'Установка дверных ручек', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (55, N'Установка доборов на входную дверь', 3, 4000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (56, N'Установка замка на калитку', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (57, N'Установка замков в гаражные ворота', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (58, N'Установка зеркала на входную дверь', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (59, N'Установка кодового замка', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (60, N'Установка мдф панели на входную дверь', 3, 6300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (61, N'Установка металлических дверей', 3, 6300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (62, N'Установка наличников на входную дверь', 3, 300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (63, N'Установка пластиковой входной двери', 3, 6300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (64, N'Установка противопожарных дверей', 3, 6300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (65, N'Установка стеклянных дверей', 3, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (66, N'Установка электромагнитного замка', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (67, N'Установка электромеханического замка', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (68, N'Установка электронного замка', 3, 1800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (69, N'Врезать замок в деревянную дверь', 4, 900)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (70, N'Демонтаж дверного проёма', 4, 1200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (71, N'Демонтаж межкомнатных дверей', 4, 1200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (72, N'Замена замка в межкомнатной двери', 4, 900)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (73, N'Заменить дверное полотно', 4, 5400)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (74, N'Монтаж дверей‑купе', 4, 4200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (75, N'Монтаж межкомнатных дверей', 4, 5300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (76, N'Остекление межкомнатных дверей', 4, 600)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (77, N'Покраска межкомнатных дверей', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (78, N'Ремонт автоматических дверей', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (79, N'Ремонт дверной коробки межкомнатной двери', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (80, N'Ремонт дверной ручки', 4, 400)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (81, N'Ремонт дверных ручек межкомнатных дверей', 4, 400)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (82, N'Ремонт замка межкомнатной двери', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (83, N'Ремонт межкомнатных дверей', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (84, N'Ремонт петель', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (85, N'Ремонт раздвижных дверей', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (86, N'Ремонт стеклянных дверей', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (87, N'Установить деревянную межкомнатную дверь', 4, 5300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (88, N'Установить межкомнатную дверь BRAVO', 4, 5300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (89, N'Установить межкомнатную дверь с одной створкой', 4, 5300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (90, N'Установка дверей гармошек', 4, 5300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (91, N'Установка доборов на двери', 4, 1200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (92, N'Установка замка на межкомнатную дверь', 4, 800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (93, N'Установка межкомнатных дверей с двумя створками', 4, 7600)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (94, N'Установка наличников на межкомнатные двери', 4, 300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (95, N'Установка раздвижных межкомнатных дверей', 4, 4200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (96, N'Установка ручки на межкомнатную дверь', 4, 400)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (97, N'Установка скрытой двери', 4, 10800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (98, N'Выезд специалиста консультанта', 5, 5000)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'123', N'1', 2, N'1', N'1', N'1', N'+2 (123) 122-13-12', N'123123')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'admin', N'1', 1, N'Борисов', N'Матвей', N' Михайлович', N'+7 (896) 645-64-56', N'matvei@mail.ru')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'bulat', N'1', 2, N'Булатов', N'Булат', N'Булатович', N'+2 (111) 111-11-11', N'e')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'dan', N'1', 2, N'Иванов', N'Иван', N'Иванович', N'+7 (777) 777-77-77', N'777777777777')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'daniil', N'1', 2, N'Кондратьев', N'Даниил', N'Андреевич', N'+7 (282) 823-23-23', N'daniil@mail.ru')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'danil', N'1', 2, N'Данилов', N'Данил', N'Данилович', N'+7 (777) 777-77-77', N'danil@mail.ru')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'hello', N'1', 2, N'Hello', N'Hello', N'', N'+7 (879) 879-87-98', N'hello@hello.ru')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'mark', N'1', 2, N'1', N'2', N'3', N'+1 (231) 212-21-23', N'12312312@mail.ru')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'mark123', N'1', 2, N'1', N'1', N'1', N'+1 (231) 231-23-12', N'1231231')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'max', N'1', 2, N'Смирнов', N'Максим', N'Дмитриевич', N'+7 (897) 987-98-79', N'me@mail.ru')
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderWindow_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderWindow_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderWindow_Window] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderWindow_Window]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Service]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Window_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Window_Category]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [WindowRepairDB] SET  READ_WRITE 
GO
