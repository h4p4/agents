USE [master]
GO
/****** Object:  Database [Agents]    Script Date: 10.03.2022 15:50:54 ******/
CREATE DATABASE [Agents]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Agents', FILENAME = N'C:\Users\gr613_zaani\Agents.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Agents_log', FILENAME = N'C:\Users\gr613_zaani\Agents_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Agents] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agents].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agents] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agents] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agents] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agents] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agents] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agents] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Agents] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agents] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agents] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agents] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agents] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agents] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agents] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agents] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agents] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Agents] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agents] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agents] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agents] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Agents] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agents] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Agents] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agents] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Agents] SET  MULTI_USER 
GO
ALTER DATABASE [Agents] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agents] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Agents] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Agents] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Agents] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Agents] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Agents] SET QUERY_STORE = OFF
GO
USE [Agents]
GO
/****** Object:  Table [dbo].[AgentPriorityHistories]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[ChangeDate] [datetime2](7) NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[AgentTypeId] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[INN] [nvarchar](max) NOT NULL,
	[KPP] [nvarchar](max) NOT NULL,
	[DirectorName] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Logo] [nvarchar](max) NOT NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentTypes]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AgentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCostHistories]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCostHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[ChangeDate] [datetime2](7) NOT NULL,
	[CostValue] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_MaterialCostHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](max) NOT NULL,
	[CountInStock] [int] NULL,
	[MinCount] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Cost] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[MaterialTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSuppliers]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSuppliers](
	[MaterialId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSuppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC,
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialTypes]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MaterialTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistories]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ChangeDate] [datetime2](7) NOT NULL,
	[CostValue] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterials]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterials](
	[ProductId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
	[Count] [int] NULL,
 CONSTRAINT [PK_ProductMaterials] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ProductTypeId] [int] NULL,
	[ArticleNumber] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSales]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[SaleDate] [datetime2](7) NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shops]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[AgentId] [int] NOT NULL,
 CONSTRAINT [PK_Shops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 10.03.2022 15:50:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[INN] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[QualityRating] [int] NOT NULL,
	[SupplierType] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (51, N'Шипы для льда 3x2', 3, N'г', 470, 26, N'', 6511, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (52, N'Резина для льда 0x2', 2, N'кг', 816, 21, N'', 48785, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (53, N'Шипы для льда 2x2', 1, N'г', 479, 22, N'', 13077, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (54, N'Шипы для льда 3x0', 9, N'г', 885, 5, N'', 52272, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (55, N'Шипы для пустыни 3x2', 2, N'г', 923, 19, N'', 28748, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (56, N'Шипы для лета 3x1', 6, N'кг', 184, 40, N'', 51974, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (57, N'Резина для зимы 2x3', 3, N'м', 344, 12, N'', 53323, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (58, N'Резина для зимы 3x3', 2, N'кг', 275, 28, N'', 31356, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (59, N'Шипы для льда 1x0', 10, N'г', 914, 22, N'', 25538, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (60, N'Резина для лета 0x1', 9, N'кг', 127, 17, N'', 23936, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (61, N'Резина для лета 2x2', 2, N'м', 542, 20, N'', 54298, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (62, N'Резина для зимы 3x1', 9, N'кг', 690, 24, N'', 25844, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (63, N'Шипы для зимы 0x1', 3, N'г', 255, 25, N'', 6484, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (64, N'Шипы для льда 2x0', 4, N'шт', 214, 15, N'', 17996, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (65, N'Резина для пустыни 3x2', 1, N'м', 931, 43, N'', 5854, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (66, N'Шипы для зимы 3x0', 6, N'г', 192, 48, N'', 9260, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (67, N'Резина для пустыни 2x0', 5, N'кг', 769, 14, N'', 17425, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (68, N'Шипы для лета 3x2', 1, N'г', 547, 11, N'', 43288, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (69, N'Резина для зимы 0x3', 4, N'м', 726, 46, N'', 37293, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (70, N'Шипы для льда 0x0', 2, N'кг', 585, 37, N'', 21188, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (71, N'Шипы для льда 0x1', 2, N'шт', 147, 8, N'', 49557, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (72, N'Резина для льда 1x3', 2, N'кг', 286, 39, N'', 23551, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (73, N'Резина для пустыни 1x3', 5, N'кг', 222, 9, N'', 21546, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (74, N'Шипы для зимы 3x3', 4, N'г', 652, 33, N'', 15159, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (75, N'Шипы для пустыни 0x2', 4, N'г', 792, 46, N'', 8571, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (76, N'Шипы для лета 2x0', 1, N'г', 68, 43, N'', 8206, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (77, N'Резина для пустыни 3x3', 9, N'м', 840, 11, N'', 5144, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (78, N'Резина для льда 0x1', 5, N'м', 964, 34, N'', 53394, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (79, N'Резина для лета 0x2', 4, N'кг', 753, 33, N'', 9069, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (80, N'Резина для зимы 1x0', 5, N'кг', 929, 48, N'', 43046, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (81, N'Резина для лета 3x3', 6, N'м', 652, 28, N'', 6764, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (82, N'Резина для пустыни 1x1', 6, N'кг', 120, 21, N'', 11642, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (83, N'Шипы для пустыни 0x1', 4, N'шт', 612, 24, N'', 55689, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (84, N'Шипы для льда 3x1', 8, N'г', 123, 43, N'', 42668, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (85, N'Резина для льда 3x3', 7, N'кг', 909, 35, N'', 23174, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (86, N'Шипы для льда 2x3', 10, N'шт', 237, 7, N'', 27105, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (87, N'Шипы для лета 2x2', 4, N'г', 15, 10, N'', 44506, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (88, N'Резина для пустыни 2x3', 5, N'м', 103, 38, N'', 55679, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (89, N'Резина для зимы 1x3', 9, N'м', 84, 50, N'', 27823, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (90, N'Резина для лета 1x0', 5, N'м', 234, 32, N'', 25499, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (91, N'Резина для пустыни 0x3', 8, N'м', 761, 7, N'', 8094, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (92, N'Резина для лета 2x1', 2, N'м', 561, 39, N'', 47610, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (93, N'Резина для пустыни 2x1', 10, N'кг', 918, 12, N'', 34518, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (94, N'Шипы для пустыни 3x1', 4, N'г', 37, 43, N'', 27104, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (95, N'Шипы для льда 1x1', 7, N'г', 335, 33, N'', 48279, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (96, N'Шипы для зимы 2x0', 3, N'шт', 466, 8, N'', 34841, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (97, N'Резина для пустыни 1x2', 9, N'кг', 496, 36, N'', 24876, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (98, N'Резина для льда 2x0', 6, N'м', 86, 8, N'', 24767, NULL, 2)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (99, N'Шипы для лета 0x1', 2, N'кг', 974, 35, N'', 28825, NULL, 1)
INSERT [dbo].[Materials] ([Id], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeId]) VALUES (100, N'Шипы для льда 2x1', 10, N'шт', 634, 25, N'', 23287, NULL, 1)
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialTypes] ON 

INSERT [dbo].[MaterialTypes] ([Id], [Title]) VALUES (1, N'Шипы')
INSERT [dbo].[MaterialTypes] ([Id], [Title]) VALUES (2, N'Резина')
SET IDENTITY_INSERT [dbo].[MaterialTypes] OFF
GO
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (1, 61, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (1, 68, 16)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (1, 83, 20)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (3, 57, 3)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (3, 89, 11)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (5, 84, 15)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (6, 58, 3)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (6, 76, 9)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (6, 89, 3)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (6, 99, 10)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (7, 55, 16)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (7, 56, 13)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (7, 87, 18)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (8, 65, 7)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (9, 52, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (9, 59, 4)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (9, 62, 10)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (11, 57, 2)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (14, 64, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (14, 81, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (15, 59, 9)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (15, 61, 4)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (15, 92, 10)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (21, 51, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (25, 79, 11)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (25, 97, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (27, 63, 13)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (27, 68, 13)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (27, 87, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (28, 62, 6)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (30, 51, 9)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (30, 57, 18)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (30, 62, 16)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (30, 69, 11)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (30, 70, 1)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (30, 81, 6)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (30, 87, 15)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (31, 76, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (34, 76, 9)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (34, 90, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (35, 81, 1)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (38, 73, 11)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (38, 84, 4)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (38, 95, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (38, 97, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (42, 57, 9)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (42, 60, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (42, 71, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (42, 83, 10)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (43, 64, 2)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (43, 90, 9)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (43, 100, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (47, 69, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (47, 80, 2)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (47, 94, 11)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (52, 82, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (57, 69, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (57, 85, 11)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (57, 95, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (61, 53, 11)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (61, 79, 8)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (61, 91, 13)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (65, 64, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (65, 69, 10)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (65, 75, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (68, 91, 3)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (68, 92, 4)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (69, 72, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (71, 80, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (71, 93, 9)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (72, 74, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (75, 64, 6)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (76, 75, 12)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (81, 62, 3)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (82, 55, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (82, 79, 15)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (82, 88, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (83, 67, 2)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (83, 76, 16)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (83, 97, 18)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (83, 99, 13)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (85, 56, 19)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (87, 52, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (87, 61, 3)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (87, 70, 4)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (87, 89, 20)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (91, 56, 14)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (91, 58, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (91, 97, 6)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (91, 99, 12)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (92, 51, 19)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (92, 56, 10)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (94, 56, 12)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (94, 65, 13)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (94, 73, 19)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (94, 80, 5)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (98, 80, 4)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (98, 97, 19)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (99, 65, 3)
INSERT [dbo].[ProductMaterials] ([ProductId], [MaterialId], [Count]) VALUES (99, 71, 4)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Колесо R18 Кованый', 1, N'241659', NULL, N'\products\tire_15.jpg', 4, 10, CAST(11509.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Запаска R15 Кованый', 2, N'327657', NULL, N'\products\tire_64.jpg', 2, 8, CAST(8667.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Шина R21 Лето', 3, N'266521', NULL, N'\products\tire_6.jpg', 4, 1, CAST(10561.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Шина R21 Кованый', 3, N'329576', NULL, N'\products\tire_59.jpg', 2, 2, CAST(7989.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Диск R17 Лето', 4, N'400508', NULL, N'\products\tire_24.jpg', 1, 4, CAST(12941.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Шина R14 Липучка', 3, N'331598', NULL, N'\products\tire_17.jpg', 4, 1, CAST(13879.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Диск R16 Кованый', 4, N'440075', NULL, N'\products\tire_25.jpg', 3, 9, CAST(9068.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Запаска R14 Лето', 2, N'448396', NULL, N'\products\tire_32.jpg', 1, 5, CAST(12878.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Диск R22 Липучка', 4, N'418286', NULL, N'\products\tire_4.jpg', 4, 2, CAST(10670.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Запаска R15 Лето', 2, N'348910', NULL, N'\products\tire_50.jpg', 1, 9, CAST(4969.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Шина R15 Липучка', 3, N'349418', NULL, N'\products\tire_48.jpg', 1, 4, CAST(6393.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Колесо R15 Кованый', 1, N'376388', NULL, NULL, 3, 4, CAST(9439.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Колесо R20 Кованый', 1, N'445217', NULL, N'\products\tire_1.jpg', 3, 10, CAST(9569.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Диск R19 Лето', 4, N'243152', NULL, N'\products\tire_0.jpg', 1, 9, CAST(6264.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Колесо R18 Лето', 1, N'412238', NULL, N'\products\tire_14.jpg', 2, 7, CAST(13892.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Диск R20 Зима', 4, N'252453', NULL, NULL, 4, 9, CAST(14526.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Диск R17 Зима', 4, N'343841', NULL, NULL, 3, 9, CAST(12768.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Запаска R21 Липучка', 2, N'247470', NULL, N'\products\tire_62.jpg', 1, 2, CAST(10139.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Запаска R20 Липучка', 2, N'335226', NULL, NULL, 1, 2, CAST(9988.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Шина R17 Кованый', 3, N'299692', NULL, N'\products\tire_58.jpg', 3, 10, CAST(11463.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Диск R20 Липучка', 4, N'447543', NULL, N'\products\tire_3.jpg', 4, 8, CAST(11661.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Запаска R20 Кованый', 2, N'249737', NULL, NULL, 5, 5, CAST(7509.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Колесо R14 Кованый', 1, N'429265', NULL, NULL, 3, 6, CAST(11838.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Диск R21 Кованый', 4, N'299085', NULL, N'\products\tire_61.jpg', 3, 3, CAST(4757.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Шина R20 Кованый', 3, N'330937', NULL, N'\products\tire_45.jpg', 3, 1, CAST(10928.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Диск R16 Липучка', 4, N'435703', NULL, NULL, 5, 2, CAST(9934.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Запаска R18 Лето', 2, N'305509', NULL, N'\products\tire_41.jpg', 1, 3, CAST(5192.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Запаска R19 Кованый', 2, N'390434', NULL, N'\products\tire_46.jpg', 5, 8, CAST(14258.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Диск R18 Лето', 4, N'317858', NULL, N'\products\tire_52.jpg', 5, 3, CAST(8435.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Запаска R14 Кованый', 2, N'412235', NULL, N'\products\tire_47.jpg', 4, 6, CAST(12891.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Запаска R22 Липучка', 2, N'328305', NULL, N'\products\tire_13.jpg', 2, 1, CAST(10116.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Колесо R21 Липучка', 1, N'403378', NULL, N'\products\tire_55.jpg', 3, 10, CAST(3626.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Шина R18 Лето', 3, N'425463', NULL, NULL, 4, 10, CAST(11625.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Запаска R17 Липучка', 2, N'327883', NULL, N'\products\tire_10.jpg', 2, 2, CAST(12332.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Диск R22 Кованый', 4, N'388520', NULL, N'\products\tire_19.jpg', 3, 2, CAST(7498.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Шина R18 Липучка', 3, N'319450', NULL, NULL, 3, 6, CAST(4951.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Шина R16 Кованый', 3, N'421321', NULL, NULL, 1, 2, CAST(14691.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Диск R17 Липучка', 4, N'282569', NULL, N'\products\tire_42.jpg', 5, 5, CAST(12356.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Запаска R23 Зима', 2, N'394768', NULL, N'\products\tire_8.jpg', 1, 9, CAST(13019.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Диск R21 Зима', 4, N'250714', NULL, N'\products\tire_11.jpg', 5, 5, CAST(8762.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Диск R16 Лето', 4, N'251201', NULL, NULL, 3, 10, CAST(8149.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Шина R14 Кованый', 3, N'274477', NULL, N'\products\tire_34.jpg', 5, 5, CAST(9527.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Диск R19 Зима', 4, N'358851', NULL, N'\products\tire_16.jpg', 5, 6, CAST(5695.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Диск R21 Лето', 4, N'449834', NULL, N'\products\tire_35.jpg', 4, 8, CAST(2698.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Запаска R19 Липучка', 2, N'438383', NULL, NULL, 3, 1, CAST(12000.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Колесо R19 Лето', 1, N'298778', NULL, N'\products\tire_38.jpg', 1, 10, CAST(7493.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Колесо R16 Лето', 1, N'337577', NULL, N'\products\tire_2.jpg', 1, 9, CAST(10161.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Запаска R21 Зима', 2, N'365509', NULL, NULL, 5, 6, CAST(14556.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Шина R20 Липучка', 3, N'348553', NULL, NULL, 2, 2, CAST(3508.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Диск R20 Лето', 4, N'300047', NULL, N'\products\tire_56.jpg', 3, 10, CAST(10323.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (51, N'Запаска R18 Липучка', 2, N'279256', NULL, N'\products\tire_53.jpg', 4, 5, CAST(9759.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (52, N'Шина R22 Лето', 3, N'406784', NULL, N'\products\tire_37.jpg', 3, 5, CAST(14692.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (53, N'Колесо R21 Лето', 1, N'276905', NULL, NULL, 1, 2, CAST(10343.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (54, N'Диск R19 Липучка', 4, N'318661', NULL, NULL, 1, 6, CAST(5544.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (55, N'Запаска R14 Зима', 2, N'440993', NULL, NULL, 5, 2, CAST(6020.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (56, N'Запаска R22 Кованый', 2, N'341800', NULL, NULL, 2, 4, CAST(5447.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (57, N'Диск R22 Зима', 4, N'453650', NULL, N'\products\tire_22.jpg', 5, 3, CAST(11459.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (58, N'Запаска R17 Кованый', 2, N'372287', NULL, N'\products\tire_57.jpg', 5, 3, CAST(5808.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (59, N'Диск R15 Лето', 4, N'347427', NULL, NULL, 1, 1, CAST(5071.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (60, N'Шина R15 Кованый', 3, N'274665', NULL, N'\products\tire_63.jpg', 2, 10, CAST(13101.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (61, N'Запаска R19 Лето', 2, N'283112', NULL, N'\products\tire_33.jpg', 3, 4, CAST(3362.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (62, N'Колесо R20 Липучка', 1, N'363664', NULL, NULL, 1, 8, CAST(12681.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (63, N'Шина R19 Зима', 3, N'444141', NULL, NULL, 2, 8, CAST(2741.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (64, N'Шина R22 Кованый', 3, N'416324', NULL, N'\products\tire_30.jpg', 2, 8, CAST(13841.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (65, N'Колесо R18 Зима', 1, N'387609', NULL, N'\products\tire_9.jpg', 1, 4, CAST(3445.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (66, N'Запаска R16 Кованый', 2, N'432234', NULL, NULL, 3, 7, CAST(13556.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (67, N'Колесо R17 Зима', 1, N'381949', NULL, NULL, 4, 6, CAST(5902.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (68, N'Запаска R16 Зима', 2, N'394413', NULL, N'\products\tire_49.jpg', 3, 10, CAST(12679.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (69, N'Колесо R20 Лето', 1, N'434626', NULL, N'\products\tire_31.jpg', 5, 8, CAST(11959.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (70, N'Шина R17 Липучка', 3, N'280863', NULL, NULL, 4, 8, CAST(11695.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (71, N'Шина R18 Зима', 3, N'444280', NULL, N'\products\tire_44.jpg', 4, 6, CAST(13168.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (72, N'Запаска R17 Лето', 2, N'331576', NULL, N'\products\tire_39.jpg', 3, 8, CAST(4803.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (73, N'Запаска R22 Зима', 2, N'268886', NULL, NULL, 3, 2, CAST(13471.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (74, N'Колесо R20 Зима', 1, N'427198', NULL, NULL, 4, 10, CAST(2397.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (75, N'Шина R17 Лето', 3, N'354738', NULL, N'\products\tire_20.jpg', 2, 10, CAST(11329.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (76, N'Шина R14 Лето', 3, N'330951', NULL, N'\products\tire_29.jpg', 4, 7, CAST(6786.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (77, N'Запаска R20 Зима', 2, N'241577', NULL, N'\products\tire_51.jpg', 2, 6, CAST(9125.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (78, N'Колесо R17 Липучка', 1, N'281537', NULL, NULL, 1, 2, CAST(4365.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (79, N'Шина R16 Зима', 3, N'300433', NULL, NULL, 4, 2, CAST(2570.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (80, N'Запаска R19 Зима', 2, N'254860', NULL, NULL, 2, 5, CAST(5568.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (81, N'Диск R22 Лето', 4, N'406411', NULL, N'\products\tire_23.jpg', 2, 4, CAST(2904.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (82, N'Колесо R19 Липучка', 1, N'440973', NULL, N'\products\tire_5.jpg', 4, 4, CAST(8439.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (83, N'Шина R21 Липучка', 3, N'308647', NULL, N'\products\tire_26.jpg', 4, 6, CAST(12830.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (84, N'Шина R17 Зима', 3, N'291319', NULL, N'\products\tire_54.jpg', 2, 4, CAST(6426.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (85, N'Диск R18 Зима', 4, N'255211', NULL, N'\products\tire_21.jpg', 1, 6, CAST(13239.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (86, N'Шина R18 Кованый', 3, N'275809', NULL, N'\products\tire_40.jpg', 4, 10, CAST(3258.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (87, N'Колесо R17 Лето', 1, N'332936', NULL, N'\products\tire_28.jpg', 2, 1, CAST(11145.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (88, N'Шина R22 Зима', 3, N'382661', NULL, NULL, 1, 2, CAST(10373.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (89, N'Шина R19 Лето', 3, N'335030', NULL, NULL, 4, 10, CAST(4870.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (90, N'Шина R19 Кованый', 3, N'291359', NULL, N'\products\tire_27.jpg', 5, 10, CAST(14682.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (91, N'Колесо R18 Липучка', 1, N'332858', NULL, N'\products\tire_12.jpg', 3, 7, CAST(14804.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (92, N'Запаска R15 Липучка', 2, N'237228', NULL, N'\products\tire_18.jpg', 3, 8, CAST(5510.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (93, N'Шина R15 Зима', 3, N'312952', NULL, NULL, 2, 5, CAST(4039.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (94, N'Шина R19 Липучка', 3, N'341034', NULL, N'\products\tire_36.jpg', 1, 5, CAST(13063.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (95, N'Запаска R15 Зима', 2, N'251241', NULL, NULL, 3, 10, CAST(3874.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (96, N'Шина R16 Лето', 3, N'437927', NULL, NULL, 3, 6, CAST(7181.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (97, N'Колесо R16 Липучка', 1, N'263261', NULL, NULL, 4, 1, CAST(14521.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (98, N'Запаска R21 Лето', 2, N'299112', NULL, N'\products\tire_43.jpg', 2, 8, CAST(3694.00 AS Decimal(18, 2)))
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (99, N'Шина R21 Зима', 3, N'398710', NULL, N'\products\tire_7.jpg', 2, 2, CAST(9378.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Products] ([Id], [Title], [ProductTypeId], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (100, N'Шина R16 Липучка', 3, N'320970', NULL, N'\products\tire_60.jpg', 1, 2, CAST(2264.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([Id], [Title]) VALUES (1, N'Колесо')
INSERT [dbo].[ProductTypes] ([Id], [Title]) VALUES (2, N'Запаска')
INSERT [dbo].[ProductTypes] ([Id], [Title]) VALUES (3, N'Шина')
INSERT [dbo].[ProductTypes] ([Id], [Title]) VALUES (4, N'Диск')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
/****** Object:  Index [IX_AgentPriorityHistories_AgentId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_AgentPriorityHistories_AgentId] ON [dbo].[AgentPriorityHistories]
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Agents_AgentTypeId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_Agents_AgentTypeId] ON [dbo].[Agents]
(
	[AgentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MaterialCostHistories_MaterialId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_MaterialCostHistories_MaterialId] ON [dbo].[MaterialCostHistories]
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Materials_MaterialTypeId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_Materials_MaterialTypeId] ON [dbo].[Materials]
(
	[MaterialTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MaterialSuppliers_MaterialId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_MaterialSuppliers_MaterialId] ON [dbo].[MaterialSuppliers]
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductCostHistories_ProductId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_ProductCostHistories_ProductId] ON [dbo].[ProductCostHistories]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductMaterials_MaterialId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_ProductMaterials_MaterialId] ON [dbo].[ProductMaterials]
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductTypeId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductTypeId] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductSales_AgentId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_ProductSales_AgentId] ON [dbo].[ProductSales]
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Shops_AgentId]    Script Date: 10.03.2022 15:50:54 ******/
CREATE NONCLUSTERED INDEX [IX_Shops_AgentId] ON [dbo].[Shops]
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AgentPriorityHistories]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistories_Agents_AgentId] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AgentPriorityHistories] CHECK CONSTRAINT [FK_AgentPriorityHistories_Agents_AgentId]
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD  CONSTRAINT [FK_Agents_AgentTypes_AgentTypeId] FOREIGN KEY([AgentTypeId])
REFERENCES [dbo].[AgentTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Agents] CHECK CONSTRAINT [FK_Agents_AgentTypes_AgentTypeId]
GO
ALTER TABLE [dbo].[MaterialCostHistories]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCostHistories_Materials_MaterialId] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MaterialCostHistories] CHECK CONSTRAINT [FK_MaterialCostHistories_Materials_MaterialId]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_MaterialTypes_MaterialTypeId] FOREIGN KEY([MaterialTypeId])
REFERENCES [dbo].[MaterialTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_MaterialTypes_MaterialTypeId]
GO
ALTER TABLE [dbo].[MaterialSuppliers]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Materials_MaterialId] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [dbo].[MaterialSuppliers] CHECK CONSTRAINT [FK_MaterialSuppliers_Materials_MaterialId]
GO
ALTER TABLE [dbo].[MaterialSuppliers]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSuppliers_Suppliers_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Suppliers] ([Id])
GO
ALTER TABLE [dbo].[MaterialSuppliers] CHECK CONSTRAINT [FK_MaterialSuppliers_Suppliers_SupplierId]
GO
ALTER TABLE [dbo].[ProductCostHistories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistories_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductCostHistories] CHECK CONSTRAINT [FK_ProductCostHistories_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterials_Materials_MaterialId] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [dbo].[ProductMaterials] CHECK CONSTRAINT [FK_ProductMaterials_Materials_MaterialId]
GO
ALTER TABLE [dbo].[ProductMaterials]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterials_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductMaterials] CHECK CONSTRAINT [FK_ProductMaterials_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes_ProductTypeId]
GO
ALTER TABLE [dbo].[ProductSales]  WITH CHECK ADD  CONSTRAINT [FK_ProductSales_Agents_AgentId] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductSales] CHECK CONSTRAINT [FK_ProductSales_Agents_AgentId]
GO
ALTER TABLE [dbo].[Shops]  WITH CHECK ADD  CONSTRAINT [FK_Shops_Agents_AgentId] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Shops] CHECK CONSTRAINT [FK_Shops_Agents_AgentId]
GO
USE [master]
GO
ALTER DATABASE [Agents] SET  READ_WRITE 
GO
