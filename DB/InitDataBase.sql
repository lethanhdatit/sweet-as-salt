USE [master]
GO
/****** Object:  Database [Sweet-As-SaltDB]    Script Date: 2/7/2021 5:07:38 PM ******/
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
/****** Object:  Table [dbo].[Characters]    Script Date: 2/7/2021 5:07:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalSettings]    Script Date: 2/7/2021 5:07:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionnaireUsers]    Script Date: 2/7/2021 5:07:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 2/7/2021 5:07:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CharacterID] [bigint] NULL,
	[Description] [nvarchar](1024) NOT NULL,
	[Content] [nvarchar](512) NOT NULL,
	[Info] [nvarchar](512) NULL,
	[ContentURL] [ntext] NULL,
	[Point] [float] NOT NULL,
	[IsCorrect] [bit] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[CreatedTS] [datetime] NOT NULL,
	[InCorrectScale] [float] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/7/2021 5:07:38 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (1, N'The King', N'The King Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (2, N'The Alchemist', N'The Alchemist Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (3, N'The Farmer', N'The Farmer Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (4, N'The Knight', N'The Knight Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (5, N'The Merchant', N'The Merchant Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (6, N'The Prince', N'The Prince Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (7, N'Princess Zizola', N'The Princess Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (8, N'The Prisoner', N'The Prisoner Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (9, N'The Queen', N'The Queen Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (10, N'Trusted servant', N'The Servant Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Characters] ([ID], [Name], [Description], [ContentURL], [Status], [CreatedTS]) VALUES (12, N'Calvino the cook', N'The Cook Des', NULL, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Characters] OFF
GO
SET IDENTITY_INSERT [dbo].[GlobalSettings] ON 

INSERT [dbo].[GlobalSettings] ([ID], [Name], [Value], [Description], [Status]) VALUES (1, N'NUMBER_QUESTION_EACH_SESSION', N'10', N'Số lượng câu hỏi người chơi phải trả lời cho mỗi lần tham gia?', 1)
INSERT [dbo].[GlobalSettings] ([ID], [Name], [Value], [Description], [Status]) VALUES (3, N'IS_USE_UNIQUE_USER', N'false', N'[''true'' hoặc ''false''] Cho phép người dùng nhập trùng tên hay không?', 1)
INSERT [dbo].[GlobalSettings] ([ID], [Name], [Value], [Description], [Status]) VALUES (4, N'IS_REALTIME_LEADERBOARD', N'true', N'[''true'' hoặc ''false''] Chế độ tính bảng xếp hạng: theo thời gian thực hay kết quả ban đầu?', 1)
SET IDENTITY_INSERT [dbo].[GlobalSettings] OFF
GO
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
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (1, 4, N'Your highness, our hinterlands were attacked by the Hightower’s army.', N'Do you want to take vengeance and attack their salt depot?', N'Salt has played a prominent role in determining the power and location of the world''s great cities. Some wars for salt took place in the past.', NULL, 663, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (2, 4, N'The Hightower’s King blocks our way to the sea and we’re losing our resource to make salt. For a little payment, a group of mercenaries could help.', N'Would you like to hire them?', N'Via Salaria was an ancient roman road used to transport salt from the sea to Rome and other roman cities.', NULL, 775, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (3, 4, N'Sir, as much as I like my job, I am not comfortable with this amount of salt. If you don''t pay me the double I will continue my work in another kingdom.', N'Do you want to pay him the double?', N'In Rome... the soldier''s pay was originally salt and the word salary derives from it.', NULL, 900, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.3)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (4, 12, N'Our salt inventories are empty, my Lord. We cannot store our food anymore', N'Should we keep it anyway', N'Salt can be used to conserve food.', NULL, 708, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (5, 12, N'We don''t have enough sugar to cook the dessert for the banquet, I suggest we cook a salty dessert.', N'Do you allow him?', N'Some popular desserts like pretzel chocolate chip cookies and salted rose honey pie are made with salt.', NULL, 619, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.3)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (6, 12, N'Your highness, I am making bread for the banquet, may I ask a barrel of salt?
', N'Salt for making bread?', N'Would you give him?', NULL, 789, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (7, 10, N'Your majesty, a knight from a kingdom far away is asking for shelter in our walls. It could very well be a spy…', N'Do you want to let him in?', N'In ancient kingdoms it was common to send spies to get information on the enemies.
', NULL, 751, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (8, 10, N'My Lord, there is a manifestation of citizens outside the castle complaining about the heavy tax on salt..', N'Would you like to reduce the salt tax?', N'The common salt tax was of such a high value that it caused mass population shifts and exodus, attracted invaders, and caused wars.', NULL, 645, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (9, 10, N'My King, there is a huge protest at Black Square to demonstrate against the new salt tax...', N'Would you like to quit this tax?', N'The common salt tax was of such a high value that it caused mass population shifts and exodus, attracted invaders, and caused wars.', NULL, 770, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (10, 6, N'I am here to take your beautiful daughter as my bride. My kingdom may not have as much salt as yours, but our love is as rich as it can be.', N'Will you give your daughter away?', N'In the middle ages the arrangement of marriage was based on monetary worth.', NULL, 851, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.3)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (12, 6, N'My father, the king of Faraway, sent me to personally invite you to the annual tournament. The price will be a carriage full of premium salt.', N'Would you send your most prestigious knights to the tournament?', N'The medieval tournament was a forum for European knights to show their military skills.', NULL, 871, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (13, 7, N'Father, you are as dear as salt to me!', N'Do you want to execute her for being so arrogant to you?', N'There is a folktale from Italo Calvino named “Dear As Salt” where the King orders to kill his daughter because she told him she loves him “as dear as Salt', NULL, 999, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (14, 7, N'Daddy, I have only one request for you, can I have some salt as a gift for my birthday?', N'Would you give it to her?', N'In the Middle Ages, salt was so expensive it was sometimes referred to as “white gold”', NULL, 890, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (15, 2, N'My King, I see death caused by an overconsumption of salt in the future.', N'Would you command the cook to reduce the use of salt?', N'A high consumption of salt can cause some health diseases such as high blood pressure and heart disease.', NULL, 920, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (16, 2, N'Your Majesty, I feel a lot of bad vibes against you I suggest we do a ritual against evil…', N'Do you accept?', N'There are some Mayan rituals for avoiding evil vibes that involve the use of salt.', NULL, 590, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.4)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (17, 2, N'My lord, I have found this interesting plant to create salt, but I need more gold to continue my research on it.', N'Do you want to give him money to experiment?', N'Salt can be obtained from Bamboo.', NULL, 805, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (18, 9, N'My love, I think this sea salt might help to cure the people struggling from this weird plague that is spreading in the kingdom.', N'Do you want to give sea salt to the harmed?', N'Sea salt is recommended to regulate the levels of sugar in the blood.', NULL, 934, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (19, 9, N'Oh my dear, you seem tired. Let me make a Dead sea salt bath.', N'A dead sea salt bath? Do you want to try?', N'Sea salt baths are known for their therapeutic and healing properties, as well as their ability to ease stress and boost your overall health', NULL, 748, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (20, 9, N'Darling, you have been talking all day long. Believe me, gargling with warm salt water can make you feel better.', N'Is it magic? Do you want to try?', N'Gargling with salt water, about 1/2 teaspoon dissolved in a cup of warm water, can ease swelling and make a sore, scratchy throat feel better.', NULL, 888, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (21, 8, N'Your highness, I regret my sins and would like to meet my newborn.', N'Do you change his penalty in working at the salt-mines for two years?', N'until the Industrial revolution salt was often mined by slaves or prisoners.', NULL, 683, 0, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (22, 8, N'Your Grace, I have been locked away in the dungeons for 25 years. I have seen a lot of things and could tell you what the guards are talking about your salt warehouse, if you set me free.', N'Will you listen to what he has to say and release him from the dungeon?', N'Dungeons are rooms or cells in castles where prisoners were left, especially during the renaissance period', NULL, 794, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.3)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (23, 8, N'I have been accused of stealing a barrel of salt from the castle’s kitchen, though I never did it! Why would I steal worthless salt? A master thief like me can get anything he wants!', N'Would you like to throw him in the dungeon?', N'Worthless? No, salt was of high value to the Jews, Greeks, Tamils, Chinese, Hittites and other peoples of antiquity
', NULL, 816, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (24, 5, N'My lord, I have been traveling along the Salt Route and have the finest salt from a kingdom far away. It is yours for a coach full of gold and a horse to pull it.', N'Would you like to buy it?', N'In the early years, salt was of high value. Routes to transport salt have existed, some examples are via salaria in Italy and old salt routes in Germany.', NULL, 722, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (25, 5, N'I am a traveler and I''ve just bought this amazing rock salt on the way. I will stay in your land for only 1 night.', N'Would you collect taxes from his salt?', N' Cities, states and duchies along the salt roads exacted heavy duties and taxes for the salt passing through their territories.', NULL, 818, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (26, 5, N'We have made a long trek and faced a lot of dangers passing through the Salt Route.', N'Would you spend money protecting your people?', N' For the most part, however, the historic trade route was somewhat dangerous, since the valuable cargo attracted thieves, bandits, and marauders
', NULL, 811, 1, 1, CAST(N'2020-09-15T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (30, 3, N'My neighbour has scattered salt all over my fields! Now my crops are ruined!', N'Do you want to punish the neighbour for his actions?', N'Salt is essential for cooking, but too much salt in soil can ruin crops and render fields useless
', NULL, 899, 1, 1, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (36, 3, N'Your Grace, our lands become inundated. We need salt-tolerant crop varieties and new farming methods.', N'Would you support your people even though it will cost you a fortune?', N'Rising soil salinity is already influencing agricultural production. Salt contamination, which leads to stunted and uneven plant growth.', NULL, 902, 1, 1, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 0.2)
INSERT [dbo].[Questions] ([ID], [CharacterID], [Description], [Content], [Info], [ContentURL], [Point], [IsCorrect], [Status], [CreatedTS], [InCorrectScale]) VALUES (37, 3, N'My Lord, can I just ask for a small amount of salt to give my livestock?', N'Would you like to give away such a precious thing?', N'Salt plays a key role to keep animals'' bodily functions in good order, as well as their general health, production, and breeding capabilities.', NULL, 769, 1, 1, CAST(N'2021-07-02T00:00:00.000' AS DateTime), 0.2)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FullName], [Type], [Status], [CreatedTS]) VALUES (4, N'Le Thanh Dat', 1, 1, CAST(N'2020-09-17T09:40:23.520' AS DateTime))
INSERT [dbo].[Users] ([ID], [FullName], [Type], [Status], [CreatedTS]) VALUES (6, N'Xuan Huong', 1, 1, CAST(N'2020-09-17T10:00:10.547' AS DateTime))
INSERT [dbo].[Users] ([ID], [FullName], [Type], [Status], [CreatedTS]) VALUES (7, N'I am the best', 1, 1, CAST(N'2020-09-17T10:07:39.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Questions] ADD  CONSTRAINT [DF__Questions__InCor__300424B4]  DEFAULT ((0.5)) FOR [InCorrectScale]
GO
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
