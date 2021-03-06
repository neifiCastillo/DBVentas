USE [citas_medicas_db]
GO
/****** Object:  Table [dbo].[citas]    Script Date: 09/28/20 11:49:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[citas](
	[NoCedula] [varchar](20) NULL,
	[FechaCita] [date] NOT NULL,
	[MotivoCita] [int] NOT NULL,
	[ComentarioMedico] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 09/28/20 11:49:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[NoCedula] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[NoCelular] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[fechaNac] [date] NOT NULL,
	[Direccion] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[NoCedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historial_medico]    Script Date: 09/28/20 11:49:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historial_medico](
	[NoCedula] [varchar](20) NULL,
	[FechaConsulta] [date] NOT NULL,
	[SintomasPresentados] [varchar](max) NULL,
	[Receta] [varchar](max) NULL,
	[Diagnostico] [varchar](max) NULL,
	[ComentarioMedico] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[motivo_cita]    Script Date: 09/28/20 11:49:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[motivo_cita](
	[IdMotivoCita] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMotivoCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[citas]  WITH CHECK ADD FOREIGN KEY([NoCedula])
REFERENCES [dbo].[cliente] ([NoCedula])
GO
ALTER TABLE [dbo].[historial_medico]  WITH CHECK ADD FOREIGN KEY([NoCedula])
REFERENCES [dbo].[cliente] ([NoCedula])
GO
