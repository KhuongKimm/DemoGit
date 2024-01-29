USE [QuanLyQuanCafe3]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[idRole] [int] NOT NULL,
	[status] [bit] NOT NULL DEFAULT ((1)),
	[ResetPasswordCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Area]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[Area_id] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Area_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bill]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[Bill_id] [int] IDENTITY(1,1) NOT NULL,
	[DateCheckIn] [date] NOT NULL CONSTRAINT [DF__Bill__DateCheckI__03F0984C]  DEFAULT (getdate()),
	[DateCheckOut] [date] NOT NULL,
	[Timein] [time](7) NULL,
	[Timeout] [time](7) NULL,
	[idTable] [int] NOT NULL,
	[idAccount] [int] NOT NULL,
	[idKM] [int] NULL,
	[status] [bit] NOT NULL CONSTRAINT [DF__Bill__status__04E4BC85]  DEFAULT ((0)),
 CONSTRAINT [PK__Bill__CF6F718BFA034445] PRIMARY KEY CLUSTERED 
(
	[Bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BillInfo]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillInfo](
	[BillInfo_id] [int] IDENTITY(1,1) NOT NULL,
	[idBill] [int] NOT NULL,
	[idFood] [int] NOT NULL,
	[idAccount] [int] NOT NULL,
	[count] [int] NOT NULL CONSTRAINT [DF__BillInfo__count__6754599E]  DEFAULT ((0)),
	[Price] [decimal](18, 0) NOT NULL,
	[idTable] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__BillInfo__26ADC9807A5B5CF4] PRIMARY KEY CLUSTERED 
(
	[BillInfo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DVT]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVT](
	[DVT_id] [int] IDENTITY(1,1) NOT NULL,
	[DVT_Name] [nvarchar](150) NOT NULL,
	[Descreption] [nvarchar](300) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_DVT] PRIMARY KEY CLUSTERED 
(
	[DVT_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Food]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[Food_id] [int] IDENTITY(1,1) NOT NULL,
	[Food_name] [nvarchar](500) NOT NULL CONSTRAINT [DF__Food__Food_name__182C9B23]  DEFAULT (N'Chưa đặt tên'),
	[idCategory] [int] NOT NULL,
	[price] [decimal](18, 0) NOT NULL CONSTRAINT [DF__Food__price__1920BF5C]  DEFAULT ((0)),
	[idDVT] [int] NOT NULL,
	[status] [bit] NOT NULL CONSTRAINT [DF__Food__status__1A14E395]  DEFAULT ((1)),
 CONSTRAINT [PK__Food__B328E034DA2988AA] PRIMARY KEY CLUSTERED 
(
	[Food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FoodCategory]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodCategory](
	[FoodCategory_id] [int] IDENTITY(1,1) NOT NULL,
	[FoodCategory_name] [nvarchar](500) NOT NULL DEFAULT (N'Chưa đặt tên'),
	[Decription] [nvarchar](500) NULL DEFAULT (''),
	[status] [bit] NULL DEFAULT ('1'),
PRIMARY KEY CLUSTERED 
(
	[FoodCategory_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[KM_id] [int] IDENTITY(1,1) NOT NULL,
	[KM_Name] [nvarchar](250) NOT NULL,
	[TimeTu] [date] NOT NULL,
	[TimeDen] [date] NOT NULL,
	[Descreption] [nvarchar](350) NULL,
	[KM_Value] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[KM_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableFood]    Script Date: 11/05/2019 9:33:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableFood](
	[TableFood_id] [int] IDENTITY(1,1) NOT NULL,
	[TableFood_name] [nvarchar](100) NOT NULL CONSTRAINT [DF__TableFood__name__5165187F]  DEFAULT (N'Bàn chưa có tên'),
	[idArea] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[idBill] [int] NOT NULL CONSTRAINT [DF_TableFood_Bill_id]  DEFAULT ((0)),
 CONSTRAINT [PK__TableFoo__816EA8C1C7438133] PRIMARY KEY CLUSTERED 
(
	[TableFood_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [UserName], [PassWord], [Name], [Email], [Address], [Phone], [idRole], [status], [ResetPasswordCode]) VALUES (1, N'tai', N'1', N'Quang tài', N'doquangtaia3@gmail.com', N'BN', N'0377990688', 1, 1, N'59046744-4913-4bb7-86fb-2e25cd6977db')
INSERT [dbo].[Account] ([id], [UserName], [PassWord], [Name], [Email], [Address], [Phone], [idRole], [status], [ResetPasswordCode]) VALUES (2, N'luhanbc', N'1', N'Phan đăng', N'doquangtai', N'BN', N'123456789', 2, 1, NULL)
INSERT [dbo].[Account] ([id], [UserName], [PassWord], [Name], [Email], [Address], [Phone], [idRole], [status], [ResetPasswordCode]) VALUES (3, N'quangtai', N'1', N'Ánh Dương', N'dotaihaui@gmail.com', N'BN', N'0123456789', 3, 1, N'')
INSERT [dbo].[Account] ([id], [UserName], [PassWord], [Name], [Email], [Address], [Phone], [idRole], [status], [ResetPasswordCode]) VALUES (6, N'Hung', N'1', N'Quang Hưng', N'hung@gmail.com', N'Bn', N'135489', 4, 1, NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([Area_id], [AreaName]) VALUES (2, N'Tầng 1 ')
INSERT [dbo].[Area] ([Area_id], [AreaName]) VALUES (3, N'Tầng 2 ')
INSERT [dbo].[Area] ([Area_id], [AreaName]) VALUES (4, N'Tầng 3')
INSERT [dbo].[Area] ([Area_id], [AreaName]) VALUES (7, N'tầng 4')
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (24, CAST(N'2019-04-29' AS Date), CAST(N'2019-04-29' AS Date), CAST(N'16:31:17.5778642' AS Time), CAST(N'16:36:17.5778642' AS Time), 31, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (25, CAST(N'2019-04-29' AS Date), CAST(N'2019-04-29' AS Date), CAST(N'16:31:17.7349753' AS Time), CAST(N'21:49:44.3039124' AS Time), 31, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (26, CAST(N'2019-04-29' AS Date), CAST(N'2019-04-29' AS Date), CAST(N'16:47:22.1518515' AS Time), CAST(N'17:04:45.8604698' AS Time), 35, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (27, CAST(N'2019-04-30' AS Date), CAST(N'2019-04-30' AS Date), CAST(N'09:13:07.9115476' AS Time), CAST(N'12:25:08.4316353' AS Time), 28, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (28, CAST(N'2019-04-30' AS Date), CAST(N'2019-04-30' AS Date), CAST(N'12:25:10.7650677' AS Time), CAST(N'12:35:13.4164730' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (30, CAST(N'2019-04-30' AS Date), CAST(N'2019-04-30' AS Date), CAST(N'17:08:03.6634011' AS Time), CAST(N'21:49:58.1503020' AS Time), 36, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (31, CAST(N'2019-05-01' AS Date), CAST(N'2019-05-01' AS Date), CAST(N'17:09:46.4516137' AS Time), CAST(N'21:49:52.2081837' AS Time), 35, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (32, CAST(N'2019-05-01' AS Date), CAST(N'2019-05-01' AS Date), CAST(N'17:11:05.7274191' AS Time), CAST(N'21:49:48.5914245' AS Time), 32, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (33, CAST(N'2019-05-02' AS Date), CAST(N'2019-05-02' AS Date), CAST(N'17:11:31.5818760' AS Time), CAST(N'21:50:01.4792557' AS Time), 48, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (34, CAST(N'2019-05-02' AS Date), CAST(N'2019-05-02' AS Date), CAST(N'23:23:09.3747627' AS Time), CAST(N'20:27:23.8640924' AS Time), 28, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (35, CAST(N'2019-05-02' AS Date), CAST(N'2019-05-02' AS Date), CAST(N'20:27:37.1531623' AS Time), CAST(N'00:33:05.1781931' AS Time), 37, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (36, CAST(N'2019-05-03' AS Date), CAST(N'2019-05-03' AS Date), CAST(N'20:27:40.6820763' AS Time), CAST(N'00:32:41.4323645' AS Time), 28, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (37, CAST(N'2019-05-03' AS Date), CAST(N'2019-05-03' AS Date), CAST(N'20:27:52.4668860' AS Time), CAST(N'00:33:00.7655865' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (38, CAST(N'2019-05-03' AS Date), CAST(N'2019-05-03' AS Date), CAST(N'00:33:51.1525469' AS Time), CAST(N'00:44:22.9892518' AS Time), 28, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (39, CAST(N'2019-05-03' AS Date), CAST(N'2019-05-03' AS Date), CAST(N'00:34:05.4956986' AS Time), CAST(N'00:44:26.7592547' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (40, CAST(N'2019-05-03' AS Date), CAST(N'2019-05-03' AS Date), CAST(N'08:38:29.8900764' AS Time), CAST(N'11:36:18.8898972' AS Time), 28, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (41, CAST(N'2019-05-03' AS Date), CAST(N'2019-05-03' AS Date), CAST(N'11:50:57.6312140' AS Time), CAST(N'12:17:57.7298459' AS Time), 29, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (42, CAST(N'2019-05-03' AS Date), CAST(N'2019-05-03' AS Date), CAST(N'11:50:58.3199270' AS Time), CAST(N'12:17:57.7298459' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (43, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'12:18:37.2493416' AS Time), CAST(N'12:33:51.2133757' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (44, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'13:42:15.2818901' AS Time), CAST(N'15:21:27.7874972' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (45, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'14:28:45.8579221' AS Time), CAST(N'15:21:33.3478741' AS Time), 39, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (46, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'15:25:24.3922987' AS Time), CAST(N'15:27:25.7791607' AS Time), 32, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (47, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'15:34:00.6757357' AS Time), CAST(N'15:35:39.1044241' AS Time), 33, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (48, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'15:35:30.0865583' AS Time), CAST(N'15:36:03.7028430' AS Time), 46, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (49, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'15:35:53.3891893' AS Time), CAST(N'15:36:03.7028430' AS Time), 32, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (50, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'15:35:59.4768031' AS Time), CAST(N'15:36:35.7363289' AS Time), 33, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (51, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'15:36:26.9100874' AS Time), CAST(N'15:51:38.3741767' AS Time), 38, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (52, CAST(N'2019-05-09' AS Date), CAST(N'2019-05-09' AS Date), CAST(N'15:47:10.2870542' AS Time), CAST(N'15:51:38.3741767' AS Time), 32, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (53, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'08:37:50.4174513' AS Time), CAST(N'09:43:57.3411756' AS Time), 28, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (54, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'09:43:49.4207819' AS Time), CAST(N'10:26:43.3626166' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (55, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'09:45:33.9162474' AS Time), CAST(N'10:26:43.3626166' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (56, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'10:27:50.2953198' AS Time), CAST(N'10:28:23.5438536' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (57, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'10:28:18.4059271' AS Time), CAST(N'10:29:31.9056115' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (58, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'10:29:23.9117301' AS Time), CAST(N'11:02:13.9855471' AS Time), 39, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (59, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'10:32:28.4112530' AS Time), CAST(N'11:02:13.9855471' AS Time), 30, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (60, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'10:45:50.2979277' AS Time), CAST(N'11:02:13.9855471' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (61, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'11:03:37.6204507' AS Time), CAST(N'12:13:44.2497009' AS Time), 39, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (62, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'12:08:25.9149967' AS Time), CAST(N'12:13:33.9038256' AS Time), 28, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (63, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'12:13:21.7418256' AS Time), CAST(N'14:21:09.0835790' AS Time), 41, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (64, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'12:13:53.9071716' AS Time), CAST(N'12:14:11.9618981' AS Time), 45, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (65, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'14:24:18.2025979' AS Time), CAST(N'14:53:36.8141371' AS Time), 41, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (66, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'14:24:22.6724742' AS Time), CAST(N'14:53:30.7006509' AS Time), 39, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (67, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'14:42:31.0134023' AS Time), CAST(N'15:25:17.8775146' AS Time), 30, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (68, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'14:42:31.6712491' AS Time), CAST(N'15:25:17.8775146' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (69, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'14:53:53.3046705' AS Time), CAST(N'14:54:27.1396627' AS Time), 28, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (70, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'14:54:01.7046798' AS Time), CAST(N'15:25:17.8775146' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (71, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'14:54:47.8563513' AS Time), CAST(N'15:25:17.8775146' AS Time), 40, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (72, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'15:07:09.3872705' AS Time), CAST(N'15:25:17.8775146' AS Time), 28, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (73, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'15:10:09.9081527' AS Time), CAST(N'15:25:17.8775146' AS Time), 30, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (74, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'15:10:10.5984117' AS Time), CAST(N'15:25:17.8775146' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (75, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'15:11:14.1865926' AS Time), CAST(N'15:25:17.8775146' AS Time), 33, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (76, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'15:16:17.2810304' AS Time), CAST(N'15:25:17.8775146' AS Time), 45, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (77, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'15:19:07.3392401' AS Time), CAST(N'15:25:17.8775146' AS Time), 42, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (78, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'15:21:52.0187857' AS Time), CAST(N'15:25:17.8775146' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (79, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'15:22:15.4180509' AS Time), CAST(N'15:25:17.8775146' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (80, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'21:56:44.7344081' AS Time), CAST(N'21:05:44.7344081' AS Time), 30, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (81, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'21:56:45.4023506' AS Time), CAST(N'21:05:45.4023506' AS Time), 30, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (82, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'21:57:43.5421451' AS Time), CAST(N'21:05:43.5421451' AS Time), 46, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (83, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'22:05:47.2715676' AS Time), CAST(N'22:05:47.2715676' AS Time), 43, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (84, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'22:09:00.3152056' AS Time), CAST(N'22:19:00.3152056' AS Time), 39, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (86, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'22:10:34.6106423' AS Time), CAST(N'22:15:41.0866114' AS Time), 46, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (87, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'22:12:10.4506063' AS Time), CAST(N'22:15:42.9013478' AS Time), 39, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (88, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'22:19:10.5544946' AS Time), CAST(N'22:20:10.5544946' AS Time), 29, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (93, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'22:27:18.7821875' AS Time), CAST(N'22:27:31.8927258' AS Time), 33, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (94, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'22:46:43.2515725' AS Time), CAST(N'23:29:40.2006398' AS Time), 29, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (95, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'22:47:17.9705909' AS Time), CAST(N'23:30:06.8124197' AS Time), 46, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (96, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'23:31:51.8012575' AS Time), CAST(N'23:39:23.1299238' AS Time), 30, 1, NULL, 0)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (97, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'23:31:51.9753818' AS Time), CAST(N'23:39:23.1299238' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (98, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'23:33:43.3840555' AS Time), CAST(N'23:39:30.3469700' AS Time), 39, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (99, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'23:53:50.6437558' AS Time), CAST(N'23:56:38.6108718' AS Time), 39, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (100, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'23:53:57.6093117' AS Time), CAST(N'23:57:14.3825267' AS Time), 43, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (101, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-10' AS Date), CAST(N'23:55:08.3607844' AS Time), CAST(N'23:57:03.4336787' AS Time), 40, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (102, CAST(N'2019-05-10' AS Date), CAST(N'2019-05-11' AS Date), CAST(N'23:57:33.2462331' AS Time), CAST(N'00:01:37.2549255' AS Time), 35, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (104, CAST(N'2019-05-11' AS Date), CAST(N'2019-05-11' AS Date), CAST(N'00:32:01.1216032' AS Time), CAST(N'02:01:21.4552731' AS Time), 33, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (105, CAST(N'2019-05-11' AS Date), CAST(N'2019-05-11' AS Date), CAST(N'00:32:03.7605544' AS Time), CAST(N'02:01:31.0207586' AS Time), 47, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (106, CAST(N'2019-05-11' AS Date), CAST(N'2019-05-11' AS Date), CAST(N'02:01:56.0029338' AS Time), CAST(N'08:36:25.3031827' AS Time), 33, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (107, CAST(N'2019-05-11' AS Date), CAST(N'2019-05-11' AS Date), CAST(N'02:02:16.3503864' AS Time), CAST(N'08:28:09.6430896' AS Time), 46, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (108, CAST(N'2019-05-11' AS Date), CAST(N'2019-05-11' AS Date), CAST(N'08:27:22.8321009' AS Time), CAST(N'08:36:08.9483295' AS Time), 30, 1, NULL, 1)
INSERT [dbo].[Bill] ([Bill_id], [DateCheckIn], [DateCheckOut], [Timein], [Timeout], [idTable], [idAccount], [idKM], [status]) VALUES (109, CAST(N'2019-05-11' AS Date), CAST(N'2019-05-11' AS Date), CAST(N'08:40:53.6256558' AS Time), CAST(N'08:40:53.6256558' AS Time), 45, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[Bill] OFF
SET IDENTITY_INSERT [dbo].[BillInfo] ON 

INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (79, 24, 4, 1, 1, CAST(25000 AS Decimal(18, 0)), 31, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (80, 25, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 31, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (81, 25, 1, 1, 1, CAST(25000 AS Decimal(18, 0)), 31, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (82, 26, 5, 1, 4, CAST(25000 AS Decimal(18, 0)), 35, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (87, 27, 5, 1, 3, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (91, 27, 52, 1, 3, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (92, 28, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (95, 28, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (97, 30, 5, 1, 3, CAST(25000 AS Decimal(18, 0)), 36, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (100, 30, 51, 1, 2, CAST(25000 AS Decimal(18, 0)), 36, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (101, 31, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 35, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (104, 32, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 32, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (105, 32, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 32, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (106, 32, 4, 1, 1, CAST(25000 AS Decimal(18, 0)), 32, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (107, 32, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 32, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (110, 34, 4, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (111, 34, 5, 1, 4, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (112, 35, 5, 1, 3, CAST(25000 AS Decimal(18, 0)), 37, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (113, 36, 8, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (114, 36, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (115, 37, 8, 1, 4, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (116, 36, 4, 1, 3, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (117, 36, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (118, 36, 1, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (119, 36, 47, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (120, 36, 52, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (121, 36, 53, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (122, 36, 49, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (123, 36, 48, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (124, 36, 37, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (125, 36, 38, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (126, 36, 39, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (127, 38, 4, 1, 4, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (128, 39, 35, 1, 2, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (129, 39, 36, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (130, 40, 6, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (131, 40, 1, 1, 1, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (132, 40, 8, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (133, 40, 5, 1, 4, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (134, 40, 7, 1, 3, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (135, 41, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (136, 42, 5, 1, 5, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (137, 42, 15, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (138, 42, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (139, 42, 7, 1, 2, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (140, 42, 46, 1, 2, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (141, 42, 43, 1, 2, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (142, 42, 44, 1, 2, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (143, 42, 45, 1, 2, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (144, 42, 9, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (145, 42, 10, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (146, 42, 11, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (147, 43, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (148, 43, 5, 1, 5, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (149, 43, 4, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (150, 43, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (151, 43, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (152, 44, 5, 1, 2, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (153, 44, 6, 1, 2, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (154, 44, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (155, 44, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (156, 44, 1, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (157, 44, 4, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (158, 45, 38, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (159, 45, 37, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (160, 45, 39, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (161, 45, 52, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (162, 45, 48, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (163, 45, 49, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (164, 46, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 32, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (165, 46, 5, 1, 3, CAST(25000 AS Decimal(18, 0)), 32, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (166, 46, 41, 1, 2, CAST(25000 AS Decimal(18, 0)), 32, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (167, 47, 5, 1, 4, CAST(25000 AS Decimal(18, 0)), 33, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (168, 47, 33, 1, 3, CAST(25000 AS Decimal(18, 0)), 33, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (169, 48, 5, 1, 5, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (170, 49, 42, 1, 3, CAST(25000 AS Decimal(18, 0)), 32, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (171, 50, 41, 1, 2, CAST(25000 AS Decimal(18, 0)), 33, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (172, 51, 42, 1, 3, CAST(25000 AS Decimal(18, 0)), 38, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (175, 53, 36, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (176, 53, 33, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (177, 54, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (178, 55, 46, 1, 3, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (179, 56, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (180, 57, 45, 1, 3, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (181, 58, 4, 1, 2, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (182, 58, 5, 1, 2, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (183, 58, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (184, 58, 41, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (185, 58, 42, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (188, 60, 44, 1, 45, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (189, 60, 4, 1, 2, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (190, 60, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (191, 60, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (192, 60, 10, 1, 3, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (193, 60, 11, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (194, 60, 12, 1, 3, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (195, 61, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (196, 61, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (197, 61, 4, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
GO
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (198, 61, 1, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (199, 61, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (200, 61, 8, 1, 3, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (201, 61, 37, 1, 2, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (202, 61, 39, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (203, 61, 38, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (204, 61, 49, 1, 2, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (205, 62, 6, 1, 2, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (206, 63, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (207, 64, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 45, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (208, 63, 13, 1, 3, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (209, 63, 14, 1, 2, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (210, 63, 15, 1, 2, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (211, 63, 21, 1, 2, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (212, 63, 22, 1, 2, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (213, 63, 23, 1, 1, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (214, 63, 24, 1, 1, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (215, 63, 37, 1, 1, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (216, 63, 39, 1, 1, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (217, 65, 6, 1, 5, CAST(25000 AS Decimal(18, 0)), 41, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (218, 66, 6, 1, 4, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (219, 67, 6, 1, 2, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (220, 68, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (221, 69, 44, 1, 4, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (222, 69, 46, 1, 4, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (223, 70, 12, 1, 4, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (224, 71, 12, 1, 3, CAST(25000 AS Decimal(18, 0)), 40, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (225, 72, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 28, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (226, 73, 42, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (227, 74, 42, 1, 3, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (228, 75, 41, 1, 2, CAST(25000 AS Decimal(18, 0)), 33, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (229, 76, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 45, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (230, 77, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 42, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (231, 78, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (232, 79, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (233, 80, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (235, 81, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (236, 81, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (237, 81, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (239, 82, 44, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (240, 82, 43, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (242, 84, 7, 1, 2, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (244, 86, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (245, 86, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (246, 86, 4, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (247, 86, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (248, 86, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (249, 87, 6, 1, 5, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (251, 88, 11, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (256, 93, 6, 1, 2, CAST(25000 AS Decimal(18, 0)), 33, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (257, 93, 8, 1, 3, CAST(25000 AS Decimal(18, 0)), 33, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (258, 93, 7, 1, 2, CAST(25000 AS Decimal(18, 0)), 33, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (259, 94, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (260, 94, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (261, 94, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (262, 94, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 29, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (265, 96, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (266, 97, 6, 1, 2, CAST(25000 AS Decimal(18, 0)), 30, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (267, 98, 6, 1, 3, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (268, 99, 8, 1, 3, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (269, 99, 4, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (270, 99, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (271, 99, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (272, 99, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 39, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (273, 100, 7, 1, 3, CAST(25000 AS Decimal(18, 0)), 43, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (274, 100, 8, 1, 3, CAST(25000 AS Decimal(18, 0)), 43, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (275, 101, 42, 1, 4, CAST(25000 AS Decimal(18, 0)), 40, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (276, 102, 42, 1, 3, CAST(25000 AS Decimal(18, 0)), 35, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (277, 102, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 35, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (278, 102, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 35, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (279, 102, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 35, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (280, 102, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 35, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (282, 104, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 33, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (283, 104, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 33, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (284, 105, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 47, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (285, 105, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 47, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (286, 106, 46, 1, 2, CAST(25000 AS Decimal(18, 0)), 33, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (287, 106, 45, 1, 2, CAST(25000 AS Decimal(18, 0)), 33, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (288, 106, 44, 1, 1, CAST(25000 AS Decimal(18, 0)), 33, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (289, 107, 10, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (290, 107, 11, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (291, 107, 12, 1, 1, CAST(25000 AS Decimal(18, 0)), 46, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (292, 108, 4, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (293, 108, 8, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (294, 108, 7, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (295, 108, 5, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (296, 108, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (297, 108, 14, 1, 2, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (298, 108, 38, 1, 4, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (299, 108, 39, 1, 2, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (300, 108, 37, 1, 1, CAST(25000 AS Decimal(18, 0)), 30, 1)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (301, 109, 6, 1, 1, CAST(25000 AS Decimal(18, 0)), 45, NULL)
INSERT [dbo].[BillInfo] ([BillInfo_id], [idBill], [idFood], [idAccount], [count], [Price], [idTable], [status]) VALUES (302, 109, 8, 1, 2, CAST(25000 AS Decimal(18, 0)), 45, NULL)
SET IDENTITY_INSERT [dbo].[BillInfo] OFF
SET IDENTITY_INSERT [dbo].[DVT] ON 

INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (2, N'Cốc', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (3, N'Chai', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (5, N'Đĩa', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (6, N'Lon', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (7, N'Gói', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (8, N'Gram', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (9, N'Két', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (10, N'kg', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (11, N'Lít', NULL, 1)
INSERT [dbo].[DVT] ([DVT_id], [DVT_Name], [Descreption], [status]) VALUES (15, N'Quả', NULL, 1)
SET IDENTITY_INSERT [dbo].[DVT] OFF
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (1, N'Bạc xỉu', 1, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (4, N'Cà phê sữa ', 1, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (5, N'Cà phên đen', 1, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (6, N'Cà phê đá xay', 1, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (7, N'Cà Phê Socola Đá Xay', 1, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (8, N'Cà Phê Sinh Tố Dừa', 1, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (9, N'Cookle''s Cream', 9, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (10, N'Socola Tinamisu', 9, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (11, N'Caramel Cream', 9, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (12, N'Choco-ples Cream', 9, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (13, N'Kem Chanh Việt Quất', 10, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (14, N'Kem Chanh Dâu', 10, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (15, N'Kem Chanh Leo', 10, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (16, N'Sữa Chua Mix Dâu Xoài', 12, CAST(30000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (17, N'Sữa Chua Mít', 12, CAST(30000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (18, N'Hoa Quả Dầm', 12, CAST(30000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (19, N'Sữa Chua Dầm Xoài', 12, CAST(30000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (20, N'Sữa Chua Dầm Dâu', 12, CAST(30000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (21, N'Sinh Tố Xoài', 2, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (22, N'Sinh Tố Dưa Hấu', 2, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (23, N'Sinh Tố Bơ', 2, CAST(30000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (24, N'Sinh Tố Mãng Cầu', 2, CAST(30000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (25, N'Thái Phủ Kem', 3, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (26, N'Bạc Hà', 3, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (27, N'Socola', 3, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (28, N'Việt Quật', 3, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (29, N'Đen', 3, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (30, N'Khoai môn', 3, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (31, N'Ô long', 3, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (32, N'Việt Quất', 5, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (33, N'Bạc Hà', 5, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (34, N'Dâu', 5, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (35, N'Socola', 5, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (36, N'Chanh Leo', 5, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (37, N'Trà Xanh Kem Sữa', 6, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (38, N'Trà Ô Long Kem Sữa', 6, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (39, N'Trà Đen Kem Sữa', 6, CAST(20000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (40, N'Socola Đá Xay', 7, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (41, N'Socola Bạc Hà', 7, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (42, N'Socola Caramen', 7, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (43, N'Việt Quất', 8, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (44, N'Dâu', 8, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (45, N'Xoài', 8, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (46, N'Chanh Leo', 8, CAST(25000 AS Decimal(18, 0)), 2, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (47, N'Hướng Dương', 11, CAST(10000 AS Decimal(18, 0)), 5, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (48, N'Bò Khô', 11, CAST(20000 AS Decimal(18, 0)), 5, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (49, N'Nem Chua Rán', 11, CAST(30000 AS Decimal(18, 0)), 5, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (50, N'Khoai Tây Chiên', 11, CAST(25000 AS Decimal(18, 0)), 5, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (51, N'Cá Viên Chiên', 11, CAST(25000 AS Decimal(18, 0)), 5, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (52, N'Khoai Lang Kén ', 11, CAST(25000 AS Decimal(18, 0)), 5, 1)
INSERT [dbo].[Food] ([Food_id], [Food_name], [idCategory], [price], [idDVT], [status]) VALUES (53, N'Haniken', 11, CAST(15000 AS Decimal(18, 0)), 3, 1)
SET IDENTITY_INSERT [dbo].[Food] OFF
SET IDENTITY_INSERT [dbo].[FoodCategory] ON 

INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (1, N'CAFE', NULL, 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (2, N'SINH TỐ', N'', 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (3, N'TRÀ SỮA', N'', 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (5, N'TRÀ XANH NHẬT BẢN', NULL, 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (6, N'THỨC UỐNG KEM SỮA', N'', 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (7, N'SOCOLA ĐÁ XAY', N'', 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (8, N'HOA QUẢ ĐÁ XAY', N'', 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (9, N'ĐỒ UỐNG VỊ BÁNH', NULL, 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (10, N'KEM CHANH', N'', 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (11, N'ĐỒ ĂN NHANH', N'', 1)
INSERT [dbo].[FoodCategory] ([FoodCategory_id], [FoodCategory_name], [Decription], [status]) VALUES (12, N'SỮA CHUA HOA QUẢ ', NULL, 1)
SET IDENTITY_INSERT [dbo].[FoodCategory] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Role_id], [RoleName]) VALUES (1, N'Quản lí')
INSERT [dbo].[Role] ([Role_id], [RoleName]) VALUES (2, N'Phục vụ')
INSERT [dbo].[Role] ([Role_id], [RoleName]) VALUES (3, N'Thu ngân')
INSERT [dbo].[Role] ([Role_id], [RoleName]) VALUES (4, N'Chế biến')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[TableFood] ON 

INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (28, N'bàn 101', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (29, N'bàn 102', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (30, N'bàn 103', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (31, N'bàn 201', 3, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (32, N'bàn 202', 3, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (33, N'bàn 203', 3, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (34, N'bàn 301', 4, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (35, N'bàn 302', 4, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (36, N'bàn 303', 4, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (37, N'bàn 401', 7, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (38, N'bàn 402', 7, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (39, N'bàn 104', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (40, N'bàn 105', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (41, N'bàn 106', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (42, N'bàn 107', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (43, N'bàn 108', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (44, N'bàn 109', 2, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (45, N'bàn 110', 2, 1, 109)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (46, N'bàn 204', 3, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (47, N'bàn 205', 3, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (48, N'bàn 304', 4, 1, 0)
INSERT [dbo].[TableFood] ([TableFood_id], [TableFood_name], [idArea], [status], [idBill]) VALUES (49, N'bàn 305', 4, 1, 0)
SET IDENTITY_INSERT [dbo].[TableFood] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role1] FOREIGN KEY([idRole])
REFERENCES [dbo].[Role] ([Role_id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role1]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Account] FOREIGN KEY([idAccount])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Account]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_TableFood] FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([TableFood_id])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_TableFood]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_Account] FOREIGN KEY([idAccount])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_Account]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_Bill] FOREIGN KEY([idBill])
REFERENCES [dbo].[Bill] ([Bill_id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_Bill]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_Food] FOREIGN KEY([idFood])
REFERENCES [dbo].[Food] ([Food_id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_Food]
GO
ALTER TABLE [dbo].[BillInfo]  WITH CHECK ADD  CONSTRAINT [FK_BillInfo_TableFood] FOREIGN KEY([idTable])
REFERENCES [dbo].[TableFood] ([TableFood_id])
GO
ALTER TABLE [dbo].[BillInfo] CHECK CONSTRAINT [FK_BillInfo_TableFood]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_DVT] FOREIGN KEY([idDVT])
REFERENCES [dbo].[DVT] ([DVT_id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_DVT]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_FoodCategory] FOREIGN KEY([idCategory])
REFERENCES [dbo].[FoodCategory] ([FoodCategory_id])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_FoodCategory]
GO
ALTER TABLE [dbo].[TableFood]  WITH CHECK ADD  CONSTRAINT [fk1] FOREIGN KEY([idArea])
REFERENCES [dbo].[Area] ([Area_id])
GO
ALTER TABLE [dbo].[TableFood] CHECK CONSTRAINT [fk1]
GO
