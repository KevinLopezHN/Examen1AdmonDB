--USE [MercaditoExamen]
--GO
--/****** Object:  Table [dbo].[Proveedor]    Script Date: 02/12/2020 20:07:30 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
CREATE TABLE [dbo].[Proveedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[observaciones] [varchar](50) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenProveedores]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenProveedores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[proveedorId] [int] NULL,
	[fechaOrden] [date] NULL,
	[fechaEntrega] [date] NULL,
	[estado] [bit] NULL,
	[cobroAdicional] [float] NULL,
 CONSTRAINT [PK_OrdenProveedores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[categoriaId] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenProductos]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenProductos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ordenId] [int] NULL,
	[productoId] [int] NULL,
	[cantidad] [int] NULL,
	[costo] [float] NULL,
	[precioSugerido] [float] NULL,
 CONSTRAINT [PK_OrdenProductos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productoId] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[limiteCredito] [float] NULL,
 CONSTRAINT [PK_Cliente_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clienteId] [int] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ventaId] [int] NULL,
	[productoId] [int] NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [PK_VentaDetalle] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credito]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credito](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clienteId] [int] NULL,
	[ventaId] [int] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Credito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Abono]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abono](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[creditoId] [int] NULL,
	[monto] [float] NULL,
 CONSTRAINT [PK_Abono] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwTransaccionesDiaras]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwTransaccionesDiaras]
AS
SELECT v.id as "Id Venta",cli.nombre as "Nombre de Cliente",p.nombre as "Nombre de Producto Vendido",ca.nombre as "Categoria del Producto"
,vd.cantidad as "Cantidad de Producto Vendido", inve.precio as "Precio de Venta",v.fecha as "Fecha de Venta", op.id as "Orden de Compra", p.nombre as "Producto Comprado",
op.cantidad as "Cantidad de Producto Comprado", op.costo "Costo del Producto", pro.nombre as "Nombre del Proveedor", opr.fechaOrden as "Fecha de Orden"
, opr.fechaEntrega as "Fecha de Entrega", inve.cantidad as "Cantidad en Inventario"
FROM Producto p
INNER JOIN OrdenProductos op 
ON p.id = op.productoId
INNER JOIN Categoria ca
ON ca.id=p.categoriaId
INNER JOIN OrdenProveedores opr 
ON op.ordenId = opr.id
INNER JOIN Proveedor pro
ON opr.proveedorId = pro.id
INNER JOIN VentaDetalle vd
ON p.id = vd.productoId
INNER JOIN Venta v
ON v.id= vd.ventaId
INNER JOIN Credito cre
ON cre.ventaId = v.id
INNER JOIN Cliente cli
ON cli.id = cre.clienteId
INNER JOIN Inventario inve
ON inve.productoId = p.id
INNER JOIN Abono abo
ON abo.creditoId= cre.id
GO
SET IDENTITY_INSERT [dbo].[Abono] ON 

INSERT [dbo].[Abono] ([id], [fecha], [creditoId], [monto]) VALUES (1, CAST(N'2020-12-01' AS Date), 1, 200)
INSERT [dbo].[Abono] ([id], [fecha], [creditoId], [monto]) VALUES (2, CAST(N'2020-12-01' AS Date), 2, 300)
INSERT [dbo].[Abono] ([id], [fecha], [creditoId], [monto]) VALUES (3, CAST(N'2020-11-30' AS Date), 3, 500)
SET IDENTITY_INSERT [dbo].[Abono] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([id], [nombre]) VALUES (1, N'Carnes')
INSERT [dbo].[Categoria] ([id], [nombre]) VALUES (2, N'Lacteos')
INSERT [dbo].[Categoria] ([id], [nombre]) VALUES (3, N'Jugos')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [nombre], [limiteCredito]) VALUES (1, N'Carlos Hernandez', 500)
INSERT [dbo].[Cliente] ([id], [nombre], [limiteCredito]) VALUES (2, N'Julio Florencio', 500)
INSERT [dbo].[Cliente] ([id], [nombre], [limiteCredito]) VALUES (3, N'Karla Perez', 700)
INSERT [dbo].[Cliente] ([id], [nombre], [limiteCredito]) VALUES (4, N'Andrea Peraza', 700)
INSERT [dbo].[Cliente] ([id], [nombre], [limiteCredito]) VALUES (5, N'Mario Velasquez', 800)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Credito] ON 

INSERT [dbo].[Credito] ([id], [clienteId], [ventaId], [estado]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Credito] ([id], [clienteId], [ventaId], [estado]) VALUES (2, 2, 2, 1)
INSERT [dbo].[Credito] ([id], [clienteId], [ventaId], [estado]) VALUES (3, 4, 3, 1)
SET IDENTITY_INSERT [dbo].[Credito] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([id], [productoId], [cantidad], [precio]) VALUES (1, 1, 50, 50)
INSERT [dbo].[Inventario] ([id], [productoId], [cantidad], [precio]) VALUES (2, 2, 100, 45)
INSERT [dbo].[Inventario] ([id], [productoId], [cantidad], [precio]) VALUES (3, 3, 130, 25)
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenProductos] ON 

INSERT [dbo].[OrdenProductos] ([id], [ordenId], [productoId], [cantidad], [costo], [precioSugerido]) VALUES (1, 1, 1, 200, 40, 50)
INSERT [dbo].[OrdenProductos] ([id], [ordenId], [productoId], [cantidad], [costo], [precioSugerido]) VALUES (2, 2, 2, 300, 30, 45)
INSERT [dbo].[OrdenProductos] ([id], [ordenId], [productoId], [cantidad], [costo], [precioSugerido]) VALUES (3, 3, 3, 450, 20, 25)
SET IDENTITY_INSERT [dbo].[OrdenProductos] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenProveedores] ON 

INSERT [dbo].[OrdenProveedores] ([id], [proveedorId], [fechaOrden], [fechaEntrega], [estado], [cobroAdicional]) VALUES (1, 1, CAST(N'2020-11-01' AS Date), CAST(N'2020-11-01' AS Date), 1, 100)
INSERT [dbo].[OrdenProveedores] ([id], [proveedorId], [fechaOrden], [fechaEntrega], [estado], [cobroAdicional]) VALUES (2, 2, CAST(N'2020-11-01' AS Date), CAST(N'2020-11-05' AS Date), 1, 200)
INSERT [dbo].[OrdenProveedores] ([id], [proveedorId], [fechaOrden], [fechaEntrega], [estado], [cobroAdicional]) VALUES (3, 3, CAST(N'2020-11-01' AS Date), CAST(N'2020-11-01' AS Date), 1, 140)
INSERT [dbo].[OrdenProveedores] ([id], [proveedorId], [fechaOrden], [fechaEntrega], [estado], [cobroAdicional]) VALUES (4, 3, CAST(N'2020-11-01' AS Date), CAST(N'2020-11-04' AS Date), 1, 190)
SET IDENTITY_INSERT [dbo].[OrdenProveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([id], [nombre], [categoriaId]) VALUES (1, N'Pollo', 1)
INSERT [dbo].[Producto] ([id], [nombre], [categoriaId]) VALUES (2, N'Queso', 2)
INSERT [dbo].[Producto] ([id], [nombre], [categoriaId]) VALUES (3, N'Jugo de Naranja', 3)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([id], [nombre], [observaciones]) VALUES (1, N'Manuel Ortiz', N'Proveedor entrega inmediata')
INSERT [dbo].[Proveedor] ([id], [nombre], [observaciones]) VALUES (2, N'Hector Lopez', N'Proveedor con fecha de anticipacion')
INSERT [dbo].[Proveedor] ([id], [nombre], [observaciones]) VALUES (3, N'Juana Maradiaga', N'Proveedor mixto')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([id], [clienteId], [fecha]) VALUES (1, 1, CAST(N'2020-12-01' AS Date))
INSERT [dbo].[Venta] ([id], [clienteId], [fecha]) VALUES (2, 2, CAST(N'2020-11-30' AS Date))
INSERT [dbo].[Venta] ([id], [clienteId], [fecha]) VALUES (3, 3, CAST(N'2020-11-24' AS Date))
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
SET IDENTITY_INSERT [dbo].[VentaDetalle] ON 

INSERT [dbo].[VentaDetalle] ([id], [ventaId], [productoId], [cantidad]) VALUES (2, 1, 1, 2)
INSERT [dbo].[VentaDetalle] ([id], [ventaId], [productoId], [cantidad]) VALUES (3, 2, 2, 5)
INSERT [dbo].[VentaDetalle] ([id], [ventaId], [productoId], [cantidad]) VALUES (4, 3, 3, 2)
SET IDENTITY_INSERT [dbo].[VentaDetalle] OFF
GO
ALTER TABLE [dbo].[Abono]  WITH CHECK ADD  CONSTRAINT [FK_Abono_Credito] FOREIGN KEY([creditoId])
REFERENCES [dbo].[Credito] ([id])
GO
ALTER TABLE [dbo].[Abono] CHECK CONSTRAINT [FK_Abono_Credito]
GO
ALTER TABLE [dbo].[Credito]  WITH CHECK ADD  CONSTRAINT [FK_Credito_Cliente] FOREIGN KEY([clienteId])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Credito] CHECK CONSTRAINT [FK_Credito_Cliente]
GO
ALTER TABLE [dbo].[Credito]  WITH CHECK ADD  CONSTRAINT [FK_Credito_Venta] FOREIGN KEY([ventaId])
REFERENCES [dbo].[Venta] ([id])
GO
ALTER TABLE [dbo].[Credito] CHECK CONSTRAINT [FK_Credito_Venta]
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Inventario_Producto] FOREIGN KEY([productoId])
REFERENCES [dbo].[Producto] ([id])
GO
ALTER TABLE [dbo].[Inventario] CHECK CONSTRAINT [FK_Inventario_Producto]
GO
ALTER TABLE [dbo].[OrdenProductos]  WITH CHECK ADD  CONSTRAINT [FK_OrdenProductos_OrdenProveedores] FOREIGN KEY([ordenId])
REFERENCES [dbo].[OrdenProveedores] ([id])
GO
ALTER TABLE [dbo].[OrdenProductos] CHECK CONSTRAINT [FK_OrdenProductos_OrdenProveedores]
GO
ALTER TABLE [dbo].[OrdenProductos]  WITH CHECK ADD  CONSTRAINT [FK_OrdenProductos_Producto] FOREIGN KEY([productoId])
REFERENCES [dbo].[Producto] ([id])
GO
ALTER TABLE [dbo].[OrdenProductos] CHECK CONSTRAINT [FK_OrdenProductos_Producto]
GO
ALTER TABLE [dbo].[OrdenProveedores]  WITH CHECK ADD  CONSTRAINT [FK_OrdenProveedores_Proveedor] FOREIGN KEY([proveedorId])
REFERENCES [dbo].[Proveedor] ([id])
GO
ALTER TABLE [dbo].[OrdenProveedores] CHECK CONSTRAINT [FK_OrdenProveedores_Proveedor]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[Categoria] ([id])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([clienteId])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY([productoId])
REFERENCES [dbo].[Producto] ([id])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Producto]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Venta] FOREIGN KEY([ventaId])
REFERENCES [dbo].[Venta] ([id])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Venta]
GO
/****** Object:  StoredProcedure [dbo].[ClasificarProveedores]    Script Date: 02/12/2020 20:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClasificarProveedores]
AS  
BEGIN  
   SELECT v.id as "Id Venta",cli.nombre as "Nombre de Cliente",p.nombre as "Nombre de Producto Vendido",ca.nombre as "Categoria del Producto"
,vd.cantidad as "Cantidad de Producto Vendido", inve.precio as "Precio de Venta",v.fecha as "Fecha de Venta", op.id as "Orden de Compra", p.nombre as "Producto Comprado",
op.cantidad as "Cantidad de Producto Comprado", op.costo "Costo del Producto", pro.nombre as "Nombre del Proveedor", opr.fechaOrden as "Fecha de Orden"
, opr.fechaEntrega as "Fecha de Entrega", inve.cantidad as "Cantidad en Inventario", "Tipo de Proveedor" =
CASE
WHEN op.cantidad >= 300 AND vd.cantidad>=5 then 'Proveedor Alto'
WHEN op.cantidad < 300 AND vd.cantidad<5 then 'Proveedor Bajo'
ELSE 'Proveedor Bajo'
END
FROM Producto p
INNER JOIN OrdenProductos op 
ON p.id = op.productoId
INNER JOIN Categoria ca
ON ca.id=p.categoriaId
INNER JOIN OrdenProveedores opr 
ON op.ordenId = opr.id
INNER JOIN Proveedor pro
ON opr.proveedorId = pro.id
INNER JOIN VentaDetalle vd
ON p.id = vd.productoId
INNER JOIN Venta v
ON v.id= vd.ventaId
INNER JOIN Credito cre
ON cre.ventaId = v.id
INNER JOIN Cliente cli
ON cli.id = cre.clienteId
INNER JOIN Inventario inve
ON inve.productoId = p.id
INNER JOIN Abono abo
ON abo.creditoId= cre.id

END  
GO
