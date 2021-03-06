USE [master]
GO
/****** Object:  Database [CarsRental]    Script Date: 05/10/2015 20:19:21 ******/
CREATE DATABASE [CarsRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentingCars', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RentingCars.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RentingCars_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\RentingCars_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CarsRental] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarsRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarsRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarsRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarsRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarsRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarsRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarsRental] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CarsRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarsRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarsRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarsRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarsRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarsRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarsRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarsRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarsRental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarsRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarsRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarsRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarsRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarsRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarsRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarsRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarsRental] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarsRental] SET  MULTI_USER 
GO
ALTER DATABASE [CarsRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarsRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarsRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarsRental] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CarsRental] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CarsRental]
GO
/****** Object:  UserDefinedFunction [dbo].[IsCarTaken]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[IsCarTaken](@desiredStartDate date, @desiredEndDate date, @rentalStartDate date, @rentalEndDate date) returns bit
begin
	declare @returnValue bit
	
	--if ( (@desiredStartDate <= @rentalStartDate and @desiredEndDate >= @rentalStartDate) or 
	--	 (@desiredStartDate <= @rentalEndDate and @desiredEndDate >= @rentalEndDate) or
	--	 (@desiredStartDate >= @rentalStartDate and @desiredEndDate <= @rentalEndDate) )
	
	if((@desiredStartDate <= @rentalStartDate) AND (@desiredEndDate >=@rentalStartDate))

		 set @returnValue = 1;
	else
		 set @returnValue = 0;
	
	return @returnValue;
end

GO
/****** Object:  Table [dbo].[Cars]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarNumber] [int] IDENTITY(1,1) NOT NULL,
	[ModelCode] [int] NOT NULL,
	[Mileage] [decimal](18, 0) NOT NULL,
	[CarImage] [nvarchar](max) NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_AllCars] PRIMARY KEY CLUSTERED 
(
	[CarNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CarsModels]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarsModels](
	[ModelCode] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerCode] [int] NOT NULL,
	[ModelName] [nvarchar](50) NOT NULL,
	[Year] [int] NOT NULL,
	[Gear] [bit] NOT NULL,
	[DailyRentalCost] [decimal](18, 0) NOT NULL,
	[DailyLateReturnCost] [decimal](18, 0) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_CarsModels] PRIMARY KEY CLUSTERED 
(
	[ModelCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CarsRental]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarsRental](
	[CodeCarRental] [int] IDENTITY(1,1) NOT NULL,
	[CarNumber] [int] NOT NULL,
	[UserIDCode] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[ActualReturnDate] [date] NULL,
 CONSTRAINT [PK_CarsRental] PRIMARY KEY CLUSTERED 
(
	[CodeCarRental] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[ManufacturerCode] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[ManufacturerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserIDCode] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
 CONSTRAINT [PK__Users__1788CCAC88736A6B] PRIMARY KEY CLUSTERED 
(
	[UserIDCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserVsRoles]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVsRoles](
	[UserIDCode] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_UserVsRoles] PRIMARY KEY CLUSTERED 
(
	[UserIDCode] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[SearchRentedCarsByDateRange]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[SearchRentedCarsByDateRange] ( @BeginDate datetime, @EndDate datetime)
RETURNS TABLE 
AS
RETURN 
 SELECT DISTINCT 
 M.ManufacturerName, CM.ModelName, CM.Year,  CM.Gear, CM.DailyRentalCost,
 CM.DailyLateReturnCost 
 From Manufacturers M
 join CarsModels CM
 on M.ManufacturerCode= CM.ManufacturerCode
 join CarsRental CR
 on CR.CarNumber=CM.ModelCode
 where CR.StartDate > @EndDate OR CR.ReturnDate < @BeginDate
 


GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (6, 5, CAST(111 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (8, 5, CAST(222 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (9, 5, CAST(15 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (10, 7, CAST(333 AS Decimal(18, 0)), N'pic33', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (11, 5, CAST(169 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (12, 7, CAST(11 AS Decimal(18, 0)), N'pic33', 0)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (13, 5, CAST(9999 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (14, 5, CAST(555 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (15, 5, CAST(11 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (16, 7, CAST(1 AS Decimal(18, 0)), N'pic33', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (17, 5, CAST(80 AS Decimal(18, 0)), N'pic11', 0)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (18, 5, CAST(111 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (19, 5, CAST(46 AS Decimal(18, 0)), N'pic11', 0)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (20, 5, CAST(999 AS Decimal(18, 0)), N'pic11', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (21, 8, CAST(1000 AS Decimal(18, 0)), N'pic40', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (22, 9, CAST(2000 AS Decimal(18, 0)), N'pic41', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (23, 10, CAST(3000 AS Decimal(18, 0)), N'pic42', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (26, 12, CAST(4000 AS Decimal(18, 0)), N'pic43', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (27, 13, CAST(5000 AS Decimal(18, 0)), N'pic44', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (28, 14, CAST(5000 AS Decimal(18, 0)), N'pic45', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (31, 15, CAST(5000 AS Decimal(18, 0)), N'pic46', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (32, 16, CAST(5000 AS Decimal(18, 0)), N'pic47', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (33, 17, CAST(5000 AS Decimal(18, 0)), N'pic48', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (34, 18, CAST(5000 AS Decimal(18, 0)), N'pic49', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (35, 19, CAST(5000 AS Decimal(18, 0)), N'pic50', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (36, 20, CAST(6000 AS Decimal(18, 0)), N'pic51', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1021, 21, CAST(5000 AS Decimal(18, 0)), N'pic52', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1022, 22, CAST(6000 AS Decimal(18, 0)), N'pic53', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1023, 23, CAST(6000 AS Decimal(18, 0)), N'pic54', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1025, 26, CAST(5000 AS Decimal(18, 0)), N'pic55', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1026, 27, CAST(5000 AS Decimal(18, 0)), N'pic56', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1027, 28, CAST(7000 AS Decimal(18, 0)), N'pic57', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1028, 29, CAST(7000 AS Decimal(18, 0)), N'pic58', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1029, 30, CAST(6000 AS Decimal(18, 0)), N'pic59', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1030, 31, CAST(7000 AS Decimal(18, 0)), N'pic60', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1031, 32, CAST(6000 AS Decimal(18, 0)), N'pic61', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1032, 33, CAST(5000 AS Decimal(18, 0)), N'pic62', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1033, 34, CAST(7000 AS Decimal(18, 0)), N'pic62', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1034, 35, CAST(6000 AS Decimal(18, 0)), N'pic63', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1035, 36, CAST(6000 AS Decimal(18, 0)), N'pic64', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1036, 37, CAST(5000 AS Decimal(18, 0)), N'pic65', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1037, 38, CAST(8000 AS Decimal(18, 0)), N'pic66', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1038, 39, CAST(7999 AS Decimal(18, 0)), N'pic67', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1040, 41, CAST(4000 AS Decimal(18, 0)), N'pic68', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1041, 42, CAST(9000 AS Decimal(18, 0)), N'pic69', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1042, 43, CAST(5000 AS Decimal(18, 0)), N'pic70', 1)
INSERT [dbo].[Cars] ([CarNumber], [ModelCode], [Mileage], [CarImage], [Available]) VALUES (1043, 44, CAST(7000 AS Decimal(18, 0)), N'pic71', 1)
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[CarsModels] ON 

INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (5, 3, N'corola', 2015, 1, CAST(100 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), N'no remark')
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (7, 4, N'lancer', 2005, 1, CAST(150 AS Decimal(18, 0)), CAST(175 AS Decimal(18, 0)), N'ma ma ma')
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (8, 5, N'reventon', 2002, 1, CAST(2200 AS Decimal(18, 0)), CAST(3300 AS Decimal(18, 0)), N'YAP')
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (9, 4, N'pajero', 2013, 1, CAST(300 AS Decimal(18, 0)), CAST(250 AS Decimal(18, 0)), N'NO')
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (10, 6, N'GTV', 2007, 1, CAST(100 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (12, 7, N'C5', 2012, 1, CAST(80 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (13, 8, N'Accord', 2013, 1, CAST(100 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (14, 9, N'6', 2014, 1, CAST(100 AS Decimal(18, 0)), CAST(120 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (15, 10, N'535D', 2013, 1, CAST(160 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (16, 11, N'CTS', 2014, 1, CAST(150 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (17, 12, N'GOLF', 2015, 0, CAST(120 AS Decimal(18, 0)), CAST(140 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (18, 13, N'911', 2012, 0, CAST(300 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (19, 3, N'LS400', 2012, 1, CAST(250 AS Decimal(18, 0)), CAST(300 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (20, 7, N'c4', 2013, 1, CAST(70 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (21, 8, N'CIVIC', 2012, 1, CAST(90 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (22, 11, N'ATS', 2014, 1, CAST(120 AS Decimal(18, 0)), CAST(170 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (23, 3, N'Carina', 2011, 1, CAST(100 AS Decimal(18, 0)), CAST(140 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (26, 3, N'Avensis', 2014, 1, CAST(120 AS Decimal(18, 0)), CAST(160 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (27, 6, N'Mito', 2015, 0, CAST(100 AS Decimal(18, 0)), CAST(130 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (28, 7, N'C3', 2015, 1, CAST(60 AS Decimal(18, 0)), CAST(80 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (29, 8, N'Jazz', 2015, 1, CAST(70 AS Decimal(18, 0)), CAST(90 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (30, 9, N'3', 2015, 1, CAST(110 AS Decimal(18, 0)), CAST(130 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (31, 9, N'2', 2015, 1, CAST(90 AS Decimal(18, 0)), CAST(110 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (32, 9, N'5', 2014, 1, CAST(120 AS Decimal(18, 0)), CAST(150 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (33, 10, N'M3', 2014, 1, CAST(250 AS Decimal(18, 0)), CAST(360 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (34, 10, N'135I', 2013, 0, CAST(190 AS Decimal(18, 0)), CAST(260 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (35, 10, N'330I', 2013, 0, CAST(200 AS Decimal(18, 0)), CAST(270 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (36, 10, N'750I', 2013, 1, CAST(300 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (37, 12, N'Polo', 2015, 1, CAST(60 AS Decimal(18, 0)), CAST(90 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (38, 12, N'Passat', 2014, 1, CAST(150 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (39, 12, N'Transporter', 2015, 1, CAST(160 AS Decimal(18, 0)), CAST(220 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (41, 13, N'911 Turbo', 2014, 1, CAST(400 AS Decimal(18, 0)), CAST(600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (42, 13, N'Boxster S', 2015, 0, CAST(300 AS Decimal(18, 0)), CAST(390 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (43, 6, N'Roadster4C', 2015, 0, CAST(300 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[CarsModels] ([ModelCode], [ManufacturerCode], [ModelName], [Year], [Gear], [DailyRentalCost], [DailyLateReturnCost], [Remarks]) VALUES (44, 6, N'Stradale33', 1968, 0, CAST(800 AS Decimal(18, 0)), CAST(1200 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[CarsModels] OFF
SET IDENTITY_INSERT [dbo].[CarsRental] ON 

INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1070, 6, 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1077, 21, 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1080, 23, 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1082, 1028, 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1084, 28, 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1086, 1029, 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1088, 31, 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1091, 1033, 1012, CAST(N'2015-10-01' AS Date), CAST(N'2015-10-01' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1093, 1033, 1012, CAST(N'2015-10-21' AS Date), CAST(N'2015-10-28' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1096, 34, 1012, CAST(N'2015-10-05' AS Date), CAST(N'2015-10-05' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1099, 6, 1012, CAST(N'2015-10-05' AS Date), CAST(N'2015-10-05' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1101, 8, 1012, CAST(N'2015-10-05' AS Date), CAST(N'2015-10-05' AS Date), NULL)
INSERT [dbo].[CarsRental] ([CodeCarRental], [CarNumber], [UserIDCode], [StartDate], [ReturnDate], [ActualReturnDate]) VALUES (1104, 9, 1012, CAST(N'2015-10-05' AS Date), CAST(N'2015-10-05' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[CarsRental] OFF
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (3, N'Toyota')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (4, N'Mitsubishi')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (5, N'Lamborghini')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (6, N'Alfa')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (7, N'Citroen')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (8, N'Honda')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (9, N'Mazda')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (10, N'BMW')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (11, N'Cadillac')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (12, N'VW')
INSERT [dbo].[Manufacturers] ([ManufacturerCode], [ManufacturerName]) VALUES (13, N'Porsche')
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (4, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (5, N'Manager')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (6, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (3, N'liora', N'amit', 123456, N'Liori', N'101010', N'liora_amit@walla.com', CAST(N'2005-04-12' AS Date))
INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (4, N'shimi', N'levi', 789999, N'shim', N'202020', N'shim@hotmail.com', CAST(N'1970-03-14' AS Date))
INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (5, N'dror ', N'cohen', 898989, N'drori', N'303030', N'dror@gmail.com', CAST(N'1988-01-15' AS Date))
INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (6, N'Ftemp', N'Ltemp', 234567, N'Zx16V', N'0CC3FB659FB16EAEDADBB0AC42D463D4795FDC10', NULL, NULL)
INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (9, N'li', N'instien', 345678, N'lilo', N'A1CEA1574D20835EAB05381ED3AF26F39E1547C5', NULL, NULL)
INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (10, N'jhon', N'doe', 135789, N'guitar', N'230991ABCD77E8173EDB0AF392E1F11120051E29', NULL, NULL)
INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (11, N'Ricki', N'mrago', 677, N'Rick', N'D2F75E8204FEDF2EACD261E2461B2964E3BFD5BE', NULL, NULL)
INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (1011, N'Dani', N'Boy', 677, N'Dude', N'A045B7EFA463C6ED195C644163F4168952FBD34A', NULL, NULL)
INSERT [dbo].[Users] ([UserIDCode], [FirstName], [LastName], [UserID], [UserName], [Password], [Email], [BirthDate]) VALUES (1012, N'c3', N'c4', 677, N'c5', N'074FE681C9742D991DC00DC287ABA5094FF8C678', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (3, 4)
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (4, 5)
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (5, 6)
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (6, 6)
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (9, 6)
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (10, 6)
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (11, 6)
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (1011, 6)
INSERT [dbo].[UserVsRoles] ([UserIDCode], [RoleID]) VALUES (1012, 6)
/****** Object:  Index [uRent]    Script Date: 05/10/2015 20:19:21 ******/
ALTER TABLE [dbo].[CarsRental] ADD  CONSTRAINT [uRent] UNIQUE NONCLUSTERED 
(
	[CarNumber] ASC,
	[StartDate] ASC,
	[ReturnDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Roles__8A2B616017A60500]    Script Date: 05/10/2015 20:19:21 ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Users__536C85E474FFB766]    Script Date: 05/10/2015 20:19:21 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__536C85E474FFB766] UNIQUE NONCLUSTERED 
(
	[FirstName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_AllCars_CarsModels] FOREIGN KEY([ModelCode])
REFERENCES [dbo].[CarsModels] ([ModelCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_AllCars_CarsModels]
GO
ALTER TABLE [dbo].[CarsModels]  WITH CHECK ADD  CONSTRAINT [FK_CarsModels_Manufacturers] FOREIGN KEY([ManufacturerCode])
REFERENCES [dbo].[Manufacturers] ([ManufacturerCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CarsModels] CHECK CONSTRAINT [FK_CarsModels_Manufacturers]
GO
ALTER TABLE [dbo].[CarsRental]  WITH CHECK ADD  CONSTRAINT [FK_CarsRental_AllCars1] FOREIGN KEY([CarNumber])
REFERENCES [dbo].[Cars] ([CarNumber])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CarsRental] CHECK CONSTRAINT [FK_CarsRental_AllCars1]
GO
ALTER TABLE [dbo].[CarsRental]  WITH CHECK ADD  CONSTRAINT [FK_CarsRental_Users1] FOREIGN KEY([UserIDCode])
REFERENCES [dbo].[Users] ([UserIDCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CarsRental] CHECK CONSTRAINT [FK_CarsRental_Users1]
GO
ALTER TABLE [dbo].[UserVsRoles]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserVsRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserVsRol__UserI__5BE2A6F2] FOREIGN KEY([UserIDCode])
REFERENCES [dbo].[Users] ([UserIDCode])
GO
ALTER TABLE [dbo].[UserVsRoles] CHECK CONSTRAINT [FK__UserVsRol__UserI__5BE2A6F2]
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableCars]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[GetAvailableCars]
(@desiredStartDate date, @desiredEndDate date,@MakeID int=null, @ModelCode int=null, @GearType bit=null) as
 Begin
 select 
 M.ManufacturerName,M.ManufacturerCode, ModelName,CarNumber, CM.ModelCode,CM.Year, CM.Gear, CM.DailyRentalCost,
 CM.DailyLateReturnCost 
 FROM Cars 
 join CarsModels CM
 on CM.ModelCode=Cars.ModelCode
 join Manufacturers M
 on M.ManufacturerCode= CM.ManufacturerCode
 where CarNumber  NOT IN 
      (select distinct CarNumber 
              from CarsRental
			  where StartDate <= @desiredEndDate AND ReturnDate >= @desiredStartDate
      )
 AND Available=1 
 AND (@MakeID IS NULL or M.ManufacturerCode=@MakeID )
 AND (@ModelCode IS NULL or CM.ModelCode=@ModelCode )
 AND (@GearType IS NULL or CM.Gear=@GearType )

 ORDER BY M.ManufacturerName ASC
 END

 

GO
/****** Object:  StoredProcedure [dbo].[GetAvailableCarsByModels]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAvailableCarsByModels]
(@desiredStartDate date, @desiredEndDate date,@MakeID int= null, @ModelCode int=null, @GearType bit=null) as
Begin


select distinct ModelName,
 M.ManufacturerName,M.ManufacturerCode, CM.ModelCode,CM.Year,  CM.Gear,CM.DailyRentalCost,
CM.DailyLateReturnCost, CarImage  from Cars 
 join CarsModels CM
 on CM.ModelCode=Cars.ModelCode
 join Manufacturers M
 on M.ManufacturerCode= CM.ManufacturerCode
 where CarNumber  NOT IN 
 (select distinct CarNumber from CarsRental where StartDate <= @desiredEndDate AND ReturnDate >= @desiredStartDate )
AND Available=1 
AND (@MakeID IS NULL or M.ManufacturerCode=@MakeID )
AND (@ModelCode IS NULL or CM.ModelCode=@ModelCode )
AND (@GearType IS NULL or CM.Gear=@GearType )

ORDER BY M.ManufacturerName ASC
END

 

GO
/****** Object:  StoredProcedure [dbo].[GetAvailableCarsColumn]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetAvailableCarsColumn](@desiredStartDate date, @desiredEndDate date) as

	select * from Cars  where CarNumber NOT IN (select distinct CarNumber from CarsRental 
where dbo.IsCarTaken(@desiredStartDate, @desiredEndDate, StartDate, ReturnDate) = 1) and Available=1

GO
/****** Object:  StoredProcedure [dbo].[GetCars]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery3.sql|7|0|C:\Users\levil\AppData\Local\Temp\~vs53D6.sql
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCars] AS
SELECT M.ManufacturerName, CM.ModelName, CM.Year,  CM.Gear, CM.DailyRentalCost,
CM.DailyLateReturnCost 
From Manufacturers M
join CarsModels CM
on M.ManufacturerCode= CM.ManufacturerCode
join Cars C
on C.ModelCode=CM.ModelCode
ORDER BY M.ManufacturerName ASC


GO
/****** Object:  StoredProcedure [dbo].[GetCarsModelByMaker]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [sys].[sp_adduser]    Script Date: 20/08/2015 18:15:00 ******/
CREATE PROCEDURE [dbo].[GetCarsModelByMaker]( @MakerID int) AS
Begin
select ModelCode,ModelName from CarsModels 
where ManufacturerCode=@MakerID
End


GO
/****** Object:  StoredProcedure [dbo].[GetUnicAvailableCars]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetUnicAvailableCars]
(@desiredStartDate date, @desiredEndDate date,@MakeID int=null, @ModelCode int=null, @GearType bit=null) as
 Begin
 select 
 M.ManufacturerName,M.ManufacturerCode, ModelName,min (Cars.CarNumber) AS 'CarNumber', CM.ModelCode,CM.Year, CM.Gear, CM.DailyRentalCost,
 CM.DailyLateReturnCost 
 FROM Cars 
 join CarsModels CM
 on CM.ModelCode=Cars.ModelCode
 join Manufacturers M
 on M.ManufacturerCode= CM.ManufacturerCode
 where CarNumber  NOT IN 
      (select distinct CarNumber 
              from CarsRental
			  where StartDate <= @desiredEndDate AND ReturnDate >= @desiredStartDate
      )
 AND Available=1 
 AND (@MakeID IS NULL or M.ManufacturerCode=@MakeID )
 AND (@ModelCode IS NULL or CM.ModelCode=@ModelCode )
 AND (@GearType IS NULL or CM.Gear=@GearType )
 AND  CM.ModelCode >1
 GROUP BY ModelName,M.ManufacturerCode, M.ManufacturerName,CM.ModelCode,CM.Year,CM.Gear,
 CM.DailyRentalCost,CM.DailyLateReturnCost
 --ORDER BY CarNumber
 ORDER BY M.ManufacturerName ASC
 END

 

GO
/****** Object:  StoredProcedure [dbo].[nulltest]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[nulltest]  (@rmk nvarchar(max))
	
AS
BEGIN
	 
	SELECT ModelName from CarsModels
	 where( @rmk IS NULL or Remarks=@rmk )
	--where Remarks = IsNull(@rmk, Remarks) 
END

GO
/****** Object:  StoredProcedure [dbo].[RentOrder]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RentOrder]
(
 @desiredStartDate date,
 @desiredEndDate date,
 @CarNumber int,
 @UserIdCode int
)
 AS	
 BEGIN
 --IF EXISTS (SELECT 1    FROM    CarsRental    WHERE  CarNumber = @CarNumber)
 
  INSERT INTO  CarsRental ([UserIDCode], [CarNumber], [StartDate], [ReturnDate]  )
  Values       ( @UserIdCode,  @CarNumber, @desiredStartDate, @desiredEndDate    )
	--select       [UserIDCode], @CarNumber, @desiredStartDate, @desiredEndDate from Users 
	--where        UserID      =   @UserId

 END

GO
/****** Object:  StoredProcedure [dbo].[SearchCar]    Script Date: 05/10/2015 20:19:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SearchCar]
( 
  @BeginDate datetime,
  @EndDate datetime,
  @MakerID int =null,
  @ModelCode int =null
 )
AS
If   @MakerID IS  null AND  @ModelCode IS  null

BEGIN 
SELECT DISTINCT 
M.ManufacturerName, CM.ModelName, CM.Year,  CM.Gear, CM.DailyRentalCost,
CM.DailyLateReturnCost 
From Manufacturers M
join CarsModels CM
on M.ManufacturerCode= CM.ManufacturerCode
join CarsRental CR
on CR.CarNumber=CM.ModelCode
where CR.StartDate > @EndDate OR CR.ReturnDate < @BeginDate
ORDER BY M.ManufacturerName ASC
END

Else
If  @ModelCode IS  null
BEGIN 
SELECT DISTINCT 
M.ManufacturerName, CM.ModelName, CM.Year,  CM.Gear, CM.DailyRentalCost,
CM.DailyLateReturnCost 
From Manufacturers M
join CarsModels CM
on M.ManufacturerCode= CM.ManufacturerCode
join CarsRental CR
on CR.CarNumber=CM.ModelCode
where @MakerID= M.ManufacturerCode AND CR.StartDate > @EndDate OR CR.ReturnDate < @BeginDate
ORDER BY M.ManufacturerName ASC
END

Else
BEGIN 
SELECT DISTINCT 
M.ManufacturerName, CM.ModelName, CM.Year,  CM.Gear, CM.DailyRentalCost,
CM.DailyLateReturnCost 
From Manufacturers M
join CarsModels CM
on M.ManufacturerCode= CM.ManufacturerCode
join CarsRental CR
on CR.CarNumber= CM.ModelCode
where @MakerID= M.ManufacturerCode AND @ModelCode=CM.ModelCode AND  CR.StartDate > @EndDate OR CR.ReturnDate < @BeginDate
ORDER BY M.ManufacturerName ASC
END
GO
USE [master]
GO
ALTER DATABASE [CarsRental] SET  READ_WRITE 
GO
