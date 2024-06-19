USE [master]
GO
/****** Object:  Database [WindowRepairDB]    Script Date: 19.06.2024 16:26:15 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 19.06.2024 16:26:15 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 19.06.2024 16:26:15 ******/
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
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 19.06.2024 16:26:15 ******/
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
/****** Object:  Table [dbo].[OrderService]    Script Date: 19.06.2024 16:26:15 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 19.06.2024 16:26:15 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 19.06.2024 16:26:15 ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 19.06.2024 16:26:15 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 19.06.2024 16:26:15 ******/
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

INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Доставка  стекла, С/П, створок, рам и т.п.')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Доставка мелких материалов ( фурнитура, уплотнитель и т.п.)')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'Выезд специалиста на объект')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Изделия и стеклопакеты')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (5, N'Москитные сетки')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (6, N'Подоконник, отлив.')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (7, N'Откосы наружные')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (8, N'Откосы внутренние')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (9, N'Ремонт окон')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (5, N'max', CAST(N'2024-06-19T13:51:54.000' AS DateTime), 6800, 0)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (6, N'danil', CAST(N'2024-06-19T15:35:36.000' AS DateTime), 3500, 0)
INSERT [dbo].[Order] ([Id], [Username], [DateOrder], [Total], [Paid]) VALUES (7, N'boss', CAST(N'2024-06-19T15:49:15.000' AS DateTime), 4500, 0)
GO
SET IDENTITY_INSERT [dbo].[OrderService] ON 

INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (58, 5, 1, 145)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (59, 5, 1, 149)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (60, 5, 1, 102)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (61, 5, 1, 151)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (62, 5, 1, 143)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (63, 6, 1, 153)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (64, 6, 1, 102)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (65, 7, 1, 145)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (66, 7, 1, 149)
INSERT [dbo].[OrderService] ([Id], [OrderId], [Count], [ServiceId]) VALUES (67, 7, 1, 102)
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

INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (99, N'Простая регулировка с помощью ключей без съема створки', 9, 250)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (100, N'Сложная регулировка со съёмом створки', 9, 1000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (101, N'Регулировка окна с расклиниванием стеклопакета в створке', 9, 800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (102, N'Вскрытие заблокированной створки пластикового окна', 9, 500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (103, N'Чистка и смазка фурнитуры без снятия створки', 9, 150)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (104, N'Чистка и смазка фурнитуры со снятием створки', 9, 1200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (105, N'Чистка и смазка уплотнительной резины', 9, 80)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (106, N'Замена фурнитуры на створках окна', 9, 4500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (107, N'Замена ручного дистанционного управления фрамуг', 9, 9800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (108, N'Установка дополнительного прижима со стороны петель', 9, 400)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (109, N'Установка декоративных накладок на петли (комплект на петлю)', 9, 200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (110, N'Установка ответной планки', 9, 250)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (111, N'Установка ограничителя открывания створки (фрамуги)', 9, 700)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (112, N'Установка «гребёнки» пластиковой / металлической', 9, 300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (113, N'Установка зимнего проветривания (при полной замене фурнитуры на ROTO NT)', 9, 500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (114, N'Установка микролифта (при полной замене фурнитуры на  ROTO NT )', 9, 500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (115, N'Замена имеющегося клапана Аэрэко на новый (белый / коричневый)', 9, 4000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (116, N'Замена редуктора SCHÜCO (23 мм) для ПВХ окон, с блокиратором', 9, 3500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (117, N'Установка откосов из ПВХ (стандартное окно) до 250 мм', 8, 2000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (118, N'Установка откосов из ПВХ (тройное окно) до 250 мм', 8, 2300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (119, N'Установка откосов из ПВХ (балконный блок) до 250 мм', 8, 3000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (120, N'Установка откосов из ПВХ (стандартное окно)  от 250мм до 400 мм', 8, 2300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (121, N'Установка откосов из ПВХ (тройное окно)  от 250мм до 400 мм', 8, 2600)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (122, N'Установка откосов из ПВХ (балконный блок) от 250мм до 400 мм', 8, 3300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (123, N'Установка откосов из ПВХ (стандартное окно)  от 400мм до 600 мм', 8, 2600)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (124, N'Установка откосов из ПВХ (тройное окно)  от 400мм до 600 мм', 8, 2900)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (125, N'Установка откосов из ПВХ (балконный блок) от 400мм до 600 мм', 8, 3600)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (126, N'Демонтаж откосов', 8, 500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (127, N'Установка подоконника от 100 до 350 мм за пг.м.', 7, 1000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (128, N'Установка подоконника от 350 до 600 мм за пг.м.', 7, 1300)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (129, N'Установка подоконника свыше 600 мм за пг.м.', 7, 1700)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (130, N'Пропенка подоконника (без демонтажа)', 7, 1200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (131, N'Установка отлива от 90 до 150 мм за пг.м.', 7, 500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (132, N'Установка отлива от 150 до 210 мм за пг.м.', 7, 800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (133, N'Установка отлива свыше 210 мм за пг.м.', 7, 1100)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (134, N'Пропенка отлива', 7, 200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (135, N'Изготовление москитных сеток за кв.м.', 5, 600)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (136, N'Установка и замена креплений для М/С (комплект)', 5, 200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (137, N'Установка и замена ручек для М/С (комплект)', 5, 200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (138, N'Замена стекла  4М1', 4, 1000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (139, N'Замена СПО (стеклопакет однокамерный)', 4, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (140, N'Замена СПД  (стеклопакет двухкамерный)', 4, 1900)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (141, N'Энергосберегающий', 4, 500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (142, N'по городу', 3, 500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (143, N'за город до 20 км', 3, 800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (144, N'за город от 20 и до 40 км', 3, 1200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (145, N'более 40 км', 3, 2000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (146, N'по городу', 2, 500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (147, N'за город до 20 км', 2, 800)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (148, N'за город от 20 и до 40 км', 2, 1200)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (149, N'более 40 км', 2, 2000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (150, N'по городу', 1, 1000)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (151, N'за город до 20 км', 1, 1500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (152, N'за город от 20 и до 40 км', 1, 2500)
INSERT [dbo].[Service] ([Id], [Title], [CategoryId], [Price]) VALUES (153, N'более 40 км', 1, 3000)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'123', N'1', 2, N'1', N'1', N'1', N'+2 (123) 122-13-12', N'123123')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'admin', N'1', 1, N'Борисов', N'Матвей', N' Михайлович', N'+7 (896) 645-64-56', N'matvei@mail.ru')
INSERT [dbo].[User] ([Username], [Password], [RoleId], [LastName], [FirstName], [MiddleName], [Phone], [Email]) VALUES (N'boss', N'1', 2, N'Петров', N'Антуан', N'Дмитриевич', N'+1 (111) 111-11-11', N'hello')
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
