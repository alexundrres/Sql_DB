USE [master]
GO
/****** Object:  Database [ToursReshetnikov]    Script Date: 19.05.2023 8:50:29 ******/
CREATE DATABASE [ToursReshetnikov]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToursReshetnikov', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ToursReshetnikov.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToursReshetnikov_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ToursReshetnikov_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ToursReshetnikov] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToursReshetnikov].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ToursReshetnikov] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET ARITHABORT OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ToursReshetnikov] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ToursReshetnikov] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ToursReshetnikov] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ToursReshetnikov] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ToursReshetnikov] SET  MULTI_USER 
GO
ALTER DATABASE [ToursReshetnikov] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ToursReshetnikov] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ToursReshetnikov] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ToursReshetnikov] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ToursReshetnikov] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ToursReshetnikov] SET QUERY_STORE = OFF
GO
USE [ToursReshetnikov]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 19.05.2023 8:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 19.05.2023 8:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 19.05.2023 8:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Hotelid] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotelimage]    Script Date: 19.05.2023 8:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotelimage](
	[id] [int] NOT NULL,
	[Hotelid] [int] IDENTITY(1,1) NOT NULL,
	[ImageSource] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Hotelimage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 19.05.2023 8:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelId] [int] NOT NULL,
	[Tourld] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC,
	[Tourld] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 19.05.2023 8:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[isActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 19.05.2023 8:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 19.05.2023 8:50:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[Tourld] [int] NOT NULL,
	[Typed] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_TypeOfTour] PRIMARY KEY CLUSTERED 
(
	[Tourld] ASC,
	[Typed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[Hotelimage]  WITH CHECK ADD  CONSTRAINT [FK_Hotelimage_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Hotelimage] CHECK CONSTRAINT [FK_Hotelimage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([Tourld])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([Tourld])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([Typed])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [ToursReshetnikov] SET  READ_WRITE 
GO
