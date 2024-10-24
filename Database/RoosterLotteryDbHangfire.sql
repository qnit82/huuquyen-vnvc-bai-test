USE [RoosterLotteryDbHangfire]
GO
/****** Object:  Schema [HangFire]    Script Date: 25/10/2024 5:10:31 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 25/10/2024 5:10:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 1259, NULL)
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-20', 483, CAST(N'2024-11-20T18:00:07.993' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-21', 204, CAST(N'2024-11-21T17:50:04.983' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-22', 272, CAST(N'2024-11-22T17:40:06.997' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-23', 153, CAST(N'2024-11-23T16:26:14.623' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24', 147, CAST(N'2024-11-24T22:06:00.827' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-06', 1, CAST(N'2024-10-25T06:12:51.713' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-09', 12, CAST(N'2024-10-25T09:58:07.997' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-10', 10, CAST(N'2024-10-25T10:58:27.397' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-11', 42, CAST(N'2024-10-25T11:58:01.300' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-12', 37, CAST(N'2024-10-25T12:58:12.227' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-13', 5, CAST(N'2024-10-25T13:52:53.517' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-14', 1, CAST(N'2024-10-25T14:07:41.297' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-15', 2, CAST(N'2024-10-25T15:45:02.567' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-21', 31, CAST(N'2024-10-25T21:58:00.277' AS DateTime))
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-10-24-22', 6, CAST(N'2024-10-25T22:06:00.827' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Counter] ON 
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded', 1, NULL, 32872)
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2024-10-24', 1, CAST(N'2024-11-24T22:08:00.937' AS DateTime), 32873)
GO
INSERT [HangFire].[Counter] ([Key], [Value], [ExpireAt], [Id]) VALUES (N'stats:succeeded:2024-10-24-22', 1, CAST(N'2024-10-25T22:08:00.937' AS DateTime), 32874)
GO
SET IDENTITY_INSERT [HangFire].[Counter] OFF
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'CreatedAt', N'1729410431611', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'Cron', N'*/45 * * * *', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'Error', N'Hangfire.Common.JobLoadException: Could not load the job. See inner exception for the details.
 ---> System.InvalidOperationException: The type `RoosterLottery.UnitOfWork.WorkerService.SlotCreationService` does not contain a method with signature `CreateSlotForNextDay()`
   at Hangfire.Storage.InvocationData.<>c.<CachedDeserializeMethod>b__33_0(Tuple`4 tuple) in C:\projects\hangfire-525\src\Hangfire.Core\Storage\InvocationData.cs:line 346
   at System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   at Hangfire.Storage.InvocationData.CachedDeserializeMethod(Func`2 typeResolver, String typeName, String methodName, String parameterTypes, Type& type, MethodInfo& methodInfo) in C:\projects\hangfire-525\src\Hangfire.Core\Storage\InvocationData.cs:line 332
   at Hangfire.Storage.InvocationData.DeserializeJob() in C:\projects\hangfire-525\src\Hangfire.Core\Storage\InvocationData.cs:line 100
   --- End of inner exception stack trace ---
   at Hangfire.Storage.InvocationData.DeserializeJob() in C:\projects\hangfire-525\src\Hangfire.Core\Storage\InvocationData.cs:line 118
   at Hangfire.RecurringJobExtensions.TriggerRecurringJob(IBackgroundJobFactory factory, JobStorage storage, IStorageConnection connection, IProfiler profiler, RecurringJobEntity recurringJob, DateTime now) in C:\projects\hangfire-525\src\Hangfire.Core\RecurringJobExtensions.cs:line 115
   at Hangfire.Server.RecurringJobScheduler.ScheduleRecurringJob(BackgroundProcessContext context, IStorageConnection connection, String recurringJobId, RecurringJobEntity recurringJob, DateTime now) in C:\projects\hangfire-525\src\Hangfire.Core\Server\RecurringJobScheduler.cs:line 333', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'Job', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'LastExecution', N'1729784701188', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'LastJobId', N'30818', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'NextExecution', N'', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'Queue', N'default', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'RetryAttempt', N'5', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'TimeZoneId', N'UTC', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-day', N'V', N'2', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'CreatedAt', N'1729763203762', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'Cron', N'*/2 * * * *', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'Job', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'LastExecution', N'1729807680907', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'LastJobId', N'30958', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'NextExecution', N'1729807800000', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'Queue', N'default', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'TimeZoneId', N'UTC', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:create-slot-next-time', N'V', N'2', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'CreatedAt', N'1729763204024', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'Cron', N'*/5 * * * *', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'Job', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'LastExecution', N'1729807500729', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'LastJobId', N'30956', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'NextExecution', N'1729807800000', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'Queue', N'default', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'TimeZoneId', N'UTC', NULL)
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:spin-slot', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20817, 23228, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', N'[]', CAST(N'2024-10-24T06:12:47.060' AS DateTime), CAST(N'2024-10-25T06:12:51.720' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20818, 23231, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', N'[]', CAST(N'2024-10-24T12:14:59.050' AS DateTime), CAST(N'2024-10-25T12:14:59.140' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20819, 23234, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', N'[]', CAST(N'2024-10-24T12:45:11.687' AS DateTime), CAST(N'2024-10-25T12:45:11.933' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20820, 23237, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', N'[]', CAST(N'2024-10-24T13:00:12.387' AS DateTime), CAST(N'2024-10-25T13:00:12.480' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20821, 23240, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', N'[]', CAST(N'2024-10-24T13:52:50.690' AS DateTime), CAST(N'2024-10-25T13:52:53.523' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (20822, 23243, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', N'[]', CAST(N'2024-10-24T14:07:39.330' AS DateTime), CAST(N'2024-10-25T14:07:41.303' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30817, 33228, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', N'[]', CAST(N'2024-10-24T15:16:48.030' AS DateTime), CAST(N'2024-10-25T15:16:49.573' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30818, 33231, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextDay"}', N'[]', CAST(N'2024-10-24T15:45:01.253' AS DateTime), CAST(N'2024-10-25T15:45:02.567' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30819, 33237, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T09:48:14.217' AS DateTime), CAST(N'2024-10-25T09:48:15.337' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30820, 33236, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T09:48:14.247' AS DateTime), CAST(N'2024-10-25T09:48:15.180' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30821, 33242, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T09:50:05.373' AS DateTime), CAST(N'2024-10-25T09:50:21.427' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30822, 33243, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T09:50:05.463' AS DateTime), CAST(N'2024-10-25T09:50:24.920' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30823, 33249, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T09:52:06.500' AS DateTime), CAST(N'2024-10-25T09:52:09.823' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30824, 33248, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T09:52:06.507' AS DateTime), CAST(N'2024-10-25T09:52:09.823' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30825, 33254, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T09:54:07.720' AS DateTime), CAST(N'2024-10-25T09:54:14.450' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30826, 33255, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T09:54:07.753' AS DateTime), CAST(N'2024-10-25T09:54:18.400' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30827, 33260, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T09:56:07.853' AS DateTime), CAST(N'2024-10-25T09:56:07.883' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30828, 33261, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T09:56:07.867' AS DateTime), CAST(N'2024-10-25T09:56:07.887' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30829, 33266, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T09:58:07.950' AS DateTime), CAST(N'2024-10-25T09:58:07.993' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30830, 33267, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T09:58:07.970' AS DateTime), CAST(N'2024-10-25T09:58:07.997' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30831, 33277, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T10:00:08.070' AS DateTime), CAST(N'2024-10-25T10:09:26.207' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30832, 33276, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T10:00:08.107' AS DateTime), CAST(N'2024-10-25T10:09:26.047' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30833, 33278, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T10:09:25.103' AS DateTime), CAST(N'2024-10-25T10:09:26.227' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30834, 33283, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T10:10:10.193' AS DateTime), CAST(N'2024-10-25T10:10:10.233' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30835, 33284, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T10:10:10.223' AS DateTime), CAST(N'2024-10-25T10:10:10.233' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30836, 33287, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T10:12:10.297' AS DateTime), CAST(N'2024-10-25T10:12:10.333' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30837, 33290, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T10:14:10.433' AS DateTime), CAST(N'2024-10-25T10:14:10.480' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30838, 33293, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T10:15:10.500' AS DateTime), CAST(N'2024-10-25T10:15:10.527' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30839, 33298, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T10:58:27.370' AS DateTime), CAST(N'2024-10-25T10:58:27.393' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30840, 33299, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T10:58:27.383' AS DateTime), CAST(N'2024-10-25T10:58:27.397' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30841, 33304, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:00:12.480' AS DateTime), CAST(N'2024-10-25T11:00:12.513' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30842, 33309, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:00:12.503' AS DateTime), CAST(N'2024-10-25T11:00:42.273' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30843, 33312, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:02:12.597' AS DateTime), CAST(N'2024-10-25T11:02:12.630' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30844, 33315, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:04:12.733' AS DateTime), CAST(N'2024-10-25T11:04:12.760' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30845, 33318, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:05:12.807' AS DateTime), CAST(N'2024-10-25T11:05:12.850' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30846, 33321, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:06:12.883' AS DateTime), CAST(N'2024-10-25T11:06:12.920' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30847, 33324, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:08:13.007' AS DateTime), CAST(N'2024-10-25T11:08:13.037' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30848, 33328, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:10:13.120' AS DateTime), CAST(N'2024-10-25T11:10:13.150' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30849, 33330, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:10:13.137' AS DateTime), CAST(N'2024-10-25T11:10:13.163' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30850, 33333, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:12:13.237' AS DateTime), CAST(N'2024-10-25T11:12:13.277' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30851, 33336, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:14:13.373' AS DateTime), CAST(N'2024-10-25T11:14:13.417' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30852, 33339, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:15:13.450' AS DateTime), CAST(N'2024-10-25T11:15:13.510' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30853, 33342, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:16:13.560' AS DateTime), CAST(N'2024-10-25T11:16:13.587' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30854, 33345, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:18:13.653' AS DateTime), CAST(N'2024-10-25T11:18:13.690' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30855, 33350, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:20:13.760' AS DateTime), CAST(N'2024-10-25T11:20:13.790' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30856, 33351, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:20:13.780' AS DateTime), CAST(N'2024-10-25T11:20:13.793' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30857, 33354, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:22:13.860' AS DateTime), CAST(N'2024-10-25T11:22:13.887' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30858, 33357, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:24:13.983' AS DateTime), CAST(N'2024-10-25T11:24:14.030' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30859, 33360, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:25:14.073' AS DateTime), CAST(N'2024-10-25T11:25:14.127' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30860, 33363, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:26:14.163' AS DateTime), CAST(N'2024-10-25T11:26:14.193' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30861, 33366, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:28:14.283' AS DateTime), CAST(N'2024-10-25T11:28:14.317' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30862, 33371, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:30:14.437' AS DateTime), CAST(N'2024-10-25T11:30:14.490' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30863, 33372, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:30:14.480' AS DateTime), CAST(N'2024-10-25T11:30:14.493' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30864, 33375, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:32:14.583' AS DateTime), CAST(N'2024-10-25T11:32:14.617' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30865, 33378, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:34:14.693' AS DateTime), CAST(N'2024-10-25T11:34:14.727' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30866, 33381, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:35:14.763' AS DateTime), CAST(N'2024-10-25T11:35:14.797' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30867, 33384, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:36:14.827' AS DateTime), CAST(N'2024-10-25T11:36:14.877' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30868, 33387, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:38:14.943' AS DateTime), CAST(N'2024-10-25T11:38:14.990' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30869, 33392, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:40:00.067' AS DateTime), CAST(N'2024-10-25T11:40:00.103' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30870, 33393, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:40:00.093' AS DateTime), CAST(N'2024-10-25T11:40:00.173' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30871, 33396, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:42:00.207' AS DateTime), CAST(N'2024-10-25T11:42:00.303' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30872, 33399, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:44:00.377' AS DateTime), CAST(N'2024-10-25T11:44:00.420' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30873, 33402, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:45:00.450' AS DateTime), CAST(N'2024-10-25T11:45:00.480' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30874, 33405, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:46:00.500' AS DateTime), CAST(N'2024-10-25T11:46:00.543' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30875, 33408, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:48:00.640' AS DateTime), CAST(N'2024-10-25T11:48:00.673' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30876, 33413, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:50:00.763' AS DateTime), CAST(N'2024-10-25T11:50:00.800' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30877, 33414, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:50:00.790' AS DateTime), CAST(N'2024-10-25T11:50:00.800' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30878, 33417, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:52:00.880' AS DateTime), CAST(N'2024-10-25T11:52:00.923' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30879, 33420, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:54:01.020' AS DateTime), CAST(N'2024-10-25T11:54:01.070' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30880, 33423, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T11:55:01.083' AS DateTime), CAST(N'2024-10-25T11:55:01.113' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30881, 33426, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:56:01.147' AS DateTime), CAST(N'2024-10-25T11:56:01.180' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30882, 33429, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T11:58:01.273' AS DateTime), CAST(N'2024-10-25T11:58:01.300' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30883, 33434, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:00:01.380' AS DateTime), CAST(N'2024-10-25T12:00:01.423' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30884, 33439, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:00:01.403' AS DateTime), CAST(N'2024-10-25T12:00:45.150' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30885, 33442, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:02:01.507' AS DateTime), CAST(N'2024-10-25T12:02:01.543' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30886, 33445, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:04:01.647' AS DateTime), CAST(N'2024-10-25T12:04:01.683' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30887, 33448, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:05:01.743' AS DateTime), CAST(N'2024-10-25T12:05:01.770' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30888, 33451, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:06:01.810' AS DateTime), CAST(N'2024-10-25T12:06:01.840' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30889, 33454, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:08:01.923' AS DateTime), CAST(N'2024-10-25T12:08:01.963' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30890, 33459, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:10:02.060' AS DateTime), CAST(N'2024-10-25T12:10:02.103' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30891, 33460, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:10:02.090' AS DateTime), CAST(N'2024-10-25T12:10:02.107' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30892, 33463, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:12:02.163' AS DateTime), CAST(N'2024-10-25T12:12:02.193' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30893, 33466, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:14:02.263' AS DateTime), CAST(N'2024-10-25T12:14:02.290' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30894, 33469, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:15:02.337' AS DateTime), CAST(N'2024-10-25T12:15:02.437' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30895, 33472, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:16:02.463' AS DateTime), CAST(N'2024-10-25T12:16:02.520' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30896, 33475, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:18:02.610' AS DateTime), CAST(N'2024-10-25T12:18:02.637' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30897, 33480, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:20:02.703' AS DateTime), CAST(N'2024-10-25T12:20:02.740' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30898, 33481, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:20:02.730' AS DateTime), CAST(N'2024-10-25T12:20:02.747' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30899, 33484, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:22:02.890' AS DateTime), CAST(N'2024-10-25T12:22:02.913' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30900, 33487, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:24:03.003' AS DateTime), CAST(N'2024-10-25T12:24:03.033' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30901, 33490, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:25:03.070' AS DateTime), CAST(N'2024-10-25T12:25:03.137' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30902, 33493, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:26:03.167' AS DateTime), CAST(N'2024-10-25T12:26:03.197' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30903, 33496, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:28:03.250' AS DateTime), CAST(N'2024-10-25T12:28:03.280' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30904, 33501, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:30:03.357' AS DateTime), CAST(N'2024-10-25T12:30:03.387' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30905, 33502, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:30:03.373' AS DateTime), CAST(N'2024-10-25T12:30:03.393' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30906, 33505, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:32:03.450' AS DateTime), CAST(N'2024-10-25T12:32:03.487' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30907, 33508, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:34:03.550' AS DateTime), CAST(N'2024-10-25T12:34:03.573' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30908, 33511, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:35:03.600' AS DateTime), CAST(N'2024-10-25T12:35:03.647' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30909, 33514, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:36:03.673' AS DateTime), CAST(N'2024-10-25T12:36:03.707' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30910, 33517, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:38:03.783' AS DateTime), CAST(N'2024-10-25T12:38:03.823' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30911, 33522, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:40:03.907' AS DateTime), CAST(N'2024-10-25T12:40:03.947' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30912, 33523, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:40:03.937' AS DateTime), CAST(N'2024-10-25T12:40:03.950' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30913, 33526, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:42:04.007' AS DateTime), CAST(N'2024-10-25T12:42:04.040' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30914, 33529, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:44:04.137' AS DateTime), CAST(N'2024-10-25T12:44:04.163' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30915, 33532, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:45:04.190' AS DateTime), CAST(N'2024-10-25T12:45:04.220' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30916, 33536, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T12:58:12.207' AS DateTime), CAST(N'2024-10-25T12:58:12.227' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30917, 33538, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T12:58:12.220' AS DateTime), CAST(N'2024-10-25T12:58:12.227' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30918, 33543, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T13:00:12.303' AS DateTime), CAST(N'2024-10-25T13:00:12.347' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30919, 33548, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T13:00:12.337' AS DateTime), CAST(N'2024-10-25T13:00:40.387' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30920, 33551, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T13:02:12.433' AS DateTime), CAST(N'2024-10-25T13:02:12.480' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30921, 33557, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:16:12.780' AS DateTime), CAST(N'2024-10-25T21:16:14.060' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30922, 33556, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:16:12.850' AS DateTime), CAST(N'2024-10-25T21:16:13.867' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30923, 33560, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:18:13.007' AS DateTime), CAST(N'2024-10-25T21:18:13.047' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30924, 33565, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:20:13.123' AS DateTime), CAST(N'2024-10-25T21:20:13.150' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30925, 33566, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:20:13.140' AS DateTime), CAST(N'2024-10-25T21:20:13.153' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30926, 33569, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:22:13.210' AS DateTime), CAST(N'2024-10-25T21:22:13.237' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30927, 33572, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:24:13.320' AS DateTime), CAST(N'2024-10-25T21:24:13.350' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30928, 33575, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:25:13.390' AS DateTime), CAST(N'2024-10-25T21:25:13.437' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30929, 33578, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:26:13.473' AS DateTime), CAST(N'2024-10-25T21:26:13.503' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30930, 33581, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:28:13.593' AS DateTime), CAST(N'2024-10-25T21:28:13.623' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30931, 33585, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:30:13.723' AS DateTime), CAST(N'2024-10-25T21:30:13.757' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30932, 33587, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:30:13.740' AS DateTime), CAST(N'2024-10-25T21:30:13.773' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30933, 33590, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:32:13.833' AS DateTime), CAST(N'2024-10-25T21:32:13.860' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30934, 33593, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:34:11.653' AS DateTime), CAST(N'2024-10-25T21:34:11.797' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30935, 33596, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:35:09.200' AS DateTime), CAST(N'2024-10-25T21:35:09.357' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30936, 33599, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:36:14.727' AS DateTime), CAST(N'2024-10-25T21:36:14.867' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30937, 33602, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:38:14.850' AS DateTime), CAST(N'2024-10-25T21:38:14.883' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30938, 33606, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:40:14.967' AS DateTime), CAST(N'2024-10-25T21:40:15.010' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30939, 33608, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:40:15.000' AS DateTime), CAST(N'2024-10-25T21:40:15.043' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30940, 33611, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:42:00.103' AS DateTime), CAST(N'2024-10-25T21:42:00.140' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30941, 33614, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:44:08.680' AS DateTime), CAST(N'2024-10-25T21:44:08.840' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30942, 33617, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:45:46.480' AS DateTime), CAST(N'2024-10-25T21:45:49.117' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30943, 33620, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:46:08.773' AS DateTime), CAST(N'2024-10-25T21:46:15.630' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30944, 33623, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:48:14.650' AS DateTime), CAST(N'2024-10-25T21:48:15.590' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30945, 33628, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:50:14.800' AS DateTime), CAST(N'2024-10-25T21:50:14.830' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30946, 33629, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:50:14.820' AS DateTime), CAST(N'2024-10-25T21:50:14.850' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30947, 33632, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:52:14.920' AS DateTime), CAST(N'2024-10-25T21:52:14.953' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30948, 33635, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:54:15.007' AS DateTime), CAST(N'2024-10-25T21:54:15.043' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30949, 33638, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T21:55:00.073' AS DateTime), CAST(N'2024-10-25T21:55:00.110' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30950, 33641, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:56:00.160' AS DateTime), CAST(N'2024-10-25T21:56:00.183' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30951, 33644, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T21:58:00.240' AS DateTime), CAST(N'2024-10-25T21:58:00.277' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30952, 33651, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T22:00:00.330' AS DateTime), CAST(N'2024-10-25T22:00:00.493' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30953, 33654, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T22:00:00.350' AS DateTime), CAST(N'2024-10-25T22:00:30.253' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30954, 33657, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T22:02:00.507' AS DateTime), CAST(N'2024-10-25T22:02:00.560' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30955, 33660, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T22:04:00.640' AS DateTime), CAST(N'2024-10-25T22:04:00.677' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30956, 33663, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"SpinSlotToDay"}', N'[]', CAST(N'2024-10-24T22:05:00.733' AS DateTime), CAST(N'2024-10-25T22:05:00.757' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30957, 33666, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T22:06:00.797' AS DateTime), CAST(N'2024-10-25T22:06:00.827' AS DateTime))
GO
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (30958, 33669, N'Succeeded', N'{"t":"RoosterLottery.UnitOfWork.WorkerService.SlotCreationService, RoosterLottery.UnitOfWork","m":"CreateSlotForNextTime"}', N'[]', CAST(N'2024-10-24T22:08:00.910' AS DateTime), CAST(N'2024-10-25T22:08:00.937' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20817, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20817, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20817, N'RecurringJobId', N'"create-slot-next-day"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20817, N'Time', N'1729750366')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20818, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20818, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20818, N'RecurringJobId', N'"create-slot-next-day"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20818, N'Time', N'1729772099')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20819, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20819, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20819, N'RecurringJobId', N'"create-slot-next-day"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20819, N'Time', N'1729773911')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20820, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20820, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20820, N'RecurringJobId', N'"create-slot-next-day"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20820, N'Time', N'1729774812')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20821, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20821, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20821, N'RecurringJobId', N'"create-slot-next-day"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20821, N'Time', N'1729777970')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20822, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20822, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20822, N'RecurringJobId', N'"create-slot-next-day"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (20822, N'Time', N'1729778859')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30817, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30817, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30817, N'RecurringJobId', N'"create-slot-next-day"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30817, N'Time', N'1729783007')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30818, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30818, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30818, N'RecurringJobId', N'"create-slot-next-day"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30818, N'Time', N'1729784701')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30819, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30819, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30819, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30819, N'Time', N'1729763294')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30820, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30820, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30820, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30820, N'Time', N'1729763294')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30821, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30821, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30821, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30821, N'Time', N'1729763405')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30822, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30822, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30822, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30822, N'Time', N'1729763405')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30823, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30823, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30823, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30823, N'Time', N'1729763526')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30824, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30824, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30824, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30824, N'Time', N'1729763526')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30825, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30825, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30825, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30825, N'Time', N'1729763647')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30826, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30826, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30826, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30826, N'Time', N'1729763647')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30827, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30827, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30827, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30827, N'Time', N'1729763767')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30828, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30828, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30828, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30828, N'Time', N'1729763767')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30829, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30829, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30829, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30829, N'Time', N'1729763887')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30830, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30830, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30830, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30830, N'Time', N'1729763887')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30831, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30831, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30831, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30831, N'Time', N'1729764008')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30832, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30832, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30832, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30832, N'Time', N'1729764008')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30833, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30833, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30833, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30833, N'Time', N'1729764565')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30834, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30834, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30834, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30834, N'Time', N'1729764610')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30835, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30835, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30835, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30835, N'Time', N'1729764610')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30836, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30836, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30836, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30836, N'Time', N'1729764730')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30837, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30837, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30837, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30837, N'Time', N'1729764850')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30838, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30838, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30838, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30838, N'Time', N'1729764910')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30839, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30839, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30839, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30839, N'Time', N'1729767507')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30840, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30840, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30840, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30840, N'Time', N'1729767507')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30841, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30841, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30841, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30841, N'Time', N'1729767612')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30842, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30842, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30842, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30842, N'RetryCount', N'1')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30842, N'Time', N'1729767612')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30843, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30843, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30843, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30843, N'Time', N'1729767732')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30844, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30844, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30844, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30844, N'Time', N'1729767852')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30845, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30845, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30845, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30845, N'Time', N'1729767912')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30846, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30846, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30846, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30846, N'Time', N'1729767972')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30847, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30847, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30847, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30847, N'Time', N'1729768093')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30848, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30848, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30848, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30848, N'Time', N'1729768213')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30849, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30849, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30849, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30849, N'Time', N'1729768213')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30850, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30850, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30850, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30850, N'Time', N'1729768333')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30851, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30851, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30851, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30851, N'Time', N'1729768453')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30852, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30852, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30852, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30852, N'Time', N'1729768513')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30853, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30853, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30853, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30853, N'Time', N'1729768573')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30854, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30854, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30854, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30854, N'Time', N'1729768693')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30855, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30855, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30855, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30855, N'Time', N'1729768813')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30856, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30856, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30856, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30856, N'Time', N'1729768813')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30857, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30857, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30857, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30857, N'Time', N'1729768933')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30858, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30858, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30858, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30858, N'Time', N'1729769053')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30859, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30859, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30859, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30859, N'Time', N'1729769114')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30860, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30860, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30860, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30860, N'Time', N'1729769174')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30861, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30861, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30861, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30861, N'Time', N'1729769294')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30862, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30862, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30862, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30862, N'Time', N'1729769414')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30863, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30863, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30863, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30863, N'Time', N'1729769414')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30864, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30864, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30864, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30864, N'Time', N'1729769534')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30865, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30865, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30865, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30865, N'Time', N'1729769654')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30866, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30866, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30866, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30866, N'Time', N'1729769714')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30867, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30867, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30867, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30867, N'Time', N'1729769774')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30868, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30868, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30868, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30868, N'Time', N'1729769894')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30869, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30869, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30869, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30869, N'Time', N'1729770000')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30870, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30870, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30870, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30870, N'Time', N'1729770000')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30871, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30871, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30871, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30871, N'Time', N'1729770120')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30872, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30872, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30872, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30872, N'Time', N'1729770240')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30873, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30873, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30873, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30873, N'Time', N'1729770300')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30874, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30874, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30874, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30874, N'Time', N'1729770360')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30875, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30875, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30875, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30875, N'Time', N'1729770480')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30876, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30876, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30876, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30876, N'Time', N'1729770600')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30877, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30877, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30877, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30877, N'Time', N'1729770600')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30878, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30878, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30878, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30878, N'Time', N'1729770720')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30879, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30879, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30879, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30879, N'Time', N'1729770841')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30880, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30880, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30880, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30880, N'Time', N'1729770901')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30881, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30881, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30881, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30881, N'Time', N'1729770961')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30882, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30882, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30882, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30882, N'Time', N'1729771081')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30883, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30883, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30883, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30883, N'Time', N'1729771201')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30884, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30884, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30884, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30884, N'RetryCount', N'1')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30884, N'Time', N'1729771201')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30885, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30885, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30885, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30885, N'Time', N'1729771321')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30886, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30886, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30886, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30886, N'Time', N'1729771441')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30887, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30887, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30887, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30887, N'Time', N'1729771501')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30888, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30888, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30888, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30888, N'Time', N'1729771561')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30889, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30889, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30889, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30889, N'Time', N'1729771681')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30890, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30890, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30890, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30890, N'Time', N'1729771802')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30891, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30891, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30891, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30891, N'Time', N'1729771802')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30892, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30892, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30892, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30892, N'Time', N'1729771922')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30893, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30893, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30893, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30893, N'Time', N'1729772042')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30894, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30894, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30894, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30894, N'Time', N'1729772102')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30895, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30895, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30895, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30895, N'Time', N'1729772162')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30896, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30896, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30896, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30896, N'Time', N'1729772282')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30897, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30897, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30897, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30897, N'Time', N'1729772402')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30898, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30898, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30898, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30898, N'Time', N'1729772402')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30899, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30899, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30899, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30899, N'Time', N'1729772522')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30900, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30900, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30900, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30900, N'Time', N'1729772643')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30901, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30901, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30901, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30901, N'Time', N'1729772703')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30902, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30902, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30902, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30902, N'Time', N'1729772763')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30903, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30903, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30903, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30903, N'Time', N'1729772883')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30904, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30904, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30904, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30904, N'Time', N'1729773003')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30905, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30905, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30905, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30905, N'Time', N'1729773003')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30906, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30906, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30906, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30906, N'Time', N'1729773123')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30907, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30907, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30907, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30907, N'Time', N'1729773243')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30908, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30908, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30908, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30908, N'Time', N'1729773303')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30909, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30909, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30909, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30909, N'Time', N'1729773363')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30910, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30910, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30910, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30910, N'Time', N'1729773483')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30911, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30911, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30911, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30911, N'Time', N'1729773603')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30912, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30912, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30912, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30912, N'Time', N'1729773603')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30913, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30913, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30913, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30913, N'Time', N'1729773723')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30914, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30914, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30914, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30914, N'Time', N'1729773844')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30915, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30915, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30915, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30915, N'Time', N'1729773904')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30916, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30916, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30916, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30916, N'Time', N'1729774692')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30917, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30917, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30917, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30917, N'Time', N'1729774692')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30918, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30918, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30918, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30918, N'Time', N'1729774812')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30919, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30919, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30919, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30919, N'RetryCount', N'1')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30919, N'Time', N'1729774812')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30920, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30920, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30920, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30920, N'Time', N'1729774932')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30921, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30921, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30921, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30921, N'Time', N'1729804572')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30922, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30922, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30922, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30922, N'Time', N'1729804572')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30923, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30923, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30923, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30923, N'Time', N'1729804693')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30924, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30924, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30924, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30924, N'Time', N'1729804813')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30925, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30925, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30925, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30925, N'Time', N'1729804813')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30926, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30926, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30926, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30926, N'Time', N'1729804933')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30927, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30927, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30927, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30927, N'Time', N'1729805053')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30928, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30928, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30928, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30928, N'Time', N'1729805113')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30929, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30929, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30929, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30929, N'Time', N'1729805173')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30930, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30930, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30930, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30930, N'Time', N'1729805293')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30931, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30931, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30931, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30931, N'Time', N'1729805413')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30932, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30932, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30932, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30932, N'Time', N'1729805413')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30933, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30933, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30933, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30933, N'Time', N'1729805533')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30934, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30934, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30934, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30934, N'Time', N'1729805651')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30935, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30935, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30935, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30935, N'Time', N'1729805709')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30936, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30936, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30936, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30936, N'Time', N'1729805774')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30937, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30937, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30937, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30937, N'Time', N'1729805894')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30938, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30938, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30938, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30938, N'Time', N'1729806014')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30939, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30939, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30939, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30939, N'Time', N'1729806014')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30940, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30940, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30940, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30940, N'Time', N'1729806120')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30941, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30941, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30941, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30941, N'Time', N'1729806248')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30942, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30942, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30942, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30942, N'Time', N'1729806346')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30943, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30943, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30943, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30943, N'Time', N'1729806367')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30944, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30944, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30944, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30944, N'Time', N'1729806494')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30945, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30945, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30945, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30945, N'Time', N'1729806614')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30946, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30946, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30946, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30946, N'Time', N'1729806614')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30947, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30947, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30947, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30947, N'Time', N'1729806734')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30948, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30948, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30948, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30948, N'Time', N'1729806855')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30949, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30949, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30949, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30949, N'Time', N'1729806900')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30950, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30950, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30950, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30950, N'Time', N'1729806960')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30951, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30951, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30951, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30951, N'Time', N'1729807080')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30952, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30952, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30952, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30952, N'Time', N'1729807200')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30953, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30953, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30953, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30953, N'RetryCount', N'1')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30953, N'Time', N'1729807200')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30954, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30954, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30954, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30954, N'Time', N'1729807320')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30955, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30955, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30955, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30955, N'Time', N'1729807440')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30956, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30956, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30956, N'RecurringJobId', N'"spin-slot"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30956, N'Time', N'1729807500')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30957, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30957, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30957, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30957, N'Time', N'1729807560')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30958, N'CurrentCulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30958, N'CurrentUICulture', N'"en-US"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30958, N'RecurringJobId', N'"create-slot-next-time"')
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (30958, N'Time', N'1729807680')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', -1, N'create-slot-next-day', NULL)
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1729807800, N'create-slot-next-time', NULL)
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1729807800, N'spin-slot', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23226, 20817, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T06:12:47.110' AS DateTime), N'{"EnqueuedAt":"1729750367090","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23227, 20817, N'Processing', NULL, CAST(N'2024-10-24T06:12:47.387' AS DateTime), N'{"StartedAt":"1729750367184","ServerId":"admin-pc:18816:ab8f908f-c92b-4d04-95cf-9cc0f06e5e53","WorkerId":"9f37935c-62b9-4654-9a3c-97ab626c4e20"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23228, 20817, N'Succeeded', NULL, CAST(N'2024-10-24T06:12:51.717' AS DateTime), N'{"SucceededAt":"1729750371707","PerformanceDuration":"4312","Latency":"334"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23229, 20818, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:14:59.053' AS DateTime), N'{"EnqueuedAt":"1729772099051","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23230, 20818, N'Processing', NULL, CAST(N'2024-10-24T12:14:59.057' AS DateTime), N'{"StartedAt":"1729772099055","ServerId":"admin-pc:18816:ab8f908f-c92b-4d04-95cf-9cc0f06e5e53","WorkerId":"997d33b3-c0d2-43fb-9f56-1f1fbd0b7982"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23231, 20818, N'Succeeded', NULL, CAST(N'2024-10-24T12:14:59.140' AS DateTime), N'{"SucceededAt":"1729772099139","PerformanceDuration":"82","Latency":"7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23232, 20819, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:45:11.710' AS DateTime), N'{"EnqueuedAt":"1729773911699","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23233, 20819, N'Processing', NULL, CAST(N'2024-10-24T12:45:11.813' AS DateTime), N'{"StartedAt":"1729773911728","ServerId":"admin-pc:19432:1ef0766c-6139-4e09-a96d-b5b91e223d23","WorkerId":"3aefda13-3711-45b0-852f-d30e5732db34"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23234, 20819, N'Succeeded', NULL, CAST(N'2024-10-24T12:45:11.930' AS DateTime), N'{"SucceededAt":"1729773911925","PerformanceDuration":"108","Latency":"129"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23235, 20820, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T13:00:12.390' AS DateTime), N'{"EnqueuedAt":"1729774812390","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23236, 20820, N'Processing', NULL, CAST(N'2024-10-24T13:00:12.393' AS DateTime), N'{"StartedAt":"1729774812393","ServerId":"admin-pc:19432:1ef0766c-6139-4e09-a96d-b5b91e223d23","WorkerId":"12986f00-ab89-42a0-abf6-725fbd79d034"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23237, 20820, N'Succeeded', NULL, CAST(N'2024-10-24T13:00:12.480' AS DateTime), N'{"SucceededAt":"1729774812479","PerformanceDuration":"84","Latency":"8"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23238, 20821, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T13:52:50.777' AS DateTime), N'{"EnqueuedAt":"1729777970711","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23239, 20821, N'Processing', NULL, CAST(N'2024-10-24T13:52:50.973' AS DateTime), N'{"StartedAt":"1729777970830","ServerId":"admin-pc:18504:adbf6ce3-c25e-4333-9932-675642c28407","WorkerId":"007c4bd2-a395-4f71-8876-3ae9cd24634f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23240, 20821, N'Succeeded', NULL, CAST(N'2024-10-24T13:52:53.520' AS DateTime), N'{"SucceededAt":"1729777973514","PerformanceDuration":"2535","Latency":"289"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23241, 20822, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T14:07:39.397' AS DateTime), N'{"EnqueuedAt":"1729778859378","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23242, 20822, N'Processing', NULL, CAST(N'2024-10-24T14:07:39.617' AS DateTime), N'{"StartedAt":"1729778859445","ServerId":"admin-pc:27760:42be8c6e-3279-4cff-b7d9-b858fc3ad8d7","WorkerId":"120348fe-a1c9-4059-9853-ccc61ffac1fd"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23243, 20822, N'Succeeded', NULL, CAST(N'2024-10-24T14:07:41.300' AS DateTime), N'{"SucceededAt":"1729778861294","PerformanceDuration":"1672","Latency":"292"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33226, 30817, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T15:16:48.047' AS DateTime), N'{"EnqueuedAt":"1729783008037","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33227, 30817, N'Processing', NULL, CAST(N'2024-10-24T15:16:48.130' AS DateTime), N'{"StartedAt":"1729783008070","ServerId":"admin-pc:1388:8fb89b64-6caf-45ab-8de7-fa33fb5b610d","WorkerId":"e4556c75-b681-4ae6-8493-999d9a9f36b2"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33228, 30817, N'Succeeded', NULL, CAST(N'2024-10-24T15:16:49.573' AS DateTime), N'{"SucceededAt":"1729783009567","PerformanceDuration":"1434","Latency":"102"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33229, 30818, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T15:45:01.270' AS DateTime), N'{"EnqueuedAt":"1729784701262","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33230, 30818, N'Processing', NULL, CAST(N'2024-10-24T15:45:01.337' AS DateTime), N'{"StartedAt":"1729784701281","ServerId":"admin-pc:4880:9c830bcd-cacd-4bf9-bc62-24ccf8fac253","WorkerId":"13573181-e1ba-459b-bf9d-5090c1093bca"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33231, 30818, N'Succeeded', NULL, CAST(N'2024-10-24T15:45:02.567' AS DateTime), N'{"SucceededAt":"1729784702563","PerformanceDuration":"1223","Latency":"87"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33232, 30819, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:48:14.237' AS DateTime), N'{"EnqueuedAt":"1729763294229","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33235, 30819, N'Processing', NULL, CAST(N'2024-10-24T09:48:14.273' AS DateTime), N'{"StartedAt":"1729763294250","ServerId":"admin-pc:10244:a45a6999-a978-40e3-a86b-9e832e5a5ebe","WorkerId":"8315b4bd-b52b-4614-a172-c47a957a75f6"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33237, 30819, N'Succeeded', NULL, CAST(N'2024-10-24T09:48:15.337' AS DateTime), N'{"SucceededAt":"1729763295335","PerformanceDuration":"1059","Latency":"59"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33233, 30820, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:48:14.250' AS DateTime), N'{"EnqueuedAt":"1729763294248","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33234, 30820, N'Processing', NULL, CAST(N'2024-10-24T09:48:14.273' AS DateTime), N'{"StartedAt":"1729763294251","ServerId":"admin-pc:10244:a45a6999-a978-40e3-a86b-9e832e5a5ebe","WorkerId":"e7b7d5d1-3dec-49ff-a2a1-5fff269374b5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33236, 30820, N'Succeeded', NULL, CAST(N'2024-10-24T09:48:15.180' AS DateTime), N'{"SucceededAt":"1729763295175","PerformanceDuration":"899","Latency":"29"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33238, 30821, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:50:05.397' AS DateTime), N'{"EnqueuedAt":"1729763405384","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33241, 30821, N'Processing', NULL, CAST(N'2024-10-24T09:50:05.543' AS DateTime), N'{"StartedAt":"1729763405464","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"cd56683d-1d43-40e5-88e7-a37dcdd4219e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33242, 30821, N'Succeeded', NULL, CAST(N'2024-10-24T09:50:21.423' AS DateTime), N'{"SucceededAt":"1729763421414","PerformanceDuration":"15868","Latency":"172"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33239, 30822, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:50:05.463' AS DateTime), N'{"EnqueuedAt":"1729763405464","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33240, 30822, N'Processing', NULL, CAST(N'2024-10-24T09:50:05.543' AS DateTime), N'{"StartedAt":"1729763405466","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"edf015e1-2a12-4cab-9982-405ddbbcb13b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33243, 30822, N'Succeeded', NULL, CAST(N'2024-10-24T09:50:24.917' AS DateTime), N'{"SucceededAt":"1729763424916","PerformanceDuration":"19371","Latency":"82"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33244, 30823, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:52:06.503' AS DateTime), N'{"EnqueuedAt":"1729763526504","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33246, 30823, N'Processing', NULL, CAST(N'2024-10-24T09:52:06.507' AS DateTime), N'{"StartedAt":"1729763526506","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"199236d0-6cab-4ba8-b3bc-8fc44e784e03"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33249, 30823, N'Succeeded', NULL, CAST(N'2024-10-24T09:52:09.823' AS DateTime), N'{"SucceededAt":"1729763529820","PerformanceDuration":"3312","Latency":"8"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33245, 30824, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:52:06.507' AS DateTime), N'{"EnqueuedAt":"1729763526507","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33247, 30824, N'Processing', NULL, CAST(N'2024-10-24T09:52:06.510' AS DateTime), N'{"StartedAt":"1729763526509","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"2d42d14a-10ac-45c0-a8a3-1ee33969cff2"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33248, 30824, N'Succeeded', NULL, CAST(N'2024-10-24T09:52:09.823' AS DateTime), N'{"SucceededAt":"1729763529820","PerformanceDuration":"17","Latency":"3296"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33250, 30825, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:54:07.730' AS DateTime), N'{"EnqueuedAt":"1729763647731","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33252, 30825, N'Processing', NULL, CAST(N'2024-10-24T09:54:07.757' AS DateTime), N'{"StartedAt":"1729763647751","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"de739ce8-ba02-409a-8852-3e25ffde758b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33254, 30825, N'Succeeded', NULL, CAST(N'2024-10-24T09:54:14.450' AS DateTime), N'{"SucceededAt":"1729763654449","PerformanceDuration":"6688","Latency":"40"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33251, 30826, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:54:07.753' AS DateTime), N'{"EnqueuedAt":"1729763647752","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33253, 30826, N'Processing', NULL, CAST(N'2024-10-24T09:54:07.763' AS DateTime), N'{"StartedAt":"1729763647761","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"65e0948e-6f4c-4baa-94da-25c0affb9c1b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33255, 30826, N'Succeeded', NULL, CAST(N'2024-10-24T09:54:18.400' AS DateTime), N'{"SucceededAt":"1729763658399","PerformanceDuration":"10632","Latency":"13"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33256, 30827, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:56:07.857' AS DateTime), N'{"EnqueuedAt":"1729763767856","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33258, 30827, N'Processing', NULL, CAST(N'2024-10-24T09:56:07.870' AS DateTime), N'{"StartedAt":"1729763767867","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"a465048f-1396-4591-b5b7-42c2f102ffaf"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33260, 30827, N'Succeeded', NULL, CAST(N'2024-10-24T09:56:07.883' AS DateTime), N'{"SucceededAt":"1729763767882","PerformanceDuration":"10","Latency":"18"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33257, 30828, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:56:07.870' AS DateTime), N'{"EnqueuedAt":"1729763767869","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33259, 30828, N'Processing', NULL, CAST(N'2024-10-24T09:56:07.873' AS DateTime), N'{"StartedAt":"1729763767872","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"ae5ce860-b04e-44b0-abe9-1397869abfe1"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33261, 30828, N'Succeeded', NULL, CAST(N'2024-10-24T09:56:07.887' AS DateTime), N'{"SucceededAt":"1729763767886","PerformanceDuration":"11","Latency":"7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33262, 30829, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:58:07.960' AS DateTime), N'{"EnqueuedAt":"1729763887958","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33265, 30829, N'Processing', NULL, CAST(N'2024-10-24T09:58:07.980' AS DateTime), N'{"StartedAt":"1729763887975","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"ab6101f2-baaa-41b2-90ca-cb5111f197e4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33266, 30829, N'Succeeded', NULL, CAST(N'2024-10-24T09:58:07.993' AS DateTime), N'{"SucceededAt":"1729763887991","PerformanceDuration":"11","Latency":"30"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33263, 30830, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T09:58:07.973' AS DateTime), N'{"EnqueuedAt":"1729763887972","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33264, 30830, N'Processing', NULL, CAST(N'2024-10-24T09:58:07.980' AS DateTime), N'{"StartedAt":"1729763887976","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"c9644026-2ea1-475c-aa70-7c3cd73e5463"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33267, 30830, N'Succeeded', NULL, CAST(N'2024-10-24T09:58:07.997' AS DateTime), N'{"SucceededAt":"1729763887996","PerformanceDuration":"15","Latency":"10"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33268, 30831, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:00:08.087' AS DateTime), N'{"EnqueuedAt":"1729764008085","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33270, 30831, N'Processing', NULL, CAST(N'2024-10-24T10:00:08.110' AS DateTime), N'{"StartedAt":"1729764008108","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"320eacd4-ba5b-440d-a7cd-ccc800d48739"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33274, 30831, N'Processing', NULL, CAST(N'2024-10-24T10:09:25.137' AS DateTime), N'{"StartedAt":"1729764565048","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b31492a9-5f38-4d2d-b5b9-2ab986bebfe5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33277, 30831, N'Succeeded', NULL, CAST(N'2024-10-24T10:09:26.207' AS DateTime), N'{"SucceededAt":"1729764566206","PerformanceDuration":"1054","Latency":"557081"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33269, 30832, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:00:08.107' AS DateTime), N'{"EnqueuedAt":"1729764008106","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33271, 30832, N'Processing', NULL, CAST(N'2024-10-24T10:00:08.113' AS DateTime), N'{"StartedAt":"1729764008111","ServerId":"admin-pc:7524:7b7119c2-3932-4a7e-abc2-93f64299649b","WorkerId":"1573afc0-1864-4f8c-afbc-f6c9184c15c4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33273, 30832, N'Processing', NULL, CAST(N'2024-10-24T10:09:25.137' AS DateTime), N'{"StartedAt":"1729764565048","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dac9c8d6-fbd5-450e-81d5-8183aa30635a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33276, 30832, N'Succeeded', NULL, CAST(N'2024-10-24T10:09:26.047' AS DateTime), N'{"SucceededAt":"1729764566041","PerformanceDuration":"889","Latency":"557044"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33272, 30833, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:09:25.127' AS DateTime), N'{"EnqueuedAt":"1729764565114","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33275, 30833, N'Processing', NULL, CAST(N'2024-10-24T10:09:25.153' AS DateTime), N'{"StartedAt":"1729764565153","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a889ff48-1235-4c65-bb8f-b720da483127"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33278, 30833, N'Succeeded', NULL, CAST(N'2024-10-24T10:09:26.227' AS DateTime), N'{"SucceededAt":"1729764566226","PerformanceDuration":"1071","Latency":"52"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33279, 30834, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:10:10.207' AS DateTime), N'{"EnqueuedAt":"1729764610207","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33281, 30834, N'Processing', NULL, CAST(N'2024-10-24T10:10:10.227' AS DateTime), N'{"StartedAt":"1729764610225","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aedda9dc-4290-4796-b380-d5175acc6fe7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33283, 30834, N'Succeeded', NULL, CAST(N'2024-10-24T10:10:10.233' AS DateTime), N'{"SucceededAt":"1729764610232","PerformanceDuration":"3","Latency":"35"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33280, 30835, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:10:10.223' AS DateTime), N'{"EnqueuedAt":"1729764610223","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33282, 30835, N'Processing', NULL, CAST(N'2024-10-24T10:10:10.230' AS DateTime), N'{"StartedAt":"1729764610227","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aa4d615c-ae22-44a0-bc72-ea0176a6bc9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33284, 30835, N'Succeeded', NULL, CAST(N'2024-10-24T10:10:10.233' AS DateTime), N'{"SucceededAt":"1729764610233","PerformanceDuration":"4","Latency":"6"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33285, 30836, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:12:10.307' AS DateTime), N'{"EnqueuedAt":"1729764730305","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33286, 30836, N'Processing', NULL, CAST(N'2024-10-24T10:12:10.320' AS DateTime), N'{"StartedAt":"1729764730318","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6f942876-64db-4bb1-b9d6-b6096765a37b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33287, 30836, N'Succeeded', NULL, CAST(N'2024-10-24T10:12:10.333' AS DateTime), N'{"SucceededAt":"1729764730329","PerformanceDuration":"3","Latency":"28"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33288, 30837, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:14:10.447' AS DateTime), N'{"EnqueuedAt":"1729764850445","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33289, 30837, N'Processing', NULL, CAST(N'2024-10-24T10:14:10.470' AS DateTime), N'{"StartedAt":"1729764850467","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dd7a3733-140e-440c-b5ea-31ae1cb5e49a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33290, 30837, N'Succeeded', NULL, CAST(N'2024-10-24T10:14:10.480' AS DateTime), N'{"SucceededAt":"1729764850479","PerformanceDuration":"8","Latency":"38"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33291, 30838, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:15:10.507' AS DateTime), N'{"EnqueuedAt":"1729764910505","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33292, 30838, N'Processing', NULL, CAST(N'2024-10-24T10:15:10.520' AS DateTime), N'{"StartedAt":"1729764910518","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"8b588af2-7102-4446-afe2-efd9fd3b4164"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33293, 30838, N'Succeeded', NULL, CAST(N'2024-10-24T10:15:10.527' AS DateTime), N'{"SucceededAt":"1729764910526","PerformanceDuration":"5","Latency":"20"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33294, 30839, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:58:27.377' AS DateTime), N'{"EnqueuedAt":"1729767507375","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33296, 30839, N'Processing', NULL, CAST(N'2024-10-24T10:58:27.387' AS DateTime), N'{"StartedAt":"1729767507386","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"7b17acaf-0d3e-41bb-82b9-be179060b61f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33298, 30839, N'Succeeded', NULL, CAST(N'2024-10-24T10:58:27.393' AS DateTime), N'{"SucceededAt":"1729767507392","PerformanceDuration":"3","Latency":"19"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33295, 30840, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T10:58:27.387' AS DateTime), N'{"EnqueuedAt":"1729767507386","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33297, 30840, N'Processing', NULL, CAST(N'2024-10-24T10:58:27.390' AS DateTime), N'{"StartedAt":"1729767507389","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"c1b6c9aa-899b-402d-9ddd-2db3bc515b80"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33299, 30840, N'Succeeded', NULL, CAST(N'2024-10-24T10:58:27.397' AS DateTime), N'{"SucceededAt":"1729767507396","PerformanceDuration":"5","Latency":"8"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33300, 30841, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:00:12.493' AS DateTime), N'{"EnqueuedAt":"1729767612491","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33302, 30841, N'Processing', NULL, CAST(N'2024-10-24T11:00:12.507' AS DateTime), N'{"StartedAt":"1729767612504","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"884f4209-d532-46ac-be73-dcffbc890b0e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33304, 30841, N'Succeeded', NULL, CAST(N'2024-10-24T11:00:12.513' AS DateTime), N'{"SucceededAt":"1729767612513","PerformanceDuration":"6","Latency":"26"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33301, 30842, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:00:12.503' AS DateTime), N'{"EnqueuedAt":"1729767612502","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33303, 30842, N'Processing', NULL, CAST(N'2024-10-24T11:00:12.513' AS DateTime), N'{"StartedAt":"1729767612506","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"315b2c1d-81ca-4d8a-ba01-a6fc6f2a5b5f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33305, 30842, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2024-10-24T11:00:12.587' AS DateTime), N'{"FailedAt":"1729767612542","ExceptionType":"System.AggregateException","ExceptionMessage":"One or more errors occurred. (The ConnectionString property has not been initialized.)","ExceptionDetails":"System.AggregateException: One or more errors occurred. (The ConnectionString property has not been initialized.)\r\n ---> System.InvalidOperationException: The ConnectionString property has not been initialized.\r\n   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()\r\n   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)\r\n   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)\r\n   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenInternalAsync(Boolean errorsExpected, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenInternalAsync(Boolean errorsExpected, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenAsync(CancellationToken cancellationToken, Boolean errorsExpected)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.InitializeReaderAsync(AsyncEnumerator enumerator, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.MoveNextAsync()\r\n   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)\r\n   at RoosterLottery.Repository.Implemention.SlotRepository.GetSlotsInfoAsync(Int64 id, CancellationToken cancellationToken) in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.DI\\Implemention\\SlotRepository.cs:line 119\r\n   at RoosterLottery.UnitOfWork.Implemention.SlotUnitOfWork.SpinSlotAsync(CancellationToken cancellationToken) in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.UnitOfWork\\Implemention\\SlotUnitOfWork.cs:line 102\r\n   --- End of inner exception stack trace ---\r\n   at System.Threading.Tasks.Task.ThrowIfExceptional(Boolean includeTaskCanceledExceptions)\r\n   at System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)\r\n   at System.Threading.Tasks.Task.Wait()\r\n   at RoosterLottery.UnitOfWork.WorkerService.SlotCreationService.SpinSlotToDay() in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.UnitOfWork\\WorkerService\\SlotCreationService.cs:line 38","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33306, 30842, N'Scheduled', N'Retry attempt 1 of 10: One or more errors occurred. (The ConnectionStrin…', CAST(N'2024-10-24T11:00:12.590' AS DateTime), N'{"EnqueueAt":"1729767633549","ScheduledAt":"1729767612549"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33307, 30842, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-10-24T11:00:42.253' AS DateTime), N'{"EnqueuedAt":"1729767642246","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33308, 30842, N'Processing', NULL, CAST(N'2024-10-24T11:00:42.267' AS DateTime), N'{"StartedAt":"1729767642265","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"2cf23b52-1be0-4f64-af71-b4241e4a88e4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33309, 30842, N'Succeeded', NULL, CAST(N'2024-10-24T11:00:42.273' AS DateTime), N'{"SucceededAt":"1729767642272","PerformanceDuration":"4","Latency":"29764"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33310, 30843, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:02:12.610' AS DateTime), N'{"EnqueuedAt":"1729767732610","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33311, 30843, N'Processing', NULL, CAST(N'2024-10-24T11:02:12.623' AS DateTime), N'{"StartedAt":"1729767732622","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"45cd49ef-2575-4702-a72d-931d885f1437"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33312, 30843, N'Succeeded', NULL, CAST(N'2024-10-24T11:02:12.630' AS DateTime), N'{"SucceededAt":"1729767732629","PerformanceDuration":"3","Latency":"28"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33313, 30844, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:04:12.740' AS DateTime), N'{"EnqueuedAt":"1729767852741","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33314, 30844, N'Processing', NULL, CAST(N'2024-10-24T11:04:12.757' AS DateTime), N'{"StartedAt":"1729767852755","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"04065d81-acb0-48e1-8214-72c513bfea9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33315, 30844, N'Succeeded', NULL, CAST(N'2024-10-24T11:04:12.760' AS DateTime), N'{"SucceededAt":"1729767852760","PerformanceDuration":"2","Latency":"24"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33316, 30845, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:05:12.820' AS DateTime), N'{"EnqueuedAt":"1729767912818","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33317, 30845, N'Processing', NULL, CAST(N'2024-10-24T11:05:12.843' AS DateTime), N'{"StartedAt":"1729767912839","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a1542ae3-b278-4553-8824-6ba27fd83675"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33318, 30845, N'Succeeded', NULL, CAST(N'2024-10-24T11:05:12.850' AS DateTime), N'{"SucceededAt":"1729767912848","PerformanceDuration":"6","Latency":"35"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33319, 30846, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:06:12.893' AS DateTime), N'{"EnqueuedAt":"1729767972892","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33320, 30846, N'Processing', NULL, CAST(N'2024-10-24T11:06:12.913' AS DateTime), N'{"StartedAt":"1729767972909","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b6bd1c59-b79c-4dd8-ac82-01b376616216"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33321, 30846, N'Succeeded', NULL, CAST(N'2024-10-24T11:06:12.920' AS DateTime), N'{"SucceededAt":"1729767972918","PerformanceDuration":"4","Latency":"30"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33322, 30847, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:08:13.017' AS DateTime), N'{"EnqueuedAt":"1729768093016","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33323, 30847, N'Processing', NULL, CAST(N'2024-10-24T11:08:13.030' AS DateTime), N'{"StartedAt":"1729768093028","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"910d71ed-ebea-4d19-ac96-576532970f6f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33324, 30847, N'Succeeded', NULL, CAST(N'2024-10-24T11:08:13.037' AS DateTime), N'{"SucceededAt":"1729768093035","PerformanceDuration":"3","Latency":"24"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33325, 30848, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:10:13.123' AS DateTime), N'{"EnqueuedAt":"1729768213122","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33326, 30848, N'Processing', NULL, CAST(N'2024-10-24T11:10:13.137' AS DateTime), N'{"StartedAt":"1729768213134","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6e1204b2-657f-44e3-937b-e3a19ac3e790"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33328, 30848, N'Succeeded', NULL, CAST(N'2024-10-24T11:10:13.150' AS DateTime), N'{"SucceededAt":"1729768213145","PerformanceDuration":"3","Latency":"21"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33327, 30849, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:10:13.140' AS DateTime), N'{"EnqueuedAt":"1729768213139","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33329, 30849, N'Processing', NULL, CAST(N'2024-10-24T11:10:13.153' AS DateTime), N'{"StartedAt":"1729768213152","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"50127308-f263-42be-b7ab-23db401b689a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33330, 30849, N'Succeeded', NULL, CAST(N'2024-10-24T11:10:13.163' AS DateTime), N'{"SucceededAt":"1729768213161","PerformanceDuration":"4","Latency":"19"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33331, 30850, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:12:13.250' AS DateTime), N'{"EnqueuedAt":"1729768333248","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33332, 30850, N'Processing', NULL, CAST(N'2024-10-24T11:12:13.270' AS DateTime), N'{"StartedAt":"1729768333267","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dac9c8d6-fbd5-450e-81d5-8183aa30635a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33333, 30850, N'Succeeded', NULL, CAST(N'2024-10-24T11:12:13.277' AS DateTime), N'{"SucceededAt":"1729768333274","PerformanceDuration":"4","Latency":"33"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33334, 30851, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:14:13.390' AS DateTime), N'{"EnqueuedAt":"1729768453389","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33335, 30851, N'Processing', NULL, CAST(N'2024-10-24T11:14:13.410' AS DateTime), N'{"StartedAt":"1729768453408","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b31492a9-5f38-4d2d-b5b9-2ab986bebfe5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33336, 30851, N'Succeeded', NULL, CAST(N'2024-10-24T11:14:13.417' AS DateTime), N'{"SucceededAt":"1729768453415","PerformanceDuration":"3","Latency":"38"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33337, 30852, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:15:13.473' AS DateTime), N'{"EnqueuedAt":"1729768513472","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33338, 30852, N'Processing', NULL, CAST(N'2024-10-24T11:15:13.503' AS DateTime), N'{"StartedAt":"1729768513500","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a889ff48-1235-4c65-bb8f-b720da483127"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33339, 30852, N'Succeeded', NULL, CAST(N'2024-10-24T11:15:13.510' AS DateTime), N'{"SucceededAt":"1729768513510","PerformanceDuration":"5","Latency":"55"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33340, 30853, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:16:13.570' AS DateTime), N'{"EnqueuedAt":"1729768573568","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33341, 30853, N'Processing', NULL, CAST(N'2024-10-24T11:16:13.583' AS DateTime), N'{"StartedAt":"1729768573580","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aedda9dc-4290-4796-b380-d5175acc6fe7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33342, 30853, N'Succeeded', NULL, CAST(N'2024-10-24T11:16:13.587' AS DateTime), N'{"SucceededAt":"1729768573586","PerformanceDuration":"2","Latency":"23"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33343, 30854, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:18:13.667' AS DateTime), N'{"EnqueuedAt":"1729768693667","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33344, 30854, N'Processing', NULL, CAST(N'2024-10-24T11:18:13.683' AS DateTime), N'{"StartedAt":"1729768693682","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aa4d615c-ae22-44a0-bc72-ea0176a6bc9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33345, 30854, N'Succeeded', NULL, CAST(N'2024-10-24T11:18:13.690' AS DateTime), N'{"SucceededAt":"1729768693690","PerformanceDuration":"3","Latency":"33"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33346, 30855, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:20:13.767' AS DateTime), N'{"EnqueuedAt":"1729768813768","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33348, 30855, N'Processing', NULL, CAST(N'2024-10-24T11:20:13.783' AS DateTime), N'{"StartedAt":"1729768813780","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6f942876-64db-4bb1-b9d6-b6096765a37b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33350, 30855, N'Succeeded', NULL, CAST(N'2024-10-24T11:20:13.790' AS DateTime), N'{"SucceededAt":"1729768813787","PerformanceDuration":"4","Latency":"23"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33347, 30856, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:20:13.780' AS DateTime), N'{"EnqueuedAt":"1729768813779","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33349, 30856, N'Processing', NULL, CAST(N'2024-10-24T11:20:13.783' AS DateTime), N'{"StartedAt":"1729768813783","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dd7a3733-140e-440c-b5ea-31ae1cb5e49a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33351, 30856, N'Succeeded', NULL, CAST(N'2024-10-24T11:20:13.793' AS DateTime), N'{"SucceededAt":"1729768813793","PerformanceDuration":"8","Latency":"4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33352, 30857, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:22:13.870' AS DateTime), N'{"EnqueuedAt":"1729768933869","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33353, 30857, N'Processing', NULL, CAST(N'2024-10-24T11:22:13.883' AS DateTime), N'{"StartedAt":"1729768933880","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"8b588af2-7102-4446-afe2-efd9fd3b4164"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33354, 30857, N'Succeeded', NULL, CAST(N'2024-10-24T11:22:13.887' AS DateTime), N'{"SucceededAt":"1729768933886","PerformanceDuration":"2","Latency":"24"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33355, 30858, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:24:13.997' AS DateTime), N'{"EnqueuedAt":"1729769053998","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33356, 30858, N'Processing', NULL, CAST(N'2024-10-24T11:24:14.023' AS DateTime), N'{"StartedAt":"1729769054020","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"7b17acaf-0d3e-41bb-82b9-be179060b61f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33357, 30858, N'Succeeded', NULL, CAST(N'2024-10-24T11:24:14.030' AS DateTime), N'{"SucceededAt":"1729769054029","PerformanceDuration":"5","Latency":"40"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33358, 30859, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:25:14.090' AS DateTime), N'{"EnqueuedAt":"1729769114089","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33359, 30859, N'Processing', NULL, CAST(N'2024-10-24T11:25:14.120' AS DateTime), N'{"StartedAt":"1729769114116","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"c1b6c9aa-899b-402d-9ddd-2db3bc515b80"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33360, 30859, N'Succeeded', NULL, CAST(N'2024-10-24T11:25:14.127' AS DateTime), N'{"SucceededAt":"1729769114126","PerformanceDuration":"6","Latency":"47"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33361, 30860, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:26:14.170' AS DateTime), N'{"EnqueuedAt":"1729769174170","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33362, 30860, N'Processing', NULL, CAST(N'2024-10-24T11:26:14.190' AS DateTime), N'{"StartedAt":"1729769174189","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"884f4209-d532-46ac-be73-dcffbc890b0e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33363, 30860, N'Succeeded', NULL, CAST(N'2024-10-24T11:26:14.193' AS DateTime), N'{"SucceededAt":"1729769174194","PerformanceDuration":"2","Latency":"28"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33364, 30861, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:28:14.297' AS DateTime), N'{"EnqueuedAt":"1729769294295","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33365, 30861, N'Processing', NULL, CAST(N'2024-10-24T11:28:14.310' AS DateTime), N'{"StartedAt":"1729769294308","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"315b2c1d-81ca-4d8a-ba01-a6fc6f2a5b5f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33366, 30861, N'Succeeded', NULL, CAST(N'2024-10-24T11:28:14.317' AS DateTime), N'{"SucceededAt":"1729769294315","PerformanceDuration":"3","Latency":"29"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33367, 30862, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:30:14.450' AS DateTime), N'{"EnqueuedAt":"1729769414450","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33369, 30862, N'Processing', NULL, CAST(N'2024-10-24T11:30:14.480' AS DateTime), N'{"StartedAt":"1729769414479","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"2cf23b52-1be0-4f64-af71-b4241e4a88e4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33371, 30862, N'Succeeded', NULL, CAST(N'2024-10-24T11:30:14.490' AS DateTime), N'{"SucceededAt":"1729769414490","PerformanceDuration":"4","Latency":"48"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33368, 30863, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:30:14.480' AS DateTime), N'{"EnqueuedAt":"1729769414479","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33370, 30863, N'Processing', NULL, CAST(N'2024-10-24T11:30:14.487' AS DateTime), N'{"StartedAt":"1729769414486","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"45cd49ef-2575-4702-a72d-931d885f1437"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33372, 30863, N'Succeeded', NULL, CAST(N'2024-10-24T11:30:14.493' AS DateTime), N'{"SucceededAt":"1729769414494","PerformanceDuration":"6","Latency":"8"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33373, 30864, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:32:14.590' AS DateTime), N'{"EnqueuedAt":"1729769534590","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33374, 30864, N'Processing', NULL, CAST(N'2024-10-24T11:32:14.613' AS DateTime), N'{"StartedAt":"1729769534610","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"04065d81-acb0-48e1-8214-72c513bfea9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33375, 30864, N'Succeeded', NULL, CAST(N'2024-10-24T11:32:14.617' AS DateTime), N'{"SucceededAt":"1729769534616","PerformanceDuration":"2","Latency":"31"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33376, 30865, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:34:14.710' AS DateTime), N'{"EnqueuedAt":"1729769654708","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33377, 30865, N'Processing', NULL, CAST(N'2024-10-24T11:34:14.723' AS DateTime), N'{"StartedAt":"1729769654720","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a1542ae3-b278-4553-8824-6ba27fd83675"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33378, 30865, N'Succeeded', NULL, CAST(N'2024-10-24T11:34:14.727' AS DateTime), N'{"SucceededAt":"1729769654726","PerformanceDuration":"3","Latency":"30"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33379, 30866, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:35:14.770' AS DateTime), N'{"EnqueuedAt":"1729769714771","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33380, 30866, N'Processing', NULL, CAST(N'2024-10-24T11:35:14.790' AS DateTime), N'{"StartedAt":"1729769714786","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b6bd1c59-b79c-4dd8-ac82-01b376616216"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33381, 30866, N'Succeeded', NULL, CAST(N'2024-10-24T11:35:14.797' AS DateTime), N'{"SucceededAt":"1729769714795","PerformanceDuration":"5","Latency":"27"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33382, 30867, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:36:14.847' AS DateTime), N'{"EnqueuedAt":"1729769774846","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33383, 30867, N'Processing', NULL, CAST(N'2024-10-24T11:36:14.873' AS DateTime), N'{"StartedAt":"1729769774870","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"910d71ed-ebea-4d19-ac96-576532970f6f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33384, 30867, N'Succeeded', NULL, CAST(N'2024-10-24T11:36:14.877' AS DateTime), N'{"SucceededAt":"1729769774877","PerformanceDuration":"3","Latency":"46"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33385, 30868, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:38:14.960' AS DateTime), N'{"EnqueuedAt":"1729769894961","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33386, 30868, N'Processing', NULL, CAST(N'2024-10-24T11:38:14.987' AS DateTime), N'{"StartedAt":"1729769894983","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6e1204b2-657f-44e3-937b-e3a19ac3e790"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33387, 30868, N'Succeeded', NULL, CAST(N'2024-10-24T11:38:14.990' AS DateTime), N'{"SucceededAt":"1729769894989","PerformanceDuration":"2","Latency":"43"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33388, 30869, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:40:00.080' AS DateTime), N'{"EnqueuedAt":"1729770000079","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33390, 30869, N'Processing', NULL, CAST(N'2024-10-24T11:40:00.097' AS DateTime), N'{"StartedAt":"1729770000095","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"50127308-f263-42be-b7ab-23db401b689a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33392, 30869, N'Succeeded', NULL, CAST(N'2024-10-24T11:40:00.103' AS DateTime), N'{"SucceededAt":"1729770000103","PerformanceDuration":"5","Latency":"31"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33389, 30870, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:40:00.093' AS DateTime), N'{"EnqueuedAt":"1729770000093","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33391, 30870, N'Processing', NULL, CAST(N'2024-10-24T11:40:00.100' AS DateTime), N'{"StartedAt":"1729770000098","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dac9c8d6-fbd5-450e-81d5-8183aa30635a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33393, 30870, N'Succeeded', NULL, CAST(N'2024-10-24T11:40:00.173' AS DateTime), N'{"SucceededAt":"1729770000154","PerformanceDuration":"53","Latency":"7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33394, 30871, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:42:00.217' AS DateTime), N'{"EnqueuedAt":"1729770120215","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33395, 30871, N'Processing', NULL, CAST(N'2024-10-24T11:42:00.290' AS DateTime), N'{"StartedAt":"1729770120288","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b31492a9-5f38-4d2d-b5b9-2ab986bebfe5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33396, 30871, N'Succeeded', NULL, CAST(N'2024-10-24T11:42:00.303' AS DateTime), N'{"SucceededAt":"1729770120300","PerformanceDuration":"3","Latency":"90"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33397, 30872, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:44:00.390' AS DateTime), N'{"EnqueuedAt":"1729770240390","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33398, 30872, N'Processing', NULL, CAST(N'2024-10-24T11:44:00.413' AS DateTime), N'{"StartedAt":"1729770240410","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a889ff48-1235-4c65-bb8f-b720da483127"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33399, 30872, N'Succeeded', NULL, CAST(N'2024-10-24T11:44:00.420' AS DateTime), N'{"SucceededAt":"1729770240419","PerformanceDuration":"5","Latency":"37"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33400, 30873, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:45:00.457' AS DateTime), N'{"EnqueuedAt":"1729770300456","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33401, 30873, N'Processing', NULL, CAST(N'2024-10-24T11:45:00.473' AS DateTime), N'{"StartedAt":"1729770300471","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aedda9dc-4290-4796-b380-d5175acc6fe7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33402, 30873, N'Succeeded', NULL, CAST(N'2024-10-24T11:45:00.480' AS DateTime), N'{"SucceededAt":"1729770300480","PerformanceDuration":"5","Latency":"24"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33403, 30874, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:46:00.510' AS DateTime), N'{"EnqueuedAt":"1729770360508","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33404, 30874, N'Processing', NULL, CAST(N'2024-10-24T11:46:00.537' AS DateTime), N'{"StartedAt":"1729770360534","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aa4d615c-ae22-44a0-bc72-ea0176a6bc9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33405, 30874, N'Succeeded', NULL, CAST(N'2024-10-24T11:46:00.543' AS DateTime), N'{"SucceededAt":"1729770360542","PerformanceDuration":"3","Latency":"38"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33406, 30875, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:48:00.650' AS DateTime), N'{"EnqueuedAt":"1729770480649","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33407, 30875, N'Processing', NULL, CAST(N'2024-10-24T11:48:00.667' AS DateTime), N'{"StartedAt":"1729770480665","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6f942876-64db-4bb1-b9d6-b6096765a37b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33408, 30875, N'Succeeded', NULL, CAST(N'2024-10-24T11:48:00.673' AS DateTime), N'{"SucceededAt":"1729770480671","PerformanceDuration":"3","Latency":"28"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33409, 30876, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:50:00.777' AS DateTime), N'{"EnqueuedAt":"1729770600776","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33411, 30876, N'Processing', NULL, CAST(N'2024-10-24T11:50:00.793' AS DateTime), N'{"StartedAt":"1729770600791","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dd7a3733-140e-440c-b5ea-31ae1cb5e49a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33413, 30876, N'Succeeded', NULL, CAST(N'2024-10-24T11:50:00.800' AS DateTime), N'{"SucceededAt":"1729770600798","PerformanceDuration":"3","Latency":"32"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33410, 30877, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:50:00.790' AS DateTime), N'{"EnqueuedAt":"1729770600790","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33412, 30877, N'Processing', NULL, CAST(N'2024-10-24T11:50:00.797' AS DateTime), N'{"StartedAt":"1729770600795","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"8b588af2-7102-4446-afe2-efd9fd3b4164"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33414, 30877, N'Succeeded', NULL, CAST(N'2024-10-24T11:50:00.800' AS DateTime), N'{"SucceededAt":"1729770600800","PerformanceDuration":"3","Latency":"7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33415, 30878, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:52:00.893' AS DateTime), N'{"EnqueuedAt":"1729770720891","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33416, 30878, N'Processing', NULL, CAST(N'2024-10-24T11:52:00.917' AS DateTime), N'{"StartedAt":"1729770720914","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"7b17acaf-0d3e-41bb-82b9-be179060b61f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33417, 30878, N'Succeeded', NULL, CAST(N'2024-10-24T11:52:00.923' AS DateTime), N'{"SucceededAt":"1729770720921","PerformanceDuration":"3","Latency":"37"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33418, 30879, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:54:01.027' AS DateTime), N'{"EnqueuedAt":"1729770841027","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33419, 30879, N'Processing', NULL, CAST(N'2024-10-24T11:54:01.050' AS DateTime), N'{"StartedAt":"1729770841046","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"c1b6c9aa-899b-402d-9ddd-2db3bc515b80"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33420, 30879, N'Succeeded', NULL, CAST(N'2024-10-24T11:54:01.070' AS DateTime), N'{"SucceededAt":"1729770841063","PerformanceDuration":"4","Latency":"39"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33421, 30880, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:55:01.093' AS DateTime), N'{"EnqueuedAt":"1729770901092","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33422, 30880, N'Processing', NULL, CAST(N'2024-10-24T11:55:01.107' AS DateTime), N'{"StartedAt":"1729770901104","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"884f4209-d532-46ac-be73-dcffbc890b0e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33423, 30880, N'Succeeded', NULL, CAST(N'2024-10-24T11:55:01.113' AS DateTime), N'{"SucceededAt":"1729770901112","PerformanceDuration":"5","Latency":"24"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33424, 30881, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:56:01.163' AS DateTime), N'{"EnqueuedAt":"1729770961161","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33425, 30881, N'Processing', NULL, CAST(N'2024-10-24T11:56:01.177' AS DateTime), N'{"StartedAt":"1729770961175","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"315b2c1d-81ca-4d8a-ba01-a6fc6f2a5b5f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33426, 30881, N'Succeeded', NULL, CAST(N'2024-10-24T11:56:01.180' AS DateTime), N'{"SucceededAt":"1729770961180","PerformanceDuration":"2","Latency":"31"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33427, 30882, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T11:58:01.280' AS DateTime), N'{"EnqueuedAt":"1729771081278","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33428, 30882, N'Processing', NULL, CAST(N'2024-10-24T11:58:01.293' AS DateTime), N'{"StartedAt":"1729771081291","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"2cf23b52-1be0-4f64-af71-b4241e4a88e4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33429, 30882, N'Succeeded', NULL, CAST(N'2024-10-24T11:58:01.300' AS DateTime), N'{"SucceededAt":"1729771081297","PerformanceDuration":"2","Latency":"22"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33430, 30883, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:00:01.390' AS DateTime), N'{"EnqueuedAt":"1729771201391","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33432, 30883, N'Processing', NULL, CAST(N'2024-10-24T12:00:01.407' AS DateTime), N'{"StartedAt":"1729771201403","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"45cd49ef-2575-4702-a72d-931d885f1437"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33434, 30883, N'Succeeded', NULL, CAST(N'2024-10-24T12:00:01.423' AS DateTime), N'{"SucceededAt":"1729771201423","PerformanceDuration":"16","Latency":"27"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33431, 30884, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:00:01.403' AS DateTime), N'{"EnqueuedAt":"1729771201402","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33433, 30884, N'Processing', NULL, CAST(N'2024-10-24T12:00:01.407' AS DateTime), N'{"StartedAt":"1729771201407","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"04065d81-acb0-48e1-8214-72c513bfea9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33435, 30884, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2024-10-24T12:00:01.430' AS DateTime), N'{"FailedAt":"1729771201424","ExceptionType":"System.AggregateException","ExceptionMessage":"One or more errors occurred. (The ConnectionString property has not been initialized.)","ExceptionDetails":"System.AggregateException: One or more errors occurred. (The ConnectionString property has not been initialized.)\r\n ---> System.InvalidOperationException: The ConnectionString property has not been initialized.\r\n   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()\r\n   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)\r\n   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)\r\n   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenInternalAsync(Boolean errorsExpected, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenInternalAsync(Boolean errorsExpected, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenAsync(CancellationToken cancellationToken, Boolean errorsExpected)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.InitializeReaderAsync(AsyncEnumerator enumerator, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.MoveNextAsync()\r\n   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)\r\n   at RoosterLottery.Repository.Implemention.SlotRepository.GetSlotsInfoAsync(Int64 id, CancellationToken cancellationToken) in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.DI\\Implemention\\SlotRepository.cs:line 119\r\n   at RoosterLottery.UnitOfWork.Implemention.SlotUnitOfWork.SpinSlotAsync(CancellationToken cancellationToken) in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.UnitOfWork\\Implemention\\SlotUnitOfWork.cs:line 102\r\n   --- End of inner exception stack trace ---\r\n   at System.Threading.Tasks.Task.ThrowIfExceptional(Boolean includeTaskCanceledExceptions)\r\n   at System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)\r\n   at System.Threading.Tasks.Task.Wait()\r\n   at RoosterLottery.UnitOfWork.WorkerService.SlotCreationService.SpinSlotToDay() in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.UnitOfWork\\WorkerService\\SlotCreationService.cs:line 38","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33436, 30884, N'Scheduled', N'Retry attempt 1 of 10: One or more errors occurred. (The ConnectionStrin…', CAST(N'2024-10-24T12:00:01.430' AS DateTime), N'{"EnqueueAt":"1729771240428","ScheduledAt":"1729771201428"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33437, 30884, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-10-24T12:00:45.113' AS DateTime), N'{"EnqueuedAt":"1729771245108","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33438, 30884, N'Processing', NULL, CAST(N'2024-10-24T12:00:45.137' AS DateTime), N'{"StartedAt":"1729771245135","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a1542ae3-b278-4553-8824-6ba27fd83675"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33439, 30884, N'Succeeded', NULL, CAST(N'2024-10-24T12:00:45.150' AS DateTime), N'{"SucceededAt":"1729771245147","PerformanceDuration":"8","Latency":"43735"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33440, 30885, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:02:01.517' AS DateTime), N'{"EnqueuedAt":"1729771321515","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33441, 30885, N'Processing', NULL, CAST(N'2024-10-24T12:02:01.537' AS DateTime), N'{"StartedAt":"1729771321534","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b6bd1c59-b79c-4dd8-ac82-01b376616216"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33442, 30885, N'Succeeded', NULL, CAST(N'2024-10-24T12:02:01.543' AS DateTime), N'{"SucceededAt":"1729771321540","PerformanceDuration":"3","Latency":"30"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33443, 30886, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:04:01.663' AS DateTime), N'{"EnqueuedAt":"1729771441663","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33444, 30886, N'Processing', NULL, CAST(N'2024-10-24T12:04:01.680' AS DateTime), N'{"StartedAt":"1729771441676","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"910d71ed-ebea-4d19-ac96-576532970f6f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33445, 30886, N'Succeeded', NULL, CAST(N'2024-10-24T12:04:01.683' AS DateTime), N'{"SucceededAt":"1729771441683","PerformanceDuration":"3","Latency":"33"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33446, 30887, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:05:01.750' AS DateTime), N'{"EnqueuedAt":"1729771501750","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33447, 30887, N'Processing', NULL, CAST(N'2024-10-24T12:05:01.763' AS DateTime), N'{"StartedAt":"1729771501761","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6e1204b2-657f-44e3-937b-e3a19ac3e790"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33448, 30887, N'Succeeded', NULL, CAST(N'2024-10-24T12:05:01.770' AS DateTime), N'{"SucceededAt":"1729771501768","PerformanceDuration":"4","Latency":"21"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33449, 30888, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:06:01.820' AS DateTime), N'{"EnqueuedAt":"1729771561819","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33450, 30888, N'Processing', NULL, CAST(N'2024-10-24T12:06:01.833' AS DateTime), N'{"StartedAt":"1729771561832","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"50127308-f263-42be-b7ab-23db401b689a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33451, 30888, N'Succeeded', NULL, CAST(N'2024-10-24T12:06:01.840' AS DateTime), N'{"SucceededAt":"1729771561837","PerformanceDuration":"2","Latency":"25"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33452, 30889, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:08:01.937' AS DateTime), N'{"EnqueuedAt":"1729771681936","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33453, 30889, N'Processing', NULL, CAST(N'2024-10-24T12:08:01.960' AS DateTime), N'{"StartedAt":"1729771681956","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dac9c8d6-fbd5-450e-81d5-8183aa30635a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33454, 30889, N'Succeeded', NULL, CAST(N'2024-10-24T12:08:01.963' AS DateTime), N'{"SucceededAt":"1729771681963","PerformanceDuration":"3","Latency":"36"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33455, 30890, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:10:02.077' AS DateTime), N'{"EnqueuedAt":"1729771802075","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33457, 30890, N'Processing', NULL, CAST(N'2024-10-24T12:10:02.097' AS DateTime), N'{"StartedAt":"1729771802093","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b31492a9-5f38-4d2d-b5b9-2ab986bebfe5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33459, 30890, N'Succeeded', NULL, CAST(N'2024-10-24T12:10:02.103' AS DateTime), N'{"SucceededAt":"1729771802102","PerformanceDuration":"4","Latency":"37"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33456, 30891, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:10:02.090' AS DateTime), N'{"EnqueuedAt":"1729771802091","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33458, 30891, N'Processing', NULL, CAST(N'2024-10-24T12:10:02.097' AS DateTime), N'{"StartedAt":"1729771802096","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a889ff48-1235-4c65-bb8f-b720da483127"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33460, 30891, N'Succeeded', NULL, CAST(N'2024-10-24T12:10:02.107' AS DateTime), N'{"SucceededAt":"1729771802106","PerformanceDuration":"6","Latency":"9"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33461, 30892, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:12:02.170' AS DateTime), N'{"EnqueuedAt":"1729771922171","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33462, 30892, N'Processing', NULL, CAST(N'2024-10-24T12:12:02.187' AS DateTime), N'{"StartedAt":"1729771922184","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aedda9dc-4290-4796-b380-d5175acc6fe7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33463, 30892, N'Succeeded', NULL, CAST(N'2024-10-24T12:12:02.193' AS DateTime), N'{"SucceededAt":"1729771922191","PerformanceDuration":"3","Latency":"25"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33464, 30893, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:14:02.270' AS DateTime), N'{"EnqueuedAt":"1729772042271","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33465, 30893, N'Processing', NULL, CAST(N'2024-10-24T12:14:02.283' AS DateTime), N'{"StartedAt":"1729772042282","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aa4d615c-ae22-44a0-bc72-ea0176a6bc9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33466, 30893, N'Succeeded', NULL, CAST(N'2024-10-24T12:14:02.290' AS DateTime), N'{"SucceededAt":"1729772042287","PerformanceDuration":"2","Latency":"22"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33467, 30894, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:15:02.363' AS DateTime), N'{"EnqueuedAt":"1729772102362","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33468, 30894, N'Processing', NULL, CAST(N'2024-10-24T12:15:02.427' AS DateTime), N'{"StartedAt":"1729772102423","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6f942876-64db-4bb1-b9d6-b6096765a37b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33469, 30894, N'Succeeded', NULL, CAST(N'2024-10-24T12:15:02.437' AS DateTime), N'{"SucceededAt":"1729772102433","PerformanceDuration":"6","Latency":"90"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33470, 30895, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:16:02.480' AS DateTime), N'{"EnqueuedAt":"1729772162481","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33471, 30895, N'Processing', NULL, CAST(N'2024-10-24T12:16:02.513' AS DateTime), N'{"StartedAt":"1729772162511","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dd7a3733-140e-440c-b5ea-31ae1cb5e49a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33472, 30895, N'Succeeded', NULL, CAST(N'2024-10-24T12:16:02.520' AS DateTime), N'{"SucceededAt":"1729772162519","PerformanceDuration":"3","Latency":"52"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33473, 30896, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:18:02.613' AS DateTime), N'{"EnqueuedAt":"1729772282613","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33474, 30896, N'Processing', NULL, CAST(N'2024-10-24T12:18:02.630' AS DateTime), N'{"StartedAt":"1729772282628","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"8b588af2-7102-4446-afe2-efd9fd3b4164"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33475, 30896, N'Succeeded', NULL, CAST(N'2024-10-24T12:18:02.637' AS DateTime), N'{"SucceededAt":"1729772282635","PerformanceDuration":"2","Latency":"22"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33476, 30897, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:20:02.720' AS DateTime), N'{"EnqueuedAt":"1729772402718","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33478, 30897, N'Processing', NULL, CAST(N'2024-10-24T12:20:02.733' AS DateTime), N'{"StartedAt":"1729772402730","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"7b17acaf-0d3e-41bb-82b9-be179060b61f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33480, 30897, N'Succeeded', NULL, CAST(N'2024-10-24T12:20:02.740' AS DateTime), N'{"SucceededAt":"1729772402738","PerformanceDuration":"3","Latency":"32"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33477, 30898, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:20:02.730' AS DateTime), N'{"EnqueuedAt":"1729772402731","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33479, 30898, N'Processing', NULL, CAST(N'2024-10-24T12:20:02.737' AS DateTime), N'{"StartedAt":"1729772402736","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"c1b6c9aa-899b-402d-9ddd-2db3bc515b80"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33481, 30898, N'Succeeded', NULL, CAST(N'2024-10-24T12:20:02.747' AS DateTime), N'{"SucceededAt":"1729772402741","PerformanceDuration":"3","Latency":"7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33482, 30899, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:22:02.897' AS DateTime), N'{"EnqueuedAt":"1729772522897","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33483, 30899, N'Processing', NULL, CAST(N'2024-10-24T12:22:02.910' AS DateTime), N'{"StartedAt":"1729772522909","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"884f4209-d532-46ac-be73-dcffbc890b0e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33484, 30899, N'Succeeded', NULL, CAST(N'2024-10-24T12:22:02.913' AS DateTime), N'{"SucceededAt":"1729772522914","PerformanceDuration":"2","Latency":"21"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33485, 30900, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:24:03.013' AS DateTime), N'{"EnqueuedAt":"1729772643013","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33486, 30900, N'Processing', NULL, CAST(N'2024-10-24T12:24:03.030' AS DateTime), N'{"StartedAt":"1729772643026","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"315b2c1d-81ca-4d8a-ba01-a6fc6f2a5b5f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33487, 30900, N'Succeeded', NULL, CAST(N'2024-10-24T12:24:03.033' AS DateTime), N'{"SucceededAt":"1729772643032","PerformanceDuration":"2","Latency":"27"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33488, 30901, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:25:03.093' AS DateTime), N'{"EnqueuedAt":"1729772703093","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33489, 30901, N'Processing', NULL, CAST(N'2024-10-24T12:25:03.130' AS DateTime), N'{"StartedAt":"1729772703127","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"2cf23b52-1be0-4f64-af71-b4241e4a88e4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33490, 30901, N'Succeeded', NULL, CAST(N'2024-10-24T12:25:03.137' AS DateTime), N'{"SucceededAt":"1729772703135","PerformanceDuration":"4","Latency":"60"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33491, 30902, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:26:03.180' AS DateTime), N'{"EnqueuedAt":"1729772763179","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33492, 30902, N'Processing', NULL, CAST(N'2024-10-24T12:26:03.193' AS DateTime), N'{"StartedAt":"1729772763191","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"45cd49ef-2575-4702-a72d-931d885f1437"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33493, 30902, N'Succeeded', NULL, CAST(N'2024-10-24T12:26:03.197' AS DateTime), N'{"SucceededAt":"1729772763196","PerformanceDuration":"2","Latency":"27"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33494, 30903, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:28:03.263' AS DateTime), N'{"EnqueuedAt":"1729772883263","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33495, 30903, N'Processing', NULL, CAST(N'2024-10-24T12:28:03.277' AS DateTime), N'{"StartedAt":"1729772883274","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"04065d81-acb0-48e1-8214-72c513bfea9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33496, 30903, N'Succeeded', NULL, CAST(N'2024-10-24T12:28:03.280' AS DateTime), N'{"SucceededAt":"1729772883278","PerformanceDuration":"2","Latency":"26"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33497, 30904, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:30:03.363' AS DateTime), N'{"EnqueuedAt":"1729773003361","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33499, 30904, N'Processing', NULL, CAST(N'2024-10-24T12:30:03.377' AS DateTime), N'{"StartedAt":"1729773003374","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a1542ae3-b278-4553-8824-6ba27fd83675"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33501, 30904, N'Succeeded', NULL, CAST(N'2024-10-24T12:30:03.387' AS DateTime), N'{"SucceededAt":"1729773003383","PerformanceDuration":"5","Latency":"21"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33498, 30905, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:30:03.373' AS DateTime), N'{"EnqueuedAt":"1729773003372","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33500, 30905, N'Processing', NULL, CAST(N'2024-10-24T12:30:03.377' AS DateTime), N'{"StartedAt":"1729773003375","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b6bd1c59-b79c-4dd8-ac82-01b376616216"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33502, 30905, N'Succeeded', NULL, CAST(N'2024-10-24T12:30:03.393' AS DateTime), N'{"SucceededAt":"1729773003387","PerformanceDuration":"8","Latency":"5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33503, 30906, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:32:03.463' AS DateTime), N'{"EnqueuedAt":"1729773123462","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33504, 30906, N'Processing', NULL, CAST(N'2024-10-24T12:32:03.480' AS DateTime), N'{"StartedAt":"1729773123479","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"910d71ed-ebea-4d19-ac96-576532970f6f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33505, 30906, N'Succeeded', NULL, CAST(N'2024-10-24T12:32:03.487' AS DateTime), N'{"SucceededAt":"1729773123485","PerformanceDuration":"2","Latency":"32"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33506, 30907, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:34:03.553' AS DateTime), N'{"EnqueuedAt":"1729773243553","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33507, 30907, N'Processing', NULL, CAST(N'2024-10-24T12:34:03.567' AS DateTime), N'{"StartedAt":"1729773243566","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6e1204b2-657f-44e3-937b-e3a19ac3e790"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33508, 30907, N'Succeeded', NULL, CAST(N'2024-10-24T12:34:03.573' AS DateTime), N'{"SucceededAt":"1729773243571","PerformanceDuration":"2","Latency":"18"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33509, 30908, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:35:03.613' AS DateTime), N'{"EnqueuedAt":"1729773303614","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33510, 30908, N'Processing', NULL, CAST(N'2024-10-24T12:35:03.640' AS DateTime), N'{"StartedAt":"1729773303637","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"50127308-f263-42be-b7ab-23db401b689a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33511, 30908, N'Succeeded', NULL, CAST(N'2024-10-24T12:35:03.647' AS DateTime), N'{"SucceededAt":"1729773303645","PerformanceDuration":"4","Latency":"40"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33512, 30909, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:36:03.687' AS DateTime), N'{"EnqueuedAt":"1729773363687","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33513, 30909, N'Processing', NULL, CAST(N'2024-10-24T12:36:03.703' AS DateTime), N'{"StartedAt":"1729773363700","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dac9c8d6-fbd5-450e-81d5-8183aa30635a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33514, 30909, N'Succeeded', NULL, CAST(N'2024-10-24T12:36:03.707' AS DateTime), N'{"SucceededAt":"1729773363706","PerformanceDuration":"2","Latency":"30"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33515, 30910, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:38:03.797' AS DateTime), N'{"EnqueuedAt":"1729773483796","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33516, 30910, N'Processing', NULL, CAST(N'2024-10-24T12:38:03.817' AS DateTime), N'{"StartedAt":"1729773483814","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"a889ff48-1235-4c65-bb8f-b720da483127"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33517, 30910, N'Succeeded', NULL, CAST(N'2024-10-24T12:38:03.823' AS DateTime), N'{"SucceededAt":"1729773483822","PerformanceDuration":"3","Latency":"35"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33518, 30911, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:40:03.920' AS DateTime), N'{"EnqueuedAt":"1729773603919","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33520, 30911, N'Processing', NULL, CAST(N'2024-10-24T12:40:03.940' AS DateTime), N'{"StartedAt":"1729773603939","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"b31492a9-5f38-4d2d-b5b9-2ab986bebfe5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33522, 30911, N'Succeeded', NULL, CAST(N'2024-10-24T12:40:03.947' AS DateTime), N'{"SucceededAt":"1729773603945","PerformanceDuration":"2","Latency":"35"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33519, 30912, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:40:03.940' AS DateTime), N'{"EnqueuedAt":"1729773603938","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33521, 30912, N'Processing', NULL, CAST(N'2024-10-24T12:40:03.943' AS DateTime), N'{"StartedAt":"1729773603943","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aedda9dc-4290-4796-b380-d5175acc6fe7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33523, 30912, N'Succeeded', NULL, CAST(N'2024-10-24T12:40:03.950' AS DateTime), N'{"SucceededAt":"1729773603949","PerformanceDuration":"4","Latency":"8"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33524, 30913, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:42:04.020' AS DateTime), N'{"EnqueuedAt":"1729773724020","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33525, 30913, N'Processing', NULL, CAST(N'2024-10-24T12:42:04.033' AS DateTime), N'{"StartedAt":"1729773724032","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"aa4d615c-ae22-44a0-bc72-ea0176a6bc9e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33526, 30913, N'Succeeded', NULL, CAST(N'2024-10-24T12:42:04.040' AS DateTime), N'{"SucceededAt":"1729773724038","PerformanceDuration":"2","Latency":"28"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33527, 30914, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:44:04.147' AS DateTime), N'{"EnqueuedAt":"1729773844146","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33528, 30914, N'Processing', NULL, CAST(N'2024-10-24T12:44:04.160' AS DateTime), N'{"StartedAt":"1729773844158","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"6f942876-64db-4bb1-b9d6-b6096765a37b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33529, 30914, N'Succeeded', NULL, CAST(N'2024-10-24T12:44:04.163' AS DateTime), N'{"SucceededAt":"1729773844163","PerformanceDuration":"2","Latency":"23"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33530, 30915, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:45:04.197' AS DateTime), N'{"EnqueuedAt":"1729773904195","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33531, 30915, N'Processing', NULL, CAST(N'2024-10-24T12:45:04.210' AS DateTime), N'{"StartedAt":"1729773904208","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"dd7a3733-140e-440c-b5ea-31ae1cb5e49a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33532, 30915, N'Succeeded', NULL, CAST(N'2024-10-24T12:45:04.220' AS DateTime), N'{"SucceededAt":"1729773904214","PerformanceDuration":"3","Latency":"20"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33533, 30916, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:58:12.217' AS DateTime), N'{"EnqueuedAt":"1729774692216","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33534, 30916, N'Processing', NULL, CAST(N'2024-10-24T12:58:12.220' AS DateTime), N'{"StartedAt":"1729774692220","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"8b588af2-7102-4446-afe2-efd9fd3b4164"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33536, 30916, N'Succeeded', NULL, CAST(N'2024-10-24T12:58:12.227' AS DateTime), N'{"SucceededAt":"1729774692224","PerformanceDuration":"2","Latency":"15"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33535, 30917, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T12:58:12.220' AS DateTime), N'{"EnqueuedAt":"1729774692221","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33537, 30917, N'Processing', NULL, CAST(N'2024-10-24T12:58:12.227' AS DateTime), N'{"StartedAt":"1729774692224","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"7b17acaf-0d3e-41bb-82b9-be179060b61f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33538, 30917, N'Succeeded', NULL, CAST(N'2024-10-24T12:58:12.227' AS DateTime), N'{"SucceededAt":"1729774692227","PerformanceDuration":"1","Latency":"6"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33539, 30918, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T13:00:12.317' AS DateTime), N'{"EnqueuedAt":"1729774812316","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33541, 30918, N'Processing', NULL, CAST(N'2024-10-24T13:00:12.340' AS DateTime), N'{"StartedAt":"1729774812337","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"c1b6c9aa-899b-402d-9ddd-2db3bc515b80"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33543, 30918, N'Succeeded', NULL, CAST(N'2024-10-24T13:00:12.347' AS DateTime), N'{"SucceededAt":"1729774812346","PerformanceDuration":"5","Latency":"37"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33540, 30919, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T13:00:12.337' AS DateTime), N'{"EnqueuedAt":"1729774812335","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33542, 30919, N'Processing', NULL, CAST(N'2024-10-24T13:00:12.340' AS DateTime), N'{"StartedAt":"1729774812340","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"884f4209-d532-46ac-be73-dcffbc890b0e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33544, 30919, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2024-10-24T13:00:12.377' AS DateTime), N'{"FailedAt":"1729774812368","ExceptionType":"System.AggregateException","ExceptionMessage":"One or more errors occurred. (The ConnectionString property has not been initialized.)","ExceptionDetails":"System.AggregateException: One or more errors occurred. (The ConnectionString property has not been initialized.)\r\n ---> System.InvalidOperationException: The ConnectionString property has not been initialized.\r\n   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()\r\n   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)\r\n   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)\r\n   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenInternalAsync(Boolean errorsExpected, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenInternalAsync(Boolean errorsExpected, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenAsync(CancellationToken cancellationToken, Boolean errorsExpected)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.InitializeReaderAsync(AsyncEnumerator enumerator, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.MoveNextAsync()\r\n   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)\r\n   at RoosterLottery.Repository.Implemention.SlotRepository.GetSlotsInfoAsync(Int64 id, CancellationToken cancellationToken) in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.DI\\Implemention\\SlotRepository.cs:line 119\r\n   at RoosterLottery.UnitOfWork.Implemention.SlotUnitOfWork.SpinSlotAsync(CancellationToken cancellationToken) in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.UnitOfWork\\Implemention\\SlotUnitOfWork.cs:line 102\r\n   --- End of inner exception stack trace ---\r\n   at System.Threading.Tasks.Task.ThrowIfExceptional(Boolean includeTaskCanceledExceptions)\r\n   at System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)\r\n   at System.Threading.Tasks.Task.Wait()\r\n   at RoosterLottery.UnitOfWork.WorkerService.SlotCreationService.SpinSlotToDay() in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.UnitOfWork\\WorkerService\\SlotCreationService.cs:line 38","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33545, 30919, N'Scheduled', N'Retry attempt 1 of 10: One or more errors occurred. (The ConnectionStrin…', CAST(N'2024-10-24T13:00:12.377' AS DateTime), N'{"EnqueueAt":"1729774831374","ScheduledAt":"1729774812374"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33546, 30919, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-10-24T13:00:40.347' AS DateTime), N'{"EnqueuedAt":"1729774840339","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33547, 30919, N'Processing', NULL, CAST(N'2024-10-24T13:00:40.377' AS DateTime), N'{"StartedAt":"1729774840376","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"315b2c1d-81ca-4d8a-ba01-a6fc6f2a5b5f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33548, 30919, N'Succeeded', NULL, CAST(N'2024-10-24T13:00:40.387' AS DateTime), N'{"SucceededAt":"1729774840384","PerformanceDuration":"5","Latency":"28042"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33549, 30920, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T13:02:12.450' AS DateTime), N'{"EnqueuedAt":"1729774932449","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33550, 30920, N'Processing', NULL, CAST(N'2024-10-24T13:02:12.473' AS DateTime), N'{"StartedAt":"1729774932472","ServerId":"admin-pc:8512:637822f7-4cc5-43dc-97e1-129e7ed912db","WorkerId":"2cf23b52-1be0-4f64-af71-b4241e4a88e4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33551, 30920, N'Succeeded', NULL, CAST(N'2024-10-24T13:02:12.480' AS DateTime), N'{"SucceededAt":"1729774932478","PerformanceDuration":"2","Latency":"42"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33552, 30921, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:16:12.793' AS DateTime), N'{"EnqueuedAt":"1729804572788","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33554, 30921, N'Processing', NULL, CAST(N'2024-10-24T21:16:12.913' AS DateTime), N'{"StartedAt":"1729804572852","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"1bed032c-bc99-40d8-96b4-7d93fd3d097a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33557, 30921, N'Succeeded', NULL, CAST(N'2024-10-24T21:16:14.060' AS DateTime), N'{"SucceededAt":"1729804574057","PerformanceDuration":"1142","Latency":"134"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33553, 30922, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:16:12.850' AS DateTime), N'{"EnqueuedAt":"1729804572850","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33555, 30922, N'Processing', NULL, CAST(N'2024-10-24T21:16:12.913' AS DateTime), N'{"StartedAt":"1729804572854","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"6b3735f5-d3ed-4f26-900e-92a425ff700b"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33556, 30922, N'Succeeded', NULL, CAST(N'2024-10-24T21:16:13.867' AS DateTime), N'{"SucceededAt":"1729804573860","PerformanceDuration":"928","Latency":"81"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33558, 30923, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:18:13.017' AS DateTime), N'{"EnqueuedAt":"1729804693014","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33559, 30923, N'Processing', NULL, CAST(N'2024-10-24T21:18:13.033' AS DateTime), N'{"StartedAt":"1729804693030","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"609ce263-bc3a-4079-ba03-215071e1a5cc"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33560, 30923, N'Succeeded', NULL, CAST(N'2024-10-24T21:18:13.047' AS DateTime), N'{"SucceededAt":"1729804693044","PerformanceDuration":"3","Latency":"33"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33561, 30924, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:20:13.130' AS DateTime), N'{"EnqueuedAt":"1729804813131","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33563, 30924, N'Processing', NULL, CAST(N'2024-10-24T21:20:13.147' AS DateTime), N'{"StartedAt":"1729804813143","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"b1ea348e-4460-4eec-9e50-48b90ed5a7e8"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33565, 30924, N'Succeeded', NULL, CAST(N'2024-10-24T21:20:13.150' AS DateTime), N'{"SucceededAt":"1729804813150","PerformanceDuration":"3","Latency":"23"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33562, 30925, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:20:13.143' AS DateTime), N'{"EnqueuedAt":"1729804813141","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33564, 30925, N'Processing', NULL, CAST(N'2024-10-24T21:20:13.147' AS DateTime), N'{"StartedAt":"1729804813145","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"678f25c8-a125-4119-9696-9403dc8f8ec3"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33566, 30925, N'Succeeded', NULL, CAST(N'2024-10-24T21:20:13.153' AS DateTime), N'{"SucceededAt":"1729804813153","PerformanceDuration":"5","Latency":"7"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33567, 30926, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:22:13.217' AS DateTime), N'{"EnqueuedAt":"1729804933217","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33568, 30926, N'Processing', NULL, CAST(N'2024-10-24T21:22:13.230' AS DateTime), N'{"StartedAt":"1729804933229","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"f674ba74-9a9e-43e4-abbf-3663c3a3619a"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33569, 30926, N'Succeeded', NULL, CAST(N'2024-10-24T21:22:13.237' AS DateTime), N'{"SucceededAt":"1729804933235","PerformanceDuration":"2","Latency":"22"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33570, 30927, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:24:13.330' AS DateTime), N'{"EnqueuedAt":"1729805053328","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33571, 30927, N'Processing', NULL, CAST(N'2024-10-24T21:24:13.343' AS DateTime), N'{"StartedAt":"1729805053340","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"ce810c80-4f55-4759-9224-1147a6aaefab"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33572, 30927, N'Succeeded', NULL, CAST(N'2024-10-24T21:24:13.350' AS DateTime), N'{"SucceededAt":"1729805053347","PerformanceDuration":"3","Latency":"24"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33573, 30928, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:25:13.410' AS DateTime), N'{"EnqueuedAt":"1729805113410","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33574, 30928, N'Processing', NULL, CAST(N'2024-10-24T21:25:13.427' AS DateTime), N'{"StartedAt":"1729805113424","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"1265f870-3f7e-414e-8d50-f7eac3f6fb99"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33575, 30928, N'Succeeded', NULL, CAST(N'2024-10-24T21:25:13.437' AS DateTime), N'{"SucceededAt":"1729805113432","PerformanceDuration":"4","Latency":"37"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33576, 30929, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:26:13.483' AS DateTime), N'{"EnqueuedAt":"1729805173484","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33577, 30929, N'Processing', NULL, CAST(N'2024-10-24T21:26:13.500' AS DateTime), N'{"StartedAt":"1729805173497","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"0e551eb7-997b-4464-ad75-0f2cbf6fcd79"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33578, 30929, N'Succeeded', NULL, CAST(N'2024-10-24T21:26:13.503' AS DateTime), N'{"SucceededAt":"1729805173504","PerformanceDuration":"3","Latency":"27"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33579, 30930, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:28:13.600' AS DateTime), N'{"EnqueuedAt":"1729805293600","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33580, 30930, N'Processing', NULL, CAST(N'2024-10-24T21:28:13.617' AS DateTime), N'{"StartedAt":"1729805293614","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"15b97b99-b686-4bbb-9ed9-97dca767a1b9"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33581, 30930, N'Succeeded', NULL, CAST(N'2024-10-24T21:28:13.623' AS DateTime), N'{"SucceededAt":"1729805293621","PerformanceDuration":"3","Latency":"24"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33582, 30931, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:30:13.727' AS DateTime), N'{"EnqueuedAt":"1729805413725","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33583, 30931, N'Processing', NULL, CAST(N'2024-10-24T21:30:13.743' AS DateTime), N'{"StartedAt":"1729805413739","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"99852c17-1a2c-4f42-89d8-00ca63408567"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33585, 30931, N'Succeeded', NULL, CAST(N'2024-10-24T21:30:13.757' AS DateTime), N'{"SucceededAt":"1729805413752","PerformanceDuration":"4","Latency":"25"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33584, 30932, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:30:13.743' AS DateTime), N'{"EnqueuedAt":"1729805413744","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33586, 30932, N'Processing', NULL, CAST(N'2024-10-24T21:30:13.760' AS DateTime), N'{"StartedAt":"1729805413756","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"01454b96-7a6f-4fcd-a71b-2b4ae8d24b2f"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33587, 30932, N'Succeeded', NULL, CAST(N'2024-10-24T21:30:13.773' AS DateTime), N'{"SucceededAt":"1729805413769","PerformanceDuration":"6","Latency":"22"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33588, 30933, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:32:13.840' AS DateTime), N'{"EnqueuedAt":"1729805533840","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33589, 30933, N'Processing', NULL, CAST(N'2024-10-24T21:32:13.857' AS DateTime), N'{"StartedAt":"1729805533853","ServerId":"admin-pc:8912:9caa0f37-9361-455e-8428-99746473613d","WorkerId":"b1351646-8049-40c0-96c3-544a28bb898c"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33590, 30933, N'Succeeded', NULL, CAST(N'2024-10-24T21:32:13.860' AS DateTime), N'{"SucceededAt":"1729805533860","PerformanceDuration":"3","Latency":"23"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33591, 30934, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:34:11.667' AS DateTime), N'{"EnqueuedAt":"1729805651660","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33592, 30934, N'Processing', NULL, CAST(N'2024-10-24T21:34:11.773' AS DateTime), N'{"StartedAt":"1729805651717","ServerId":"admin-pc:25780:8c18284f-f09a-4570-9cc1-effdfe957713","WorkerId":"ae0e555a-7770-4969-88b1-377548dbd40e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33593, 30934, N'Succeeded', NULL, CAST(N'2024-10-24T21:34:11.793' AS DateTime), N'{"SucceededAt":"1729805651790","PerformanceDuration":"15","Latency":"122"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33594, 30935, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:35:09.217' AS DateTime), N'{"EnqueuedAt":"1729805709211","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33595, 30935, N'Processing', NULL, CAST(N'2024-10-24T21:35:09.320' AS DateTime), N'{"StartedAt":"1729805709267","ServerId":"admin-pc:25688:da6132e8-76ed-4ccc-a439-599c06b92cd2","WorkerId":"194876fe-973e-4274-af6a-3dd1da27c6b5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33596, 30935, N'Succeeded', NULL, CAST(N'2024-10-24T21:35:09.357' AS DateTime), N'{"SucceededAt":"1729805709354","PerformanceDuration":"30","Latency":"123"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33597, 30936, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:36:14.740' AS DateTime), N'{"EnqueuedAt":"1729805774734","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33598, 30936, N'Processing', NULL, CAST(N'2024-10-24T21:36:14.843' AS DateTime), N'{"StartedAt":"1729805774789","ServerId":"admin-pc:23600:b0fd8600-f230-4718-a4d4-9ed434211ca2","WorkerId":"17addc6b-5d4b-4ba2-9db5-de557afb059e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33599, 30936, N'Succeeded', NULL, CAST(N'2024-10-24T21:36:14.867' AS DateTime), N'{"SucceededAt":"1729805774861","PerformanceDuration":"16","Latency":"118"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33600, 30937, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:38:14.863' AS DateTime), N'{"EnqueuedAt":"1729805894862","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33601, 30937, N'Processing', NULL, CAST(N'2024-10-24T21:38:14.877' AS DateTime), N'{"StartedAt":"1729805894875","ServerId":"admin-pc:23600:b0fd8600-f230-4718-a4d4-9ed434211ca2","WorkerId":"c1326480-1828-4c3f-b0aa-e96febe6de60"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33602, 30937, N'Succeeded', NULL, CAST(N'2024-10-24T21:38:14.883' AS DateTime), N'{"SucceededAt":"1729805894882","PerformanceDuration":"4","Latency":"28"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33603, 30938, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:40:14.990' AS DateTime), N'{"EnqueuedAt":"1729806014988","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33605, 30938, N'Processing', NULL, CAST(N'2024-10-24T21:40:15.003' AS DateTime), N'{"StartedAt":"1729806015001","ServerId":"admin-pc:23600:b0fd8600-f230-4718-a4d4-9ed434211ca2","WorkerId":"87e956cd-8044-465f-8add-0eac7792667e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33606, 30938, N'Succeeded', NULL, CAST(N'2024-10-24T21:40:15.010' AS DateTime), N'{"SucceededAt":"1729806015009","PerformanceDuration":"5","Latency":"37"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33604, 30939, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:40:15.000' AS DateTime), N'{"EnqueuedAt":"1729806015000","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33607, 30939, N'Processing', NULL, CAST(N'2024-10-24T21:40:15.013' AS DateTime), N'{"StartedAt":"1729806015011","ServerId":"admin-pc:23600:b0fd8600-f230-4718-a4d4-9ed434211ca2","WorkerId":"5b80b1dc-b77e-40e0-8905-ea5fdf737497"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33608, 30939, N'Succeeded', NULL, CAST(N'2024-10-24T21:40:15.043' AS DateTime), N'{"SucceededAt":"1729806015043","PerformanceDuration":"29","Latency":"13"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33609, 30940, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:42:00.123' AS DateTime), N'{"EnqueuedAt":"1729806120121","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33610, 30940, N'Processing', NULL, CAST(N'2024-10-24T21:42:00.137' AS DateTime), N'{"StartedAt":"1729806120133","ServerId":"admin-pc:23600:b0fd8600-f230-4718-a4d4-9ed434211ca2","WorkerId":"bb7c28f5-507b-4c3c-9b5f-66e014122e09"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33611, 30940, N'Succeeded', NULL, CAST(N'2024-10-24T21:42:00.140' AS DateTime), N'{"SucceededAt":"1729806120140","PerformanceDuration":"3","Latency":"33"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33612, 30941, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:44:08.693' AS DateTime), N'{"EnqueuedAt":"1729806248687","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33613, 30941, N'Processing', NULL, CAST(N'2024-10-24T21:44:08.797' AS DateTime), N'{"StartedAt":"1729806248743","ServerId":"admin-pc:25032:22a6c7fe-d181-44fc-809e-2be5c6fdab7f","WorkerId":"06eb5770-1974-4be9-9295-1d5a356fa6a9"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33614, 30941, N'Succeeded', NULL, CAST(N'2024-10-24T21:44:08.840' AS DateTime), N'{"SucceededAt":"1729806248835","PerformanceDuration":"35","Latency":"119"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33615, 30942, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:45:46.533' AS DateTime), N'{"EnqueuedAt":"1729806346494","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33616, 30942, N'Processing', NULL, CAST(N'2024-10-24T21:45:46.940' AS DateTime), N'{"StartedAt":"1729806346750","ServerId":"admin-pc:19092:d7d05b50-326e-4777-8c81-4209b6a2175c","WorkerId":"ee3a9e2d-d33b-44a9-a981-b22e5ffa6389"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33617, 30942, N'Succeeded', NULL, CAST(N'2024-10-24T21:45:49.117' AS DateTime), N'{"SucceededAt":"1729806349110","PerformanceDuration":"2166","Latency":"464"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33618, 30943, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:46:08.797' AS DateTime), N'{"EnqueuedAt":"1729806368795","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33619, 30943, N'Processing', NULL, CAST(N'2024-10-24T21:46:09.767' AS DateTime), N'{"StartedAt":"1729806369765","ServerId":"admin-pc:19092:d7d05b50-326e-4777-8c81-4209b6a2175c","WorkerId":"94b46462-53e3-432b-9ff6-1b4e7abbeae3"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33620, 30943, N'Succeeded', NULL, CAST(N'2024-10-24T21:46:15.630' AS DateTime), N'{"SucceededAt":"1729806375627","PerformanceDuration":"4121","Latency":"2732"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33621, 30944, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:48:14.670' AS DateTime), N'{"EnqueuedAt":"1729806494662","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33622, 30944, N'Processing', NULL, CAST(N'2024-10-24T21:48:14.783' AS DateTime), N'{"StartedAt":"1729806494725","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"42e63f42-7578-4d71-bd6e-94bfb37e36fe"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33623, 30944, N'Succeeded', NULL, CAST(N'2024-10-24T21:48:15.590' AS DateTime), N'{"SucceededAt":"1729806495585","PerformanceDuration":"801","Latency":"134"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33624, 30945, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:50:14.810' AS DateTime), N'{"EnqueuedAt":"1729806614808","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33626, 30945, N'Processing', NULL, CAST(N'2024-10-24T21:50:14.823' AS DateTime), N'{"StartedAt":"1729806614821","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"bbe10ab9-c2eb-4df3-aa91-10a51c89e719"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33628, 30945, N'Succeeded', NULL, CAST(N'2024-10-24T21:50:14.830' AS DateTime), N'{"SucceededAt":"1729806614828","PerformanceDuration":"3","Latency":"25"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33625, 30946, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:50:14.820' AS DateTime), N'{"EnqueuedAt":"1729806614819","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33627, 30946, N'Processing', NULL, CAST(N'2024-10-24T21:50:14.823' AS DateTime), N'{"StartedAt":"1729806614823","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"05893525-72f5-41f0-b655-e72de5fec688"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33629, 30946, N'Succeeded', NULL, CAST(N'2024-10-24T21:50:14.850' AS DateTime), N'{"SucceededAt":"1729806614847","PerformanceDuration":"22","Latency":"5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33630, 30947, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:52:14.933' AS DateTime), N'{"EnqueuedAt":"1729806734934","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33631, 30947, N'Processing', NULL, CAST(N'2024-10-24T21:52:14.947' AS DateTime), N'{"StartedAt":"1729806734946","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"09999e43-c62b-492a-9f56-db68d8945029"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33632, 30947, N'Succeeded', NULL, CAST(N'2024-10-24T21:52:14.953' AS DateTime), N'{"SucceededAt":"1729806734952","PerformanceDuration":"3","Latency":"29"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33633, 30948, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:54:15.013' AS DateTime), N'{"EnqueuedAt":"1729806855013","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33634, 30948, N'Processing', NULL, CAST(N'2024-10-24T21:54:15.037' AS DateTime), N'{"StartedAt":"1729806855034","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"6c92ebd9-b385-41ad-bf52-873499e164a8"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33635, 30948, N'Succeeded', NULL, CAST(N'2024-10-24T21:54:15.043' AS DateTime), N'{"SucceededAt":"1729806855042","PerformanceDuration":"4","Latency":"30"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33636, 30949, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:55:00.087' AS DateTime), N'{"EnqueuedAt":"1729806900086","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33637, 30949, N'Processing', NULL, CAST(N'2024-10-24T21:55:00.103' AS DateTime), N'{"StartedAt":"1729806900101","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"ad999e4f-5647-4940-9918-b7168f9f4814"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33638, 30949, N'Succeeded', NULL, CAST(N'2024-10-24T21:55:00.110' AS DateTime), N'{"SucceededAt":"1729806900109","PerformanceDuration":"5","Latency":"31"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33639, 30950, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:56:00.163' AS DateTime), N'{"EnqueuedAt":"1729806960162","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33640, 30950, N'Processing', NULL, CAST(N'2024-10-24T21:56:00.177' AS DateTime), N'{"StartedAt":"1729806960175","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"ab47003d-62cc-40a5-9f8b-28c30aeb57a5"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33641, 30950, N'Succeeded', NULL, CAST(N'2024-10-24T21:56:00.183' AS DateTime), N'{"SucceededAt":"1729806960182","PerformanceDuration":"3","Latency":"18"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33642, 30951, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T21:58:00.250' AS DateTime), N'{"EnqueuedAt":"1729807080249","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33643, 30951, N'Processing', NULL, CAST(N'2024-10-24T21:58:00.267' AS DateTime), N'{"StartedAt":"1729807080262","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"edf0d2a9-afb3-489a-b003-b70866391e65"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33644, 30951, N'Succeeded', NULL, CAST(N'2024-10-24T21:58:00.277' AS DateTime), N'{"SucceededAt":"1729807080274","PerformanceDuration":"6","Latency":"28"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33645, 30952, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T22:00:00.337' AS DateTime), N'{"EnqueuedAt":"1729807200335","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33647, 30952, N'Processing', NULL, CAST(N'2024-10-24T22:00:00.357' AS DateTime), N'{"StartedAt":"1729807200354","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"cbcef3b8-10a9-4a0f-820b-db8859a8938c"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33651, 30952, N'Succeeded', NULL, CAST(N'2024-10-24T22:00:00.493' AS DateTime), N'{"SucceededAt":"1729807200493","PerformanceDuration":"134","Latency":"28"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33646, 30953, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T22:00:00.353' AS DateTime), N'{"EnqueuedAt":"1729807200352","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33648, 30953, N'Processing', NULL, CAST(N'2024-10-24T22:00:00.363' AS DateTime), N'{"StartedAt":"1729807200363","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"9ff80ecf-5f80-441e-b82c-69daa3742480"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33649, 30953, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2024-10-24T22:00:00.443' AS DateTime), N'{"FailedAt":"1729807200420","ExceptionType":"System.AggregateException","ExceptionMessage":"One or more errors occurred. (The ConnectionString property has not been initialized.)","ExceptionDetails":"System.AggregateException: One or more errors occurred. (The ConnectionString property has not been initialized.)\r\n ---> System.InvalidOperationException: The ConnectionString property has not been initialized.\r\n   at Microsoft.Data.SqlClient.SqlConnection.PermissionDemand()\r\n   at Microsoft.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)\r\n   at Microsoft.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry, SqlConnectionOverrides overrides)\r\n   at Microsoft.Data.SqlClient.SqlConnection.InternalOpenAsync(CancellationToken cancellationToken)\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenInternalAsync(Boolean errorsExpected, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenInternalAsync(Boolean errorsExpected, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalConnection.OpenAsync(CancellationToken cancellationToken, Boolean errorsExpected)\r\n   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.InitializeReaderAsync(AsyncEnumerator enumerator, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.Internal.SingleQueryingEnumerable`1.AsyncEnumerator.MoveNextAsync()\r\n   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)\r\n   at Microsoft.EntityFrameworkCore.Query.ShapedQueryCompilingExpressionVisitor.SingleOrDefaultAsync[TSource](IAsyncEnumerable`1 asyncEnumerable, CancellationToken cancellationToken)\r\n   at RoosterLottery.Repository.Implemention.SlotRepository.GetSlotsInfoAsync(Int64 id, CancellationToken cancellationToken) in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.DI\\Implemention\\SlotRepository.cs:line 119\r\n   at RoosterLottery.UnitOfWork.Implemention.SlotUnitOfWork.SpinSlotAsync(CancellationToken cancellationToken) in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.UnitOfWork\\Implemention\\SlotUnitOfWork.cs:line 102\r\n   --- End of inner exception stack trace ---\r\n   at System.Threading.Tasks.Task.ThrowIfExceptional(Boolean includeTaskCanceledExceptions)\r\n   at System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)\r\n   at System.Threading.Tasks.Task.Wait()\r\n   at RoosterLottery.UnitOfWork.WorkerService.SlotCreationService.SpinSlotToDay() in D:\\1.Qnit-Source\\DEMO-VNVC\\VNVC.CoreAPI\\rooster-lottery\\RoosterLottery.UnitOfWork\\WorkerService\\SlotCreationService.cs:line 38","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33650, 30953, N'Scheduled', N'Retry attempt 1 of 10: One or more errors occurred. (The ConnectionStrin…', CAST(N'2024-10-24T22:00:00.447' AS DateTime), N'{"EnqueueAt":"1729807227426","ScheduledAt":"1729807200426"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33652, 30953, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-10-24T22:00:30.240' AS DateTime), N'{"EnqueuedAt":"1729807230237","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33653, 30953, N'Processing', NULL, CAST(N'2024-10-24T22:00:30.250' AS DateTime), N'{"StartedAt":"1729807230249","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"14f1a7ea-7d9d-4f65-a1df-5307cbe493ea"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33654, 30953, N'Succeeded', NULL, CAST(N'2024-10-24T22:00:30.253' AS DateTime), N'{"SucceededAt":"1729807230252","PerformanceDuration":"1","Latency":"29901"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33655, 30954, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T22:02:00.520' AS DateTime), N'{"EnqueuedAt":"1729807320519","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33656, 30954, N'Processing', NULL, CAST(N'2024-10-24T22:02:00.547' AS DateTime), N'{"StartedAt":"1729807320545","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"84b0d215-9bc2-48ab-8238-839215d315f6"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33657, 30954, N'Succeeded', NULL, CAST(N'2024-10-24T22:02:00.560' AS DateTime), N'{"SucceededAt":"1729807320557","PerformanceDuration":"4","Latency":"45"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33658, 30955, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T22:04:00.660' AS DateTime), N'{"EnqueuedAt":"1729807440658","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33659, 30955, N'Processing', NULL, CAST(N'2024-10-24T22:04:00.673' AS DateTime), N'{"StartedAt":"1729807440670","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"93335c23-1b25-4416-ad51-208537fa4d9d"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33660, 30955, N'Succeeded', NULL, CAST(N'2024-10-24T22:04:00.677' AS DateTime), N'{"SucceededAt":"1729807440675","PerformanceDuration":"2","Latency":"33"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33661, 30956, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T22:05:00.737' AS DateTime), N'{"EnqueuedAt":"1729807500737","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33662, 30956, N'Processing', NULL, CAST(N'2024-10-24T22:05:00.753' AS DateTime), N'{"StartedAt":"1729807500749","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"2ed74a49-6cd4-4766-8f4f-15521a167f5e"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33663, 30956, N'Succeeded', NULL, CAST(N'2024-10-24T22:05:00.757' AS DateTime), N'{"SucceededAt":"1729807500756","PerformanceDuration":"4","Latency":"19"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33664, 30957, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T22:06:00.807' AS DateTime), N'{"EnqueuedAt":"1729807560807","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33665, 30957, N'Processing', NULL, CAST(N'2024-10-24T22:06:00.823' AS DateTime), N'{"StartedAt":"1729807560820","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"c9f16ef8-bf1b-4f8f-af97-24ab4f7faef4"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33666, 30957, N'Succeeded', NULL, CAST(N'2024-10-24T22:06:00.827' AS DateTime), N'{"SucceededAt":"1729807560827","PerformanceDuration":"3","Latency":"26"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33667, 30958, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2024-10-24T22:08:00.917' AS DateTime), N'{"EnqueuedAt":"1729807680918","Queue":"default"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33668, 30958, N'Processing', NULL, CAST(N'2024-10-24T22:08:00.933' AS DateTime), N'{"StartedAt":"1729807680930","ServerId":"admin-pc:21904:1c95f862-c678-4926-a5b5-ac3476a60902","WorkerId":"e6630c0e-d988-4fa6-855c-2bf901fc26dc"}')
GO
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33669, 30958, N'Succeeded', NULL, CAST(N'2024-10-24T22:08:00.937' AS DateTime), N'{"SucceededAt":"1729807680937","PerformanceDuration":"4","Latency":"23"}')
GO
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
