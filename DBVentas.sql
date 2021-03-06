USE [DBVenta]
GO
/****** Object:  Table [dbo].[TbCategoria]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCategoria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_TbCategoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbCliente]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dni] [int] NULL,
	[Direccion] [varchar](500) NULL,
	[Telefono] [varchar](50) NULL,
 CONSTRAINT [PK_TbCliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbDetalleVenta]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbDetalleVenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VentaId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [decimal](18, 2) NOT NULL,
	[PrecioUnitario] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TbDetalleVenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbProducto]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbProducto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaId] [int] NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[Stock] [decimal](18, 2) NOT NULL,
	[PrecioCompra] [decimal](18, 2) NOT NULL,
	[PrecioVenta] [decimal](18, 2) NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
	[FechaCreado] [datetime] NOT NULL,
	[imagen] [image] NULL,
 CONSTRAINT [PK_TbProducto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbUsuario]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbUsuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dni] [int] NULL,
	[Direccion] [varchar](500) NULL,
	[Telefono] [varchar](50) NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Tipo] [varchar](100) NULL,
 CONSTRAINT [PK_TbUsuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbVenta]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbVenta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[FechaVenta] [date] NOT NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[TipoDocumento] [varchar](100) NULL,
 CONSTRAINT [PK_TbVenta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TbDetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_TbDetalleVenta_TbProducto] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[TbProducto] ([Id])
GO
ALTER TABLE [dbo].[TbDetalleVenta] CHECK CONSTRAINT [FK_TbDetalleVenta_TbProducto]
GO
ALTER TABLE [dbo].[TbDetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_TbDetalleVenta_TbVenta] FOREIGN KEY([VentaId])
REFERENCES [dbo].[TbVenta] ([Id])
GO
ALTER TABLE [dbo].[TbDetalleVenta] CHECK CONSTRAINT [FK_TbDetalleVenta_TbVenta]
GO
ALTER TABLE [dbo].[TbProducto]  WITH CHECK ADD  CONSTRAINT [FK_TbProducto_TbCategoria] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[TbCategoria] ([Id])
GO
ALTER TABLE [dbo].[TbProducto] CHECK CONSTRAINT [FK_TbProducto_TbCategoria]
GO
ALTER TABLE [dbo].[TbVenta]  WITH CHECK ADD  CONSTRAINT [FK_TbVenta_TbCliente] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[TbCliente] ([Id])
GO
ALTER TABLE [dbo].[TbVenta] CHECK CONSTRAINT [FK_TbVenta_TbCliente]
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FCategoria_Actualizar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_Data_FCategoria_Actualizar](
@Id int,
@Descripcion varchar(500)
)
	
AS
update TbCategoria set Descripcion=@Descripcion where Id = @Id

select @@ROWCOUNT as cantidad
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FCategoria_Eliminar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_Data_FCategoria_Eliminar]

@Id int 

AS
BEGIN
	delete from TbCategoria where Id = @Id

	select @@ROWCOUNT as CantidadAfectada

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FCategoria_GetAll]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_Data_FCategoria_GetAll]
	
AS
BEGIN
	
	select Id,Descripcion from TbCategoria
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FCategoria_Insertar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_Data_FCategoria_Insertar](
@Descripcion varchar(500)

)
	
AS

insert into TbCategoria (Descripcion) values (@Descripcion)
select @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FCliente_Actualizar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FCliente_Actualizar](
@Id int,
@Nombre varchar(50),
@Apellido varchar(50),
@Direccion varchar(500),
@Dni int,
@Telefono varchar(50)

)
	
AS
update TbCliente set Nombre=@Nombre , Apellido=@Apellido , Direccion= @Direccion  , Dni = @Dni  , Telefono = @Telefono where Id = @Id

select @@ROWCOUNT as cantidad
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FCliente_Eliminar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FCliente_Eliminar]

@Id int 

AS
BEGIN
	delete from TbCliente where Id = @Id

	select @@ROWCOUNT as CantidadAfectada

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FCliente_GetAll]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_Data_FCliente_GetAll]
	
AS
BEGIN
	
	select Id,Nombre,Apellido,Dni,Direccion,Telefono from TbCliente
	
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FCliente_Insertar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FCliente_Insertar](
@Nombre varchar(50),
@Apellido varchar(50),
@Direccion varchar(500),
@Dni int,
@Telefono varchar(50)

)
	
AS

insert into TbCliente (Nombre,Apellido,Dni,Direccion,Telefono)
Values (@Nombre,@Apellido,@Dni,@Direccion,@Telefono)

select @@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FDetalleVenta_Actualizar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FDetalleVenta_Actualizar]
     @Id int,
	 @VentaId int, 
	 @ProductoId int, 
	 @Cantidad decimal(18,2), 
	 @PrecioUnitario decimal(18,2)
AS
BEGIN
     update TbDetalleVenta set  VentaId= @VentaId, ProductoId=@ProductoId, Cantidad=@Cantidad, 
	 PrecioUnitario=@PrecioUnitario where Id = @Id
	 
	 select @@ROWCOUNT as CantidadAfectada
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FDetalleVenta_AumentarStock]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FDetalleVenta_AumentarStock] 
	@ProductoId int ,
	@Cantidad decimal(18,2)
AS
BEGIN
	update TbProducto set Stock=Stock+@Cantidad where Id=@ProductoId

	select @@ROWCOUNT as CantidadAfectada
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FDetalleVenta_DisminuirStock]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FDetalleVenta_DisminuirStock] 
	@ProductoId int ,
	@Cantidad decimal(18,2)
AS
BEGIN
	update TbProducto set Stock=Stock-@Cantidad where Id=@ProductoId
	select @@ROWCOUNT as CantidadAfectada
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FDetalleVenta_Eliminar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FDetalleVenta_Eliminar]
     @Id int
AS
BEGIN
    delete from TbDetalleVenta where Id = @Id
	select @@ROWCOUNT as CantidadAfectada
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FDetalleVenta_GetAll]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FDetalleVenta_GetAll]
@VentaId int
AS
BEGIN
      SELECT        dbo.TbDetalleVenta.Id, dbo.TbDetalleVenta.VentaId, dbo.TbDetalleVenta.ProductoId, dbo.TbProducto.Nombre,dbo.TbDetalleVenta.Cantidad,dbo.TbDetalleVenta.PrecioUnitario, dbo.TbProducto.PrecioVenta
FROM            dbo.TbDetalleVenta INNER JOIN
                         dbo.TbProducto ON dbo.TbDetalleVenta.ProductoId = dbo.TbProducto.Id
		where dbo.TbDetalleVenta.VentaId=@VentaId

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FDetalleVenta_Insertar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FDetalleVenta_Insertar]
	 @VentaId int, 
	 @ProductoId int, 
	 @Cantidad decimal(18,2), 
	 @PrecioUnitario decimal(18,2)
AS
BEGIN
     insert into TbDetalleVenta ( VentaId, ProductoId, Cantidad, PrecioUnitario)
	 values (@VentaId, @ProductoId, @Cantidad, @PrecioUnitario)

	 select @@IDENTITY as VentaDetalleId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FLogin_ValidarLogin]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FLogin_ValidarLogin]
@Usuario varchar (100),
@Password varchar (100)

AS
BEGIN
	select Id, Nombre, Apellido, Dni, Direccion, Telefono, Usuario, Password, Tipo from TbUsuario where Usuario=@Usuario and Password = @Password
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FProducto_Actualizar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FProducto_Actualizar]
@Id int,
@CategoriaId int,
@Nombre varchar(200),
@Descripcion varchar (500),
@Stock decimal(18,2),
@PrecioCompra decimal(18,2),
@PrecioVenta decimal(18,2),
@FechaVencimiento datetime,
@imagen image
AS
BEGIN
 
 update TbProducto set CategoriaId=@CategoriaId, Nombre=@Nombre, Descripcion=@Descripcion, Stock=@Stock,
 PrecioCompra=@PrecioCompra, PrecioVenta=@PrecioVenta, FechaVencimiento=@FechaVencimiento,
 imagen=@imagen
 where Id=@Id

 select @@ROWCOUNT as CantidadAfectada

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FProducto_Eliminar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FProducto_Eliminar]
@Id int

AS
BEGIN
 
 delete from TbProducto where Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FProducto_GetAll]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FProducto_GetAll]

AS
BEGIN
SELECT        dbo.TbCategoria.Descripcion AS CategoriaDescripcion, dbo.TbProducto.Id, dbo.TbProducto.CategoriaId, dbo.TbProducto.Nombre, dbo.TbProducto.Descripcion , dbo.TbProducto.Stock, dbo.TbProducto.PrecioCompra, dbo.TbProducto.PrecioVenta, 
                         dbo.TbProducto.FechaVencimiento, dbo.TbProducto.imagen
FROM            dbo.TbCategoria INNER JOIN
                         dbo.TbProducto ON dbo.TbCategoria.Id = dbo.TbProducto.CategoriaId

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FProducto_Insertar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FProducto_Insertar]

@CategoriaId int,
@Nombre varchar(200),
@Descripcion varchar (500),
@Stock decimal(18,2),
@PrecioCompra decimal(18,2),
@PrecioVenta decimal(18,2),
@FechaVencimiento datetime,
@imagen image
AS
BEGIN
 insert into TbProducto (CategoriaId, Nombre, Descripcion, Stock, PrecioCompra, PrecioVenta, FechaVencimiento, FechaCreado, imagen)
 values (@CategoriaId, @Nombre, @Descripcion, @Stock, @PrecioCompra, @PrecioVenta, @FechaVencimiento,GETDATE() , @imagen)

 select @@IDENTITY as ProductoId

END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FVenta_Actualizar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FVenta_Actualizar]
@Id int ,
@ClienteId int , 
@FechaVenta datetime ,
@NumeroDocumento varchar(50),
@TipoDocumento varchar (100)
	
AS
BEGIN
	update TbVenta set  ClienteId=@ClienteId,FechaVenta=@FechaVenta,NumeroDocumento=@NumeroDocumento,
	TipoDocumento=@TipoDocumento where Id = @Id
	
	select @@ROWCOUNT as CantidadAfectada
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FVenta_Eliminar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FVenta_Eliminar]
@Id int
AS
BEGIN
	delete from TbVenta where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FVenta_GetAll]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Data_FVenta_GetAll]
	
AS
BEGIN
	
	SELECT        dbo.TbVenta.Id, dbo.TbVenta.ClienteId, dbo.TbVenta.FechaVenta, dbo.TbVenta.NumeroDocumento, dbo.TbVenta.TipoDocumento, dbo.TbCliente.Nombre, dbo.TbCliente.Apellido
FROM            dbo.TbCliente INNER JOIN
                         dbo.TbVenta ON dbo.TbCliente.Id = dbo.TbVenta.ClienteId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Data_FVenta_Insertar]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Data_FVenta_Insertar]

@ClienteId int , 
@FechaVenta datetime ,
@NumeroDocumento varchar(50),
@TipoDocumento varchar (100)
	
AS
BEGIN
	insert into TbVenta (ClienteId,FechaVenta,NumeroDocumento,TipoDocumento)
	values(@ClienteId,@FechaVenta,@NumeroDocumento,@TipoDocumento)

	select @@IDENTITY as VentaId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Reportes_GenerarReporteVenta]    Script Date: 09/28/20 11:53:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Reportes_GenerarReporteVenta]
     @VentaId int
	
AS
BEGIN

	SELECT        dbo.TbDetalleVenta.VentaId, dbo.TbDetalleVenta.Cantidad, dbo.TbDetalleVenta.PrecioUnitario, dbo.TbVenta.FechaVenta, dbo.TbVenta.NumeroDocumento, dbo.TbVenta.TipoDocumento, dbo.TbCliente.Nombre, 
                         dbo.TbCliente.Apellido, dbo.TbCliente.Dni, dbo.TbProducto.Nombre AS ProductoDescripcion, dbo.TbDetalleVenta.Cantidad * dbo.TbDetalleVenta.PrecioUnitario AS TotalParcial
FROM            dbo.TbDetalleVenta INNER JOIN
                         dbo.TbVenta ON dbo.TbDetalleVenta.VentaId = dbo.TbVenta.Id INNER JOIN
                         dbo.TbCliente ON dbo.TbVenta.ClienteId = dbo.TbCliente.Id INNER JOIN
                         dbo.TbProducto ON dbo.TbDetalleVenta.ProductoId = dbo.TbProducto.Id
       where TbVenta.Id = @VentaId
END
GO
