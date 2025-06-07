USE [master]
GO
/****** Object:  Database [Persons]    Script Date: 6/6/2025 7:47:27 PM ******/
CREATE DATABASE [Persons]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Persons', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Persons.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Persons_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Persons_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Persons] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Persons].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Persons] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Persons] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Persons] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Persons] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Persons] SET ARITHABORT OFF 
GO
ALTER DATABASE [Persons] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Persons] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Persons] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Persons] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Persons] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Persons] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Persons] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Persons] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Persons] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Persons] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Persons] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Persons] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Persons] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Persons] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Persons] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Persons] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Persons] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Persons] SET RECOVERY FULL 
GO
ALTER DATABASE [Persons] SET  MULTI_USER 
GO
ALTER DATABASE [Persons] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Persons] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Persons] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Persons] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Persons] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Persons] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Persons', N'ON'
GO
ALTER DATABASE [Persons] SET QUERY_STORE = OFF
GO
USE [Persons]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 6/6/2025 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 6/6/2025 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[PersonalNumber] [char](11) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[CityId] [int] NOT NULL,
	[PicturePath] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 6/6/2025 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumbers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[PersonId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelatedPersons]    Script Date: 6/6/2025 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelatedPersons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RelationType] [nvarchar](20) NOT NULL,
	[PersonId] [int] NULL,
	[RelatedToId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

set identity_insert [dbo].[relatedpersons] off

SET IDENTITY_INSERT [dbo].[Cities] ON 
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (1, N'Tbilisi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (2, N'Kutaisi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (3, N'Batumi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (4, N'Rustavi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (5, N'Zugdidi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (6, N'Gori')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (7, N'Poti')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (8, N'Samtredia')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (9, N'Khashuri')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (10, N'Senaki')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (11, N'Telavi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (12, N'Akhaltsikhe')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (13, N'Chiatura')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (14, N'Zestafoni')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (15, N'Kaspi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (16, N'Marneuli')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (17, N'Borjomi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (18, N'Ozurgeti')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (19, N'Lagodekhi')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (20, N'Dedoplistskaro')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (21, N'Akhmeta')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (22, N'Sagarejo')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (23, N'Mtskheta')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (24, N'Kobuleti')
GO
INSERT [dbo].[Cities] ([Id], [Name]) VALUES (25, N'Tskaltubo')

go
SET IDENTITY_INSERT [dbo].[Cities] Off 

go
set IDENTITY_INSERT [dbo].[Persons] on
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (1, N'მაკა', N'ჯანიაშვილი', N'Female', N'13699340190', CAST(N'1967-01-20' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (2, N'ფატი', N'თურმანიძე', N'Male', N'92540727346', CAST(N'1982-11-18' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (3, N'ლაშა', N'კვირკველია', N'Male', N'86758998713', CAST(N'2002-01-17' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (4, N'რატი', N'ახალაძე', N'Male', N'24996306220', CAST(N'1952-08-10' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (5, N'თენგიზ', N'კობიაშვილი', N'Female', N'79159412646', CAST(N'1983-05-10' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (6, N'გულნარა', N'დევაძე', N'Female', N'61281290046', CAST(N'1960-04-19' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (7, N'კონსტანტინე', N'გაგუა', N'Male', N'44493275383', CAST(N'1990-01-30' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (8, N'გიგლა', N'ჯაიანი', N'Male', N'56832151017', CAST(N'1999-10-24' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (9, N'გვანცა', N'ნემსაძე', N'Male', N'73406749406', CAST(N'1981-02-23' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (10, N'ჯულიეტა', N'ფერაძე', N'Female', N'67278527722', CAST(N'1976-02-11' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (11, N'ანნა', N'ალიევა', N'Female', N'47570104616', CAST(N'1951-10-27' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (12, N'მედეა', N'ვასაძე', N'Female', N'93644981506', CAST(N'1953-01-22' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (13, N'მალხაზ', N'ლომიძე', N'Female', N'57104517239', CAST(N'1946-02-05' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (14, N'ლევან', N'პავლიაშვილი', N'Male', N'59796359650', CAST(N'1999-12-29' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (15, N'ჯონი', N'ბოლქვაძე', N'Female', N'47319173849', CAST(N'2004-11-07' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (16, N'რიმა', N'ბერუაშვილი', N'Male', N'11269374917', CAST(N'1971-06-21' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (17, N'დოდო', N'მამულაძე', N'Male', N'08370399335', CAST(N'1953-02-20' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (18, N'კახაბერ', N'თოლორდავა', N'Female', N'21818512403', CAST(N'1972-07-03' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (19, N'არტურ', N'სილაგაძე', N'Male', N'47675897012', CAST(N'1997-12-26' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (20, N'უშანგი', N'ჯაფარიძე', N'Male', N'61402227766', CAST(N'1976-04-04' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (21, N'გიგლა', N'ნემსაძე', N'Female', N'03331408894', CAST(N'1946-04-13' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (22, N'ტარიელ', N'მაჩიტიძე', N'Male', N'68395360041', CAST(N'1966-07-19' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (23, N'მამუკა', N'გოგოხია', N'Female', N'52607366061', CAST(N'1948-06-03' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (24, N'მარინე', N'არაბიძე', N'Female', N'86218760639', CAST(N'1997-12-11' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (25, N'აიდა', N'არველაძე', N'Male', N'10787847956', CAST(N'1960-03-15' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (26, N'გოგა', N'ხიმშიაშვილი', N'Female', N'67276857865', CAST(N'1973-06-26' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (27, N'გოგი', N'ჩხარტიშვილი', N'Male', N'57613492239', CAST(N'1961-02-25' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (28, N'მაკა', N'ხალვაში', N'Female', N'79133245723', CAST(N'1996-10-08' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (29, N'დოდო', N'როსტიაშვილი', N'Female', N'47679888172', CAST(N'1952-06-21' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (30, N'მეგი', N'ბერიშვილი', N'Male', N'45158563500', CAST(N'1988-07-17' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (31, N'არმენ', N'ბარბაქაძე', N'Female', N'08326004746', CAST(N'2000-12-31' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (32, N'ლელა', N'ფხალაძე', N'Female', N'61611221599', CAST(N'1969-04-19' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (33, N'ლანა', N'მერებაშვილი', N'Female', N'90471088023', CAST(N'1977-08-07' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (34, N'ლანა', N'მამულაძე', N'Male', N'92313154164', CAST(N'1992-07-02' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (35, N'ალექსანდრე', N'გოგუა', N'Male', N'47490585629', CAST(N'1970-07-23' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (36, N'ქეთო', N'ასანიძე', N'Female', N'71667096946', CAST(N'1990-06-06' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (37, N'თამუნა', N'ხარატიშვილი', N'Female', N'83992563168', CAST(N'1994-07-08' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (38, N'ვანო', N'ბალიაშვილი', N'Female', N'95117394092', CAST(N'2005-12-15' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (39, N'გიორგი', N'კვინიკაძე', N'Male', N'37191060947', CAST(N'2003-07-12' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (40, N'ციალა', N'აბაშიძე', N'Male', N'18860694522', CAST(N'1945-02-17' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (41, N'ინეზა', N'არველაძე', N'Female', N'02670904331', CAST(N'1975-01-12' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (42, N'ლაშა', N'კაცაძე', N'Female', N'82506578666', CAST(N'1970-01-01' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (43, N'ლიკა', N'ნაჭყებია', N'Male', N'80071776254', CAST(N'1966-11-12' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (44, N'ომარ', N'გვაზავა', N'Female', N'32308613086', CAST(N'1999-03-29' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (45, N'ცირა', N'გოცირიძე', N'Male', N'40236930367', CAST(N'1966-06-03' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (46, N'მიხეილ', N'ლატარია', N'Female', N'43845153509', CAST(N'1965-03-17' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (47, N'ნაირა', N'კიკვაძე', N'Female', N'06050444217', CAST(N'1990-10-21' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (48, N'ავთანდილ', N'შველიძე', N'Female', N'07540986314', CAST(N'1999-09-25' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (49, N'ეკატერინე', N'ძიძიგური', N'Male', N'17111341200', CAST(N'2004-10-31' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (50, N'ვალერი', N'გოგსაძე', N'Female', N'40448378711', CAST(N'1989-06-11' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (51, N'ცირა', N'გობეჯიშვილი', N'Female', N'00423928273', CAST(N'1963-09-16' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (52, N'შორენა', N'ვარშანიძე', N'Male', N'20546886270', CAST(N'1983-10-24' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (53, N'ჟანა', N'გოგუაძე', N'Male', N'61155958202', CAST(N'1961-01-05' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (54, N'მადონა', N'ნაცვლიშვილი', N'Female', N'44118770770', CAST(N'1975-11-20' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (55, N'ირინე', N'აბულაძე', N'Male', N'48823374004', CAST(N'2000-04-18' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (56, N'თამთა', N'ცეცხლაძე', N'Male', N'77691440003', CAST(N'1957-06-24' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (57, N'უშანგი', N'ბექაური', N'Female', N'95038154217', CAST(N'1998-02-21' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (58, N'ანჟელა', N'ირემაძე', N'Male', N'05918653342', CAST(N'1985-07-19' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (59, N'მერაბ', N'შელია', N'Female', N'54530414336', CAST(N'1976-06-03' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (60, N'ცირა', N'ტყემალაძე', N'Female', N'47032843056', CAST(N'1973-04-11' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (61, N'ლარისა', N'კევლიშვილი', N'Female', N'47081368491', CAST(N'1958-10-20' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (62, N'ბესიკ', N'ახალაია', N'Male', N'80895559303', CAST(N'1961-04-23' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (63, N'თამაზ', N'პეტროსიანი', N'Female', N'38283508146', CAST(N'1963-05-31' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (64, N'თამარი', N'ფუტკარაძე', N'Male', N'34867995224', CAST(N'2007-01-09' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (65, N'მარინე', N'ბრეგაძე', N'Female', N'90026842997', CAST(N'1972-10-16' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (66, N'ანა', N'გაგუა', N'Female', N'55964978282', CAST(N'1961-01-08' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (67, N'მურმან', N'გურული', N'Female', N'30176606931', CAST(N'1968-12-13' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (68, N'ლალი', N'ხარაზიშვილი', N'Male', N'28073974756', CAST(N'1966-03-20' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (69, N'კარლო', N'რაზმაძე', N'Female', N'33542192125', CAST(N'1986-10-13' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (70, N'ვალერი', N'გოგიტიძე', N'Male', N'28868294871', CAST(N'1965-05-15' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (71, N'მზია', N'ფარცვანია', N'Male', N'63852545648', CAST(N'1962-10-01' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (72, N'მარინა', N'ჩინჩალაძე', N'Male', N'27720210085', CAST(N'1963-08-16' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (73, N'სუსანა', N'ხატიაშვილი', N'Female', N'81792388337', CAST(N'1964-11-10' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (74, N'კახაბერ', N'კაციტაძე', N'Female', N'76872298754', CAST(N'1961-05-05' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (75, N'ნანი', N'ნაკაშიძე', N'Male', N'91642860546', CAST(N'2005-11-01' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (76, N'ცირა', N'ბერიძე', N'Female', N'45429629552', CAST(N'1986-08-18' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (77, N'იამზე', N'ჯოხაძე', N'Male', N'09321495102', CAST(N'1957-12-15' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (78, N'უშანგი', N'ქათამაძე', N'Female', N'33606715092', CAST(N'1994-09-09' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (79, N'ვანო', N'ქათამაძე', N'Female', N'93529576599', CAST(N'1981-04-03' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (80, N'ვახტანგ', N'გეგეშიძე', N'Male', N'23222546476', CAST(N'1969-06-11' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (81, N'მიხეილ', N'დვალი', N'Female', N'86512130495', CAST(N'1980-07-13' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (82, N'ქეთო', N'აბაშიძე', N'Female', N'46031662771', CAST(N'2006-09-15' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (83, N'ილია', N'გაჯიევი', N'Male', N'52817107630', CAST(N'1978-07-03' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (84, N'ნონა', N'იმერლიშვილი', N'Female', N'35452351308', CAST(N'1993-09-14' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (85, N'ქრისტინე', N'ლობჯანიძე', N'Male', N'53658126678', CAST(N'1944-11-15' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (86, N'ვიქტორ', N'კუპრაშვილი', N'Female', N'23972446982', CAST(N'2000-09-26' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (87, N'ვერიკო', N'კარაპეტიანი', N'Female', N'29818699239', CAST(N'1961-11-15' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (88, N'უშანგი', N'კუბლაშვილი', N'Male', N'47622956208', CAST(N'1993-08-04' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (89, N'ლიდა', N'ტყებუჩავა', N'Male', N'71721020956', CAST(N'1954-12-14' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (90, N'ნათია', N'ელიზბარაშვილი', N'Female', N'04641373238', CAST(N'1977-01-06' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (91, N'ზოია', N'აბრამიშვილი', N'Female', N'41619073811', CAST(N'1974-01-27' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (92, N'შაქრო', N'ადეიშვილი', N'Male', N'32426597847', CAST(N'1973-03-17' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (93, N'ოლღა', N'მაღრაძე', N'Female', N'11968931040', CAST(N'1970-07-06' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (94, N'ციალა', N'გოგიჩაიშვილი', N'Female', N'64239809815', CAST(N'1963-12-04' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (95, N'ანი', N'ტურაშვილი', N'Male', N'13471136874', CAST(N'1944-09-08' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (96, N'რუსუდან', N'ვაშაყმაძე', N'Male', N'20777784003', CAST(N'1968-08-14' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (97, N'იური', N'კუბლაშვილი', N'Female', N'54124841720', CAST(N'1992-09-08' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (98, N'ირმა', N'კაჭარავა', N'Female', N'28617423041', CAST(N'1997-09-29' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (99, N'მინდია', N'ირემაძე', N'Female', N'52309560418', CAST(N'1996-06-25' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (100, N'ნაზი', N'გაბუნია', N'Male', N'48010136458', CAST(N'1977-01-06' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (101, N'ქრისტინე', N'ხარატიშვილი', N'Female', N'81146897581', CAST(N'1994-11-22' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (102, N'დარეჯან', N'კევლიშვილი', N'Female', N'57641331611', CAST(N'1967-01-15' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (103, N'ლეილა', N'ადუაშვილი', N'Female', N'33767873393', CAST(N'1947-03-19' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (104, N'ჟუჟუნა', N'დოლიძე', N'Male', N'25684604539', CAST(N'1982-10-26' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (105, N'ციური', N'მაღრაძე', N'Female', N'01154843665', CAST(N'1983-07-28' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (106, N'თამარ', N'გაბელია', N'Female', N'72293553032', CAST(N'1949-05-23' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (107, N'ბესიკ', N'აბდულაევი', N'Male', N'99057842156', CAST(N'1949-10-17' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (108, N'ივანე', N'მანაგაძე', N'Male', N'36268668959', CAST(N'1945-12-24' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (109, N'დალი', N'მახათაძე', N'Male', N'18877898298', CAST(N'1990-04-12' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (110, N'ევგენია', N'სარალიძე', N'Female', N'26662301857', CAST(N'1989-03-24' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (111, N'ქეთინო', N'იმნაძე', N'Male', N'19366545941', CAST(N'1981-08-13' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (112, N'სოფიო', N'ჯოხაძე', N'Female', N'29899163029', CAST(N'1991-01-02' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (113, N'კარლო', N'მოდებაძე', N'Male', N'58038422296', CAST(N'1945-08-26' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (114, N'არმენ', N'ისაევი', N'Female', N'62793992007', CAST(N'1979-12-08' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (115, N'ემზარ', N'ჯანიაშვილი', N'Male', N'21291050072', CAST(N'1952-07-24' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (116, N'ალექსანდრე', N'წერეთელი', N'Female', N'99280417812', CAST(N'1978-11-22' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (117, N'ევგენია', N'ფოფხაძე', N'Female', N'93669659940', CAST(N'2006-12-07' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (118, N'ზვიად', N'ოთარაშვილი', N'Female', N'91885110352', CAST(N'1985-04-22' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (119, N'ანნა', N'კახიძე', N'Female', N'67952518112', CAST(N'1979-09-05' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (120, N'მინდია', N'ქობულაძე', N'Male', N'90903531548', CAST(N'1983-01-14' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (121, N'ოლია', N'ღლონტი', N'Male', N'30305208250', CAST(N'2006-12-07' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (122, N'თამარ', N'ალადაშვილი', N'Male', N'51176090572', CAST(N'1964-01-14' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (123, N'თამაზ', N'ლობჟანიძე', N'Female', N'66017087868', CAST(N'1996-06-21' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (124, N'ლუბა', N'აფციაური', N'Female', N'82658779026', CAST(N'1977-09-13' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (125, N'ლილი', N'ქუთათელაძე', N'Female', N'69450221907', CAST(N'1990-06-02' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (126, N'შოთა', N'წურწუმია', N'Male', N'33299016275', CAST(N'1968-04-17' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (127, N'ამირან', N'ჩხეიძე', N'Female', N'20735022096', CAST(N'1993-09-08' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (128, N'კობა', N'ჭაღალიძე', N'Female', N'24318973130', CAST(N'1971-07-05' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (129, N'ნათია', N'კუპრეიშვილი', N'Female', N'25202604012', CAST(N'1978-08-19' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (130, N'ზაურ', N'კაცაძე', N'Female', N'66750730484', CAST(N'1995-07-08' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (131, N'ანზორ', N'ილურიძე', N'Female', N'96172430422', CAST(N'2006-08-22' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (132, N'ელისო', N'აფციაური', N'Male', N'49544537570', CAST(N'1948-09-11' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (133, N'სოფიკო', N'გაგნიძე', N'Male', N'11396012027', CAST(N'1989-11-05' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (134, N'ბესარიონ', N'კობერიძე', N'Female', N'98364043153', CAST(N'1984-11-20' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (135, N'რომან', N'კოპალიანი', N'Male', N'94679735573', CAST(N'1998-03-21' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (136, N'ნუცა', N'მუმლაძე', N'Female', N'31798924233', CAST(N'2006-10-12' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (137, N'ლაშა', N'სიხარულიძე', N'Male', N'33865609971', CAST(N'1969-01-26' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (138, N'ილია', N'ცირეკიძე', N'Female', N'41581857372', CAST(N'1974-06-26' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (139, N'ივანე', N'მათიაშვილი', N'Male', N'01986175050', CAST(N'2006-11-22' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (140, N'მალხაზ', N'კუჭუხიძე', N'Female', N'89240231504', CAST(N'1968-01-12' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (141, N'ნინელი', N'ნიჟარაძე', N'Female', N'07669601334', CAST(N'1980-01-22' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (142, N'სალომე', N'გრძელიშვილი', N'Female', N'99557135352', CAST(N'1974-10-15' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (143, N'თამთა', N'კოპალიანი', N'Female', N'64047155457', CAST(N'2005-11-25' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (144, N'ლუდმილა', N'საჯაია', N'Female', N'97308245585', CAST(N'1977-06-10' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (145, N'შოთა', N'სიმონიშვილი', N'Female', N'80177710255', CAST(N'1984-10-27' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (146, N'ფიქრია', N'სიმონიშვილი', N'Male', N'87093223509', CAST(N'2006-12-18' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (147, N'ვანო', N'ჯიშკარიანი', N'Female', N'27152245756', CAST(N'2004-10-15' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (148, N'მირანდა', N'ღლონტი', N'Female', N'91210003856', CAST(N'2000-02-28' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (149, N'რუსუდან', N'თოფურია', N'Male', N'42210841969', CAST(N'1949-07-19' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (150, N'ლუბა', N'ლომთაძე', N'Male', N'28613051190', CAST(N'1972-08-31' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (151, N'მედეა', N'ნიკოლაიშვილი', N'Female', N'22503190996', CAST(N'1956-05-10' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (152, N'ნორა', N'ხიმშიაშვილი', N'Female', N'77106153485', CAST(N'1951-04-13' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (153, N'ია', N'კუბლაშვილი', N'Male', N'55484948365', CAST(N'1970-11-17' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (154, N'თეა', N'სამხარაძე', N'Female', N'36487181943', CAST(N'1960-09-03' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (155, N'ანა', N'ფერაძე', N'Female', N'66962464795', CAST(N'1994-08-03' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (156, N'ქეთინო', N'საჯაია', N'Male', N'15978648049', CAST(N'1993-09-16' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (157, N'ნონა', N'პაპავა', N'Female', N'93908128474', CAST(N'1990-01-03' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (158, N'მედიკო', N'კოხრეიძე', N'Female', N'75945801372', CAST(N'1969-10-25' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (159, N'მზია', N'გიორგაძე', N'Male', N'56376932386', CAST(N'1986-01-14' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (160, N'ელენა', N'რაზმაძე', N'Female', N'72831458876', CAST(N'1945-12-26' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (161, N'კახა', N'ბექაური', N'Female', N'89145896938', CAST(N'1996-03-24' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (162, N'ციური', N'კიკვაძე', N'Male', N'21327638791', CAST(N'1991-01-26' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (163, N'რუსუდან', N'ჩხიკვაძე', N'Male', N'21359664086', CAST(N'1972-04-05' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (164, N'ზურაბ', N'კალანდია', N'Female', N'93460997344', CAST(N'1944-07-05' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (165, N'სალომე', N'ნადირაძე', N'Male', N'09289520027', CAST(N'1993-12-31' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (166, N'მარინე', N'მუსაევა', N'Male', N'61539431970', CAST(N'1992-07-10' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (167, N'გოგი', N'ნიკოლაიშვილი', N'Male', N'03743295344', CAST(N'2007-05-07' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (168, N'ნაზიკო', N'ჩხარტიშვილი', N'Female', N'89532754353', CAST(N'1996-01-19' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (169, N'დოდო', N'ჯანაშია', N'Female', N'15162433578', CAST(N'2003-11-19' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (170, N'ცირა', N'ბურდული', N'Male', N'16489568737', CAST(N'1970-01-01' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (171, N'მაია', N'ნაჭყებია', N'Female', N'67107482686', CAST(N'1977-05-12' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (172, N'დემურ', N'ჯაფარიძე', N'Female', N'01088754554', CAST(N'1986-04-06' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (173, N'ალექსანდრე', N'ზარიძე', N'Female', N'74909523343', CAST(N'1997-12-29' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (174, N'ქრისტინე', N'აბაშიძე', N'Female', N'38312635633', CAST(N'1999-04-14' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (175, N'გუგული', N'ლაცაბიძე', N'Male', N'51109130642', CAST(N'1953-10-27' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (176, N'მეგი', N'შალამბერიძე', N'Female', N'82268137046', CAST(N'2001-03-31' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (177, N'ირინა', N'ჯიქია', N'Male', N'78541711941', CAST(N'1996-01-23' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (178, N'იზოლდა', N'ჯანჯღავა', N'Female', N'73470663132', CAST(N'2002-06-09' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (179, N'ლელა', N'ლურსმანაშვილი', N'Male', N'31141312459', CAST(N'1977-04-05' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (180, N'ლიზა', N'ყაველაშვილი', N'Male', N'76572761791', CAST(N'2005-10-26' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (181, N'ნანა', N'ღვინიაშვილი', N'Female', N'48985467801', CAST(N'1977-12-15' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (182, N'რევაზ', N'ბლიაძე', N'Female', N'35223970857', CAST(N'1944-09-28' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (183, N'რამაზ', N'ჩხეიძე', N'Male', N'02218844402', CAST(N'1961-03-19' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (184, N'ზოია', N'სურმანიძე', N'Female', N'14809756054', CAST(N'2005-06-10' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (185, N'ელგუჯა', N'ჯიბლაძე', N'Female', N'37404425841', CAST(N'1971-03-18' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (186, N'მადონა', N'მაღრაძე', N'Male', N'30828444710', CAST(N'1962-10-31' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (187, N'ზურაბ', N'მუსტაფაევი', N'Female', N'90346534451', CAST(N'1974-08-26' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (188, N'ლილი', N'ლორთქიფანიძე', N'Male', N'87512737479', CAST(N'2003-08-07' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (189, N'ვერიკო', N'ზარანდია', N'Female', N'55653721015', CAST(N'1998-02-11' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (190, N'უშანგი', N'ხვედელიძე', N'Male', N'03343301646', CAST(N'1957-03-06' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (191, N'ლელა', N'გოგუა', N'Male', N'75556206277', CAST(N'1983-06-09' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (192, N'ელისო', N'ანთაძე', N'Female', N'08411693393', CAST(N'1956-08-19' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (193, N'კარლო', N'სეხნიაშვილი', N'Male', N'10482274525', CAST(N'1983-07-20' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (194, N'ნაზიკო', N'ტყეშელაშვილი', N'Female', N'71451777845', CAST(N'1949-12-06' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (195, N'ემა', N'მგელაძე', N'Male', N'13632878130', CAST(N'1996-01-02' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (196, N'გოგა', N'ჩხარტიშვილი', N'Female', N'27258735203', CAST(N'1987-06-06' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (197, N'სვეტლანა', N'გაბელია', N'Male', N'13725115306', CAST(N'2001-05-27' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (198, N'არჩილ', N'ჩაფიძე', N'Female', N'68456040880', CAST(N'1955-06-24' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (199, N'ციური', N'შალამბერიძე', N'Male', N'49303871008', CAST(N'1987-03-05' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (200, N'კობა', N'ლურსმანაშვილი', N'Female', N'96949357853', CAST(N'1984-07-05' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (201, N'გელა', N'ლომსაძე', N'Female', N'13471408234', CAST(N'1999-09-23' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (202, N'ემზარ', N'ხელაძე', N'Female', N'96318660013', CAST(N'1962-08-24' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (203, N'ნინელი', N'ბერულავა', N'Female', N'09903067688', CAST(N'2003-01-12' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (204, N'ნადია', N'ტყემალაძე', N'Male', N'78112024397', CAST(N'1960-09-13' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (205, N'რიმა', N'ჯანელიძე', N'Female', N'26319119245', CAST(N'1964-04-09' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (206, N'რიტა', N'ხიმშიაშვილი', N'Male', N'33792302433', CAST(N'2000-11-10' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (207, N'ხათუნა', N'არაბული', N'Female', N'86099076909', CAST(N'2003-09-02' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (208, N'ეკატერინე', N'რუხაძე', N'Female', N'15707621362', CAST(N'1960-09-01' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (209, N'ლუიზა', N'ჭკადუა', N'Male', N'57184277387', CAST(N'1952-04-16' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (210, N'ილია', N'უგრეხელიძე', N'Male', N'96960344954', CAST(N'1970-10-21' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (211, N'ეთერ', N'გოგოხია', N'Male', N'83332558216', CAST(N'1982-01-21' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (212, N'როინ', N'წურწუმია', N'Female', N'59443565196', CAST(N'1962-08-27' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (213, N'თამუნა', N'ჩინჩალაძე', N'Male', N'00152211170', CAST(N'1970-09-06' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (214, N'ქეთევან', N'აბესაძე', N'Male', N'27636787992', CAST(N'1946-09-21' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (215, N'ემა', N'აბულაძე', N'Female', N'55291827134', CAST(N'1978-06-10' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (216, N'ალა', N'აბესაძე', N'Male', N'76821563353', CAST(N'1954-06-22' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (217, N'გალინა', N'ხმალაძე', N'Female', N'36323131149', CAST(N'1997-01-11' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (218, N'ვეფხვია', N'ბერძენიშვილი', N'Female', N'42234223507', CAST(N'1966-10-17' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (219, N'მურმან', N'ხიზანიშვილი', N'Female', N'85167589261', CAST(N'2002-07-17' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (220, N'გალინა', N'კუპრაშვილი', N'Female', N'29617397894', CAST(N'1944-09-19' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (221, N'შორენა', N'შუკაკიძე', N'Male', N'76352964500', CAST(N'1955-01-10' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (222, N'ლამზირა', N'თოფურია', N'Male', N'39699804728', CAST(N'1960-04-24' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (223, N'მალხაზ', N'ტაბატაძე', N'Female', N'90941785021', CAST(N'1998-04-26' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (224, N'ჟანა', N'ჩაჩანიძე', N'Male', N'62160809667', CAST(N'1989-07-15' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (225, N'ანიკო', N'მაღლაკელიძე', N'Female', N'82747971454', CAST(N'1962-08-19' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (226, N'დათო', N'მამულაძე', N'Male', N'98325631876', CAST(N'1950-02-15' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (227, N'ჟანა', N'ზარიძე', N'Male', N'92322627426', CAST(N'1975-07-13' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (228, N'ნონა', N'თოლორდავა', N'Female', N'01851998473', CAST(N'1961-01-30' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (229, N'ნადეჯდა', N'ქურდაძე', N'Male', N'47298956354', CAST(N'2002-12-28' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (230, N'გალინა', N'გაჯიევი', N'Male', N'84552104639', CAST(N'1944-09-24' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (231, N'ელგუჯა', N'გაჩეჩილაძე', N'Female', N'07163936000', CAST(N'2004-03-25' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (232, N'გუგული', N'ანდღულაძე', N'Male', N'44622701942', CAST(N'1980-03-13' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (233, N'სერგო', N'პაპიაშვილი', N'Male', N'89174828199', CAST(N'1989-04-16' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (234, N'თამთა', N'ლაცაბიძე', N'Male', N'27434212168', CAST(N'1949-07-27' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (235, N'ამირან', N'მჭედლიშვილი', N'Male', N'45514563461', CAST(N'1977-03-03' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (236, N'ნანა', N'ცირეკიძე', N'Female', N'41194775236', CAST(N'1968-12-30' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (237, N'ოლღა', N'გოგსაძე', N'Female', N'33062785981', CAST(N'1944-08-12' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (238, N'რუსუდან', N'ტყეშელაშვილი', N'Female', N'60063259709', CAST(N'1994-08-31' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (239, N'ემზარ', N'ღვინჯილია', N'Male', N'53108420843', CAST(N'1949-11-17' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (240, N'გივი', N'ვაშაყმაძე', N'Male', N'27432762651', CAST(N'1969-03-21' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (241, N'ელმირა', N'სვანიძე', N'Female', N'58489406766', CAST(N'1975-06-24' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (242, N'ნაირა', N'ჭანტურია', N'Female', N'06982637845', CAST(N'2005-01-23' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (243, N'ზვიად', N'ჟორჟოლიანი', N'Male', N'65370034054', CAST(N'1972-05-02' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (244, N'შოთა', N'დოლიძე', N'Male', N'79299223970', CAST(N'1958-01-31' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (245, N'ელგუჯა', N'ფერაძე', N'Male', N'72171481066', CAST(N'1948-02-21' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (246, N'ივანე', N'ვალიევი', N'Female', N'72666998247', CAST(N'1992-09-09' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (247, N'პავლე', N'ჭიღლაძე', N'Female', N'59599242908', CAST(N'1960-10-15' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (248, N'სიმონ', N'გოგიშვილი', N'Female', N'33370639312', CAST(N'1954-09-03' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (249, N'ეკა', N'ჩაჩანიძე', N'Female', N'02269768000', CAST(N'1975-07-23' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (250, N'შოთა', N'კილაძე', N'Male', N'91587117750', CAST(N'1978-09-04' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (251, N'დიანა', N'ნადირაშვილი', N'Female', N'27641689650', CAST(N'1978-07-10' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (252, N'ვახტანგ', N'გიორგაძე', N'Female', N'28927483528', CAST(N'1986-08-03' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (253, N'ილია', N'ჯინჭარაძე', N'Male', N'71513405313', CAST(N'1966-04-24' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (254, N'დემურ', N'ცომაია', N'Female', N'39004723023', CAST(N'1983-08-11' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (255, N'კახა', N'ილურიძე', N'Female', N'29831309028', CAST(N'1953-10-04' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (256, N'ბონდო', N'ხარატიშვილი', N'Female', N'39811282769', CAST(N'1960-08-05' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (257, N'ია', N'სიმონიშვილი', N'Male', N'37764728819', CAST(N'1955-12-29' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (258, N'თამუნა', N'კეკელიძე', N'Male', N'88282655954', CAST(N'1948-06-18' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (259, N'როლანდ', N'ნაცვლიშვილი', N'Male', N'74628296839', CAST(N'2006-06-02' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (260, N'მინდია', N'ლაგვილავა', N'Male', N'63360437195', CAST(N'1944-10-21' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (261, N'ვახტანგ', N'ფარტენაძე', N'Male', N'90458390221', CAST(N'1953-10-28' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (262, N'ნადეჯდა', N'თაბაგარი', N'Female', N'62068004091', CAST(N'2002-03-03' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (263, N'ვანო', N'მიქაბერიძე', N'Female', N'42364777847', CAST(N'1962-05-07' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (264, N'გვანცა', N'რევაზიშვილი', N'Female', N'58930556852', CAST(N'1950-04-03' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (265, N'მაგდა', N'ქაჯაია', N'Male', N'09452165774', CAST(N'1969-05-06' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (266, N'ავთანდილ', N'კვაჭაძე', N'Male', N'89404519876', CAST(N'1951-03-06' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (267, N'გიული', N'ლორთქიფანიძე', N'Female', N'02867438114', CAST(N'1958-07-01' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (268, N'ანჟელა', N'მიქავა', N'Female', N'56044935481', CAST(N'1964-06-08' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (269, N'მეგი', N'სიხარულიძე', N'Male', N'17690013209', CAST(N'1953-05-03' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (270, N'ვაჟა', N'მელაძე', N'Male', N'78837484730', CAST(N'1994-06-23' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (271, N'რობერტ', N'ჯიბლაძე', N'Male', N'61481371470', CAST(N'1996-09-08' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (272, N'მაკა', N'იაშვილი', N'Male', N'48010184108', CAST(N'1978-05-21' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (273, N'ელენა', N'დოლიძე', N'Male', N'48064469285', CAST(N'1960-01-18' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (274, N'ანა', N'ჭკადუა', N'Female', N'30526757627', CAST(N'1976-07-28' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (275, N'მირანდა', N'კობიაშვილი', N'Male', N'20005319220', CAST(N'1949-07-23' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (276, N'ნადია', N'ალანია', N'Female', N'89026610550', CAST(N'1981-09-03' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (277, N'ჟანა', N'კარაპეტიანი', N'Male', N'33105570574', CAST(N'1977-12-25' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (278, N'ჯემალ', N'ფარტენაძე', N'Male', N'46113495258', CAST(N'1969-06-05' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (279, N'მურთაზ', N'შანიძე', N'Female', N'36781757258', CAST(N'1958-03-13' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (280, N'ხვიჩა', N'ფარტენაძე', N'Male', N'73415096548', CAST(N'1961-07-24' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (281, N'უშანგი', N'მღებრიშვილი', N'Female', N'71216924059', CAST(N'1964-03-28' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (282, N'სოფია', N'კირვალიძე', N'Female', N'12177515702', CAST(N'1983-05-29' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (283, N'იზა', N'ფერაძე', N'Female', N'32045305771', CAST(N'1952-06-27' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (284, N'დავით', N'კოპაძე', N'Female', N'81546906311', CAST(N'1962-12-16' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (285, N'მზია', N'ნებიერიძე', N'Female', N'60439439571', CAST(N'1991-10-03' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (286, N'ლიზა', N'ჩხიკვაძე', N'Male', N'45075091280', CAST(N'1946-09-15' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (287, N'ივანე', N'ვარშანიძე', N'Female', N'31125123523', CAST(N'1962-01-18' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (288, N'დარეჯან', N'მანაგაძე', N'Male', N'07244905065', CAST(N'1952-11-30' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (289, N'რიტა', N'დემეტრაშვილი', N'Female', N'29916293375', CAST(N'1974-12-22' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (290, N'დარეჯან', N'ზედგინიძე', N'Female', N'61580449621', CAST(N'1944-10-09' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (291, N'ვასილ', N'ბეჟანიშვილი', N'Female', N'76103880488', CAST(N'1961-05-12' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (292, N'ზაირა', N'კვერნაძე', N'Female', N'40789766201', CAST(N'1944-09-02' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (293, N'ვარდო', N'ლაგვილავა', N'Male', N'72305416787', CAST(N'1975-06-02' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (294, N'თემურ', N'ხარაიშვილი', N'Female', N'68267475806', CAST(N'1996-04-08' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (295, N'რომან', N'მაჭავარიანი', N'Female', N'29574690141', CAST(N'2002-06-11' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (296, N'გიული', N'აფციაური', N'Male', N'55467953969', CAST(N'1969-01-27' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (297, N'ნანული', N'კახაძე', N'Female', N'08780167486', CAST(N'1961-09-26' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (298, N'ზაურ', N'გველესიანი', N'Male', N'06410333388', CAST(N'1972-01-11' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (299, N'ვალერი', N'ხაჩატურიანი', N'Male', N'13388325620', CAST(N'1954-10-30' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (300, N'მედიკო', N'ჩიხლაძე', N'Male', N'85731865608', CAST(N'1952-08-22' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (301, N'ოთარ', N'არჩვაძე', N'Male', N'74947287955', CAST(N'1944-12-09' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (302, N'ცისანა', N'ბარამიძე', N'Male', N'53157892053', CAST(N'1947-07-03' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (303, N'ტარიელ', N'სანიკიძე', N'Male', N'87248331921', CAST(N'1976-10-09' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (304, N'ვალენტინა', N'ვარშანიძე', N'Male', N'44061481841', CAST(N'1979-11-17' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (305, N'ჟანა', N'შარიქაძე', N'Female', N'40374018197', CAST(N'1951-10-03' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (306, N'გივი', N'ლიპარტელიანი', N'Male', N'32980439205', CAST(N'1988-12-03' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (307, N'ბელა', N'როგავა', N'Male', N'69469723515', CAST(N'1991-07-27' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (308, N'ბონდო', N'ნოზაძე', N'Male', N'14723253942', CAST(N'1970-09-25' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (309, N'ასლან', N'ჩაჩანიძე', N'Male', N'60951672573', CAST(N'1960-08-26' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (310, N'ასლან', N'წურწუმია', N'Female', N'67709777268', CAST(N'1994-09-24' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (311, N'ელგუჯა', N'კვინიკაძე', N'Female', N'08666295280', CAST(N'1952-08-04' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (312, N'ნინო', N'რობაქიძე', N'Female', N'68301972700', CAST(N'1954-08-13' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (313, N'სოფიკო', N'ბერძენიშვილი', N'Female', N'35162921305', CAST(N'1950-09-26' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (314, N'მერაბ', N'კირვალიძე', N'Female', N'63679786441', CAST(N'2005-04-16' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (315, N'სიმონ', N'ჩხაიძე', N'Female', N'26829282289', CAST(N'1974-12-11' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (316, N'ნიკა', N'ფარცვანია', N'Male', N'78469118182', CAST(N'1945-01-30' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (317, N'ალექსანდრე', N'კაციტაძე', N'Male', N'33847832639', CAST(N'1995-04-30' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (318, N'მურთაზ', N'ასანიძე', N'Female', N'97919813685', CAST(N'1946-04-21' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (319, N'რუსუდან', N'მოდებაძე', N'Female', N'36623928792', CAST(N'1969-09-07' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (320, N'მალხაზ', N'ბუკია', N'Male', N'45517671814', CAST(N'1962-05-20' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (321, N'ზოია', N'ქარჩავა', N'Female', N'30757985439', CAST(N'2003-03-14' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (322, N'მიხეილ', N'ბოლქვაძე', N'Male', N'28026641740', CAST(N'1958-12-12' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (323, N'ზვიად', N'მუშკუდიანი', N'Female', N'91673305127', CAST(N'1967-05-07' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (324, N'ციური', N'ჯაიანი', N'Female', N'62526978521', CAST(N'1981-11-27' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (325, N'ნოდარ', N'მგალობლიშვილი', N'Female', N'59246281114', CAST(N'1969-02-13' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (326, N'ბადრი', N'რეხვიაშვილი', N'Female', N'91360116839', CAST(N'1964-06-18' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (327, N'ვახტანგ', N'რაზმაძე', N'Male', N'04992418868', CAST(N'1964-05-28' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (328, N'ილია', N'თურმანიძე', N'Female', N'93719710237', CAST(N'1956-06-10' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (329, N'ნანა', N'წიკლაური', N'Female', N'08031901228', CAST(N'1977-06-14' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (330, N'ნაირა', N'თოფურია', N'Male', N'10799548230', CAST(N'1959-02-24' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (331, N'კლარა', N'ჯიბლაძე', N'Male', N'04431705599', CAST(N'1998-09-24' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (332, N'ტარიელ', N'ბენდელიანი', N'Male', N'90354731795', CAST(N'1961-12-24' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (333, N'ზვიად', N'ალადაშვილი', N'Female', N'45129485941', CAST(N'2006-11-10' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (334, N'მიხეილ', N'კუხიანიძე', N'Female', N'27622880453', CAST(N'1973-09-21' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (335, N'ასმათ', N'ფეიქრიშვილი', N'Female', N'04087341134', CAST(N'2005-04-22' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (336, N'ბორის', N'გოგიჩაიშვილი', N'Male', N'46433099353', CAST(N'1963-12-30' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (337, N'ნესტან', N'ბერაია', N'Female', N'63024989756', CAST(N'1971-01-15' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (338, N'ნოდარ', N'ნოზაძე', N'Male', N'68850527968', CAST(N'1946-08-25' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (339, N'ბელა', N'ძნელაძე', N'Female', N'27116653237', CAST(N'1951-10-11' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (340, N'თამარ', N'ადამია', N'Female', N'64275114059', CAST(N'1945-02-16' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (341, N'ილია', N'გობეჯიშვილი', N'Female', N'60113652873', CAST(N'1997-10-31' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (342, N'ნინელი', N'გაბაიძე', N'Male', N'76793315840', CAST(N'1982-03-24' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (343, N'ელმირა', N'მუმლაძე', N'Female', N'04270466502', CAST(N'1964-05-10' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (344, N'ნანა', N'ცომაია', N'Male', N'17388440633', CAST(N'2001-06-17' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (345, N'ეკატერინე', N'გოგოხია', N'Female', N'24052549324', CAST(N'1982-11-10' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (346, N'შალვა', N'სირაძე', N'Male', N'13516073388', CAST(N'1957-10-01' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (347, N'გოჩა', N'ხარაბაძე', N'Female', N'01311506998', CAST(N'1977-05-06' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (348, N'თემურ', N'სოფრომაძე', N'Female', N'24590205003', CAST(N'1994-01-11' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (349, N'თეონა', N'გოგინაშვილი', N'Female', N'49392334794', CAST(N'1998-08-27' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (350, N'ვიოლეტა', N'ილურიძე', N'Female', N'56714472984', CAST(N'1965-08-19' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (351, N'თამარ', N'კახიძე', N'Female', N'51941256262', CAST(N'1975-12-27' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (352, N'ლილი', N'გოგსაძე', N'Male', N'89321528101', CAST(N'1958-01-25' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (353, N'მურმან', N'სიმონიშვილი', N'Female', N'53427303307', CAST(N'1971-12-03' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (354, N'სიმონ', N'გოგიჩაიშვილი', N'Male', N'32096462309', CAST(N'2005-04-20' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (355, N'ნათელა', N'ყიფშიძე', N'Female', N'14845958999', CAST(N'1996-04-22' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (356, N'თეიმურაზ', N'კვანტალიანი', N'Female', N'03208997954', CAST(N'1969-11-23' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (357, N'ნანული', N'კვარაცხელია', N'Male', N'86296650079', CAST(N'1966-03-15' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (358, N'ელიზა', N'ჭკადუა', N'Female', N'44362949166', CAST(N'1976-03-13' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (359, N'თამუნა', N'გოგიაშვილი', N'Male', N'31888982614', CAST(N'1965-11-16' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (360, N'პავლე', N'პაპიძე', N'Female', N'14423407216', CAST(N'1956-06-12' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (361, N'ნაზიბროლა', N'გუმბერიძე', N'Male', N'17285775176', CAST(N'1970-08-28' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (362, N'სუსანა', N'ლორთქიფანიძე', N'Male', N'71125658755', CAST(N'1985-03-19' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (363, N'მანანა', N'ცერცვაძე', N'Male', N'03481256746', CAST(N'1974-11-11' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (364, N'ოლღა', N'ალადაშვილი', N'Female', N'52733941176', CAST(N'1987-11-30' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (365, N'ნორა', N'არაბიძე', N'Female', N'88069731728', CAST(N'1994-11-19' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (366, N'ვალერი', N'გვასალია', N'Female', N'72570862330', CAST(N'1959-09-30' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (367, N'გუგული', N'წიქარიშვილი', N'Female', N'83982425398', CAST(N'1989-06-10' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (368, N'გულიკო', N'გოგიჩაიშვილი', N'Female', N'17872559266', CAST(N'1996-09-21' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (369, N'მაია', N'რობაქიძე', N'Male', N'54901918163', CAST(N'1980-08-30' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (370, N'მერი', N'ბექაური', N'Female', N'00098737058', CAST(N'1999-06-23' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (371, N'სერგო', N'ხატიაშვილი', N'Female', N'34063150866', CAST(N'1963-05-01' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (372, N'ელენა', N'პავლიაშვილი', N'Female', N'54317553266', CAST(N'1950-05-30' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (373, N'მაგდა', N'ლორთქიფანიძე', N'Female', N'61682854406', CAST(N'1988-11-26' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (374, N'ნათელა', N'ნიქაბაძე', N'Male', N'06578820445', CAST(N'1958-08-12' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (375, N'მადონა', N'ნადირაშვილი', N'Male', N'99025522628', CAST(N'1985-10-05' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (376, N'თემურ', N'ფეიქრიშვილი', N'Male', N'84560244257', CAST(N'1978-05-11' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (377, N'კახა', N'სარქისიანი', N'Male', N'04551155591', CAST(N'1976-10-21' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (378, N'თათია', N'კვარაცხელია', N'Female', N'40157229446', CAST(N'1961-08-20' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (379, N'ნონა', N'კოპალიანი', N'Female', N'08474616329', CAST(N'1969-05-10' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (380, N'ნანი', N'წულაია', N'Male', N'55182839913', CAST(N'1993-04-08' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (381, N'გოგი', N'შუკაკიძე', N'Male', N'00703683221', CAST(N'1979-03-10' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (382, N'იზოლდა', N'ბურჯანაძე', N'Male', N'39424600086', CAST(N'2006-08-05' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (383, N'შალვა', N'სიხარულიძე', N'Female', N'29797264159', CAST(N'1990-08-12' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (384, N'ბელა', N'მახათაძე', N'Female', N'14041156038', CAST(N'1993-02-27' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (385, N'შოთა', N'კუპრაშვილი', N'Female', N'74735428083', CAST(N'1999-10-28' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (386, N'რეზო', N'პაპუაშვილი', N'Female', N'66270630032', CAST(N'1966-09-19' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (387, N'მარი', N'ფუტკარაძე', N'Female', N'85756927721', CAST(N'1980-07-30' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (388, N'ვიოლეტა', N'ქობალია', N'Male', N'69557847780', CAST(N'1944-11-16' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (389, N'რუსუდან', N'მერაბიშვილი', N'Male', N'14534174851', CAST(N'1946-11-07' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (390, N'დემურ', N'დვალიშვილი', N'Female', N'58756824512', CAST(N'2007-04-11' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (391, N'რამაზ', N'მეტრეველი', N'Female', N'99933456712', CAST(N'1962-07-15' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (392, N'ივანე', N'სხირტლაძე', N'Male', N'16357629453', CAST(N'1979-07-20' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (393, N'გოდერძი', N'კოხრეიძე', N'Female', N'04758971479', CAST(N'1975-08-06' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (394, N'რევაზ', N'ნაბიევი', N'Male', N'22297165019', CAST(N'1959-11-17' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (395, N'პეტრე', N'სიმონიშვილი', N'Male', N'50956332120', CAST(N'2000-03-23' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (396, N'იოსებ', N'გუმბერიძე', N'Male', N'98450259040', CAST(N'1947-03-12' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (397, N'ნუცა', N'ადეიშვილი', N'Female', N'81962914653', CAST(N'1957-02-17' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (398, N'გოგა', N'კალანდია', N'Male', N'32308776668', CAST(N'1982-07-18' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (399, N'მერაბ', N'ხატიაშვილი', N'Female', N'96098502522', CAST(N'1968-08-07' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (400, N'ლალი', N'ახალაძე', N'Female', N'67383526537', CAST(N'1999-07-31' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (401, N'ნონა', N'კილაძე', N'Male', N'52321139328', CAST(N'1975-06-12' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (402, N'იზა', N'გაჩეჩილაძე', N'Male', N'61116036410', CAST(N'1969-09-26' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (403, N'იამზე', N'ლაბაძე', N'Female', N'03475779263', CAST(N'1951-04-15' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (404, N'მიხეილ', N'ღვინიაშვილი', N'Male', N'04403781896', CAST(N'1980-01-18' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (405, N'კობა', N'კონცელიძე', N'Male', N'94821985992', CAST(N'1952-08-19' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (406, N'ასმათ', N'დავითაშვილი', N'Female', N'60780829031', CAST(N'2003-02-14' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (407, N'ლელა', N'ფარტენაძე', N'Male', N'34300781263', CAST(N'1961-01-26' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (408, N'ბონდო', N'ჩიქოვანი', N'Male', N'10794630893', CAST(N'1983-01-12' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (409, N'ჯონი', N'მუშკუდიანი', N'Male', N'89620203924', CAST(N'1978-10-11' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (410, N'იური', N'მუშკუდიანი', N'Female', N'90327797373', CAST(N'1985-04-25' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (411, N'ინეზა', N'წულუკიძე', N'Female', N'17015052301', CAST(N'1982-10-30' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (412, N'ეთერ', N'არველაძე', N'Male', N'96793858563', CAST(N'1993-03-07' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (413, N'სიმონ', N'ლიპარტელიანი', N'Female', N'92456792186', CAST(N'1963-12-17' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (414, N'ლილი', N'ღურწკაია', N'Female', N'30330808695', CAST(N'2001-04-11' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (415, N'მინდია', N'თედორაძე', N'Male', N'17571094458', CAST(N'1952-02-04' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (416, N'მარინა', N'დიასამიძე', N'Female', N'37041466085', CAST(N'1978-04-30' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (417, N'არტურ', N'შანიძე', N'Female', N'05547354300', CAST(N'2007-01-04' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (418, N'ინგა', N'დანელია', N'Female', N'67262920055', CAST(N'1953-12-28' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (419, N'მთვარისა', N'გაჯიევა', N'Male', N'02777124901', CAST(N'1999-05-14' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (420, N'მერაბ', N'ჭიღლაძე', N'Female', N'75041690727', CAST(N'1963-12-09' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (421, N'დარეჯან', N'ბენდელიანი', N'Female', N'10070150351', CAST(N'1953-06-06' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (422, N'ზვიად', N'ვეკუა', N'Female', N'57975451666', CAST(N'1990-08-07' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (423, N'ნაირა', N'შაინიძე', N'Female', N'90021471110', CAST(N'1999-03-11' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (424, N'სალომე', N'ხარაზიშვილი', N'Female', N'63492737299', CAST(N'1986-01-01' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (425, N'ნანა', N'ჩაკვეტაძე', N'Male', N'32740046760', CAST(N'1963-01-25' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (426, N'დათო', N'მერებაშვილი', N'Male', N'46438293432', CAST(N'1962-10-17' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (427, N'ომარ', N'ჯაფარიძე', N'Male', N'53868681119', CAST(N'1990-11-19' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (428, N'ხატია', N'კობერიძე', N'Female', N'05027062661', CAST(N'1975-05-02' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (429, N'ვენერა', N'ჯიქია', N'Male', N'10712119822', CAST(N'2001-08-02' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (430, N'ქეთინო', N'გოგიჩაიშვილი', N'Female', N'00988697730', CAST(N'1987-04-15' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (431, N'ლალი', N'ტაბატაძე', N'Female', N'23410388080', CAST(N'2005-02-05' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (432, N'სერგო', N'ბიგვავა', N'Male', N'04335725056', CAST(N'2003-11-21' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (433, N'ვახტანგ', N'მაჭავარიანი', N'Female', N'93750357513', CAST(N'1976-03-13' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (434, N'მედიკო', N'შამათავა', N'Female', N'49469951544', CAST(N'1997-03-15' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (435, N'გოგიტა', N'ქაჯაია', N'Male', N'47125785896', CAST(N'1974-10-24' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (436, N'სერგო', N'ჯაფარიძე', N'Male', N'26385605929', CAST(N'1966-12-10' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (437, N'ნაირა', N'იმერლიშვილი', N'Female', N'42749495774', CAST(N'1992-08-13' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (438, N'უშანგი', N'ფხაკაძე', N'Female', N'45395084986', CAST(N'1946-07-08' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (439, N'რევაზ', N'ადეიშვილი', N'Male', N'97856487264', CAST(N'1976-03-13' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (440, N'ლიზა', N'ქირია', N'Female', N'06375675948', CAST(N'1972-04-25' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (441, N'თეონა', N'კიკნაძე', N'Female', N'51909447466', CAST(N'1964-08-17' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (442, N'ნორა', N'ოთარაშვილი', N'Male', N'86312378745', CAST(N'1946-08-10' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (443, N'თენგიზ', N'კირკიტაძე', N'Male', N'54936528490', CAST(N'1966-06-02' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (444, N'ნოდარ', N'რუხაძე', N'Female', N'54428345197', CAST(N'1990-01-27' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (445, N'ცისანა', N'ხორავა', N'Female', N'49235963599', CAST(N'1982-11-12' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (446, N'ნუკრი', N'კარაპეტიანი', N'Male', N'41143489619', CAST(N'2005-09-05' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (447, N'ნატო', N'ენუქიძე', N'Female', N'20599115910', CAST(N'1976-09-04' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (448, N'ნუცა', N'ნაცვლიშვილი', N'Female', N'98127700295', CAST(N'1954-12-28' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (449, N'იოსებ', N'ბაქრაძე', N'Male', N'98767424841', CAST(N'1980-12-20' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (450, N'მარია', N'ქობალია', N'Male', N'94017610732', CAST(N'1950-04-22' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (451, N'ალექს', N'კახიძე', N'Male', N'57668751356', CAST(N'1990-04-25' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (452, N'ნუცა', N'ლორთქიფანიძე', N'Female', N'75308442026', CAST(N'2005-08-05' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (453, N'ეთერ', N'ფხაკაძე', N'Female', N'43388447170', CAST(N'2004-05-17' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (454, N'ვახტანგ', N'აბულაძე', N'Female', N'60698901233', CAST(N'2003-04-22' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (455, N'სერგო', N'გოცირიძე', N'Male', N'19415445365', CAST(N'1984-04-20' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (456, N'ჯონი', N'ქარჩავა', N'Female', N'29606094193', CAST(N'1956-07-05' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (457, N'ომარ', N'ქევხიშვილი', N'Female', N'82236920381', CAST(N'1980-07-14' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (458, N'ლელა', N'ლომსაძე', N'Male', N'01536493269', CAST(N'1949-11-03' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (459, N'ევგენია', N'ჩიხლაძე', N'Female', N'03222505050', CAST(N'1949-02-15' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (460, N'როინ', N'ჯანაშია', N'Female', N'41918028329', CAST(N'1998-09-22' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (461, N'დათო', N'ჯიშკარიანი', N'Male', N'16761716386', CAST(N'1958-07-17' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (462, N'ვაჟა', N'გეგეშიძე', N'Male', N'30439167946', CAST(N'1946-04-28' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (463, N'ზოია', N'ბოლქვაძე', N'Female', N'29235971845', CAST(N'1951-12-18' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (464, N'ზოია', N'ქირია', N'Female', N'20159229287', CAST(N'1981-11-08' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (465, N'უშანგი', N'ბერაია', N'Female', N'61429094473', CAST(N'1997-09-06' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (466, N'ნორა', N'ცაავა', N'Female', N'91816773378', CAST(N'1945-07-04' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (467, N'შორენა', N'მეტრეველი', N'Male', N'52098304923', CAST(N'1990-09-01' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (468, N'იური', N'ფიფია', N'Male', N'86125976692', CAST(N'1944-09-15' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (469, N'ლიდა', N'მაღლაკელიძე', N'Female', N'08616679970', CAST(N'1953-04-16' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (470, N'ვახტანგ', N'ფოფხაძე', N'Male', N'69650284130', CAST(N'1964-04-03' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (471, N'იური', N'სულაბერიძე', N'Female', N'90962013524', CAST(N'1958-06-08' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (472, N'გუგული', N'წულუკიძე', N'Female', N'60004644534', CAST(N'1989-02-03' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (473, N'ია', N'გოგინაშვილი', N'Female', N'42484535517', CAST(N'1972-10-16' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (474, N'თეონა', N'ტყებუჩავა', N'Male', N'51590518382', CAST(N'1964-03-02' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (475, N'ნოდარ', N'ქურდაძე', N'Female', N'10872823932', CAST(N'1997-12-16' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (476, N'ირმა', N'ბექაური', N'Female', N'06937400747', CAST(N'1966-06-05' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (477, N'ლანა', N'ხატიაშვილი', N'Female', N'11932788109', CAST(N'2001-08-23' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (478, N'ალა', N'ბასილაძე', N'Male', N'85935237094', CAST(N'1970-02-17' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (479, N'ჟანა', N'ძნელაძე', N'Female', N'33051045052', CAST(N'1996-10-10' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (480, N'მეგი', N'მღებრიშვილი', N'Female', N'35051056639', CAST(N'1984-05-28' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (481, N'ტატიანა', N'ნადირაშვილი', N'Male', N'73339281287', CAST(N'1986-08-02' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (482, N'ზვიად', N'მაჭავარიანი', N'Male', N'04494534710', CAST(N'1997-07-27' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (483, N'ნანა', N'ირემაძე', N'Female', N'41063131709', CAST(N'1949-10-08' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (484, N'ელზა', N'მახათაძე', N'Male', N'70779372727', CAST(N'2006-01-21' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (485, N'თინათინ', N'ხელაძე', N'Female', N'15936543024', CAST(N'1949-05-13' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (486, N'ლუდმილა', N'დუმბაძე', N'Female', N'62098204163', CAST(N'1996-05-30' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (487, N'თამარა', N'ადუაშვილი', N'Male', N'13521713166', CAST(N'2003-04-25' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (488, N'ბესიკ', N'გიგაური', N'Male', N'16402335317', CAST(N'1963-09-08' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (489, N'ირმა', N'ზოიძე', N'Male', N'62552664886', CAST(N'1994-07-25' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (490, N'ანა', N'მახარაშვილი', N'Male', N'02907253128', CAST(N'1964-07-02' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (491, N'რატი', N'ნაცვლიშვილი', N'Female', N'46289307065', CAST(N'2005-08-06' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (492, N'ვალენტინა', N'ვარდოსანიძე', N'Female', N'24708631581', CAST(N'1959-07-20' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (493, N'ნორა', N'ასათიანი', N'Female', N'36117898970', CAST(N'1963-10-12' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (494, N'ტატიანა', N'უგრეხელიძე', N'Male', N'80424873264', CAST(N'1992-01-20' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (495, N'როლანდ', N'ბრეგაძე', N'Male', N'74451426178', CAST(N'1949-12-13' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (496, N'ზურაბ', N'შათირიშვილი', N'Female', N'29713875435', CAST(N'1991-01-04' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (497, N'აკაკი', N'ოქრუაშვილი', N'Male', N'82718205647', CAST(N'2007-01-04' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (498, N'ელგუჯა', N'დარბაიძე', N'Male', N'30072299867', CAST(N'1968-01-24' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (499, N'ნუნუ', N'ქავთარაძე', N'Male', N'92047702360', CAST(N'1984-05-07' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (500, N'რიმა', N'კუბლაშვილი', N'Male', N'50933980473', CAST(N'1966-05-16' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (501, N'ლეილა', N'ქობალია', N'Female', N'78763070451', CAST(N'1969-12-02' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (502, N'ნოდარ', N'ჩხაიძე', N'Female', N'08430805927', CAST(N'1968-04-21' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (503, N'ვალერი', N'ლომაძე', N'Female', N'12842545916', CAST(N'1991-08-18' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (504, N'არმენ', N'დავითაძე', N'Female', N'50900303218', CAST(N'1952-12-27' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (505, N'სონია', N'ჩიქოვანი', N'Female', N'92671623897', CAST(N'1978-12-03' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (506, N'ოლია', N'კუპრეიშვილი', N'Female', N'33955589932', CAST(N'2005-05-08' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (507, N'კობა', N'გურგენიძე', N'Female', N'83833901928', CAST(N'1956-06-01' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (508, N'ანა', N'ალანია', N'Male', N'35765781457', CAST(N'1960-12-13' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (509, N'გულიკო', N'ყიფშიძე', N'Male', N'26267919588', CAST(N'2004-07-26' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (510, N'ჯონი', N'გოგინაშვილი', N'Male', N'33279853830', CAST(N'1975-10-13' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (511, N'გუგული', N'მეფარიშვილი', N'Female', N'17612792285', CAST(N'1971-09-08' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (512, N'მანანა', N'ფუტკარაძე', N'Male', N'33752255510', CAST(N'1998-11-17' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (513, N'გოგიტა', N'რევაზიშვილი', N'Female', N'52959819643', CAST(N'1973-01-10' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (514, N'მედეა', N'შაინიძე', N'Female', N'93990563975', CAST(N'1975-08-04' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (515, N'ელისო', N'ყაველაშვილი', N'Female', N'58418889318', CAST(N'1987-11-09' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (516, N'ლაშა', N'არჩვაძე', N'Female', N'88623958255', CAST(N'1981-08-11' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (517, N'ანა', N'მელიქიძე', N'Male', N'36415998687', CAST(N'1985-05-31' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (518, N'სიმონ', N'მიქელაძე', N'Female', N'29931655492', CAST(N'1990-11-16' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (519, N'ოლღა', N'კობახიძე', N'Female', N'04763516441', CAST(N'1971-11-09' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (520, N'ხატია', N'სამხარაძე', N'Female', N'12261424726', CAST(N'1998-04-04' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (521, N'ნადეჯდა', N'ბაკურაძე', N'Male', N'97763866008', CAST(N'1989-11-11' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (522, N'როზა', N'გაბედავა', N'Female', N'16660645110', CAST(N'1993-12-24' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (523, N'სოფია', N'ქარჩავა', N'Male', N'86089316892', CAST(N'1979-11-04' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (524, N'გულიკო', N'დოლიძე', N'Male', N'59396308332', CAST(N'1963-07-24' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (525, N'მარინე', N'მანაგაძე', N'Female', N'97698417072', CAST(N'1948-06-23' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (526, N'თამარა', N'კევლიშვილი', N'Male', N'04531109771', CAST(N'1973-03-22' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (527, N'ირინე', N'ხმალაძე', N'Male', N'20580908912', CAST(N'2006-12-31' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (528, N'კარლო', N'თურმანიძე', N'Female', N'68757918016', CAST(N'1962-02-02' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (529, N'მირიან', N'კოხრეიძე', N'Male', N'58943055721', CAST(N'2001-03-27' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (530, N'თეონა', N'ქორიძე', N'Male', N'51108511942', CAST(N'1944-12-02' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (531, N'ნაზიბროლა', N'გიორგაძე', N'Female', N'18921676004', CAST(N'2004-11-21' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (532, N'თამარ', N'გოგალაძე', N'Female', N'35531802353', CAST(N'1986-03-21' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (533, N'რუსუდან', N'ხაჭაპურიძე', N'Male', N'53257949032', CAST(N'2002-08-30' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (534, N'ალექს', N'ლომიძე', N'Female', N'16545901698', CAST(N'1999-10-02' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (535, N'ელმირა', N'თოფურია', N'Male', N'44501839197', CAST(N'1955-12-22' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (536, N'კახა', N'ქუთათელაძე', N'Female', N'91509302877', CAST(N'1993-12-15' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (537, N'ცისანა', N'ოქრუაშვილი', N'Male', N'73185534901', CAST(N'1965-10-21' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (538, N'ბიძინა', N'ბიგვავა', N'Female', N'31544317665', CAST(N'1958-01-16' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (539, N'მედეა', N'სანიკიძე', N'Female', N'42277790980', CAST(N'1948-03-07' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (540, N'ბელა', N'ნოზაძე', N'Female', N'87592582212', CAST(N'1963-07-11' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (541, N'ნუცა', N'კვირკველია', N'Female', N'66502615265', CAST(N'1963-10-31' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (542, N'ქეთო', N'გორგოძე', N'Female', N'49439335457', CAST(N'2000-07-06' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (543, N'გულიკო', N'ბიწაძე', N'Male', N'42311448236', CAST(N'2006-09-21' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (544, N'ჯემალ', N'ქუთათელაძე', N'Male', N'54308524689', CAST(N'2000-05-07' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (545, N'ლიკა', N'ქაჯაია', N'Female', N'81416128607', CAST(N'1952-02-05' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (546, N'ტარიელ', N'ადეიშვილი', N'Female', N'72509499278', CAST(N'1978-10-27' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (547, N'მარო', N'კუბლაშვილი', N'Male', N'78772113643', CAST(N'2001-12-24' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (548, N'ომარ', N'ვეკუა', N'Female', N'96324380659', CAST(N'2007-03-03' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (549, N'თეონა', N'ტაბატაძე', N'Male', N'11950338908', CAST(N'1967-03-24' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (550, N'იოსებ', N'ბეგიაშვილი', N'Female', N'80180585198', CAST(N'1990-11-24' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (551, N'ვალერიან', N'ანთაძე', N'Male', N'73649875230', CAST(N'1974-03-12' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (552, N'მიხეილ', N'ბალიაშვილი', N'Female', N'26931584368', CAST(N'1980-02-04' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (553, N'ნიკოლოზ', N'გვენეტაძე', N'Male', N'84197469236', CAST(N'1961-08-25' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (554, N'ცირა', N'ბიბილაშვილი', N'Female', N'70564630337', CAST(N'1991-03-02' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (555, N'ნუცა', N'ცარციძე', N'Male', N'20137256026', CAST(N'1967-01-08' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (556, N'გოგიტა', N'ბაქრაძე', N'Female', N'01478137005', CAST(N'1999-07-03' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (557, N'თინათინ', N'გაბედავა', N'Male', N'78645762908', CAST(N'1997-02-01' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (558, N'ოთარ', N'ქარცივაძე', N'Male', N'28249322966', CAST(N'1945-10-17' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (559, N'მიხეილ', N'კირვალიძე', N'Male', N'69034018646', CAST(N'2001-09-25' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (560, N'მურთაზ', N'ხაჩიძე', N'Male', N'95931172572', CAST(N'1974-05-25' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (561, N'აზა', N'ლომთაძე', N'Female', N'84609917707', CAST(N'1988-04-25' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (562, N'მარიამ', N'მჭედლიშვილი', N'Female', N'62111420039', CAST(N'1989-08-23' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (563, N'დავით', N'კუპრაშვილი', N'Male', N'78543242526', CAST(N'1958-01-13' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (564, N'ლელა', N'რაზმაძე', N'Male', N'73549540762', CAST(N'1984-05-29' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (565, N'მანანა', N'შარაშიძე', N'Female', N'34068396393', CAST(N'1999-07-27' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (566, N'ლუიზა', N'ხეცურიანი', N'Male', N'43944867631', CAST(N'1950-04-15' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (567, N'ანჟელა', N'თურმანიძე', N'Female', N'01928345402', CAST(N'1958-09-08' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (568, N'ალექსანდრე', N'ნაბიევი', N'Female', N'58244637697', CAST(N'2006-04-29' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (569, N'ელზა', N'ჩხეიძე', N'Female', N'12423937584', CAST(N'2003-05-31' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (570, N'კახა', N'ლეჟავა', N'Male', N'68983562055', CAST(N'1944-11-29' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (571, N'გელა', N'მეტრეველი', N'Female', N'14782372010', CAST(N'1996-03-04' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (572, N'ლევან', N'ჩადუნელი', N'Female', N'86697018677', CAST(N'1966-01-31' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (573, N'ნადია', N'ხვედელიძე', N'Female', N'41033894208', CAST(N'1974-09-12' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (574, N'დათო', N'იმნაძე', N'Female', N'99298602456', CAST(N'1972-03-09' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (575, N'კარლო', N'ქარჩავა', N'Male', N'98596658389', CAST(N'1946-08-24' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (576, N'ნადეჯდა', N'გოცირიძე', N'Male', N'51677353120', CAST(N'1968-09-26' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (577, N'ვერა', N'ტურაშვილი', N'Male', N'82317759363', CAST(N'2000-05-21' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (578, N'ოთარ', N'ტყეშელაშვილი', N'Female', N'06498182806', CAST(N'1985-11-13' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (579, N'კარინე', N'ხარაზიშვილი', N'Male', N'97458706888', CAST(N'1974-02-20' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (580, N'ციცინო', N'გოგინაშვილი', N'Female', N'50519316226', CAST(N'1979-07-16' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (581, N'ხათუნა', N'ჯიქია', N'Male', N'42353741046', CAST(N'1953-12-21' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (582, N'ნიკოლოზ', N'მელიქიძე', N'Female', N'59273570894', CAST(N'1971-04-22' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (583, N'გოგი', N'ნეფარიძე', N'Male', N'59615371282', CAST(N'1950-09-28' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (584, N'ხატია', N'მუშკუდიანი', N'Male', N'40995420037', CAST(N'1964-05-28' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (585, N'დალი', N'ჩიქოვანი', N'Female', N'97713199123', CAST(N'1985-04-19' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (586, N'მარიამ', N'კიკვაძე', N'Male', N'38195015035', CAST(N'1996-03-09' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (587, N'ვასილ', N'ადეიშვილი', N'Female', N'09809595197', CAST(N'1968-07-02' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (588, N'თეა', N'კვაჭაძე', N'Female', N'38903566500', CAST(N'1988-02-03' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (589, N'ნათელა', N'ბოკუჩავა', N'Female', N'89734488278', CAST(N'1961-09-04' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (590, N'ჯემალ', N'რამიშვილი', N'Male', N'82252589017', CAST(N'1972-04-07' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (591, N'მერი', N'ბარბაქაძე', N'Male', N'64852276088', CAST(N'1975-05-18' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (592, N'ივანე', N'ყურაშვილი', N'Male', N'44969981908', CAST(N'2000-07-18' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (593, N'გალინა', N'თოლორდავა', N'Female', N'89663594611', CAST(N'1991-03-09' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (594, N'პეტრე', N'ბუცხრიკიძე', N'Male', N'48857709765', CAST(N'1970-04-05' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (595, N'ნიკა', N'არველაძე', N'Female', N'73582360846', CAST(N'1988-08-07' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (596, N'ვანო', N'ტაბატაძე', N'Female', N'50258641205', CAST(N'1954-08-27' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (597, N'ნატო', N'ქირია', N'Female', N'52470827906', CAST(N'1998-03-01' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (598, N'ვალერიან', N'ქობულაძე', N'Female', N'06916990948', CAST(N'1968-10-05' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (599, N'ლარისა', N'გოგიტიძე', N'Male', N'34400514595', CAST(N'1972-09-14' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (600, N'სონია', N'ალიევა', N'Female', N'03929007908', CAST(N'1966-03-29' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (601, N'ანნა', N'კიკვაძე', N'Male', N'64064022489', CAST(N'1965-12-30' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (602, N'პეტრე', N'სამუშია', N'Female', N'36337061351', CAST(N'1998-06-15' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (603, N'ლამარა', N'თოდუა', N'Male', N'98706732789', CAST(N'1994-10-31' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (604, N'თინა', N'ბაქრაძე', N'Male', N'55929709601', CAST(N'1966-11-05' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (605, N'ლილი', N'ჩაჩანიძე', N'Female', N'48845487400', CAST(N'1956-04-10' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (606, N'ნანი', N'აფციაური', N'Male', N'19312602701', CAST(N'1981-01-11' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (607, N'ლანა', N'სანიკიძე', N'Female', N'66215526911', CAST(N'1962-02-23' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (608, N'რიტა', N'გუჯაბიძე', N'Female', N'55787961930', CAST(N'2003-03-10' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (609, N'ელმირა', N'ელიზბარაშვილი', N'Male', N'92859327131', CAST(N'1969-07-11' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (610, N'ნადია', N'ნოზაძე', N'Male', N'87711253737', CAST(N'1993-06-27' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (611, N'ავთანდილ', N'მამალაძე', N'Female', N'22622082918', CAST(N'2001-12-17' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (612, N'ზაზა', N'კევლიშვილი', N'Male', N'85997428691', CAST(N'1975-01-29' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (613, N'თენგიზ', N'ავალიანი', N'Male', N'27526969672', CAST(N'1949-09-13' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (614, N'თამუნა', N'სილაგაძე', N'Male', N'61230403260', CAST(N'1973-12-03' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (615, N'ნადია', N'ძნელაძე', N'Male', N'64541524447', CAST(N'1945-07-09' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (616, N'რამაზ', N'გაფრინდაშვილი', N'Male', N'18138043311', CAST(N'1977-11-10' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (617, N'მამუკა', N'დვალი', N'Male', N'23033038261', CAST(N'1982-07-21' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (618, N'გოგა', N'ელიზბარაშვილი', N'Male', N'57084941399', CAST(N'2003-03-20' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (619, N'ქეთინო', N'ჯოხაძე', N'Female', N'84394705434', CAST(N'1988-07-04' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (620, N'მზია', N'ყოლბაია', N'Female', N'83492905614', CAST(N'1983-06-20' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (621, N'დალი', N'მიმინოშვილი', N'Female', N'43207617425', CAST(N'1955-11-22' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (622, N'ნონა', N'ბენდელიანი', N'Female', N'50342139884', CAST(N'2005-10-22' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (623, N'რომან', N'კვარაცხელია', N'Male', N'92127561474', CAST(N'1961-12-18' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (624, N'დიმიტრი', N'ჯანაშია', N'Male', N'13677466308', CAST(N'2001-03-11' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (625, N'გულნარა', N'მინდიაშვილი', N'Female', N'86157049857', CAST(N'1992-07-15' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (626, N'ასლან', N'მანაგაძე', N'Male', N'24217576385', CAST(N'1966-11-09' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (627, N'ზაირა', N'წერეთელი', N'Male', N'45406015843', CAST(N'2001-05-17' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (628, N'რიტა', N'მამულაძე', N'Female', N'96412263708', CAST(N'1980-05-14' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (629, N'რუსუდან', N'კვაჭაძე', N'Female', N'79746253789', CAST(N'1965-02-11' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (630, N'ლუბა', N'ქუთათელაძე', N'Male', N'82227279727', CAST(N'1994-06-19' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (631, N'დიანა', N'ბოჭორიშვილი', N'Male', N'42653505415', CAST(N'1990-08-14' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (632, N'არმენ', N'ჩხაიძე', N'Female', N'72438102902', CAST(N'1972-10-05' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (633, N'ასმათ', N'კაჭარავა', N'Female', N'64438712793', CAST(N'1961-12-13' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (634, N'რუსუდან', N'ჯავახიშვილი', N'Female', N'50200254958', CAST(N'1960-04-10' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (635, N'ციური', N'ალიევა', N'Male', N'64614773809', CAST(N'1974-03-06' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (636, N'ლარისა', N'ანთაძე', N'Male', N'22873725600', CAST(N'1959-05-30' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (637, N'ალა', N'გაჩეჩილაძე', N'Female', N'39177175085', CAST(N'1978-01-14' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (638, N'ჟუჟუნა', N'მაჩიტიძე', N'Male', N'03943994147', CAST(N'1968-12-05' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (639, N'მაკა', N'ონიანი', N'Female', N'91984641212', CAST(N'1962-08-21' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (640, N'მზია', N'ცინცაძე', N'Male', N'97792388166', CAST(N'2002-12-02' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (641, N'მთვარისა', N'გელაძე', N'Male', N'44720587452', CAST(N'1959-06-23' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (642, N'როინ', N'დევიძე', N'Female', N'19951957462', CAST(N'1975-12-26' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (643, N'ჯონი', N'თავართქილაძე', N'Female', N'12866919946', CAST(N'2005-07-24' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (644, N'მარგალიტა', N'შამუგია', N'Female', N'09836183207', CAST(N'1957-10-12' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (645, N'სუსანა', N'მაისურაძე', N'Female', N'48758567009', CAST(N'1984-07-20' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (646, N'ალექს', N'ჭიჭინაძე', N'Female', N'36814592375', CAST(N'1997-05-17' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (647, N'ირმა', N'აბდულაევი', N'Male', N'52412638734', CAST(N'1974-09-29' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (648, N'ლიდა', N'ძნელაძე', N'Female', N'39896987328', CAST(N'1979-12-30' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (649, N'იოსებ', N'გვენეტაძე', N'Male', N'04093604157', CAST(N'1960-10-22' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (650, N'პავლე', N'მღებრიშვილი', N'Male', N'27323802694', CAST(N'1962-10-12' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (651, N'ნოდარ', N'კაცაძე', N'Male', N'34921545546', CAST(N'2003-01-28' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (652, N'ზაქარია', N'ხარებავა', N'Female', N'57535639865', CAST(N'1995-08-12' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (653, N'დიანა', N'ვალიევი', N'Male', N'74989269166', CAST(N'1971-09-09' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (654, N'ციური', N'ელბაქიძე', N'Male', N'63220818570', CAST(N'1991-04-26' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (655, N'კარინე', N'ნადირაშვილი', N'Male', N'06044955676', CAST(N'2005-02-17' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (656, N'ელენე', N'ხალვაში', N'Male', N'85370499085', CAST(N'1948-07-17' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (657, N'ლუბა', N'სილაგაძე', N'Male', N'03946641562', CAST(N'1999-07-31' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (658, N'გიგლა', N'ანდღულაძე', N'Male', N'43364273651', CAST(N'1997-12-23' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (659, N'დემურ', N'პაპიძე', N'Male', N'13290662397', CAST(N'1950-09-26' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (660, N'ნინო', N'ჩხეიძე', N'Male', N'53826197393', CAST(N'1989-01-22' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (661, N'მარიამ', N'კოპალიანი', N'Male', N'95001391563', CAST(N'1982-09-04' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (662, N'იამზე', N'არველაძე', N'Male', N'43412629674', CAST(N'2003-09-17' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (663, N'თამუნა', N'ლაბაძე', N'Female', N'25397153742', CAST(N'2001-07-08' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (664, N'ლუდმილა', N'ჯალაღონია', N'Female', N'42690376450', CAST(N'1952-07-10' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (665, N'ლილი', N'ნაჭყებია', N'Male', N'76949912849', CAST(N'1996-06-27' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (666, N'არმენ', N'გოგიშვილი', N'Male', N'35074730826', CAST(N'2004-10-31' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (667, N'ელენე', N'ნატროშვილი', N'Female', N'18026560798', CAST(N'1978-01-11' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (668, N'ლენა', N'ვეკუა', N'Female', N'46176852774', CAST(N'1988-08-18' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (669, N'თორნიკე', N'გაბელია', N'Male', N'00159683600', CAST(N'1945-05-07' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (670, N'ხატია', N'ჭკადუა', N'Female', N'46071840214', CAST(N'1984-06-22' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (671, N'ბონდო', N'ბლიაძე', N'Male', N'35000446818', CAST(N'1952-12-16' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (672, N'ლაშა', N'ყაველაშვილი', N'Female', N'46809660906', CAST(N'1960-05-12' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (673, N'აკაკი', N'მგელაძე', N'Female', N'66212893531', CAST(N'1950-09-25' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (674, N'დარეჯან', N'კალანდაძე', N'Female', N'03830213768', CAST(N'1974-09-07' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (675, N'ჯუმბერ', N'ფოფხაძე', N'Female', N'60017254166', CAST(N'2005-10-28' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (676, N'მაყვალა', N'ქავთარაძე', N'Male', N'16980833742', CAST(N'1993-06-09' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (677, N'ეკა', N'მელაძე', N'Female', N'01075152429', CAST(N'2005-10-15' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (678, N'ბადრი', N'ქავთარაძე', N'Male', N'16344434039', CAST(N'1957-01-13' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (679, N'ნოდარ', N'კუჭავა', N'Female', N'17379035100', CAST(N'1968-10-06' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (680, N'რიმა', N'ელიზბარაშვილი', N'Male', N'21266167209', CAST(N'1957-07-28' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (681, N'ვალერი', N'ჯოჯუა', N'Male', N'56165488920', CAST(N'1956-09-26' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (682, N'ბექა', N'პეტროსიანი', N'Male', N'01046377889', CAST(N'1957-11-24' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (683, N'ნუკრი', N'ლაგვილავა', N'Male', N'56073636991', CAST(N'1952-12-27' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (684, N'ნიკოლოზ', N'სანიკიძე', N'Male', N'17022687112', CAST(N'2000-05-03' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (685, N'ოლია', N'მაჩიტიძე', N'Male', N'50476385617', CAST(N'1947-05-13' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (686, N'ნარგიზა', N'ტაბატაძე', N'Female', N'05330250688', CAST(N'2005-10-22' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (687, N'რამაზ', N'მაჩიტიძე', N'Male', N'03639675804', CAST(N'1999-02-11' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (688, N'ალექს', N'მერაბიშვილი', N'Male', N'86940538034', CAST(N'1996-09-21' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (689, N'რუსუდან', N'მუსტაფაევი', N'Male', N'94981473606', CAST(N'1971-10-08' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (690, N'მარიკა', N'ახალაია', N'Female', N'71744087550', CAST(N'1999-08-24' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (691, N'პაატა', N'სიხარულიძე', N'Female', N'82331557385', CAST(N'1986-04-03' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (692, N'მარგალიტა', N'გობეჯიშვილი', N'Male', N'28934355307', CAST(N'1998-08-08' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (693, N'სერგო', N'ყოლბაია', N'Female', N'12576800593', CAST(N'1978-02-20' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (694, N'ჯონი', N'კევლიშვილი', N'Female', N'41882015730', CAST(N'1975-03-15' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (695, N'დალი', N'მგელაძე', N'Male', N'29611362623', CAST(N'1981-02-21' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (696, N'თენგიზ', N'გოგიტიძე', N'Female', N'89282073285', CAST(N'1974-11-25' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (697, N'ჯაბა', N'ძიძიგური', N'Female', N'91615386709', CAST(N'2006-09-29' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (698, N'ელიზა', N'გვენეტაძე', N'Female', N'95145513183', CAST(N'1974-09-18' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (699, N'ლიანა', N'ლობჯანიძე', N'Male', N'19102173416', CAST(N'1967-04-27' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (700, N'ნანული', N'მაჩიტიძე', N'Male', N'96614571168', CAST(N'1987-06-11' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (701, N'მარიკა', N'ნარიმანიძე', N'Female', N'26346799609', CAST(N'1999-06-14' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (702, N'მარინა', N'ლობჟანიძე', N'Female', N'13480460846', CAST(N'2001-02-03' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (703, N'მაკა', N'ზოიძე', N'Male', N'21096202334', CAST(N'1990-09-06' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (704, N'არჩილ', N'გაბაიძე', N'Female', N'14682807722', CAST(N'1944-09-27' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (705, N'ალა', N'პაპიძე', N'Female', N'12672622902', CAST(N'1967-04-01' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (706, N'მალხაზ', N'იაშვილი', N'Male', N'07499200074', CAST(N'1953-09-24' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (707, N'ლუიზა', N'ჯანჯღავა', N'Female', N'60689479545', CAST(N'1997-03-01' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (708, N'ნანი', N'ბურჯანაძე', N'Female', N'01646566860', CAST(N'1973-12-29' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (709, N'ლარისა', N'ჯაფარიძე', N'Female', N'89244634849', CAST(N'2003-05-22' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (710, N'გივი', N'გოგუა', N'Female', N'49281871213', CAST(N'1964-06-27' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (711, N'ლუბა', N'კაკულია', N'Male', N'67115178786', CAST(N'1994-08-18' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (712, N'გიგლა', N'გაფრინდაშვილი', N'Female', N'48565737736', CAST(N'1996-06-12' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (713, N'თეონა', N'ჭკადუა', N'Female', N'28885968874', CAST(N'2005-08-16' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (714, N'ნაზიკო', N'ნაკაშიძე', N'Female', N'47927123652', CAST(N'1997-04-28' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (715, N'ნელი', N'ბერაძე', N'Female', N'17240625651', CAST(N'1991-04-30' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (716, N'გალინა', N'სიმონიშვილი', N'Female', N'08029329487', CAST(N'1990-10-29' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (717, N'სოფია', N'კაკულია', N'Female', N'82699559070', CAST(N'1959-01-02' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (718, N'შაქრო', N'რეხვიაშვილი', N'Female', N'36715777746', CAST(N'1947-02-12' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (719, N'ლილი', N'ნემსაძე', N'Male', N'24539928158', CAST(N'2001-10-06' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (720, N'უჩა', N'ზედგინიძე', N'Male', N'71061052023', CAST(N'1997-05-20' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (721, N'ნაირა', N'ურუშაძე', N'Female', N'99852834327', CAST(N'1955-12-30' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (722, N'ნაზიკო', N'პეტრიაშვილი', N'Female', N'42310147558', CAST(N'1957-10-22' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (723, N'ლამზირა', N'ცაავა', N'Female', N'40766253796', CAST(N'1994-04-01' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (724, N'ნორა', N'ონიანი', N'Male', N'82010408649', CAST(N'1967-04-11' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (725, N'ფიქრია', N'გაჯიევა', N'Male', N'82653983087', CAST(N'2000-07-19' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (726, N'ჟუჟუნა', N'კაკულია', N'Female', N'00216814352', CAST(N'1979-05-07' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (727, N'გიგლა', N'ბერაია', N'Male', N'41936885440', CAST(N'1989-12-26' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (728, N'მურთაზ', N'ჯანაშია', N'Female', N'08828302579', CAST(N'1994-11-12' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (729, N'ვენერა', N'გვენეტაძე', N'Female', N'86054876666', CAST(N'1977-02-23' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (730, N'ფატი', N'გველესიანი', N'Female', N'74492287037', CAST(N'1991-08-15' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (731, N'ნუგზარ', N'დიასამიძე', N'Male', N'57568759472', CAST(N'2005-10-01' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (732, N'რეზო', N'კაცაძე', N'Female', N'53691929614', CAST(N'1980-11-15' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (733, N'კლარა', N'მელაძე', N'Male', N'80174345667', CAST(N'2001-12-22' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (734, N'ნატო', N'გორგოძე', N'Male', N'37396779887', CAST(N'1961-02-17' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (735, N'ზოია', N'გოგიშვილი', N'Male', N'72725373299', CAST(N'1987-08-31' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (736, N'ნადია', N'გრიგორიანი', N'Male', N'53744556643', CAST(N'1979-11-08' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (737, N'ხატია', N'კურტანიძე', N'Female', N'70975182113', CAST(N'1967-08-04' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (738, N'გოგა', N'ნეფარიძე', N'Male', N'90432018400', CAST(N'1956-11-05' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (739, N'ლეილა', N'მაღლაკელიძე', N'Female', N'05873495016', CAST(N'1970-01-24' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (740, N'ციცინო', N'კირკიტაძე', N'Female', N'51173487252', CAST(N'2001-12-29' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (741, N'ინეზა', N'ჯოჯუა', N'Male', N'50136181404', CAST(N'1971-12-04' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (742, N'ნაირა', N'ვეკუა', N'Male', N'23211817504', CAST(N'1993-12-29' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (743, N'თემურ', N'სირაძე', N'Male', N'29328595734', CAST(N'1952-02-13' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (744, N'როზა', N'ნატროშვილი', N'Male', N'84176510911', CAST(N'1984-08-12' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (745, N'ნათია', N'ხიზანიშვილი', N'Female', N'81858896695', CAST(N'1958-06-10' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (746, N'ნანა', N'სარალიძე', N'Male', N'52507072262', CAST(N'1947-07-02' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (747, N'ფატი', N'თოდუა', N'Male', N'77543750877', CAST(N'1996-03-22' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (748, N'ხატია', N'გაბედავა', N'Male', N'33790170156', CAST(N'1977-05-01' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (749, N'რიტა', N'ბურდული', N'Female', N'52467100751', CAST(N'1985-01-21' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (750, N'გოდერძი', N'ლეჟავა', N'Female', N'47546386376', CAST(N'1996-12-24' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (751, N'გოჩა', N'აფციაური', N'Male', N'24749299750', CAST(N'1990-08-03' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (752, N'გულნარა', N'ხატიაშვილი', N'Male', N'11751877713', CAST(N'1992-11-21' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (753, N'დარეჯან', N'გულიაშვილი', N'Male', N'04229279656', CAST(N'1953-07-12' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (754, N'ნუგზარ', N'ბიწაძე', N'Female', N'19936365526', CAST(N'2006-12-31' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (755, N'დათო', N'ფოფხაძე', N'Female', N'16476372009', CAST(N'1994-01-02' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (756, N'რომან', N'კირთაძე', N'Male', N'81054493089', CAST(N'1954-12-26' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (757, N'ავთანდილ', N'ბუკია', N'Female', N'23171553127', CAST(N'1949-04-11' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (758, N'ელგუჯა', N'გაგნიძე', N'Female', N'05130395514', CAST(N'1945-11-28' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (759, N'თამილა', N'ცეცხლაძე', N'Male', N'89925975291', CAST(N'1998-01-17' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (760, N'ასმათ', N'წიქარიშვილი', N'Male', N'61286493895', CAST(N'1966-07-07' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (761, N'ნინელი', N'მჭედლიძე', N'Female', N'74663088970', CAST(N'1977-01-16' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (762, N'ბადრი', N'კაზარიანი', N'Female', N'47123938080', CAST(N'1962-02-14' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (763, N'ნათელა', N'მეფარიშვილი', N'Male', N'89296413093', CAST(N'1976-01-16' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (764, N'სოსო', N'სალუქვაძე', N'Male', N'39677244862', CAST(N'1975-08-02' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (765, N'ალექსანდრე', N'ბეჟანიძე', N'Female', N'24489906160', CAST(N'1999-12-25' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (766, N'ვიოლეტა', N'ონიანი', N'Male', N'18939995261', CAST(N'1998-08-25' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (767, N'ნიკოლოზ', N'ბერიშვილი', N'Female', N'27446636816', CAST(N'1973-12-28' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (768, N'ჟუჟუნა', N'ჯავახიშვილი', N'Female', N'38763955758', CAST(N'1970-11-26' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (769, N'პეტრე', N'წერეთელი', N'Male', N'78585947073', CAST(N'1998-02-17' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (770, N'გოჩა', N'ღლონტი', N'Male', N'01513965557', CAST(N'1981-09-13' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (771, N'ვერა', N'გოგიტიძე', N'Female', N'54753399658', CAST(N'1979-08-19' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (772, N'თამუნა', N'ბაკურაძე', N'Male', N'19378462100', CAST(N'1945-06-27' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (773, N'სულიკო', N'გუჯაბიძე', N'Male', N'05315781229', CAST(N'1948-05-04' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (774, N'ნადეჯდა', N'ჯინჭარაძე', N'Female', N'14436491469', CAST(N'1981-02-19' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (775, N'ნანი', N'კალანდია', N'Male', N'56218225717', CAST(N'1953-12-28' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (776, N'იზა', N'სანიკიძე', N'Male', N'08015908472', CAST(N'1968-04-25' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (777, N'ანიკო', N'ლოლაძე', N'Male', N'14859872453', CAST(N'1970-07-18' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (778, N'გიგლა', N'ხარატიშვილი', N'Female', N'12225883738', CAST(N'1990-11-24' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (779, N'სულიკო', N'სირაძე', N'Male', N'62237919372', CAST(N'1964-04-02' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (780, N'ბიძინა', N'ქუთათელაძე', N'Female', N'10556857913', CAST(N'2007-05-03' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (781, N'სიმონ', N'დავითაშვილი', N'Female', N'04143369472', CAST(N'1996-02-29' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (782, N'ედუარდ', N'ასათიანი', N'Female', N'58018544945', CAST(N'2005-04-16' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (783, N'თამილა', N'ლობჯანიძე', N'Female', N'42397705105', CAST(N'1963-02-20' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (784, N'აზა', N'კუჭავა', N'Female', N'41199921344', CAST(N'1950-05-07' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (785, N'ინეზა', N'ბერუაშვილი', N'Female', N'56000436968', CAST(N'1980-09-13' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (786, N'ასლან', N'კობიაშვილი', N'Female', N'60890548512', CAST(N'1999-06-19' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (787, N'დიმიტრი', N'გაჯიევი', N'Male', N'45576351429', CAST(N'1972-02-18' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (788, N'კობა', N'კარაპეტიანი', N'Female', N'61876644178', CAST(N'1959-08-31' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (789, N'გოგა', N'ბერიანიძე', N'Female', N'57667312278', CAST(N'1953-12-20' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (790, N'ბიძინა', N'მჭედლიშვილი', N'Female', N'27772220465', CAST(N'1985-05-19' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (791, N'ასლან', N'გველესიანი', N'Female', N'22410375538', CAST(N'1979-05-06' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (792, N'გოგიტა', N'კალანდია', N'Female', N'81927084903', CAST(N'1998-07-11' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (793, N'როზა', N'კინწურაშვილი', N'Male', N'76510864847', CAST(N'1954-07-21' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (794, N'ჯულიეტა', N'აბდულაევი', N'Male', N'31844876472', CAST(N'1990-08-15' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (795, N'მურთაზ', N'მაისურაძე', N'Female', N'70238271345', CAST(N'1950-11-03' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (796, N'ქრისტინე', N'ვარშანიძე', N'Male', N'41950823778', CAST(N'1975-04-21' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (797, N'ეკა', N'კონცელიძე', N'Female', N'42135483151', CAST(N'1962-03-10' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (798, N'ნესტან', N'ავალიანი', N'Female', N'31828977185', CAST(N'1997-02-05' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (799, N'ოთარ', N'კანდელაკი', N'Male', N'85558863382', CAST(N'1956-04-21' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (800, N'ზინა', N'იაშვილი', N'Female', N'18656272467', CAST(N'1976-08-24' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (801, N'ასლან', N'გაგუა', N'Female', N'41794435329', CAST(N'1980-11-01' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (802, N'ფიქრია', N'შეყილაძე', N'Female', N'91086267071', CAST(N'1975-03-06' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (803, N'მარია', N'შალამბერიძე', N'Female', N'20380952805', CAST(N'2007-03-16' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (804, N'ნატო', N'ჭინჭარაული', N'Male', N'15443892110', CAST(N'1958-06-15' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (805, N'მირანდა', N'ბერაძე', N'Female', N'22145489909', CAST(N'1978-11-13' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (806, N'გოდერძი', N'გოგოლაძე', N'Male', N'30476865223', CAST(N'1955-03-15' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (807, N'ტარიელ', N'ბენიძე', N'Male', N'55146894647', CAST(N'1997-10-18' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (808, N'ამირან', N'დუმბაძე', N'Male', N'57302102444', CAST(N'1962-03-12' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (809, N'ნაზიბროლა', N'კვანტალიანი', N'Male', N'48884433994', CAST(N'1984-03-14' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (810, N'ბესიკ', N'ლორთქიფანიძე', N'Female', N'83800906683', CAST(N'1986-08-04' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (811, N'ჟუჟუნა', N'მეტრეველი', N'Female', N'41433342299', CAST(N'1994-03-03' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (812, N'ვერა', N'ჯიბლაძე', N'Female', N'37725334471', CAST(N'1948-08-25' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (813, N'მარი', N'მაჭარაშვილი', N'Male', N'18151459580', CAST(N'1975-08-21' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (814, N'ნორა', N'გველესიანი', N'Male', N'63339939250', CAST(N'1947-12-19' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (815, N'რეზო', N'ჭიჭინაძე', N'Male', N'27375412927', CAST(N'1967-11-30' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (816, N'ზაირა', N'მინდიაშვილი', N'Male', N'99104381983', CAST(N'1963-11-13' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (817, N'ვერიკო', N'ნაკაშიძე', N'Female', N'33129117717', CAST(N'1956-09-10' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (818, N'ციცინო', N'გობეჯიშვილი', N'Female', N'41967173422', CAST(N'2002-05-01' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (819, N'ინეზა', N'გოგიძე', N'Male', N'30173491715', CAST(N'1986-03-13' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (820, N'მაგდა', N'გვენეტაძე', N'Male', N'79452160129', CAST(N'1971-04-26' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (821, N'ლევან', N'მამულაშვილი', N'Male', N'11143485401', CAST(N'1951-08-24' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (822, N'ამირან', N'წურწუმია', N'Male', N'10161745609', CAST(N'2000-09-25' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (823, N'ჟანა', N'კუჭუხიძე', N'Male', N'92186837135', CAST(N'1953-06-23' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (824, N'გოჩა', N'ბერუაშვილი', N'Female', N'78703118093', CAST(N'1983-02-22' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (825, N'ლუბა', N'ნაბიევი', N'Male', N'44054578859', CAST(N'1978-11-01' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (826, N'დალი', N'იაშვილი', N'Male', N'39307423826', CAST(N'1967-05-31' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (827, N'ანა', N'ფუტკარაძე', N'Male', N'47140890130', CAST(N'1976-07-04' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (828, N'ნადია', N'რუხაძე', N'Male', N'24889030419', CAST(N'1948-08-12' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (829, N'გიგა', N'ქობალია', N'Male', N'58529713044', CAST(N'2005-07-10' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (830, N'ინგა', N'გაბრიჭიძე', N'Male', N'55411066638', CAST(N'1997-06-20' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (831, N'თამარა', N'ოქრუაშვილი', N'Female', N'49252450139', CAST(N'2000-07-11' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (832, N'ამირან', N'კუპატაძე', N'Female', N'63202257649', CAST(N'1996-08-13' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (833, N'რუსუდან', N'მჭედლიშვილი', N'Female', N'27480272956', CAST(N'2005-03-01' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (834, N'ნიკა', N'ლურსმანაშვილი', N'Female', N'45233361185', CAST(N'1968-11-04' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (835, N'ალექსანდრე', N'ვალიევა', N'Female', N'10684543156', CAST(N'2000-07-23' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (836, N'ეთერ', N'მღებრიშვილი', N'Male', N'30141226129', CAST(N'1989-01-22' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (837, N'ზაზა', N'ელიზბარაშვილი', N'Male', N'14882145969', CAST(N'1945-10-12' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (838, N'მაგდა', N'გოგიშვილი', N'Male', N'56789955914', CAST(N'1946-05-25' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (839, N'რუსუდან', N'ფანცულაია', N'Male', N'13462443745', CAST(N'1968-12-27' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (840, N'ნაირა', N'ხორავა', N'Female', N'46355805743', CAST(N'2000-11-02' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (841, N'ლელა', N'რაზმაძე', N'Female', N'79300087320', CAST(N'2001-03-04' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (842, N'რიტა', N'ჭიღლაძე', N'Male', N'49320839681', CAST(N'1947-08-26' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (843, N'მედეა', N'ბუჩუკური', N'Female', N'79434398346', CAST(N'1968-08-07' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (844, N'გიგა', N'ქევხიშვილი', N'Female', N'93280633103', CAST(N'1976-02-05' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (845, N'ციცინო', N'ხაჩიძე', N'Male', N'32783959077', CAST(N'1992-02-25' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (846, N'როინ', N'ხოზრევანიძე', N'Female', N'88664658704', CAST(N'1976-12-01' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (847, N'ვანო', N'ვაშაკიძე', N'Male', N'31047996971', CAST(N'1962-02-27' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (848, N'თამთა', N'მამალაძე', N'Female', N'10510608658', CAST(N'1963-01-14' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (849, N'ვახტანგ', N'ნიჟარაძე', N'Female', N'73899718919', CAST(N'1974-03-06' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (850, N'ლარისა', N'ფიფია', N'Female', N'32747051823', CAST(N'1968-02-12' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (851, N'ქეთო', N'ცომაია', N'Female', N'15719941149', CAST(N'1965-06-01' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (852, N'პავლე', N'ანდღულაძე', N'Male', N'16647848273', CAST(N'1993-09-29' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (853, N'მამუკა', N'ცაავა', N'Male', N'99018411758', CAST(N'1948-05-06' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (854, N'კახაბერ', N'გაბუნია', N'Female', N'49276336943', CAST(N'1974-01-01' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (855, N'გოჩა', N'აბესაძე', N'Male', N'96387523658', CAST(N'1988-10-05' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (856, N'ასმათ', N'თოლორდავა', N'Male', N'51239172147', CAST(N'1977-05-21' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (857, N'არჩილ', N'კაცაძე', N'Male', N'03749724185', CAST(N'1952-11-06' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (858, N'ბესარიონ', N'ბარბაქაძე', N'Female', N'68300592998', CAST(N'1980-10-11' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (859, N'რიტა', N'მელიქიშვილი', N'Male', N'10838115963', CAST(N'1967-01-06' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (860, N'თენგიზ', N'ბეგიაშვილი', N'Female', N'57030856192', CAST(N'1962-08-28' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (861, N'ბესარიონ', N'კვირკველია', N'Female', N'72781822528', CAST(N'1950-06-03' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (862, N'ჟუჟუნა', N'ბრეგვაძე', N'Male', N'07389338320', CAST(N'1968-10-17' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (863, N'არმენ', N'უგრეხელიძე', N'Female', N'37740113279', CAST(N'1988-08-07' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (864, N'გალინა', N'მიმინოშვილი', N'Male', N'81259297303', CAST(N'2006-02-04' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (865, N'მაია', N'პეტროსიანი', N'Male', N'60245281203', CAST(N'2006-12-19' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (866, N'პავლე', N'მიქელაძე', N'Male', N'26033860502', CAST(N'1998-08-17' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (867, N'ქეთინო', N'ჯანჯღავა', N'Male', N'18943033207', CAST(N'1969-02-24' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (868, N'ლანა', N'გიორგაძე', N'Male', N'56431392305', CAST(N'1986-07-13' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (869, N'დარეჯან', N'გურეშიძე', N'Male', N'08422569652', CAST(N'1959-12-14' AS Date), 17, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (870, N'ლიდა', N'დევაძე', N'Female', N'31943443343', CAST(N'1962-12-14' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (871, N'ბექა', N'ვალიევა', N'Female', N'59616079634', CAST(N'1975-10-06' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (872, N'ალექსანდრე', N'ქარჩავა', N'Female', N'66543761399', CAST(N'1948-06-28' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (873, N'მამუკა', N'გაბაიძე', N'Male', N'94358238401', CAST(N'1947-12-04' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (874, N'ზაზა', N'წულაია', N'Female', N'62058857003', CAST(N'1966-12-24' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (875, N'გია', N'ისაევი', N'Male', N'45464803082', CAST(N'1995-11-10' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (876, N'გიგა', N'დარბაიძე', N'Female', N'17079142744', CAST(N'1994-08-14' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (877, N'ვანო', N'გაჯიევა', N'Female', N'38742227977', CAST(N'1993-01-20' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (878, N'ირინე', N'ურუშაძე', N'Male', N'10385260667', CAST(N'1991-11-19' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (879, N'ლუიზა', N'ჭაღალიძე', N'Male', N'13452117002', CAST(N'1949-03-15' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (880, N'მარია', N'ტურაშვილი', N'Male', N'94934729945', CAST(N'1965-07-04' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (881, N'ჟანა', N'გველესიანი', N'Male', N'64014559910', CAST(N'1983-03-10' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (882, N'ვალერიან', N'კერესელიძე', N'Female', N'01809298461', CAST(N'1949-01-15' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (883, N'თეონა', N'კვაჭაძე', N'Female', N'07409887869', CAST(N'1978-07-30' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (884, N'ნიკოლოზ', N'გელაშვილი', N'Male', N'81616252863', CAST(N'1958-03-01' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (885, N'მირანდა', N'თედორაძე', N'Male', N'27054894477', CAST(N'1986-01-06' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (886, N'დალი', N'ქირია', N'Male', N'45602973649', CAST(N'1946-05-15' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (887, N'სონია', N'ბიბილაშვილი', N'Male', N'57962182239', CAST(N'2001-10-31' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (888, N'ნოდარ', N'ბეგიაშვილი', N'Male', N'77159268273', CAST(N'2004-07-14' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (889, N'შაქრო', N'კვირკველია', N'Male', N'55678851720', CAST(N'1996-03-12' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (890, N'ლენა', N'მეფარიშვილი', N'Male', N'94938490257', CAST(N'1973-01-27' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (891, N'ნუცა', N'ქამადაძე', N'Male', N'99060608895', CAST(N'1974-03-18' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (892, N'ჯემალ', N'წერეთელი', N'Male', N'74538707208', CAST(N'1962-10-10' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (893, N'მაია', N'კუხიანიძე', N'Male', N'88113359142', CAST(N'1969-04-28' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (894, N'პეტრე', N'სოფრომაძე', N'Male', N'99937586060', CAST(N'1959-06-16' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (895, N'ელისო', N'ბაკურაძე', N'Female', N'97989179904', CAST(N'1970-09-09' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (896, N'ვალერი', N'დოლიძე', N'Female', N'26475861391', CAST(N'1999-06-26' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (897, N'ლუბა', N'კვანტალიანი', N'Female', N'47351811326', CAST(N'1973-03-05' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (898, N'ლელა', N'დოლიძე', N'Female', N'92816192760', CAST(N'1974-03-14' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (899, N'ნადეჯდა', N'ზარანდია', N'Female', N'62799301256', CAST(N'2005-02-06' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (900, N'ლენა', N'ფუტკარაძე', N'Male', N'89863201203', CAST(N'1956-08-18' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (901, N'ია', N'ქუთათელაძე', N'Male', N'37294115987', CAST(N'1965-02-25' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (902, N'ფატიმა', N'ფიცხელაური', N'Male', N'10361671442', CAST(N'1964-10-20' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (903, N'ნინო', N'ჭიღლაძე', N'Female', N'92999698478', CAST(N'1949-05-11' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (904, N'სვეტლანა', N'ჟღენტი', N'Female', N'05183220897', CAST(N'1961-11-06' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (905, N'ალექს', N'კუჭავა', N'Female', N'40590269709', CAST(N'1995-05-12' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (906, N'მალხაზ', N'კევლიშვილი', N'Female', N'30797229284', CAST(N'1957-07-20' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (907, N'პაატა', N'კაჭარავა', N'Female', N'50246297725', CAST(N'1959-12-14' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (908, N'ბონდო', N'ბლიაძე', N'Male', N'73513766682', CAST(N'1972-03-02' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (909, N'პავლე', N'ოქრუაშვილი', N'Male', N'28419513828', CAST(N'1979-12-31' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (910, N'გულნარა', N'გაბუნია', N'Female', N'67364381609', CAST(N'1982-05-16' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (911, N'ვაჟა', N'როგავა', N'Female', N'02473704850', CAST(N'1990-05-18' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (912, N'მინდია', N'მუშკუდიანი', N'Female', N'76825321857', CAST(N'1995-05-01' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (913, N'ჟენია', N'ჯანიაშვილი', N'Female', N'91391121775', CAST(N'1975-12-08' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (914, N'მირიან', N'ბალიაშვილი', N'Female', N'95367826731', CAST(N'1954-02-08' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (915, N'თამარ', N'ჭიჭინაძე', N'Male', N'57170225627', CAST(N'1947-01-18' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (916, N'თეონა', N'ირემაძე', N'Female', N'48196106416', CAST(N'2002-03-06' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (917, N'თამთა', N'უგრეხელიძე', N'Male', N'34846606450', CAST(N'1993-11-05' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (918, N'ლიდა', N'კახიძე', N'Female', N'59094387258', CAST(N'2002-05-19' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (919, N'მიხეილ', N'კევლიშვილი', N'Female', N'42852940691', CAST(N'1989-08-06' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (920, N'ლიანა', N'ჭკადუა', N'Male', N'70205296286', CAST(N'1961-10-21' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (921, N'როინ', N'ჯანჯღავა', N'Female', N'29944821437', CAST(N'1969-09-26' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (922, N'ირინე', N'მიქავა', N'Male', N'81930216943', CAST(N'1985-05-18' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (923, N'ელზა', N'ხელაძე', N'Male', N'15957777799', CAST(N'1949-05-26' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (924, N'ილია', N'გოცირიძე', N'Male', N'73666560714', CAST(N'1961-01-12' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (925, N'ირაკლი', N'ადამია', N'Female', N'66390688318', CAST(N'1996-01-14' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (926, N'არჩილ', N'ცერცვაძე', N'Female', N'94421020799', CAST(N'1991-05-14' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (927, N'მერი', N'ოქროპირიძე', N'Male', N'13840456982', CAST(N'1998-11-20' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (928, N'გიგლა', N'ახვლედიანი', N'Female', N'17987064593', CAST(N'1951-05-30' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (929, N'როლანდ', N'გვენეტაძე', N'Female', N'83069484969', CAST(N'2006-03-20' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (930, N'გიგა', N'ოქრუაშვილი', N'Male', N'57882083554', CAST(N'2003-02-19' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (931, N'აზა', N'მიქაბერიძე', N'Female', N'91613787957', CAST(N'1978-07-28' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (932, N'ფატიმა', N'გელაშვილი', N'Female', N'84672536751', CAST(N'1953-12-11' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (933, N'ბიძინა', N'ხარაბაძე', N'Male', N'28481133101', CAST(N'1959-09-03' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (934, N'ირინა', N'ცეცხლაძე', N'Female', N'32279217642', CAST(N'1945-05-24' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (935, N'ზაირა', N'იმნაძე', N'Female', N'03667199901', CAST(N'1952-12-11' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (936, N'ელზა', N'ალიევა', N'Female', N'27695814770', CAST(N'1952-10-27' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (937, N'დავით', N'ლურსმანაშვილი', N'Male', N'50076673006', CAST(N'1967-06-26' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (938, N'გიგლა', N'ბიგვავა', N'Male', N'30611585328', CAST(N'1981-08-20' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (939, N'ლეილა', N'სირაძე', N'Female', N'12376339888', CAST(N'1998-01-19' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (940, N'თეონა', N'გურგენიძე', N'Male', N'86471768612', CAST(N'1990-05-03' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (941, N'ირინე', N'იმნაძე', N'Male', N'80793999676', CAST(N'1985-07-20' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (942, N'ემა', N'ყიფშიძე', N'Male', N'51704685415', CAST(N'1962-01-13' AS Date), 15, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (943, N'ვლადიმერ', N'კობახიძე', N'Female', N'43115021529', CAST(N'1945-04-21' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (944, N'სოფიკო', N'გურეშიძე', N'Female', N'27263277866', CAST(N'1952-06-14' AS Date), 1, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (945, N'ილია', N'ჟღენტი', N'Male', N'22481275908', CAST(N'1948-10-07' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (946, N'რუსუდან', N'გვასალია', N'Female', N'24946075794', CAST(N'1991-11-15' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (947, N'კარინე', N'ბლიაძე', N'Male', N'24851191495', CAST(N'1959-04-21' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (948, N'ჯულიეტა', N'ბალიაშვილი', N'Female', N'60768279022', CAST(N'1951-09-12' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (949, N'მედეა', N'ბასილაძე', N'Male', N'61489637123', CAST(N'1957-10-22' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (950, N'თეიმურაზ', N'შალამბერიძე', N'Male', N'04606973300', CAST(N'1981-06-14' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (951, N'გენადი', N'ნეფარიძე', N'Male', N'07938119297', CAST(N'2006-07-06' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (952, N'მაყვალა', N'სამუშია', N'Male', N'29676929359', CAST(N'1960-01-19' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (953, N'ბადრი', N'მუსაევი', N'Male', N'99457497259', CAST(N'1962-03-08' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (954, N'აიდა', N'ჯანჯღავა', N'Female', N'56121158084', CAST(N'1974-01-21' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (955, N'გოდერძი', N'ჟვანია', N'Male', N'07095382024', CAST(N'1957-12-25' AS Date), 4, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (956, N'მურმან', N'არველაძე', N'Female', N'34095062783', CAST(N'1991-05-24' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (957, N'უშანგი', N'ფიფია', N'Female', N'68908979030', CAST(N'2001-02-07' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (958, N'ანი', N'გიორგაძე', N'Male', N'54158989873', CAST(N'2000-08-31' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (959, N'თეა', N'ანდღულაძე', N'Male', N'83700600238', CAST(N'1982-07-12' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (960, N'დალი', N'ქევხიშვილი', N'Male', N'64315810757', CAST(N'1989-05-13' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (961, N'ნუცა', N'გუმბერიძე', N'Male', N'60404714980', CAST(N'1975-05-21' AS Date), 16, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (962, N'მეგი', N'მჭედლიშვილი', N'Female', N'41605621966', CAST(N'1962-12-26' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (963, N'ვახტანგ', N'ხვედელიძე', N'Female', N'52288106805', CAST(N'1999-10-27' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (964, N'არმენ', N'გობეჯიშვილი', N'Female', N'95200202883', CAST(N'1962-08-31' AS Date), 8, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (965, N'თენგიზ', N'გაგუა', N'Female', N'22535654235', CAST(N'1984-04-05' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (966, N'ქრისტინე', N'ჭანტურია', N'Male', N'25455949563', CAST(N'1975-09-27' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (967, N'კარლო', N'ტყემალაძე', N'Female', N'98530919905', CAST(N'1945-12-31' AS Date), 14, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (968, N'იოსებ', N'შელია', N'Male', N'94147792864', CAST(N'2003-08-06' AS Date), 23, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (969, N'თინათინ', N'კვირკველია', N'Male', N'64959763903', CAST(N'1957-11-03' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (970, N'როზა', N'კახიძე', N'Male', N'36938512379', CAST(N'1985-10-15' AS Date), 12, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (971, N'იზოლდა', N'კალანდაძე', N'Male', N'89003389987', CAST(N'1994-08-08' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (972, N'ვიქტორ', N'რობაქიძე', N'Female', N'21450249115', CAST(N'2003-11-11' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (973, N'ანა', N'გურული', N'Male', N'77504349544', CAST(N'1961-05-31' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (974, N'მარინე', N'სალუქვაძე', N'Male', N'52126464204', CAST(N'1951-01-23' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (975, N'ანზორ', N'ჯოჯუა', N'Male', N'24567696418', CAST(N'1993-02-20' AS Date), 7, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (976, N'ნორა', N'ხარაბაძე', N'Female', N'86900637420', CAST(N'1990-07-31' AS Date), 24, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (977, N'დიანა', N'მელიქიძე', N'Female', N'38988246846', CAST(N'1999-02-01' AS Date), 21, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (978, N'ცირა', N'სეხნიაშვილი', N'Female', N'63495554800', CAST(N'1968-12-06' AS Date), 9, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (979, N'ვეფხვია', N'მარგველაშვილი', N'Male', N'09189741904', CAST(N'2004-01-23' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (980, N'თამილა', N'რევაზიშვილი', N'Male', N'97494577598', CAST(N'1992-05-22' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (981, N'დარეჯან', N'გოგალაძე', N'Male', N'29801383631', CAST(N'1976-05-29' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (982, N'ანი', N'სირაძე', N'Male', N'97208972969', CAST(N'1983-05-22' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (983, N'მურმან', N'სიჭინავა', N'Female', N'01123607544', CAST(N'1948-01-18' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (984, N'მიხეილ', N'ბეგიაშვილი', N'Female', N'31780760435', CAST(N'1992-10-21' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (985, N'სოფიკო', N'ახალაძე', N'Male', N'54394024770', CAST(N'1994-12-30' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (986, N'ვახტანგ', N'გველესიანი', N'Female', N'94054847037', CAST(N'1954-10-12' AS Date), 2, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (987, N'როზა', N'ბახტაძე', N'Female', N'29985998734', CAST(N'1962-08-26' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (988, N'გოგა', N'ღარიბაშვილი', N'Female', N'74906231255', CAST(N'1972-03-12' AS Date), 13, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (989, N'ირინა', N'მახათაძე', N'Male', N'86331507356', CAST(N'1945-05-14' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (990, N'ზაქარია', N'მეგრელიშვილი', N'Female', N'68939790744', CAST(N'1982-10-01' AS Date), 19, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (991, N'აზა', N'ქურდაძე', N'Male', N'07128900192', CAST(N'1968-07-28' AS Date), 6, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (992, N'ლარისა', N'ბრეგაძე', N'Male', N'71149343685', CAST(N'1980-09-17' AS Date), 3, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (993, N'ზაურ', N'ქევხიშვილი', N'Male', N'55378163494', CAST(N'1971-08-29' AS Date), 22, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (994, N'მალხაზ', N'ხარაზიშვილი', N'Female', N'09576061318', CAST(N'1968-02-03' AS Date), 18, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (995, N'გია', N'მიქელაძე', N'Female', N'04893718720', CAST(N'1976-07-16' AS Date), 10, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (996, N'მარია', N'გრძელიშვილი', N'Male', N'62636753743', CAST(N'1950-01-27' AS Date), 5, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (997, N'ტარიელ', N'მესხი', N'Female', N'97803606420', CAST(N'1959-11-20' AS Date), 20, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (998, N'ირაკლი', N'შანიძე', N'Male', N'46693607740', CAST(N'1992-11-08' AS Date), 11, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (999, N'სოფიკო', N'ზედგინიძე', N'Male', N'04388173490', CAST(N'1957-08-13' AS Date), 25, '')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Gender], [PersonalNumber], [DateOfBirth], [CityId], [PicturePath]) VALUES (1000, N'ვალერი', N'გულუა', N'Female', N'49541106035', CAST(N'2000-10-08' AS Date), 8, '')
go
set identity_insert [dbo].[Persons] off
go
SET IDENTITY_INSERT [dbo].[PhoneNumbers] ON 
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (1, N'mobile', N'349659407488', 919)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (2, N'mobile', N'345556903521', 837)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (3, N'office', N'361786045713', 495)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (4, N'home', N'334297790062', 407)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (5, N'mobile', N'384051805893', 549)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (6, N'mobile', N'398195638466', 708)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (7, N'home', N'340489062366', 178)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (8, N'mobile', N'313787737899', 769)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (9, N'home', N'351351235534', 934)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (10, N'mobile', N'303326155135', 829)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (11, N'mobile', N'354839103812', 882)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (12, N'home', N'336369644758', 76)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (13, N'office', N'369330885128', 702)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (14, N'mobile', N'325235505443', 242)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (15, N'mobile', N'300590250427', 607)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (16, N'office', N'355962541775', 572)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (17, N'office', N'324616368536', 838)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (18, N'office', N'349240523157', 166)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (19, N'office', N'380527963576', 679)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (20, N'office', N'343242170795', 959)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (21, N'home', N'300378191599', 105)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (22, N'mobile', N'393582198191', 457)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (23, N'office', N'394728245758', 825)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (24, N'mobile', N'353109644198', 623)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (25, N'office', N'340427111397', 531)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (26, N'office', N'397478425888', 599)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (27, N'mobile', N'373789369729', 561)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (28, N'mobile', N'332838888035', 706)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (29, N'mobile', N'364782375000', 468)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (30, N'home', N'361857658939', 703)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (31, N'office', N'349562627979', 776)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (32, N'office', N'337464186591', 423)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (33, N'home', N'382124501224', 556)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (34, N'home', N'344778816397', 415)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (35, N'mobile', N'382202097375', 196)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (36, N'home', N'315544148803', 879)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (37, N'home', N'399879292683', 11)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (38, N'office', N'377949329075', 437)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (39, N'office', N'350911514426', 683)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (40, N'home', N'348911341395', 789)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (41, N'home', N'338169809844', 238)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (42, N'home', N'387035482327', 104)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (43, N'home', N'305066384490', 876)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (44, N'mobile', N'320257680305', 796)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (45, N'home', N'306021831067', 37)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (46, N'mobile', N'335088283345', 99)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (47, N'mobile', N'343647303040', 887)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (48, N'home', N'370815425596', 426)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (49, N'office', N'325824098972', 769)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (50, N'office', N'356684319116', 675)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (51, N'office', N'352628772191', 543)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (52, N'home', N'355131452088', 364)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (53, N'office', N'346209723306', 573)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (54, N'office', N'315329828078', 828)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (55, N'mobile', N'366792775246', 791)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (56, N'mobile', N'376590818411', 119)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (57, N'home', N'343403444260', 694)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (58, N'mobile', N'323252662606', 643)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (59, N'office', N'303549047982', 877)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (60, N'home', N'326206385992', 763)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (61, N'mobile', N'387998008484', 871)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (62, N'mobile', N'317286510542', 677)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (63, N'office', N'388233439840', 881)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (64, N'home', N'387192993273', 752)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (65, N'office', N'311110772756', 764)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (66, N'mobile', N'353185062559', 664)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (67, N'home', N'303740282288', 166)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (68, N'office', N'324088587602', 495)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (69, N'mobile', N'362926653294', 128)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (70, N'office', N'380855741855', 512)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (71, N'office', N'364913454999', 606)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (72, N'home', N'357292954589', 650)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (73, N'office', N'329926144042', 510)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (74, N'mobile', N'320313307721', 234)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (75, N'office', N'389181222581', 319)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (76, N'mobile', N'337731829775', 77)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (77, N'mobile', N'303032786649', 16)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (78, N'home', N'355300645967', 117)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (79, N'office', N'386662879997', 582)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (80, N'office', N'319755324831', 614)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (81, N'mobile', N'318949618968', 484)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (82, N'mobile', N'341607447762', 903)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (83, N'home', N'312301098157', 875)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (84, N'mobile', N'378737652970', 878)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (85, N'mobile', N'395960284350', 311)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (86, N'home', N'327938233111', 341)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (87, N'office', N'366197064026', 273)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (88, N'office', N'318779959114', 179)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (89, N'home', N'373354689998', 737)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (90, N'office', N'334050795367', 800)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (91, N'home', N'397481577916', 479)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (92, N'mobile', N'304236584156', 582)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (93, N'mobile', N'308063794006', 597)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (94, N'home', N'354461562663', 882)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (95, N'home', N'331830128437', 987)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (96, N'office', N'391301680393', 799)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (97, N'office', N'372295405417', 270)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (98, N'mobile', N'322331420792', 486)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (99, N'mobile', N'352939908091', 909)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (100, N'office', N'382798751208', 133)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (101, N'mobile', N'380290888542', 958)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (102, N'mobile', N'350653544690', 298)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (103, N'home', N'310974744375', 708)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (104, N'home', N'369592278627', 133)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (105, N'office', N'304242446210', 101)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (106, N'office', N'399713218987', 605)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (107, N'mobile', N'355507081393', 985)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (108, N'home', N'344819921880', 554)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (109, N'mobile', N'329314258375', 427)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (110, N'mobile', N'350092668502', 751)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (111, N'home', N'345811307800', 679)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (112, N'home', N'389001164875', 129)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (113, N'mobile', N'369711296704', 546)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (114, N'office', N'325113368744', 274)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (115, N'home', N'312955541464', 748)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (116, N'mobile', N'352255590291', 220)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (117, N'mobile', N'306965900959', 563)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (118, N'home', N'391620093626', 695)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (119, N'office', N'319194120666', 363)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (120, N'mobile', N'354691143565', 354)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (121, N'office', N'323032489827', 193)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (122, N'mobile', N'385286521389', 591)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (123, N'office', N'322979037530', 980)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (124, N'office', N'397292902991', 913)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (125, N'office', N'327775110109', 228)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (126, N'home', N'351591656385', 867)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (127, N'home', N'364504648764', 893)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (128, N'home', N'392806670373', 759)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (129, N'office', N'349533279762', 706)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (130, N'office', N'346098360566', 248)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (131, N'mobile', N'338295542381', 187)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (132, N'mobile', N'385547947445', 140)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (133, N'home', N'345385253374', 937)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (134, N'mobile', N'314526739092', 361)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (135, N'home', N'343765901592', 655)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (136, N'office', N'325784254374', 693)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (137, N'home', N'354492072111', 874)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (138, N'home', N'350859051607', 246)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (139, N'office', N'399778380751', 38)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (140, N'mobile', N'310088178607', 38)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (141, N'mobile', N'308847230846', 249)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (142, N'mobile', N'308382137839', 477)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (143, N'office', N'362357244967', 521)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (144, N'office', N'309050485858', 910)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (145, N'mobile', N'337815416708', 539)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (146, N'mobile', N'306397297251', 151)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (147, N'home', N'354611523170', 712)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (148, N'home', N'308518285673', 373)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (149, N'home', N'382351501417', 863)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (150, N'mobile', N'327250602975', 701)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (151, N'office', N'337969456870', 319)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (152, N'mobile', N'337122040464', 464)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (153, N'mobile', N'307153238398', 293)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (154, N'office', N'397781917878', 599)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (155, N'office', N'396798898053', 731)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (156, N'mobile', N'361305187008', 884)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (157, N'office', N'380964828463', 601)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (158, N'mobile', N'309271259962', 849)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (159, N'home', N'331169323282', 497)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (160, N'home', N'337745347219', 898)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (161, N'office', N'328842182310', 520)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (162, N'home', N'356880236456', 151)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (163, N'office', N'381771690416', 15)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (164, N'home', N'378910202995', 497)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (165, N'office', N'335028133657', 489)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (166, N'office', N'360675906746', 102)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (167, N'office', N'357871329987', 863)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (168, N'office', N'361564185835', 328)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (169, N'home', N'310564426358', 77)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (170, N'home', N'358252307581', 192)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (171, N'office', N'365272709120', 869)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (172, N'home', N'300135621559', 230)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (173, N'mobile', N'357560841579', 775)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (174, N'mobile', N'309145275824', 598)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (175, N'home', N'341477933461', 240)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (176, N'home', N'396471869013', 729)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (177, N'home', N'302904258378', 696)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (178, N'mobile', N'379755150756', 497)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (179, N'mobile', N'376603775193', 4)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (180, N'home', N'328052705784', 173)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (181, N'office', N'328135188399', 535)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (182, N'mobile', N'367657853157', 316)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (183, N'home', N'383110174194', 169)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (184, N'office', N'336085984693', 480)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (185, N'mobile', N'301228023015', 484)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (186, N'home', N'375701760272', 15)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (187, N'home', N'343388568984', 531)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (188, N'home', N'355436490494', 451)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (189, N'home', N'305637793384', 445)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (190, N'office', N'343149842670', 309)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (191, N'mobile', N'362614578855', 972)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (192, N'home', N'354172166575', 825)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (193, N'office', N'335958510474', 614)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (194, N'mobile', N'310153123835', 74)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (195, N'mobile', N'305241025461', 879)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (196, N'office', N'378341707667', 35)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (197, N'office', N'367980192966', 720)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (198, N'mobile', N'348585874610', 854)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (199, N'mobile', N'370670165836', 70)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (200, N'home', N'388479292270', 568)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (201, N'mobile', N'305848570906', 587)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (202, N'home', N'348040443718', 133)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (203, N'mobile', N'366472140380', 698)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (204, N'office', N'312995623687', 709)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (205, N'office', N'387436122772', 449)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (206, N'office', N'346337185656', 216)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (207, N'home', N'399010047167', 723)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (208, N'home', N'382745352962', 430)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (209, N'office', N'344492606847', 687)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (210, N'home', N'302090615476', 359)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (211, N'home', N'349905998914', 593)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (212, N'office', N'348764393997', 126)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (213, N'office', N'320771841409', 745)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (214, N'mobile', N'306938234671', 301)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (215, N'mobile', N'348481115452', 737)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (216, N'mobile', N'324187700350', 265)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (217, N'mobile', N'360644693405', 919)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (218, N'mobile', N'365344068690', 472)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (219, N'mobile', N'327584371992', 188)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (220, N'home', N'340628515429', 11)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (221, N'office', N'371192865492', 444)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (222, N'home', N'327381530528', 629)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (223, N'office', N'399737289902', 750)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (224, N'mobile', N'330139881449', 894)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (225, N'office', N'356251432485', 818)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (226, N'office', N'386876088397', 590)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (227, N'home', N'310681836759', 992)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (228, N'mobile', N'330061034664', 67)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (229, N'office', N'324126335726', 839)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (230, N'office', N'367449840580', 573)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (231, N'home', N'311232748420', 918)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (232, N'office', N'346579584364', 36)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (233, N'home', N'351963596085', 226)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (234, N'mobile', N'398583026620', 361)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (235, N'office', N'334677807734', 134)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (236, N'mobile', N'395833437196', 556)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (237, N'home', N'307678630475', 160)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (238, N'mobile', N'364513681364', 805)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (239, N'office', N'364981324998', 341)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (240, N'office', N'387269229986', 437)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (241, N'mobile', N'386837638864', 691)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (242, N'office', N'363835639975', 56)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (243, N'home', N'334210780311', 310)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (244, N'home', N'369161569379', 646)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (245, N'mobile', N'315032580399', 773)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (246, N'mobile', N'351487063203', 247)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (247, N'mobile', N'317391473968', 917)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (248, N'mobile', N'364131857554', 79)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (249, N'mobile', N'312038264848', 63)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (250, N'home', N'371644979411', 881)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (251, N'mobile', N'327644468865', 397)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (252, N'home', N'398189184775', 816)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (253, N'home', N'344286655062', 994)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (254, N'office', N'342617940870', 892)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (255, N'mobile', N'340881860500', 780)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (256, N'office', N'392499083343', 290)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (257, N'home', N'378945343445', 91)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (258, N'office', N'364138876918', 713)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (259, N'office', N'394381543099', 880)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (260, N'home', N'317481976543', 83)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (261, N'home', N'395061482957', 718)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (262, N'office', N'307036824107', 782)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (263, N'office', N'382563576710', 593)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (264, N'mobile', N'338574185876', 479)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (265, N'home', N'364893384102', 408)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (266, N'home', N'389843825435', 306)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (267, N'office', N'379720057685', 659)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (268, N'office', N'316959390021', 777)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (269, N'home', N'350275206169', 207)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (270, N'mobile', N'338328871185', 653)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (271, N'home', N'326083552873', 838)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (272, N'mobile', N'396701214915', 117)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (273, N'office', N'391875292867', 239)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (274, N'home', N'356701215482', 107)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (275, N'mobile', N'356873676848', 760)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (276, N'home', N'307881095278', 49)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (277, N'home', N'363572705201', 414)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (278, N'mobile', N'388836756523', 266)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (279, N'home', N'331301683576', 173)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (280, N'office', N'372601115547', 574)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (281, N'office', N'363023787164', 505)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (282, N'home', N'357525146500', 466)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (283, N'office', N'336492879357', 330)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (284, N'mobile', N'370843141258', 861)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (285, N'mobile', N'360147374244', 664)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (286, N'mobile', N'343832370162', 251)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (287, N'mobile', N'367671000268', 768)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (288, N'mobile', N'361662024434', 897)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (289, N'home', N'305569032746', 304)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (290, N'office', N'338174814930', 884)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (291, N'home', N'320630859603', 145)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (292, N'office', N'368319219066', 864)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (293, N'mobile', N'349598582488', 775)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (294, N'office', N'321177170207', 362)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (295, N'home', N'331178428412', 823)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (296, N'home', N'340078527707', 877)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (297, N'home', N'388616625645', 308)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (298, N'office', N'332920499621', 378)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (299, N'mobile', N'396402051718', 444)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (300, N'mobile', N'346161823079', 307)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (301, N'home', N'384327253312', 621)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (302, N'mobile', N'340200560094', 309)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (303, N'office', N'306372427042', 529)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (304, N'office', N'377773798005', 983)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (305, N'office', N'391219451634', 917)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (306, N'home', N'343656762956', 134)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (307, N'mobile', N'310946930634', 313)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (308, N'office', N'348405109356', 275)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (309, N'office', N'373422077957', 563)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (310, N'office', N'364649432745', 948)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (311, N'home', N'381192496677', 417)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (312, N'office', N'338368057890', 794)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (313, N'office', N'325117497354', 442)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (314, N'home', N'337725105521', 355)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (315, N'home', N'397937321210', 284)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (316, N'home', N'347482457677', 118)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (317, N'home', N'312730649552', 827)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (318, N'mobile', N'353363824614', 317)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (319, N'office', N'345971159194', 299)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (320, N'home', N'398618888813', 370)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (321, N'home', N'378324830429', 126)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (322, N'office', N'329194304343', 861)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (323, N'office', N'371984744816', 600)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (324, N'office', N'308897018237', 368)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (325, N'mobile', N'332999422170', 63)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (326, N'mobile', N'330531088697', 505)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (327, N'home', N'318199850557', 556)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (328, N'mobile', N'353316108550', 945)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (329, N'home', N'332065081190', 855)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (330, N'home', N'321327101346', 76)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (331, N'home', N'315095533985', 761)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (332, N'mobile', N'348224033385', 568)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (333, N'home', N'370941433829', 222)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (334, N'office', N'335641907168', 734)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (335, N'mobile', N'376858622237', 30)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (336, N'office', N'313141527442', 598)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (337, N'office', N'374134851254', 839)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (338, N'office', N'312101158228', 927)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (339, N'mobile', N'379127524246', 529)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (340, N'office', N'333951139536', 796)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (341, N'mobile', N'325899463774', 494)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (342, N'mobile', N'315351453294', 232)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (343, N'office', N'320633615142', 46)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (344, N'mobile', N'310187027767', 210)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (345, N'mobile', N'341536978840', 386)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (346, N'office', N'316718718074', 555)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (347, N'mobile', N'341299765564', 45)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (348, N'office', N'340906691561', 689)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (349, N'home', N'364053243094', 265)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (350, N'office', N'385427399619', 489)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (351, N'mobile', N'300994702724', 420)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (352, N'home', N'361918281487', 451)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (353, N'mobile', N'323791031763', 440)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (354, N'office', N'315759923213', 729)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (355, N'home', N'353318285627', 644)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (356, N'home', N'385167243122', 626)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (357, N'mobile', N'347860354019', 489)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (358, N'office', N'378574572509', 799)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (359, N'mobile', N'357122568071', 144)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (360, N'home', N'361387252441', 116)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (361, N'home', N'348838280134', 20)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (362, N'home', N'328034908209', 174)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (363, N'home', N'359526048002', 274)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (364, N'office', N'395205351194', 587)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (365, N'mobile', N'356292221727', 163)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (366, N'home', N'329366183549', 173)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (367, N'office', N'398508614216', 407)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (368, N'mobile', N'336318314721', 100)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (369, N'office', N'382785528174', 209)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (370, N'home', N'382643759253', 130)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (371, N'office', N'376757297276', 39)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (372, N'home', N'310691027884', 840)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (373, N'home', N'323815139237', 721)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (374, N'mobile', N'355850491852', 625)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (375, N'home', N'354311789581', 152)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (376, N'home', N'351139484386', 465)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (377, N'mobile', N'314402279909', 192)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (378, N'home', N'341367448843', 887)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (379, N'office', N'327613038993', 552)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (380, N'home', N'363114108262', 660)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (381, N'office', N'393144860866', 290)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (382, N'mobile', N'318974874464', 161)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (383, N'home', N'317262830580', 976)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (384, N'mobile', N'392898393932', 568)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (385, N'home', N'349493650983', 403)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (386, N'mobile', N'375209437225', 680)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (387, N'home', N'392981574095', 283)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (388, N'mobile', N'307308152987', 885)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (389, N'mobile', N'340615436485', 334)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (390, N'mobile', N'344791346044', 52)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (391, N'mobile', N'319429215373', 64)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (392, N'home', N'309479823103', 336)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (393, N'office', N'343080010690', 761)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (394, N'mobile', N'315079216672', 61)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (395, N'office', N'315580010408', 254)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (396, N'home', N'334089979780', 63)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (397, N'mobile', N'312231899596', 495)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (398, N'home', N'334426658979', 621)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (399, N'home', N'326048614849', 65)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (400, N'mobile', N'343247651385', 838)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (401, N'mobile', N'311972940284', 587)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (402, N'mobile', N'335872956546', 436)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (403, N'office', N'366397009902', 804)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (404, N'office', N'398612853220', 973)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (405, N'mobile', N'335410267836', 38)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (406, N'mobile', N'364032337220', 518)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (407, N'office', N'386382823739', 545)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (408, N'office', N'331084639613', 488)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (409, N'home', N'381235934105', 515)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (410, N'office', N'314799945321', 229)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (411, N'mobile', N'312508441606', 176)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (412, N'mobile', N'330891003320', 936)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (413, N'office', N'326818932449', 850)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (414, N'office', N'350317691446', 786)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (415, N'mobile', N'378839014360', 583)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (416, N'home', N'313364978882', 615)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (417, N'home', N'373221321178', 281)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (418, N'mobile', N'325321108616', 776)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (419, N'home', N'323333090390', 130)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (420, N'office', N'366283563731', 825)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (421, N'home', N'351726786753', 84)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (422, N'home', N'339420074291', 482)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (423, N'mobile', N'339332970898', 652)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (424, N'mobile', N'365175551310', 226)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (425, N'home', N'374734088104', 738)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (426, N'home', N'389668325264', 355)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (427, N'mobile', N'368691401893', 394)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (428, N'home', N'388644740263', 615)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (429, N'mobile', N'364464866724', 419)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (430, N'mobile', N'308453407198', 760)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (431, N'office', N'364395686576', 210)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (432, N'office', N'339440131278', 343)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (433, N'office', N'369587545129', 480)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (434, N'office', N'347220025760', 415)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (435, N'home', N'344001798778', 31)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (436, N'mobile', N'386927754923', 922)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (437, N'mobile', N'390457816455', 594)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (438, N'mobile', N'370083065355', 127)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (439, N'office', N'397240890820', 289)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (440, N'office', N'303694628275', 932)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (441, N'mobile', N'357673957890', 967)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (442, N'office', N'374631175046', 176)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (443, N'home', N'393856798561', 1000)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (444, N'office', N'395745791375', 748)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (445, N'office', N'312342933413', 811)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (446, N'home', N'386176120279', 446)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (447, N'mobile', N'396694321206', 101)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (448, N'office', N'378722222606', 753)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (449, N'home', N'393974395773', 339)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (450, N'mobile', N'384132291516', 101)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (451, N'mobile', N'378230732584', 544)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (452, N'mobile', N'345662179609', 923)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (453, N'mobile', N'309778907614', 156)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (454, N'office', N'338293776163', 170)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (455, N'home', N'320132687376', 867)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (456, N'mobile', N'367267754500', 619)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (457, N'home', N'328091799340', 290)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (458, N'office', N'353578507411', 112)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (459, N'office', N'356076221658', 333)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (460, N'home', N'331483434040', 25)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (461, N'home', N'376889457837', 764)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (462, N'office', N'385987214819', 499)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (463, N'office', N'300780056968', 497)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (464, N'office', N'319966685031', 462)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (465, N'mobile', N'326729293410', 394)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (466, N'mobile', N'383513630156', 594)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (467, N'office', N'395394972406', 254)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (468, N'office', N'319539321056', 64)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (469, N'mobile', N'379158989499', 133)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (470, N'home', N'377287021821', 194)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (471, N'office', N'346594441997', 50)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (472, N'office', N'340679461417', 788)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (473, N'mobile', N'356806725360', 332)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (474, N'mobile', N'341996693354', 75)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (475, N'office', N'389485415627', 706)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (476, N'home', N'320520103690', 936)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (477, N'mobile', N'302157131523', 642)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (478, N'mobile', N'392541604908', 153)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (479, N'mobile', N'329614849895', 532)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (480, N'mobile', N'327479325050', 517)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (481, N'home', N'336946217751', 394)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (482, N'mobile', N'368304237157', 257)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (483, N'office', N'341337173905', 119)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (484, N'home', N'308182363668', 494)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (485, N'office', N'339404963493', 554)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (486, N'mobile', N'328910241290', 794)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (487, N'office', N'363047936046', 199)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (488, N'home', N'388521625412', 524)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (489, N'office', N'352249591404', 865)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (490, N'mobile', N'392898167276', 582)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (491, N'mobile', N'311603779195', 236)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (492, N'office', N'325787285712', 837)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (493, N'home', N'351959850699', 588)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (494, N'mobile', N'312809508505', 596)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (495, N'home', N'331481981004', 174)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (496, N'office', N'372221241269', 805)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (497, N'home', N'365763894174', 239)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (498, N'mobile', N'321060391442', 920)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (499, N'mobile', N'393061478537', 630)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (500, N'mobile', N'343304383724', 376)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (501, N'mobile', N'345342411585', 501)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (502, N'home', N'362156911329', 115)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (503, N'mobile', N'316209612283', 844)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (504, N'office', N'364998804272', 909)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (505, N'office', N'365232317923', 694)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (506, N'office', N'305651309250', 679)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (507, N'mobile', N'343493359389', 536)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (508, N'home', N'345389624087', 210)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (509, N'mobile', N'375903269134', 682)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (510, N'home', N'326513379200', 437)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (511, N'office', N'341238767904', 247)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (512, N'mobile', N'323646865972', 911)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (513, N'home', N'346376145524', 658)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (514, N'mobile', N'380314677715', 267)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (515, N'mobile', N'361762231375', 221)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (516, N'home', N'395155285010', 797)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (517, N'home', N'308065044508', 404)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (518, N'mobile', N'350754628732', 469)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (519, N'mobile', N'379550098649', 260)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (520, N'office', N'335934274910', 760)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (521, N'home', N'350576470742', 374)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (522, N'home', N'331738626631', 983)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (523, N'home', N'340329933561', 890)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (524, N'mobile', N'336782068876', 218)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (525, N'home', N'334146179684', 441)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (526, N'office', N'357678317321', 939)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (527, N'office', N'323169747311', 396)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (528, N'office', N'380213206828', 704)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (529, N'office', N'313425866916', 272)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (530, N'mobile', N'389063484115', 130)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (531, N'mobile', N'319973477327', 865)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (532, N'home', N'333176278897', 94)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (533, N'office', N'399791819056', 296)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (534, N'office', N'336000731401', 583)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (535, N'mobile', N'345278031181', 183)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (536, N'office', N'327959242265', 746)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (537, N'home', N'364939737306', 885)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (538, N'home', N'391466808742', 76)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (539, N'mobile', N'336842273624', 970)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (540, N'mobile', N'392037517966', 420)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (541, N'mobile', N'374693843303', 671)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (542, N'home', N'384880261169', 120)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (543, N'mobile', N'322000239802', 433)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (544, N'mobile', N'329866294261', 188)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (545, N'mobile', N'367256322359', 858)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (546, N'mobile', N'323134048867', 86)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (547, N'office', N'337527722942', 148)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (548, N'home', N'391725684323', 953)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (549, N'home', N'372605165775', 259)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (550, N'home', N'354951368991', 509)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (551, N'office', N'361593137803', 501)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (552, N'office', N'313969027287', 557)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (553, N'office', N'362443384384', 562)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (554, N'office', N'322878184932', 979)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (555, N'office', N'330519153064', 108)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (556, N'office', N'399077398300', 171)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (557, N'office', N'368627206849', 981)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (558, N'home', N'331456691125', 986)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (559, N'home', N'392860935433', 209)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (560, N'office', N'324592057116', 780)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (561, N'home', N'333329971337', 614)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (562, N'office', N'376315436566', 699)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (563, N'office', N'344562798050', 253)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (564, N'office', N'394272506940', 840)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (565, N'office', N'305889651030', 199)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (566, N'office', N'370595269493', 891)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (567, N'home', N'359282878742', 156)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (568, N'office', N'306532260145', 518)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (569, N'office', N'373416837642', 190)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (570, N'mobile', N'311098465529', 55)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (571, N'home', N'357815980544', 637)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (572, N'office', N'369122464912', 427)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (573, N'home', N'353368128073', 529)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (574, N'home', N'378572336817', 284)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (575, N'office', N'355654353519', 465)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (576, N'home', N'381519747509', 899)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (577, N'office', N'315923493912', 628)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (578, N'office', N'369689476956', 488)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (579, N'office', N'327419996938', 241)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (580, N'mobile', N'342459518500', 551)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (581, N'office', N'331587907708', 967)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (582, N'office', N'387783380996', 671)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (583, N'mobile', N'324743001952', 602)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (584, N'office', N'396466208548', 830)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (585, N'home', N'396985942951', 463)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (586, N'home', N'303627328160', 425)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (587, N'mobile', N'315132343567', 434)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (588, N'home', N'316294284839', 496)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (589, N'office', N'380220457493', 539)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (590, N'mobile', N'331470836281', 132)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (591, N'office', N'364818600883', 670)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (592, N'mobile', N'322272509173', 357)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (593, N'mobile', N'396226663726', 73)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (594, N'home', N'383162065553', 615)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (595, N'home', N'316253561551', 818)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (596, N'mobile', N'396939300387', 591)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (597, N'mobile', N'320028904610', 5)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (598, N'mobile', N'316756385884', 269)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (599, N'mobile', N'304802942550', 381)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (600, N'office', N'304796448411', 376)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (601, N'office', N'307020298852', 458)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (602, N'mobile', N'357735605930', 900)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (603, N'office', N'321507216452', 19)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (604, N'office', N'306836530136', 810)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (605, N'home', N'331756817446', 572)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (606, N'home', N'305888428657', 380)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (607, N'home', N'358097462424', 770)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (608, N'office', N'370372446672', 31)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (609, N'mobile', N'345684014873', 551)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (610, N'mobile', N'322902709508', 278)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (611, N'office', N'310619971352', 745)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (612, N'mobile', N'399207857242', 878)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (613, N'mobile', N'331348645116', 617)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (614, N'mobile', N'320467226993', 18)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (615, N'mobile', N'359280295475', 491)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (616, N'home', N'310111138611', 394)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (617, N'office', N'335925534092', 357)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (618, N'mobile', N'355241158655', 815)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (619, N'home', N'397029680555', 350)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (620, N'office', N'304505482991', 468)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (621, N'home', N'380703998178', 879)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (622, N'mobile', N'385536922823', 394)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (623, N'mobile', N'363685291152', 815)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (624, N'mobile', N'382343919596', 698)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (625, N'mobile', N'346448178499', 307)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (626, N'office', N'393574025977', 137)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (627, N'home', N'319701926184', 297)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (628, N'mobile', N'368002792748', 325)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (629, N'mobile', N'317523139502', 517)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (630, N'mobile', N'372537293635', 88)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (631, N'home', N'382537542467', 197)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (632, N'mobile', N'363554351976', 438)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (633, N'mobile', N'329265537053', 169)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (634, N'home', N'350580056793', 100)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (635, N'home', N'341159594254', 36)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (636, N'mobile', N'351557165253', 520)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (637, N'office', N'347070191756', 644)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (638, N'home', N'313898236414', 968)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (639, N'office', N'380727386556', 579)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (640, N'mobile', N'334909143960', 543)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (641, N'office', N'334900022045', 824)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (642, N'office', N'335564697322', 513)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (643, N'mobile', N'313894422497', 965)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (644, N'mobile', N'376061052192', 698)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (645, N'mobile', N'370683910014', 617)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (646, N'mobile', N'395789477889', 191)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (647, N'mobile', N'351782729552', 414)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (648, N'mobile', N'345186324504', 568)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (649, N'mobile', N'303723171858', 154)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (650, N'office', N'315120590211', 790)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (651, N'home', N'327712341425', 724)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (652, N'office', N'364252290237', 340)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (653, N'office', N'360452113778', 276)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (654, N'home', N'367251560948', 87)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (655, N'mobile', N'389810418796', 283)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (656, N'mobile', N'354151656303', 214)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (657, N'home', N'393402650676', 551)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (658, N'office', N'375060296269', 986)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (659, N'office', N'394585987940', 25)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (660, N'home', N'392290675810', 287)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (661, N'home', N'333426729392', 553)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (662, N'home', N'324472023668', 845)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (663, N'mobile', N'316398824718', 373)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (664, N'mobile', N'306164507776', 402)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (665, N'mobile', N'323305742968', 954)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (666, N'home', N'326307024770', 586)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (667, N'home', N'368729504206', 539)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (668, N'mobile', N'368239745996', 410)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (669, N'home', N'378119999783', 893)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (670, N'office', N'392901468194', 427)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (671, N'office', N'356399355548', 732)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (672, N'mobile', N'352269540140', 730)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (673, N'home', N'322464181058', 343)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (674, N'office', N'362310222952', 241)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (675, N'office', N'363144232255', 877)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (676, N'mobile', N'384394976032', 194)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (677, N'home', N'399996258835', 314)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (678, N'mobile', N'358815643955', 5)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (679, N'home', N'363493907205', 747)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (680, N'office', N'317868283337', 906)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (681, N'office', N'305237954357', 83)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (682, N'mobile', N'352302827981', 250)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (683, N'home', N'316367424263', 228)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (684, N'home', N'332854736892', 110)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (685, N'mobile', N'310154769909', 415)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (686, N'mobile', N'395253579817', 675)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (687, N'office', N'315597661286', 928)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (688, N'office', N'305806059670', 219)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (689, N'home', N'378720581324', 82)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (690, N'mobile', N'336479623910', 246)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (691, N'office', N'396309611804', 632)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (692, N'home', N'387606350495', 394)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (693, N'mobile', N'362089682221', 927)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (694, N'mobile', N'349783034752', 198)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (695, N'mobile', N'345122204891', 250)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (696, N'mobile', N'376984928021', 335)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (697, N'office', N'344755324083', 551)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (698, N'mobile', N'300951773532', 694)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (699, N'office', N'325649220805', 294)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (700, N'office', N'357773946699', 802)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (701, N'office', N'317753295623', 764)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (702, N'office', N'389090334390', 483)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (703, N'home', N'397293406688', 391)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (704, N'mobile', N'329063085565', 373)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (705, N'home', N'330063920935', 754)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (706, N'home', N'351723966839', 313)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (707, N'office', N'322778633590', 140)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (708, N'office', N'335187306672', 297)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (709, N'home', N'394742879653', 559)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (710, N'mobile', N'371986236305', 719)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (711, N'office', N'327558796668', 167)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (712, N'home', N'370065430880', 692)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (713, N'office', N'392690120216', 463)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (714, N'home', N'351379810476', 797)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (715, N'office', N'352638809211', 249)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (716, N'home', N'396890251610', 459)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (717, N'mobile', N'390890020108', 13)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (718, N'home', N'368131775176', 156)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (719, N'home', N'395164876298', 791)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (720, N'mobile', N'382019110964', 49)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (721, N'office', N'307915010851', 629)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (722, N'office', N'336519498046', 306)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (723, N'mobile', N'321116105011', 873)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (724, N'mobile', N'348270014282', 738)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (725, N'mobile', N'360653628273', 243)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (726, N'home', N'338625520393', 764)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (727, N'office', N'357870923196', 235)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (728, N'mobile', N'334599312791', 333)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (729, N'home', N'361033971526', 923)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (730, N'mobile', N'337685172347', 501)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (731, N'mobile', N'350655899015', 156)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (732, N'home', N'352784735644', 3)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (733, N'home', N'324563986100', 132)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (734, N'home', N'342172135118', 628)
GO
INSERT [dbo].[PhoneNumbers] ([Id], [Type], [Number], [PersonId]) VALUES (735, N'home', N'379330732036', 565)
GO

set identity_insert [dbo].[PhoneNumbers] off
GO
SET IDENTITY_INSERT [dbo].[RelatedPersons] ON 
GO
INSERT [dbo].[RelatedPersons] ([Id], [RelationType], [PersonId], [RelatedToId]) VALUES
(1, N'colleague', 1, 2),
(2, N'acquaintance', 300, 450),
(3, N'relative', 12, 220),
(4, N'other', 523, 742),
(5, N'colleague', 734, 381),
(6, N'acquaintance', 185, 97),
(7, N'relative', 102, 33),
(8, N'other', 600, 800),
(9, N'colleague', 999, 124),
(10, N'acquaintance', 400, 330),
(11, N'relative', 200, 500),
(12, N'other', 755, 60),
(13, N'colleague', 22, 815),
(14, N'acquaintance', 123, 456),
(15, N'relative', 712, 534),
(16, N'other', 88, 670),
(17, N'colleague', 35, 999),
(18, N'acquaintance', 78, 411),
(19, N'relative', 620, 242),
(20, N'other', 240, 891),
(21, N'colleague', 33, 77),
(22, N'acquaintance', 90, 12),
(23, N'relative', 157, 530),
(24, N'other', 300, 679),
(25, N'colleague', 999, 95),
(26, N'acquaintance', 200, 808),
(27, N'relative', 540, 100),
(28, N'other', 888, 998),
(29, N'colleague', 50, 630),
(30, N'acquaintance', 672, 89),
(31, N'relative', 333, 782),
(32, N'other', 800, 11),
(33, N'colleague', 120, 50),
(34, N'acquaintance', 450, 312),
(35, N'relative', 900, 76),
(36, N'other', 233, 542),
(37, N'colleague', 410, 999),
(38, N'acquaintance', 29, 582),
(39, N'relative', 544, 444),
(40, N'other', 750, 150),
(41, N'colleague', 612, 945),
(42, N'acquaintance', 33, 777),
(43, N'relative', 515, 32),
(44, N'other', 431, 282),
(45, N'colleague', 57, 600),
(46, N'acquaintance', 703, 567),
(47, N'relative', 123, 111),
(48, N'other', 250, 672),
(49, N'colleague', 324, 970),
(50, N'acquaintance', 435, 234)

go
set identity_insert [dbo].[PhoneNumbers] off

GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[PhoneNumbers]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RelatedPersons]  WITH CHECK ADD  CONSTRAINT [FK_RelatedPersons_RelatedToId] FOREIGN KEY([RelatedToId])
REFERENCES [dbo].[Persons] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RelatedPersons] CHECK CONSTRAINT [FK_RelatedPersons_RelatedToId]
GO
USE [master]
GO
ALTER DATABASE [Persons] SET  READ_WRITE 
GO
