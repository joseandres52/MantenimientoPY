/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Ciudadanos]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudadanos](
	[idCiudadano] [int] IDENTITY(1,1) NOT NULL,
	[nombreCiudadano] [varchar](50) NULL,
	[apellidoPatCiudadano] [varchar](50) NULL,
	[apellidoMatCiudadano] [varchar](50) NULL,
	[direccionCiudadano] [varchar](100) NULL,
	[passwordCiudadano] [varchar](100) NULL,
	[correoCiudadano] [varchar](50) NULL,
	[estadoCiudadano] [int] NULL,
	[numReportesFalsosCiudadano] [int] NULL,
	[telefonoCiudadano] [int] NULL,
 CONSTRAINT [PK_Ciudadanos] PRIMARY KEY CLUSTERED 
(
	[idCiudadano] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactosEmergencia]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactosEmergencia](
	[idContactoEmergencia] [int] IDENTITY(1,1) NOT NULL,
	[idCiudadano] [int] NOT NULL,
	[numContactoEmergencia] [int] NOT NULL,
	[nombreContactoEmergencia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ContactosEmergencia] PRIMARY KEY CLUSTERED 
(
	[idContactoEmergencia] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactosPolicia]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactosPolicia](
	[idContactoPoli] [int] IDENTITY(1,1) NOT NULL,
	[idPolicia] [int] NOT NULL,
	[numContactoPolicia] [int] NOT NULL,
	[nombreContactoPolicia] [nvarchar](50) NULL,
 CONSTRAINT [PK__Contacto__F52C04700C47D502] PRIMARY KEY CLUSTERED 
(
	[idContactoPoli] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Denuncias]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Denuncias](
	[idDenuncia] [int] IDENTITY(1,1) NOT NULL,
	[idCiudadano] [int] NOT NULL,
	[idPolicia] [int] NULL,
	[idTipoDenuncia] [int] NOT NULL,
	[idTipoDelito] [int] NOT NULL,
	[idEstadoDenuncia] [int] NULL,
	[latitudDenuncia] [decimal](10, 7) NOT NULL,
	[longitudDenuncia] [decimal](10, 7) NOT NULL,
	[descripcionDenuncia] [varchar](300) NULL,
	[afectadoDenuncia] [varchar](300) NULL,
	[fechaDenuncia] [datetime] NULL,
 CONSTRAINT [PK_DenunciasDelitos] PRIMARY KEY CLUSTERED 
(
	[idDenuncia] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoDenuncia]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoDenuncia](
	[idEstadoDenuncia] [int] NOT NULL,
	[descripcionEstadoDenuncia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadoDenuncia] PRIMARY KEY CLUSTERED 
(
	[idEstadoDenuncia] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policias]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policias](
	[idPolicia] [int] IDENTITY(1,1) NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
	[identificacionPolicia] [int] NULL,
	[nombrePolicia] [varchar](50) NULL,
	[apellidoPaternoPolicia] [varchar](50) NULL,
	[apellidoMaternoPolicia] [varchar](50) NULL,
	[direccionPolicia] [varchar](100) NULL,
	[telefonoPolicia] [int] NULL,
	[correoPolicia] [varchar](50) NULL,
	[passwordPolicia] [varchar](50) NULL,
	[estadoPolicia] [int] NULL,
 CONSTRAINT [PK_Policias] PRIMARY KEY CLUSTERED 
(
	[idPolicia] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDelito]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDelito](
	[idTipoDelito] [int] NOT NULL,
	[nombreTipoDelito] [varchar](50) NOT NULL,
	[descripcionTipoDelito] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDelito] PRIMARY KEY CLUSTERED 
(
	[idTipoDelito] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoDenuncias]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDenuncias](
	[idTipoDenuncia] [int] NOT NULL,
	[nombreDenuncia] [varchar](50) NOT NULL,
	[descripcionDenincua] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDenuncias] PRIMARY KEY CLUSTERED 
(
	[idTipoDenuncia] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 12/3/2019 8:11:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[idTipoUsuario] [int] NOT NULL,
	[descripcionTipoUsuario] [varchar](50) NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[idTipoUsuario] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ciudadanos] ON 

INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (5, N'Jazmine', N'Hernandez', N'Ramirez', N'Tibás centro', N'1234', N'test@tets.com', 0, 0, 88888888)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (11, N'Emily', N'Scott', N'Ramirez', N'Tibás centro', N'123', N'emi.oba97@gmail.com', 0, 1, 87235566)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (29, N'Andres', N'Espinoza', N'isaza', N'Tibás centro', N'1234', N'andres@gmail.com', 0, 0, 88467822)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (30, N'Villandry', N'Fallas', N'Fernandez', N'Tibás Cinco Esquinas', N'prueba123', N'calderon_102@hotmail.com', 0, 0, 86549929)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (31, N'Kenneth', N'Gomez', N'Guzman', N'Tibás Llorente', N'123', N'fabian@hotmail.com', 0, 0, 78346744)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (32, N'Jeffrey ', N'Hills', N'Hernandez', N'Tibás centro', N'General57', N'jeffrey.arroyo@gmail.com', 0, 0, 89325524)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (33, N'Andy', N'Iglesias', N'Ign', N'Tibás centro', N'12345678', N'andres.sandoval@hotmail.com', 0, 0, 87127955)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (35, N'María', N'Marín', N'Murcia', N'Tibás centro', N'123456789', N'maria.marin@gmail.com', 0, 0, 87556644)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (43, N'Michael', N'Fallas', N'Guzmán', N'Tibás centro', N'12345678', N'maicol@hotmail.com', 0, 0, 87456390)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (45, N'Sandra', N'Tobal', N'Perez', N'Tibás centro', N'12345678', N'p@yahoo.com', 0, 0, 67875833)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (46, N'jeffry', N'Rodrguez', N'Gamboa', N'Tibás Leóntrece Garabito, casa #506,entre alameda 5y 6.casa color blanca.', N'JEF25fry', N'glenmemejp@gmail.com', 0, 0, 86033499)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (47, N'Laura', N'Mora', N'Castro', N'Tibás centro', N'holis_02', N'holis@holis.com', 0, 0, 85858585)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (48, N'Diego', N'León ', N'León', N'San Antonio de Escazú', N'demo8yeah', N'diegoleon2196@gmail.com', 0, 0, 86307138)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (49, N'Emily', N'García', N'Obando', N'San Juan de Tibás', N'12345678', N'emily.obando@hotmail.com', 0, 0, 88572618)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (51, N'kenneth', N'gutierrez ', N'isaza', N'tibas centro', N'12345678', N'kenneth@hotmail.com', 0, 0, 88888888)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (53, N'fabian ', N'gutierrez ', N'isaza ', N'tibas', N'12345678', N'lol@hotmail.com', 0, 0, 87424084)
INSERT [dbo].[Ciudadanos] ([idCiudadano], [nombreCiudadano], [apellidoPatCiudadano], [apellidoMatCiudadano], [direccionCiudadano], [passwordCiudadano], [correoCiudadano], [estadoCiudadano], [numReportesFalsosCiudadano], [telefonoCiudadano]) VALUES (54, N'Haniel', N'Sandino', N'Rivera', N'Cinco Esquinas, Tibás', N'holis_02', N'hanielsandino@hotmail.com', 0, 0, 89697742)
SET IDENTITY_INSERT [dbo].[Ciudadanos] OFF
SET IDENTITY_INSERT [dbo].[ContactosEmergencia] ON 

INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (22, 11, 87127955, N'Mario Ulloa Zeledón')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (23, 43, 87127943, N'Jeannette Zuñiga Chavarría')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (24, 43, 87127777, N'Luisa Mora Gamboa')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (26, 45, 87129999, N'José Andres Sandoval')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (27, 45, 87120000, N'Yamileth Garro Keith')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (30, 46, 84177250, N'Scott Hernandez Jimenez')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (31, 46, 85059578, N'Melany Gutierrez Durán')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (34, 30, 87127111, N'Héctor Fallas Calderón')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (35, 30, 87121111, N'Randall Chavarría Abarca')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (36, 30, 87155555, N'Víctor Vargas Villegas')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (37, 30, 87127894, N'Peter Daniels Smith')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (38, 47, 84185970, N'Guillermo Wilson Castro')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (39, 47, 89697742, N'Katherine Campell Yuelth')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (41, 48, 87124563, N'Juan Navarro Naranjo')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (42, 48, 84657128, N'Carlos Barrahonda Birr')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (43, 29, 33333333, N'Luis Fallas Feith')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (44, 49, 88503181, N'Rosario')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (45, 49, 86549929, N'Villandry')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (46, 51, 88888888, N'Luis')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (47, 51, 33333333, N'Andrea')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (50, 53, 33333333, N'Luis')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (51, 53, 22222222, N'Andrea')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (52, 54, 12345678, N'Geiner')
INSERT [dbo].[ContactosEmergencia] ([idContactoEmergencia], [idCiudadano], [numContactoEmergencia], [nombreContactoEmergencia]) VALUES (53, 54, 98765432, N'Mamá')
SET IDENTITY_INSERT [dbo].[ContactosEmergencia] OFF
SET IDENTITY_INSERT [dbo].[ContactosPolicia] ON 

INSERT [dbo].[ContactosPolicia] ([idContactoPoli], [idPolicia], [numContactoPolicia], [nombreContactoPolicia]) VALUES (18, 3, 88888, N'luis')
SET IDENTITY_INSERT [dbo].[ContactosPolicia] OFF
SET IDENTITY_INSERT [dbo].[Denuncias] ON 

INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (7, 5, 2, 2, 1, 0, CAST(9.9220514 AS Decimal(10, 7)), CAST(-84.0839286 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (8, 5, 4, 2, 1, 0, CAST(9.9700000 AS Decimal(10, 7)), CAST(-84.0700000 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (14, 11, 1, 1, 0, 0, CAST(9.9500000 AS Decimal(10, 7)), CAST(-84.0600000 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (15, 29, 1, 1, 0, 1, CAST(9.4220514 AS Decimal(10, 7)), CAST(-84.0839286 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (16, 30, 2, 1, 7, 2, CAST(9.9644176 AS Decimal(10, 7)), CAST(-84.0656059 AS Decimal(10, 7)), N'acoso', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (17, 31, 2, 1, 7, 2, CAST(9.9655210 AS Decimal(10, 7)), CAST(-84.0658358 AS Decimal(10, 7)), N'acoso', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (18, 5, 4, 1, 0, 1, CAST(9.9600000 AS Decimal(10, 7)), CAST(-84.0800000 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (19, 33, 2, 1, 0, 2, CAST(9.9568736 AS Decimal(10, 7)), CAST(-84.0684523 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (20, 5, 1, 1, 0, 1, CAST(9.9569084 AS Decimal(10, 7)), CAST(-84.0684824 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (21, 32, 6, 1, 0, 1, CAST(9.9600000 AS Decimal(10, 7)), CAST(-84.0700000 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (22, 35, 2, 1, 0, 0, CAST(9.9600000 AS Decimal(10, 7)), CAST(-84.0700000 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (23, 35, 2, 1, 0, 0, CAST(9.9600000 AS Decimal(10, 7)), CAST(-84.0700000 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (24, 35, 4, 1, 0, 1, CAST(9.9600000 AS Decimal(10, 7)), CAST(-84.0700000 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (25, 35, 1, 1, 0, 1, CAST(9.9569362 AS Decimal(10, 7)), CAST(-84.0684150 AS Decimal(10, 7)), N'emergencia', N'üsuario', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (26, 11, 6, 1, 0, 0, CAST(9.9600000 AS Decimal(10, 7)), CAST(-84.0800000 AS Decimal(10, 7)), N'emergencia', N'emi.oba97@gmail.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (28, 11, 1, 1, 0, 2, CAST(9.9600000 AS Decimal(10, 7)), CAST(-84.0800000 AS Decimal(10, 7)), N'emergencia', N'emi.oba97@gmail.com', NULL)
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (29, 5, 1, 1, 0, 1, CAST(9.9500000 AS Decimal(10, 7)), CAST(-84.0800000 AS Decimal(10, 7)), N'emergencia', N'test@tets.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (40, 11, 2, 1, 0, 0, CAST(9.9500000 AS Decimal(10, 7)), CAST(-84.0600000 AS Decimal(10, 7)), N'emergencia', N'emi.oba97@gmail.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (41, 11, 1, 1, 0, 1, CAST(9.9600000 AS Decimal(10, 7)), CAST(-84.0600000 AS Decimal(10, 7)), N'emergencia', N'emi.oba97@gmail.com', NULL)
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (42, 11, 1, 1, 0, 0, CAST(9.9561156 AS Decimal(10, 7)), CAST(-84.0689128 AS Decimal(10, 7)), N'emergencia', N'emi.oba97@gmail.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (43, 11, 1, 1, 0, 0, CAST(9.9579271 AS Decimal(10, 7)), CAST(-84.0650138 AS Decimal(10, 7)), N'emergencia', N'emi.oba97@gmail.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (48, 45, 1, 1, 0, 0, CAST(9.9585273 AS Decimal(10, 7)), CAST(-84.1059349 AS Decimal(10, 7)), N'emergencia', N'p@yahoo.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (49, 5, 1, 1, 0, 0, CAST(9.9456190 AS Decimal(10, 7)), CAST(-84.0761196 AS Decimal(10, 7)), N'emergencia', N'test@tets.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (50, 30, 1, 1, 0, 0, CAST(9.9469610 AS Decimal(10, 7)), CAST(-84.0637950 AS Decimal(10, 7)), N'emergencia', N'calderon_102@hotmail.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (51, 30, 1, 1, 0, 0, CAST(9.9469156 AS Decimal(10, 7)), CAST(-84.0692690 AS Decimal(10, 7)), N'emergencia', N'calderon_102@hotmail.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (52, 30, 1, 1, 0, 0, CAST(9.9462590 AS Decimal(10, 7)), CAST(-84.0632650 AS Decimal(10, 7)), N'emergencia', N'calderon_102@hotmail.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (53, 30, 1, 1, 0, 0, CAST(9.9409078 AS Decimal(10, 7)), CAST(-84.0642617 AS Decimal(10, 7)), N'emergencia', N'calderon_102@hotmail.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (54, 5, 1, 1, 0, 0, CAST(9.9586289 AS Decimal(10, 7)), CAST(-84.0731193 AS Decimal(10, 7)), N'emergencia', N'test@tets.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (55, 29, 1, 1, 0, 2, CAST(9.9655263 AS Decimal(10, 7)), CAST(-84.0658398 AS Decimal(10, 7)), N'emergencia', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (56, 29, 1, 2, 2, 0, CAST(9.9615249 AS Decimal(10, 7)), CAST(-84.0608381 AS Decimal(10, 7)), N'Afectado: luis
Suceso: daño a casa', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (57, 29, 1, 2, 2, 0, CAST(9.9655555 AS Decimal(10, 7)), CAST(-84.0658523 AS Decimal(10, 7)), N'Afectado: omar
Suceso: adjdjfjfhcjrjrkdksksjcnfnrjdjcjfjfjwhshw', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (58, 29, 1, 2, 1, 0, CAST(9.9659000 AS Decimal(10, 7)), CAST(-84.0658677 AS Decimal(10, 7)), N'Afectado: kenneth 
Suceso: asaltado por la casa por 2 personas', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (59, 29, 1, 2, 2, 0, CAST(9.9615177 AS Decimal(10, 7)), CAST(-84.0618510 AS Decimal(10, 7)), N'Afectado: luis
Suceso: vandalismo', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (60, 29, 1, 2, 3, 0, CAST(9.9655777 AS Decimal(10, 7)), CAST(-84.0648599 AS Decimal(10, 7)), N'Afectado: andrea
Suceso: 2 sujetos la agredieron', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (62, 29, 1, 2, 5, 0, CAST(9.9355111 AS Decimal(10, 7)), CAST(-84.0658553 AS Decimal(10, 7)), N'Afectado: paula
Suceso: agresion casa', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (63, 29, 1, 2, 4, 0, CAST(9.9655500 AS Decimal(10, 7)), CAST(-84.0658515 AS Decimal(10, 7)), N'Afectado: edwin
Suceso: pelea en bar', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (64, 29, 1, 2, 9, 0, CAST(9.9755987 AS Decimal(10, 7)), CAST(-84.0658578 AS Decimal(10, 7)), N'Afectado: kevin
Suceso: radicalismo', N'andres@', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (65, 47, 4, 1, 0, 2, CAST(9.9500000 AS Decimal(10, 7)), CAST(-84.0700000 AS Decimal(10, 7)), N'emergencia', N'holis@holis.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (66, 5, 1, 2, 2, 2, CAST(9.9568609 AS Decimal(10, 7)), CAST(-84.0684265 AS Decimal(10, 7)), N'Afectado: villandry
Suceso: se metieron a mi casa', N'test@tets.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (67, 5, 1, 2, 2, 2, CAST(9.9568609 AS Decimal(10, 7)), CAST(-84.0684265 AS Decimal(10, 7)), N'Afectado: villandry', N'test@tets.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (69, 5, 1, 2, 2, 0, CAST(9.9562222 AS Decimal(10, 7)), CAST(-84.0684555 AS Decimal(10, 7)), N'Afenctado: Andres Sandoval Chavarria', N'test@tets.com', CAST(N'2019-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (70, 5, 1, 1, 0, 0, CAST(9.9655287 AS Decimal(10, 7)), CAST(-84.0658381 AS Decimal(10, 7)), N'emergencia', N'test@tets.com                           ', CAST(N'2019-11-29T23:45:44.390' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (71, 49, 1, 2, 1, 0, CAST(9.9612814 AS Decimal(10, 7)), CAST(-84.0776294 AS Decimal(10, 7)), N'Afectado: Emily
Suceso: Me robaron mi lonjitas en mi casa', N'emily.obando@hotmail.com', CAST(N'2019-11-30T17:32:20.413' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (72, 49, 1, 1, 0, 0, CAST(9.9612780 AS Decimal(10, 7)), CAST(-84.0776279 AS Decimal(10, 7)), N'emergencia', N'emily.obando@hotmail.com', CAST(N'2019-11-30T17:32:36.363' AS DateTime))
INSERT [dbo].[Denuncias] ([idDenuncia], [idCiudadano], [idPolicia], [idTipoDenuncia], [idTipoDelito], [idEstadoDenuncia], [latitudDenuncia], [longitudDenuncia], [descripcionDenuncia], [afectadoDenuncia], [fechaDenuncia]) VALUES (73, 5, 1, 2, 4, 0, CAST(9.9655265 AS Decimal(10, 7)), CAST(-84.0658403 AS Decimal(10, 7)), N'Afectado: luis
Suceso: pelea con indigentes', N'test@tets.com', CAST(N'2019-12-01T22:19:19.617' AS DateTime))
SET IDENTITY_INSERT [dbo].[Denuncias] OFF
INSERT [dbo].[EstadoDenuncia] ([idEstadoDenuncia], [descripcionEstadoDenuncia]) VALUES (0, N'Sin atender')
INSERT [dbo].[EstadoDenuncia] ([idEstadoDenuncia], [descripcionEstadoDenuncia]) VALUES (1, N'En proceso')
INSERT [dbo].[EstadoDenuncia] ([idEstadoDenuncia], [descripcionEstadoDenuncia]) VALUES (2, N'Atendida')
SET IDENTITY_INSERT [dbo].[Policias] ON 

INSERT [dbo].[Policias] ([idPolicia], [idTipoUsuario], [identificacionPolicia], [nombrePolicia], [apellidoPaternoPolicia], [apellidoMaternoPolicia], [direccionPolicia], [telefonoPolicia], [correoPolicia], [passwordPolicia], [estadoPolicia]) VALUES (1, 2, 123456789, N'Alberto', N'Alpizar', N'Altamiran', N'Tibas', 87990033, N'alberto@gmail.com', N'123456789', 1)
INSERT [dbo].[Policias] ([idPolicia], [idTipoUsuario], [identificacionPolicia], [nombrePolicia], [apellidoPaternoPolicia], [apellidoMaternoPolicia], [direccionPolicia], [telefonoPolicia], [correoPolicia], [passwordPolicia], [estadoPolicia]) VALUES (2, 3, 999999998, N'Gilberto', N'Bermudez', N'Barquero', N'Tibas', 87424084, N'prueba@test.com', N'1234', 1)
INSERT [dbo].[Policias] ([idPolicia], [idTipoUsuario], [identificacionPolicia], [nombrePolicia], [apellidoPaternoPolicia], [apellidoMaternoPolicia], [direccionPolicia], [telefonoPolicia], [correoPolicia], [passwordPolicia], [estadoPolicia]) VALUES (3, 1, 999999999, N'Admin', N'Admin', N'Admin', N'Tibas', 99999999, N'admin@admin.com', N'admin', 1)
INSERT [dbo].[Policias] ([idPolicia], [idTipoUsuario], [identificacionPolicia], [nombrePolicia], [apellidoPaternoPolicia], [apellidoMaternoPolicia], [direccionPolicia], [telefonoPolicia], [correoPolicia], [passwordPolicia], [estadoPolicia]) VALUES (4, 3, 7893447, N'Manuel', N'Marin', N'Mora', N'Santo Domingo', 86549929, N'manu@hotmail.com', N'12345678', 1)
INSERT [dbo].[Policias] ([idPolicia], [idTipoUsuario], [identificacionPolicia], [nombrePolicia], [apellidoPaternoPolicia], [apellidoMaternoPolicia], [direccionPolicia], [telefonoPolicia], [correoPolicia], [passwordPolicia], [estadoPolicia]) VALUES (6, 3, 2121211, N'Andrey', N'Alberto', N'Amador', N'Tibas', 3838333, N'aaa@hotmail.com', N'0987654321', 1)
SET IDENTITY_INSERT [dbo].[Policias] OFF
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (0, N'Emergencia', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (1, N'Robo, atraco o asalto', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (2, N'Vandalismo o daño', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (3, N'Violencia doméstica', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (4, N'Agresión o pelea', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (5, N'Agresión sexual', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (6, N'Violencia de género', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (7, N'Acoso general.', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (8, N'Perdido o desaparecido', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (9, N'Radicalismo', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (10, N'Otro', N'.')
INSERT [dbo].[TipoDelito] ([idTipoDelito], [nombreTipoDelito], [descripcionTipoDelito]) VALUES (11, N'Testing', N'Testing')
INSERT [dbo].[TipoDenuncias] ([idTipoDenuncia], [nombreDenuncia], [descripcionDenincua]) VALUES (1, N'Botón de pánico', N'Denuncia que ocurre con el boton de pánico')
INSERT [dbo].[TipoDenuncias] ([idTipoDenuncia], [nombreDenuncia], [descripcionDenincua]) VALUES (2, N'Incidente', N'No ocurre inmediatamente')
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcionTipoUsuario]) VALUES (1, N'Administrador')
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcionTipoUsuario]) VALUES (2, N'Policía administador')
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcionTipoUsuario]) VALUES (3, N'Policía')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 12/3/2019 8:11:42 AM ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactosEmergencia]  WITH CHECK ADD  CONSTRAINT [FK_ContactosEmergencia_Ciudananos] FOREIGN KEY([idCiudadano])
REFERENCES [dbo].[Ciudadanos] ([idCiudadano])
GO
ALTER TABLE [dbo].[ContactosEmergencia] CHECK CONSTRAINT [FK_ContactosEmergencia_Ciudananos]
GO
ALTER TABLE [dbo].[ContactosPolicia]  WITH CHECK ADD FOREIGN KEY([idPolicia])
REFERENCES [dbo].[Policias] ([idPolicia])
GO
ALTER TABLE [dbo].[Denuncias]  WITH CHECK ADD  CONSTRAINT [FK__Denuncias__idCiu__4E88ABD4] FOREIGN KEY([idCiudadano])
REFERENCES [dbo].[Ciudadanos] ([idCiudadano])
GO
ALTER TABLE [dbo].[Denuncias] CHECK CONSTRAINT [FK__Denuncias__idCiu__4E88ABD4]
GO
ALTER TABLE [dbo].[Denuncias]  WITH CHECK ADD  CONSTRAINT [FK__Denuncias__idTip__5441852A] FOREIGN KEY([idTipoDenuncia])
REFERENCES [dbo].[TipoDenuncias] ([idTipoDenuncia])
GO
ALTER TABLE [dbo].[Denuncias] CHECK CONSTRAINT [FK__Denuncias__idTip__5441852A]
GO
ALTER TABLE [dbo].[Denuncias]  WITH CHECK ADD  CONSTRAINT [FK__Denuncias__idTip__571DF1D5] FOREIGN KEY([idTipoDelito])
REFERENCES [dbo].[TipoDelito] ([idTipoDelito])
GO
ALTER TABLE [dbo].[Denuncias] CHECK CONSTRAINT [FK__Denuncias__idTip__571DF1D5]
GO
ALTER TABLE [dbo].[Denuncias]  WITH CHECK ADD  CONSTRAINT [FK_Denuncias_EstadoDenuncia] FOREIGN KEY([idEstadoDenuncia])
REFERENCES [dbo].[EstadoDenuncia] ([idEstadoDenuncia])
GO
ALTER TABLE [dbo].[Denuncias] CHECK CONSTRAINT [FK_Denuncias_EstadoDenuncia]
GO
ALTER TABLE [dbo].[Denuncias]  WITH CHECK ADD  CONSTRAINT [FK_Denuncias_Policias] FOREIGN KEY([idPolicia])
REFERENCES [dbo].[Policias] ([idPolicia])
GO
ALTER TABLE [dbo].[Denuncias] CHECK CONSTRAINT [FK_Denuncias_Policias]
GO
ALTER TABLE [dbo].[Policias]  WITH CHECK ADD  CONSTRAINT [FK_Policias_TipoUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[Policias] CHECK CONSTRAINT [FK_Policias_TipoUsuario]
GO
/****** Object:  StoredProcedure [dbo].[SelectTodosCiudadanos]    Script Date: 12/3/2019 8:11:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectTodosCiudadanos] 
AS
SELECT * FROM Ciudadanos
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 12/3/2019 8:11:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 12/3/2019 8:11:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 12/3/2019 8:11:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 12/3/2019 8:11:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 12/3/2019 8:11:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 12/3/2019 8:11:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 12/3/2019 8:11:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
