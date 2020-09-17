USE [master]
GO
/****** Object:  Database [Sweet-As-SaltDB]    Script Date: 9/17/2020 5:12:16 PM ******/
CREATE DATABASE [Sweet-As-SaltDB]
GO
ALTER DATABASE [Sweet-As-SaltDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET RECOVERY FULL 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET  MULTI_USER 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sweet-As-SaltDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sweet-As-SaltDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Sweet-As-SaltDB', N'ON'
GO
ALTER DATABASE [Sweet-As-SaltDB] SET QUERY_STORE = OFF
GO
USE [Sweet-As-SaltDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Sweet-As-SaltDB]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 9/17/2020 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[ContentURL] [ntext] NULL,
	[Status] [tinyint] NOT NULL,
	[CreatedTS] [datetime] NOT NULL,
 CONSTRAINT [PK_Characters] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalSettings]    Script Date: 9/17/2020 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalSettings](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](64) NOT NULL,
	[Value] [nvarchar](128) NULL,
	[Description] [nvarchar](512) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_GlobalSettings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionnaireUsers]    Script Date: 9/17/2020 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionnaireUsers](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [bigint] NOT NULL,
	[QuestionID] [bigint] NOT NULL,
	[Selection] [bit] NULL,
	[SnapPoint] [float] NULL,
 CONSTRAINT [PK_QuestionnaireUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 9/17/2020 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CharacterID] [bigint] NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Content] [nvarchar](512) NOT NULL,
	[ContentURL] [ntext] NULL,
	[Point] [float] NOT NULL,
	[IsCorrect] [bit] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CreatedTS] [datetime] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/17/2020 5:12:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CreatedTS] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (1, N'The King', N'The King Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (2, N'The Alchemist', N'The Alchemist Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (3, N'The Farmer', N'The Farmer Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (4, N'The Knight', N'The Knight Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (5, N'The Merchant', N'The Merchant Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (6, N'The Prince', N'The Prince Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (7, N'The Princess', N'The Princess Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (8, N'The Prisoner', N'The Prisoner Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (9, N'The Queen', N'The Queen Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (10, N'The Servant', N'The Servant Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (12, N'The Cook', N'The Cook Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Characters] OFF
SET IDENTITY_INSERT [dbo].[GlobalSettings] ON 

INSERT [dbo].[GlobalSettings] ([ID], [Name], [Value], [Description], [Status]) VALUES (1, N'NUMBER_QUESTION_EACH_SESSION', N'10', N'Số lượng câu hỏi người chơi phải trả lời cho mỗi lần tham gia?', 1)
INSERT [dbo].[GlobalSettings] ([ID], [Name], [Value], [Description], [Status]) VALUES (3, N'IS_USE_UNIQUE_USER', N'false', N'[''true'' hoặc ''false''] Cho phép người dùng nhập trùng tên hay không?', 1)
INSERT [dbo].[GlobalSettings] ([ID], [Name], [Value], [Description], [Status]) VALUES (4, N'IS_REALTIME_LEADERBOARD', N'true', N'[''true'' hoặc ''false''] Chế độ tính bảng xếp hạng: theo thời gian thực hay kết quả ban đầu?', 1)
SET IDENTITY_INSERT [dbo].[GlobalSettings] OFF
SET IDENTITY_INSERT [dbo].[QuestionnaireUsers] ON 

INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (11, 4, 6, 1, 220)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (12, 4, 7, 1, 190)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (13, 4, 8, 1, 0)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (14, 4, 2, 1, 0)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (15, 4, 1, 0, 0)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (16, 6, 4, 1, 100)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (17, 6, 2, 1, 0)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (18, 6, 10, 1, 220)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (19, 6, 8, 1, 0)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (20, 6, 12, 1, 0)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (21, 7, 8, 0, 310)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (22, 7, 3, 1, 150)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (23, 7, 2, 0, 250)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (24, 7, 4, 1, 100)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (25, 7, 5, 0, 150)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (26, 7, 9, 1, 100)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (27, 7, 6, 1, 220)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (28, 7, 12, 0, 120)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (29, 7, 1, 1, 200)
INSERT [dbo].[QuestionnaireUsers] ([ID], [UserID], [QuestionID], [Selection], [SnapPoint]) VALUES (30, 7, 7, 1, 180)
SET IDENTITY_INSERT [dbo].[QuestionnaireUsers] OFF
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (1, 1, N'Gợi ý câu hỏi thứ 1', N'Nội dung câu hỏi thứ 1', NULL, 200, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (2, 2, N'Gợi ý câu hỏi thứ 2', N'Nội dung câu hỏi thứ 2', NULL, 250, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (3, 3, N'Gợi ý câu hỏi thứ 3', N'Nội dung câu hỏi thứ 3', NULL, 150, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (4, 4, N'Gợi ý câu hỏi thứ 4', N'Nội dung câu hỏi thứ 4', NULL, 100, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (5, 5, N'Gợi ý câu hỏi thứ 5', N'Nội dung câu hỏi thứ 5', NULL, 150, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (6, 6, N'Gợi ý câu hỏi thứ 6', N'Nội dung câu hỏi thứ 6', NULL, 220, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (7, 7, N'Gợi ý câu hỏi thứ 7', N'Nội dung câu hỏi thứ 7', NULL, 180, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (8, 8, N'Gợi ý câu hỏi thứ 8', N'Nội dung câu hỏi thứ 8', NULL, 310, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (9, 9, N'Gợi ý câu hỏi thứ 9', N'Nội dung câu hỏi thứ 9', NULL, 100, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (10, 10, N'Gợi ý câu hỏi thứ 10', N'Nội dung câu hỏi thứ 10 ', NULL, 220, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS]) VALUES (12, 12, N'Gợi ý câu hỏi thứ 11', N'Nội dung câu hỏi thứ 11', NULL, 120, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Questions] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FullName], [Type], [Status], [CreatedTS]) VALUES (4, N'Le Thanh Dat', 1, 1, CAST(N'2020-09-17T09:40:23.520' AS DateTime))
INSERT [dbo].[Users] ([ID], [FullName], [Type], [Status], [CreatedTS]) VALUES (6, N'Xuan Huong', 1, 1, CAST(N'2020-09-17T10:00:10.547' AS DateTime))
INSERT [dbo].[Users] ([ID], [FullName], [Type], [Status], [CreatedTS]) VALUES (7, N'I am the best', 1, 1, CAST(N'2020-09-17T10:07:39.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[QuestionnaireUsers]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireUsers_Questions] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([ID])
GO
ALTER TABLE [dbo].[QuestionnaireUsers] CHECK CONSTRAINT [FK_QuestionnaireUsers_Questions]
GO
ALTER TABLE [dbo].[QuestionnaireUsers]  WITH CHECK ADD  CONSTRAINT [FK_QuestionnaireUsers_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[QuestionnaireUsers] CHECK CONSTRAINT [FK_QuestionnaireUsers_Users]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Characters] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[Characters] ([ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Characters]
GO
USE [master]
GO
ALTER DATABASE [Sweet-As-SaltDB] SET  READ_WRITE 
GO
