-- ===========================================================
-- Create landing tables
-- ===========================================================

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [landing_spa].[kunde]    Script Date: 4/13/2021 10:37:57 AM ******/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[kunde]') AND type in (N'U'))
DROP TABLE [landing_spa].[kunde]
GO

CREATE TABLE [landing_spa].[kunde](
	----[extrakt_vom] NVARCHAR(max),
	[K_ID] NVARCHAR(max) NULL,
	[IMPORT_AM] NVARCHAR(max) NULL,
	[LIEFERN_AB] NVARCHAR(max) NULL,
	[VERTRAGSENDE] NVARCHAR(max) NULL,
	[WUNSCHTERMIN] NVARCHAR(max) NULL,
	EINZUGSDATUM NVARCHAR(max) NULL,
	[ABSCHLAGSMIT_AM] NVARCHAR(max) NULL,
	[FREI_ZUM] NVARCHAR(max) NULL,
	RLM NVARCHAR(max) NULL,
	KUENDIGUNGSGRUND NVARCHAR(max) NULL,
	[STORNO] NVARCHAR(max) NULL,
	[VERBRAUCH_AKT] VARCHAR(100) NULL	
) ON [PRIMARY]
GO


/****** Object:  Table [landing_spa].[kalender]    Script Date: 4/13/2021 10:38:13 AM ******/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[kalender]') AND type in (N'U'))
DROP TABLE [landing_spa].[kalender]
GO

CREATE TABLE [landing_spa].[kalender](
	[KAL_ID] VARCHAR(100) NOT NULL,
	BEZEICHNUNG VARCHAR(100) NOT NULL
)	ON [PRIMARY]
GO

/****** Object:  Table [landing_spa].[kalendertag]    Script Date: 4/13/2021 10:38:13 AM ******/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[kalendertag]') AND type in (N'U'))
DROP TABLE [landing_spa].[kalendertag]
GO

CREATE TABLE [landing_spa].[kalendertag](
	--[extrakt_vom] NVARCHAR(max),
	[KAL_ID] NVARCHAR(max) NULL,
	[KAL_DATUM] NVARCHAR(max) NULL,
	[ART] NVARCHAR(max) NULL,
	[BEMERKUNG] VARCHAR(max) NULL,
	[PRIMARY_KEY] VARCHAR(max) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [landing_spa].[nach_k]    Script Date: 13.04.2021 10:43:22 ******/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[nach_k]') AND type in (N'U'))
DROP TABLE [landing_spa].[nach_k]
GO

CREATE TABLE [landing_spa].[nach_k](
	--[extrakt_vom] DATETIME NOT NULL DEFAULT GETDATE(),
	[K_ID] NVARCHAR(max) NULL,
	[GESENDET] NVARCHAR(max) NULL,
	[NACH_ID] NVARCHAR(max) NULL,
	[DATUM] NVARCHAR(max) NULL,
	[ABSENDER] NVARCHAR(max) NULL,
	[EMPFAENGER] NVARCHAR(max) NULL,
	[PRUEFIDENTIFIKATOR] NVARCHAR(max) NULL,
	[KATEGORIE] NVARCHAR(max) NULL,
	[ANTWORT] NVARCHAR(max) NULL,
	[TRANSAKTIONSGRUND] NVARCHAR(max) NULL,
	[PRIMARY_KEY] NVARCHAR(max) NULL,
	FEHLERCODE VARCHAR(100) NULL,
	ENDE_ZUM VARCHAR(100) NULL	
) ON [PRIMARY] 
GO

/****** Object:  Table [landing_spa].[kunden_hist]    Script Date: 13.04.2021 10:43:22 ******/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[kunden_historie]') AND type in (N'U'))
DROP TABLE [landing_spa].[kunden_historie]
GO

CREATE TABLE [landing_spa].[kunden_historie](
	--[extrakt_vom] DATETIME NOT NULL DEFAULT GETDATE(),
	[ABN_ID] NVARCHAR(max) NULL,
	[ART] NVARCHAR(max) NULL,
	[GUELTIG_BIS] NVARCHAR(max) NULL,
	[FELD1] NVARCHAR(max) NULL,
	[FELD2] NVARCHAR(max) NULL,
	[DATUM] NVARCHAR(max) NULL,
	[ZEIT] NVARCHAR(max) NULL
) ON [PRIMARY] 
GO

/****** Object:  Table [landing_spa].[abrechnung]    Script Date: 13.04.2021 10:43:22 ******/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[abrechnung]') AND type in (N'U'))
DROP TABLE [landing_spa].[abrechnung]
GO
CREATE TABLE [landing_spa].[abrechnung](
	--[extrakt_vom] DATETIME NOT NULL DEFAULT GETDATE(),
	[AB_DATUM] NVARCHAR(max) NULL,
	[K_ID] NVARCHAR(max) NULL,
	[ABR_ART] NVARCHAR(max) NULL,
	[ABR_ID] NVARCHAR(max) NULL,
	[FAELLIG_AM] NVARCHAR(max) NULL,
	[R_NUMMER] NVARCHAR(max) NULL,
	[STORNO] NVARCHAR(max) NULL,
	[STORNO_AM] NVARCHAR(max) NULL,
	[STORNOGRUND] NVARCHAR(max) NULL,
	[ZEITRAUM_VON] NVARCHAR(max) NULL,
	[ZEITRAUM_BIS] NVARCHAR(max) NULL
) ON [PRIMARY]
GO

/****** Object:  Table [landing_spa].[zaehler_historie]    Script Date: 13.04.2021 10:43:22 ******/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[zaehler_historie]') AND type in (N'U'))
DROP TABLE [landing_spa].[zaehler_historie]
GO

CREATE TABLE [landing_spa].[zaehler_historie](
	--[extrakt_vom] DATETIME NOT NULL DEFAULT GETDATE(),
	[K_ID] NVARCHAR(max) NULL,
	[ABR_ID] NVARCHAR(max) NULL,
	[ERFASST_ALT_AM] NVARCHAR(max) NULL,
	[ERFASST_NEU_AM] NVARCHAR(max) NULL,
	[IMPORTIERT_AM] NVARCHAR(max) NULL,
	[MSCONS_ID_ALT] NVARCHAR(max) NULL,
	[MSCONS_ID_NEU] NVARCHAR(max) NULL,
	[PRIMARY_KEY] NVARCHAR(max) NULL,
	[STORNO] NVARCHAR(max) NULL,
	[Z_ART] NVARCHAR(max) NULL,
	[Z_HIST_ART] NVARCHAR(max) NULL,
	[Z_HIST_ID] NVARCHAR(max) NULL
) ON [PRIMARY] 
GO

/****** Object:  Table [landing_spa].[k_xml]    Script Date: 13.04.2021 10:43:22 ******/

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[k_xml]') AND type in (N'U'))
DROP TABLE [landing_spa].[k_xml]
GO

CREATE TABLE [landing_spa].[k_xml](
	--[extrakt_vom] DATETIME NOT NULL DEFAULT GETDATE(),
	[K_ID] NVARCHAR(max) NULL,
	[EINGANG_AUSGANG] NVARCHAR(max) NULL,
	[ID] NVARCHAR(max) NULL, -- [EINGANG_ID]
	[DATUM] NVARCHAR(max) NULL, -- [ERSTELLDATUM]
	[SENDER] NVARCHAR(max) NULL,
	[PROZESS] NVARCHAR(max) NULL,
	[ANTWORT_CODE] NVARCHAR(max) NULL
) ON [PRIMARY] 
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[buchung]') AND type in (N'U'))
DROP TABLE [landing_spa].[buchung]
GO

CREATE TABLE [landing_spa].[buchung](
	K_ID NVARCHAR(max) NULL,
	ABBUCHBAR NVARCHAR(max) NULL,
	ABGEBUCHT_AM NVARCHAR(max) NULL,
	ABR_ID NVARCHAR(max) NULL,
	ABSTIMMUNGSDATUM NVARCHAR(max) NULL,
	B_ART NVARCHAR(max) NULL,
	B_DATUM NVARCHAR(max) NULL,
	B_ID NVARCHAR(max) NULL,
	BETRAG_HABEN NVARCHAR(max) NULL,
	BETRAG_SOLL NVARCHAR(max) NULL,
	DTA_ERZEUGT_AM NVARCHAR(max) NULL,
	FAELLIG_AM NVARCHAR(max) NULL,
	JAHR_MONAT NVARCHAR(max) NULL,
	MAHNSTUFE NVARCHAR(max) NULL,
	REF_ZEICHEN NVARCHAR(max) NULL,
	ERFASST_AM NVARCHAR(max) NULL
) ON [PRIMARY] 
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[kalender]') AND type in (N'U'))
DROP TABLE landing_spa.kalender
GO

CREATE TABLE landing_spa.kalender (
	KAL_ID NVARCHAR(max) NULL,
	BEZEICHNUNG NVARCHAR(max) NULL
) ON [PRIMARY] 
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[files_log]') AND type in (N'U'))
DROP TABLE landing_spa.files_log
GO

CREATE TABLE [landing_spa].[files_log](
	[name] [nvarchar](100) NOT NULL,
	[lastwritetime] [nvarchar](100) NOT NULL,
	[size] [nvarchar](100) NOT NULL,
	[directory_path] [nvarchar](100) NOT NULL,
	[load_cycle_seq] [int] NULL,
	[insert_dts] [datetime] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [landing_spa].[files_log] ADD  DEFAULT (getdate()) FOR [insert_dts]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[mahnung]') AND type in (N'U'))
DROP TABLE landing_spa.mahnung
GO

CREATE TABLE [landing_spa].[mahnung](
	K_ID NVARCHAR(max) NULL,
	MAHNBETRAG NVARCHAR(max) NULL,
	MAHNSTUFE NVARCHAR(max) NULL,
	DRUCKDATUM NVARCHAR(max) NULL,
	PRIMARY_KEY NVARCHAR(max) NULL,
) ON [PRIMARY]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[landing_spa].[netznutzung_k_test]') AND type in (N'U'))
DROP TABLE landing_spa.netznutzung_k
GO

CREATE TABLE [landing_spa].[netznutzung_k](
	K_ID NVARCHAR(max) NULL,
	FAELLIG_AM NVARCHAR(max) NULL,
	UBERW_AM NVARCHAR(max) NULL,
	BEMERKUNG NVARCHAR(max) NULL,
	PRIMARY_KEY NVARCHAR(max) NULL,
) ON [PRIMARY]
GO

