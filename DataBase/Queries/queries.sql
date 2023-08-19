--DROP PROCEDURE CrearTablaTemporal

CREATE PROCEDURE CrearTablaTemporal
AS
BEGIN	
    IF OBJECT_ID('TablaTemporal', 'U') IS NULL
    BEGIN
        CREATE TABLE TablaTemporal (
            EntregaID INT,
            Dia VARCHAR(10),
            Mes VARCHAR(10),
            Anio VARCHAR(10),
            NombreCliente VARCHAR(50),
            Direccion VARCHAR(50),
            NombreEmpleadoEntrega VARCHAR(50),
            PuestoEmpleadoEntrega VARCHAR(50),
            CiudadEntrega VARCHAR(50),
            NombreProducto VARCHAR(50),
            Descripcion VARCHAR(50),
            Peso FLOAT,
            TiempoEntrega INT,
            EstadoEntrega VARCHAR(50),
            CostoEnvio MONEY,
            PrecioProducto MONEY
        );
    END;
END;


GO



DROP PROCEDURE CrearTablasModelo
CREATE PROCEDURE CrearTablasModelo
AS
BEGIN	
    /****** Object:  Table [dbo].[Cliente]    Script Date: 19/08/2023 17:08:01 ******/
    SET ANSI_NULLS ON

    SET QUOTED_IDENTIFIER ON
  
    CREATE TABLE [dbo].[Cliente](
        [idCliente] [int] IDENTITY(1,1) NOT NULL,
        [nombre] [varchar](50) NOT NULL,
        [direccion] [varchar](50) NOT NULL,
    CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
    (
        [idCliente] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    
    /****** Object:  Table [dbo].[Empleado]    Script Date: 19/08/2023 17:08:01 ******/
    SET ANSI_NULLS ON
    
    SET QUOTED_IDENTIFIER ON
    
    CREATE TABLE [dbo].[Empleado](
        [idEmpleado] [int] IDENTITY(1,1) NOT NULL,
        [nombre] [varchar](50) NOT NULL,
        [puesto] [varchar](50) NOT NULL,
    CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
    (
        [idEmpleado] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    
    /****** Object:  Table [dbo].[Entrega]    Script Date: 19/08/2023 17:08:01 ******/
    SET ANSI_NULLS ON
    
    SET QUOTED_IDENTIFIER ON
    
    CREATE TABLE [dbo].[Entrega](
        [idEntrega] [int] IDENTITY(1,1) NOT NULL,
        [idCliente] [int] NOT NULL,
        [idEmpleado] [int] NOT NULL,
        [idEstadoEntrega] [int] NOT NULL,
        [idInfoProducto] [int] NOT NULL,
		[idDescProducto] [int] NOT NULL,
        [idTiempo] [int] NOT NULL,
        [ciudadEntrega] [varchar](50) NOT NULL,
        [costoEnvio] [decimal](18, 2) NOT NULL,
        [tiempoEntrega] [int] NOT NULL
    ) ON [PRIMARY]
    
    /****** Object:  Table [dbo].[EstadoEntrega]    Script Date: 19/08/2023 17:08:01 ******/
    SET ANSI_NULLS ON
    
    SET QUOTED_IDENTIFIER ON
    
    CREATE TABLE [dbo].[EstadoEntrega](
        [idEstadoEntrega] [int] IDENTITY(1,1) NOT NULL,
        [nombre] [varchar](50) NOT NULL,
    CONSTRAINT [PK_EstadoEntrega] PRIMARY KEY CLUSTERED 
    (
        [idEstadoEntrega] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

	
    /****** Object:  Table [dbo].[DescProducto]    Script Date: 19/08/2023 17:08:01 ******/
    SET ANSI_NULLS ON
    
    SET QUOTED_IDENTIFIER ON
    
    CREATE TABLE [dbo].[DescProducto](
        [idDescProducto] [int] IDENTITY(1,1) NOT NULL,
        [nombre] [varchar](50) NOT NULL,
        [descripcion] [varchar](50) NOT NULL,        
    CONSTRAINT [PK_DescProducto] PRIMARY KEY CLUSTERED 
    (
        [idDescProducto] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]

    
    /****** Object:  Table [dbo].[Producto]    Script Date: 19/08/2023 17:08:01 ******/
    SET ANSI_NULLS ON
    
    SET QUOTED_IDENTIFIER ON
    
    CREATE TABLE [dbo].[InfoProducto](
        [idInfoProducto] [int] IDENTITY(1,1) NOT NULL,
        [precio] [decimal](18, 2) NOT NULL,
        [peso] [decimal](18, 2) NOT NULL,
    CONSTRAINT [PK_InfoProducto] PRIMARY KEY CLUSTERED 
    (
        [idInfoProducto] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    
    /****** Object:  Table [dbo].[Tiempo]    Script Date: 19/08/2023 17:08:01 ******/
    SET ANSI_NULLS ON
    
    SET QUOTED_IDENTIFIER ON
    
    CREATE TABLE [dbo].[Tiempo](
        [idTiempo] [int] IDENTITY(1,1) NOT NULL,
        [dia] [varchar](50) NOT NULL,
        [mes] [varchar](50) NOT NULL,
        [anio] [int] NOT NULL,
    CONSTRAINT [PK_Tiempo] PRIMARY KEY CLUSTERED 
    (
        [idTiempo] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
    ) ON [PRIMARY]
    
    ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Cliente] FOREIGN KEY([idCliente])
    REFERENCES [dbo].[Cliente] ([idCliente])
    
    ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Cliente]
    
    ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Empleado] FOREIGN KEY([idEmpleado])
    REFERENCES [dbo].[Empleado] ([idEmpleado])
    
    ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Empleado]
    
    ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_EstadoEntrega] FOREIGN KEY([idEstadoEntrega])
    REFERENCES [dbo].[EstadoEntrega] ([idEstadoEntrega])
    
    ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_EstadoEntrega]
    
    ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_InfoProducto] FOREIGN KEY([idInfoProducto])
    REFERENCES [dbo].[InfoProducto] ([idInfoProducto])

    ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_InfoProducto]


	ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_DescProducto] FOREIGN KEY([idDescProducto])
    REFERENCES [dbo].[DescProducto] ([idDescProducto])
    
    ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_DescProducto]
    
    ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [FK_Entrega_Tiempo] FOREIGN KEY([idTiempo])
    REFERENCES [dbo].[Tiempo] ([idTiempo])
    
    ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [FK_Entrega_Tiempo]
END;


GO

CREATE PROCEDURE EliminarTablas
AS
BEGIN
DROP TABLE Entrega
DROP TABLE Cliente
DROP TABLE Empleado
DROP TABLE EstadoEntrega
DROP TABLE InfoProducto
DROP TABLE DescProducto
DROP TABLE Tiempo
DROP TABLE TablaTemporal

END;

DROP PROCEDURE EliminarTablas

EXEC CrearTablaTemporal

EXEC CrearTablasModelo

Exec EliminarTablas


DROP TABLE TablaTemporal
SELECT * FROM TablaTemporal


DROP TABLE Entrega
DROP TABLE Cliente
DROP TABLE Empleado
DROP TABLE EstadoEntrega
DROP TABLE Producto
DROP TABLE Tiempo





