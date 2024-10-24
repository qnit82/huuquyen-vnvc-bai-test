USE [RoosterLotteryDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 25/10/2024 5:09:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bets]    Script Date: 25/10/2024 5:09:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bets](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SlotId] [bigint] NULL,
	[BetNumber] [bigint] NULL,
	[BetTime] [datetime2](7) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
	[IsWinner] [bit] NULL,
	[Spined] [bit] NULL,
 CONSTRAINT [PK_Bets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slots]    Script Date: 25/10/2024 5:09:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slots](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SlotTime] [datetime2](7) NOT NULL,
	[SlotDay] [int] NOT NULL,
	[SlotHour] [int] NOT NULL,
	[SlotMinute] [int] NOT NULL,
	[SpinTime] [datetime2](7) NULL,
	[ResultNumber] [int] NULL,
	[Spined] [bit] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Slots] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25/10/2024 5:09:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[AccessToken] [nvarchar](max) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241020104932_InitDB', N'6.0.31')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241020174401_InitRemoveUserIdGuiID', N'6.0.31')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241020180125_InitRemoveUserIdForBet', N'6.0.31')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241021155600_InitRemoveEntityBetResult', N'6.0.31')
GO
SET IDENTITY_INSERT [dbo].[Bets] ON 
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (1, 1, 1, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (2, 1, 2, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (3, 1, 3, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (4, 1, 4, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 1, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (5, 1, 5, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (6, 1, 6, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (7, 1, 7, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (8, 1, 9, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (9, 1, 0, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10, 1, 1, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (11, 1, 2, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (12, 1, 3, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (14, 1, 9, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10014, 1, 2, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10015, 1, 1, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10016, 1, 5, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10017, 1, 2, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10018, 1, 9, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), 1, NULL, CAST(N'2024-10-24T17:08:50.5900000' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10019, 2, 2, CAST(N'2024-10-24T18:26:32.3398598' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:26:32.3521177' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10020, 2, 2, CAST(N'2024-10-24T18:26:48.5456925' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:26:48.5459629' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10021, 2, 2, CAST(N'2024-10-24T18:28:36.4747320' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:28:36.4749899' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10022, 2, 3, CAST(N'2024-10-24T18:32:12.8544723' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:32:12.8545740' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10023, 2, 2, CAST(N'2024-10-24T18:40:33.4058235' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:40:33.4059490' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10024, 2, 2, CAST(N'2024-10-24T18:40:46.4215961' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:40:46.4217414' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10025, 2, 3, CAST(N'2024-10-24T18:42:22.3738779' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:42:22.3739761' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10026, 2, 2, CAST(N'2024-10-24T18:46:17.2761950' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:46:17.2762573' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10027, 2, 6, CAST(N'2024-10-24T18:47:20.1151734' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:47:20.1152563' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10028, 2, 6, CAST(N'2024-10-24T18:49:28.0342134' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:49:28.0342609' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10029, 2, 7, CAST(N'2024-10-24T18:57:03.0100876' AS DateTime2), 1, NULL, CAST(N'2024-10-24T18:57:03.0101915' AS DateTime2), CAST(N'2024-10-24T19:00:01.4200000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10030, 3, 2, CAST(N'2024-10-24T19:01:04.5699538' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:01:04.5703920' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10031, 3, 2, CAST(N'2024-10-24T19:06:52.6733009' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:06:52.6734842' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10032, 3, 2, CAST(N'2024-10-24T19:08:11.4703386' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:08:11.4704091' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10033, 3, 2, CAST(N'2024-10-24T19:10:14.6559529' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:10:14.6560040' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10034, 3, 7, CAST(N'2024-10-24T19:18:46.4632848' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:18:46.4634356' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10035, 3, 6, CAST(N'2024-10-24T19:20:37.6765687' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:20:37.6766141' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10036, 3, 2, CAST(N'2024-10-24T19:24:21.8676533' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:24:21.8676993' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10037, 3, 2, CAST(N'2024-10-24T19:25:19.9075591' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:25:19.9076291' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10038, 3, 9, CAST(N'2024-10-24T19:25:28.5726592' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:25:28.5727019' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10039, 3, 5, CAST(N'2024-10-24T19:28:22.9549537' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:28:22.9550393' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
INSERT [dbo].[Bets] ([Id], [SlotId], [BetNumber], [BetTime], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt], [IsWinner], [Spined]) VALUES (10040, 3, 5, CAST(N'2024-10-24T19:31:38.7873626' AS DateTime2), 1, NULL, CAST(N'2024-10-24T19:31:38.7874251' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Bets] OFF
GO
SET IDENTITY_INSERT [dbo].[Slots] ON 
GO
INSERT [dbo].[Slots] ([Id], [SlotTime], [SlotDay], [SlotHour], [SlotMinute], [SpinTime], [ResultNumber], [Spined], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt]) VALUES (1, CAST(N'2024-10-24T18:00:00.0000000' AS DateTime2), 24, 18, 0, CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2), 4, 1, 0, NULL, CAST(N'2024-10-24T17:14:10.4741907' AS DateTime2), CAST(N'2024-10-24T18:00:12.5233333' AS DateTime2))
GO
INSERT [dbo].[Slots] ([Id], [SlotTime], [SlotDay], [SlotHour], [SlotMinute], [SpinTime], [ResultNumber], [Spined], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt]) VALUES (2, CAST(N'2024-10-24T19:00:00.0000000' AS DateTime2), 24, 19, 0, CAST(N'2024-10-24T19:00:01.4166667' AS DateTime2), 7, 1, 0, NULL, CAST(N'2024-10-24T18:00:12.5094572' AS DateTime2), CAST(N'2024-10-24T19:00:01.4166667' AS DateTime2))
GO
INSERT [dbo].[Slots] ([Id], [SlotTime], [SlotDay], [SlotHour], [SlotMinute], [SpinTime], [ResultNumber], [Spined], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt]) VALUES (3, CAST(N'2024-10-24T20:00:00.0000000' AS DateTime2), 24, 20, 0, CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2), 1, 1, 0, NULL, CAST(N'2024-10-24T19:00:01.4138973' AS DateTime2), CAST(N'2024-10-24T20:00:12.3600000' AS DateTime2))
GO
INSERT [dbo].[Slots] ([Id], [SlotTime], [SlotDay], [SlotHour], [SlotMinute], [SpinTime], [ResultNumber], [Spined], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt]) VALUES (4, CAST(N'2024-10-24T21:00:00.0000000' AS DateTime2), 24, 21, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2024-10-24T20:00:12.3431185' AS DateTime2), NULL)
GO
INSERT [dbo].[Slots] ([Id], [SlotTime], [SlotDay], [SlotHour], [SlotMinute], [SpinTime], [ResultNumber], [Spined], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt]) VALUES (5, CAST(N'2024-10-25T05:00:00.0000000' AS DateTime2), 25, 5, 0, CAST(N'2024-10-25T05:00:00.3766667' AS DateTime2), 5, 1, 0, NULL, CAST(N'2024-10-25T04:16:13.8579941' AS DateTime2), CAST(N'2024-10-25T05:00:00.3766667' AS DateTime2))
GO
INSERT [dbo].[Slots] ([Id], [SlotTime], [SlotDay], [SlotHour], [SlotMinute], [SpinTime], [ResultNumber], [Spined], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt]) VALUES (6, CAST(N'2024-10-25T06:00:00.0000000' AS DateTime2), 25, 6, 0, NULL, NULL, NULL, 0, NULL, CAST(N'2024-10-25T05:00:00.3636544' AS DateTime2), NULL)
GO
SET IDENTITY_INSERT [dbo].[Slots] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [FullName], [DateOfBirth], [PhoneNumber], [AccessToken], [CreatedBy], [UpdatedBy], [CreatedAt], [UpdatedAt]) VALUES (1, N'A QUyền', CAST(N'1980-10-21T17:00:00.0000000' AS DateTime2), N'0908088099', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiMSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvZ3JvdXBzaWQiOiIxIiwiZXhwIjoxNzMwMTM2MDU1LCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUwMDAiLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjUwMDAifQ.GMkbT6qIdqPqdhG3UPMoSvjYL2VwYrXOAJpnv6OEsFw', 1, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[udfResetSlot_Test]    Script Date: 25/10/2024 5:09:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[udfResetSlot_Test]
-- exec udfResetSlot_Test
as
begin
	BEGIN TRANSACTION;
	BEGIN TRY
		update Slots set Spined=null, SpinTime=null, ResultNumber=null, UpdatedAt=null where day(SlotTime)=DAY(getdate())
		update Bets set UpdatedBy=null, UpdatedAt=null, IsWinner=null, Spined=null where SlotId in(
			select x.Id from Slots x where day(x.SlotTime)=DAY(getdate())
		)
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT ERROR_MESSAGE() AS ErrorMessage;
	END CATCH;
end
GO
/****** Object:  StoredProcedure [dbo].[udfSpinTest]    Script Date: 25/10/2024 5:09:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[udfSpinTest]
@ResultNumber int,
@SlotId bigint
-- exec udfSpinTest @ResultNumber=2, @SlotId=43
as
begin
	BEGIN TRANSACTION;
	BEGIN TRY 
		update Slots set ResultNumber=@ResultNumber, Spined=1, SpinTime=GETDATE(), UpdatedAt=GETDATE() where Id=@SlotId
		update Bets set UpdatedAt=GETDATE(), Spined=1, IsWinner=case BetNumber when @ResultNumber then 1 else 0 end where SlotId=@SlotId
	COMMIT TRANSACTION; 
	PRINT 'Spin committed successfully'; 
	END TRY 
	BEGIN CATCH 
	ROLLBACK TRANSACTION; 
	PRINT 'Spin error'; 
	END CATCH; 
end
GO
