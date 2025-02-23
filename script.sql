USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 19.02.2025 13:51:31 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19.02.2025 13:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 19.02.2025 13:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.02.2025 13:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NOT NULL,
	[ProductManufacturer] [nvarchar](max) NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD538E100E2] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.02.2025 13:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.02.2025 13:51:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
 CONSTRAINT [PK__User__1788CCACBD678C8C] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (1, N'Завершен', CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'18')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (2, N'Завершен', CAST(N'2022-05-12T00:00:00.000' AS DateTime), N'19')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (3, N'Новый ', CAST(N'2022-05-13T00:00:00.000' AS DateTime), N'20')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (4, N'Новый ', CAST(N'2022-05-14T00:00:00.000' AS DateTime), N'21')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (5, N'Завершен', CAST(N'2022-05-15T00:00:00.000' AS DateTime), N'22')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (6, N'Новый ', CAST(N'2022-05-16T00:00:00.000' AS DateTime), N'23')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (7, N'Новый ', CAST(N'2022-05-17T00:00:00.000' AS DateTime), N'24')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (8, N'Завершен', CAST(N'2022-05-18T00:00:00.000' AS DateTime), N'25')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (9, N'Завершен', CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'26')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (10, N'Новый ', CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'27')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (51, N'Никифоров ', N'Всеволод', N'Иванович', N'loginDEjrm2018', N'Cpb+Im', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (52, N'Воронов ', N'Донат', N'Никитевич', N'loginDEpxl2018', N'P6h4Jq', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (53, N'Игнатьева ', N'Евгения', N'Валентиновна', N'loginDEwgk2018', N'&mfI9l', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (54, N'Буров ', N'Федот', N'Егорович', N'loginDEpou2018', N'gX3f5Z', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (55, N'Иван ', N'Семёновна', N'', N'loginDEjwl2018', N'D4ZYHt', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (56, N'Денисов ', N'Дамир', N'Филатович', N'loginDEabf2018', N'*Tasm+', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (57, N'Ершов ', N'Максим', N'Геласьевич', N'loginDEwjm2018', N'k}DJKo', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (58, N'Копылов ', N'Куприян', N'Пётрович', N'loginDEjvz2018', N'&|bGTy', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (59, N'Носов ', N'Валерьян', N'Дмитрьевич', N'loginDEuyv2018', N'8hhrZ}', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (60, N'Силин ', N'Игорь', N'Авдеевич', N'loginDExdm2018', N'DH68L9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (61, N'Дроздова ', N'Александра', N'Мартыновна', N'loginDEeiv2018', N'H*BxlS', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (62, N'Дроздов ', N'Аркадий', N'Геласьевич', N'loginDEfuc2018', N'VuM+QT', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (63, N'Боброва ', N'Варвара', N'Евсеевна', N'loginDEoot2018', N'usi{aT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (64, N'Чернова ', N'Агата', N'Данииловна', N'loginDElhk2018', N'Okk0jY', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (65, N'Лыткина ', N'Ульяна', N'Станиславовна', N'loginDEazg2018', N's3bb|V', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (66, N'Лаврентьев ', N'Леонид', N'Игнатьевич', N'loginDEaba2018', N'#ИМЯ?', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (67, N'Кулаков ', N'Юрий', N'Владленович', N'loginDEtco2018', N'tTKDJB', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (68, N'Соловьёв ', N'Андрей', N'Александрович', N'loginDEsyq2018', N'2QbpBN', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (69, N'Корнилова ', N'Марфа', N'Макаровна', N'loginDEpxi2018', N'+5X&hy', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (70, N'Белоусова ', N'Любовь', N'Георгьевна', N'loginDEicr2018', N'3+|Sn{', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (71, N'Анисимов ', N'Никита', N'Гордеевич', N'loginDEcui2018', N'Zi1Tth', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (72, N'Стрелкова ', N'Фаина', N'Федосеевна', N'loginDEpxc2018', N'G+nFsv', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (73, N'Осипов ', N'Евгений', N'Иванович', N'loginDEqrd2018', N'sApUbt', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (74, N'Владимирова ', N'Иванна', N'Павловна', N'loginDEsso2018', N'#ИМЯ?', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (75, N'Кудрявцева ', N'Жанна', N'Демьяновна', N'loginDErsy2018', N'{Aa6nS', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (76, N'Матвиенко ', N'Яков', N'Брониславович', N'loginDEvpz2018', N'mS0UxK', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (77, N'Селезнёв ', N'Егор', N'Артёмович', N'loginDEfog2018', N'glICay', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (78, N'Брагин ', N'Куприян', N'Митрофанович', N'loginDEpii2018', N'Ob}RZB', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (79, N'Гордеев ', N'Виктор', N'Эдуардович', N'loginDEhyk2018', N'*gN}Tc', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (80, N'Мартынов ', N'Онисим', N'Брониславович', N'loginDEdxi2018', N'ywLUbA', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (81, N'Никонова ', N'Евгения', N'Павловна', N'loginDEzro2018', N'B24s6o', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (82, N'Полякова ', N'Анна', N'Денисовна', N'loginDEuxg2018', N'K8jui7', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (83, N'Макарова ', N'Пелагея', N'Антониновна', N'loginDEllw2018', N'jNtNUr', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (84, N'Андреева ', N'Анна', N'Вячеславовна', N'loginDEddg2018', N'gGGhvD', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (85, N'Кудрявцева ', N'Кира', N'Ефимовна', N'loginDEpdz2018', N'#ИМЯ?', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (86, N'Шилова ', N'Кира', N'Егоровна', N'loginDEyiw2018', N'cnj3QR', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (87, N'Ситников ', N'Игорь', N'Борисович', N'loginDEqup2018', N'95AU|R', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (88, N'Русаков ', N'Борис', N'Христофорович', N'loginDExil2018', N'w+++Ht', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (89, N'Капустина ', N'Ульяна', N'Игоревна', N'loginDEkuv2018', N'Ade++|', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (90, N'Беляков ', N'Семён', N'Германнович', N'loginDEmox2018', N'Je}9e7', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (91, N'Гурьев ', N'Ириней', N'Игнатьевич', N'loginDEvug2018', N'lEa{Cn', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (92, N'Мишин ', N'Христофор', N'Леонидович', N'loginDEzre2018', N'N*VX+G', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (93, N'Лазарева ', N'Антонина', N'Христофоровна', N'loginDEbes2018', N'NaVtyH', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (94, N'Маркова ', N'Ираида', N'Сергеевна', N'loginDEkfg2018', N'r1060q', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (95, N'Носкова ', N'Пелагея', N'Валерьевна', N'loginDEyek2018', N'KY2BL4', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (96, N'Баранов ', N'Станислав', N'Дмитрьевич', N'loginDEloq2018', N'NZV5WR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (97, N'Ефремов ', N'Демьян', N'Артёмович', N'loginDEjfb2018', N'TNT+}h', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (98, N'Константинов ', N'Всеволод', N'Мэлсович', N'loginDEueq2018', N'GqAUZ6', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (99, N'Ситникова ', N'Ираида', N'Андреевна', N'loginDEpqz2018', N'F0Bp7F', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (100, N'Матвеев ', N'Кондрат', N'Иванович', N'loginDEovk2018', N'JyJM{A', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK__User__UserRole__267ABA7A] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK__User__UserRole__267ABA7A]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
