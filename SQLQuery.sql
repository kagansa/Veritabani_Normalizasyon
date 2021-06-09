USE [Normalizasyon]
GO
/****** Object:  Table [dbo].[Kitaplar]    Script Date: 9.06.2021 21:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar](
	[Id] [int] NOT NULL,
	[Ad] [nvarchar](max) NULL,
	[YazarId] [int] NULL,
	[YayineviId] [int] NULL,
	[Fiyat] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Kitaplar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kitaplar_KitapTurleri]    Script Date: 9.06.2021 21:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kitaplar_KitapTurleri](
	[Id] [int] NOT NULL,
	[KitapId] [int] NULL,
	[KitapTurId] [int] NULL,
 CONSTRAINT [PK_Kitaplar_KitapTurleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KitapTurleri]    Script Date: 9.06.2021 21:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KitapTurleri](
	[Id] [int] NOT NULL,
	[Ad] [nvarchar](max) NULL,
 CONSTRAINT [PK_KitapTurleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 9.06.2021 21:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[Id] [int] NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satislar]    Script Date: 9.06.2021 21:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satislar](
	[Id] [int] NOT NULL,
	[SiparisDetayId] [int] NULL,
	[MusteriId] [int] NULL,
	[SatisTarihi] [datetime] NULL,
 CONSTRAINT [PK_Satislar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SatislarDetay]    Script Date: 9.06.2021 21:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatislarDetay](
	[Id] [int] NOT NULL,
	[KitapId] [int] NULL,
	[Adet] [int] NULL,
 CONSTRAINT [PK_SatislarDetay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yayinevleri]    Script Date: 9.06.2021 21:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yayinevleri](
	[Id] [int] NOT NULL,
	[Ad] [nvarchar](max) NULL,
 CONSTRAINT [PK_Yayinevleri] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yazarlar]    Script Date: 9.06.2021 21:18:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yazarlar](
	[Id] [int] NOT NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
 CONSTRAINT [PK_Yazarlar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Yayinevleri] FOREIGN KEY([YayineviId])
REFERENCES [dbo].[Yayinevleri] ([Id])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Yayinevleri]
GO
ALTER TABLE [dbo].[Kitaplar]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_Yazarlar] FOREIGN KEY([YazarId])
REFERENCES [dbo].[Yazarlar] ([Id])
GO
ALTER TABLE [dbo].[Kitaplar] CHECK CONSTRAINT [FK_Kitaplar_Yazarlar]
GO
ALTER TABLE [dbo].[Kitaplar_KitapTurleri]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_KitapTurleri_Kitaplar] FOREIGN KEY([KitapId])
REFERENCES [dbo].[Kitaplar] ([Id])
GO
ALTER TABLE [dbo].[Kitaplar_KitapTurleri] CHECK CONSTRAINT [FK_Kitaplar_KitapTurleri_Kitaplar]
GO
ALTER TABLE [dbo].[Kitaplar_KitapTurleri]  WITH CHECK ADD  CONSTRAINT [FK_Kitaplar_KitapTurleri_KitapTurleri] FOREIGN KEY([KitapTurId])
REFERENCES [dbo].[KitapTurleri] ([Id])
GO
ALTER TABLE [dbo].[Kitaplar_KitapTurleri] CHECK CONSTRAINT [FK_Kitaplar_KitapTurleri_KitapTurleri]
GO
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD  CONSTRAINT [FK_Satislar_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([Id])
GO
ALTER TABLE [dbo].[Satislar] CHECK CONSTRAINT [FK_Satislar_Musteriler]
GO
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD  CONSTRAINT [FK_Satislar_SatislarDetay] FOREIGN KEY([SiparisDetayId])
REFERENCES [dbo].[SatislarDetay] ([Id])
GO
ALTER TABLE [dbo].[Satislar] CHECK CONSTRAINT [FK_Satislar_SatislarDetay]
GO
ALTER TABLE [dbo].[SatislarDetay]  WITH CHECK ADD  CONSTRAINT [FK_SatislarDetay_Kitaplar] FOREIGN KEY([KitapId])
REFERENCES [dbo].[Kitaplar] ([Id])
GO
ALTER TABLE [dbo].[SatislarDetay] CHECK CONSTRAINT [FK_SatislarDetay_Kitaplar]
GO
