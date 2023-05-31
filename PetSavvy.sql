USE [master]
GO
/****** Object:  Database [PetSavvy]    Script Date: 25/05/2023 15:52:16 ******/
CREATE DATABASE [PetSavvy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetSavvy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PetSavvy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetSavvy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PetSavvy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PetSavvy] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetSavvy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetSavvy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetSavvy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetSavvy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetSavvy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetSavvy] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetSavvy] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetSavvy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetSavvy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetSavvy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetSavvy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetSavvy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetSavvy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetSavvy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetSavvy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetSavvy] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PetSavvy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetSavvy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetSavvy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetSavvy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetSavvy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetSavvy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetSavvy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetSavvy] SET RECOVERY FULL 
GO
ALTER DATABASE [PetSavvy] SET  MULTI_USER 
GO
ALTER DATABASE [PetSavvy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetSavvy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetSavvy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetSavvy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetSavvy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetSavvy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetSavvy', N'ON'
GO
ALTER DATABASE [PetSavvy] SET QUERY_STORE = OFF
GO
USE [PetSavvy]
GO
/****** Object:  Table [dbo].[Accesorios]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accesorios](
	[Id_Accesorio] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Accesorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adoptante]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adoptante](
	[Id_Adoptante] [int] NOT NULL,
	[Nombre] [varchar](40) NULL,
	[DNI] [char](10) NULL,
	[Telefono] [char](9) NULL,
	[Direccion] [varchar](90) NULL,
	[Cita_Id] [int] NULL,
	[Proceso_Adopcion_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Adoptante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Albergue]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Albergue](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Direccion] [varchar](100) NULL,
	[Veterinario_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alimentos]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alimentos](
	[ID_Food] [int] NOT NULL,
	[Marca] [varchar](100) NULL,
	[cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Food] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[Id_Almacen] [int] NOT NULL,
	[Albergue_Id] [int] NULL,
	[ID_Gastos] [int] NULL,
	[id_medicamento] [int] NULL,
	[Id_Accesorio] [int] NULL,
	[ID_Food] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[Id] [int] NOT NULL,
	[Edad] [int] NULL,
	[Raza] [varchar](40) NULL,
	[Tamanio] [int] NULL,
	[Color] [varchar](20) NULL,
	[Afinidad] [varchar](20) NULL,
	[Proceso_Adopcion_Id] [int] NULL,
	[Albergue_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalogo]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalogo](
	[ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cita](
	[Id] [int] NOT NULL,
	[Catalogo_ID] [int] NULL,
	[Encargado_DNI] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encargado]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encargado](
	[DNI] [char](10) NOT NULL,
	[Nombre] [varchar](40) NULL,
	[Telefono] [char](9) NULL,
	[Albergue_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gastos]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gastos](
	[ID_Gastos] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Fecha_comrpa] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Gastos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[id_medicamento] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Fecha_compra] [date] NULL,
	[Fecha_Vencimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_medicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proceso_Adopcion]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proceso_Adopcion](
	[Id] [int] NOT NULL,
	[Catalogo_ID] [int] NULL,
	[Encargado_DNI] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[Id] [int] NOT NULL,
	[id_medicamento] [int] NULL,
	[id_Animal] [int] NULL,
	[id_Veterianrio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Veterinario]    Script Date: 25/05/2023 15:52:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Veterinario](
	[id] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Apellido] [varchar](20) NULL,
	[NumeroColegiatura] [char](9) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adoptante]  WITH CHECK ADD  CONSTRAINT [fk_Cita] FOREIGN KEY([Cita_Id])
REFERENCES [dbo].[Cita] ([Id])
GO
ALTER TABLE [dbo].[Adoptante] CHECK CONSTRAINT [fk_Cita]
GO
ALTER TABLE [dbo].[Adoptante]  WITH CHECK ADD  CONSTRAINT [fk_Proceso_Adopcion] FOREIGN KEY([Proceso_Adopcion_Id])
REFERENCES [dbo].[Proceso_Adopcion] ([Id])
GO
ALTER TABLE [dbo].[Adoptante] CHECK CONSTRAINT [fk_Proceso_Adopcion]
GO
ALTER TABLE [dbo].[Albergue]  WITH CHECK ADD  CONSTRAINT [fk_Veterinario] FOREIGN KEY([Veterinario_id])
REFERENCES [dbo].[Veterinario] ([id])
GO
ALTER TABLE [dbo].[Albergue] CHECK CONSTRAINT [fk_Veterinario]
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Accesorio] FOREIGN KEY([Id_Accesorio])
REFERENCES [dbo].[Accesorios] ([Id_Accesorio])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [fk_Accesorio]
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Albergue3] FOREIGN KEY([Albergue_Id])
REFERENCES [dbo].[Albergue] ([Id])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [fk_Albergue3]
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Almacen] FOREIGN KEY([ID_Food])
REFERENCES [dbo].[Alimentos] ([ID_Food])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [fk_Almacen]
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Gastos] FOREIGN KEY([ID_Gastos])
REFERENCES [dbo].[Gastos] ([ID_Gastos])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [fk_Gastos]
GO
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD  CONSTRAINT [fk_Medicamento] FOREIGN KEY([id_medicamento])
REFERENCES [dbo].[Medicamentos] ([id_medicamento])
GO
ALTER TABLE [dbo].[Almacen] CHECK CONSTRAINT [fk_Medicamento]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [fk_Albergue2] FOREIGN KEY([Albergue_Id])
REFERENCES [dbo].[Albergue] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [fk_Albergue2]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [fk_Proceso_Adopcion2] FOREIGN KEY([Proceso_Adopcion_Id])
REFERENCES [dbo].[Proceso_Adopcion] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [fk_Proceso_Adopcion2]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [fk_Catalogo] FOREIGN KEY([Catalogo_ID])
REFERENCES [dbo].[Catalogo] ([ID])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [fk_Catalogo]
GO
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [fk_Encargado] FOREIGN KEY([Encargado_DNI])
REFERENCES [dbo].[Encargado] ([DNI])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [fk_Encargado]
GO
ALTER TABLE [dbo].[Encargado]  WITH CHECK ADD  CONSTRAINT [fk_Albergue] FOREIGN KEY([Albergue_Id])
REFERENCES [dbo].[Albergue] ([Id])
GO
ALTER TABLE [dbo].[Encargado] CHECK CONSTRAINT [fk_Albergue]
GO
ALTER TABLE [dbo].[Proceso_Adopcion]  WITH CHECK ADD  CONSTRAINT [fk_Catalogos] FOREIGN KEY([Catalogo_ID])
REFERENCES [dbo].[Catalogo] ([ID])
GO
ALTER TABLE [dbo].[Proceso_Adopcion] CHECK CONSTRAINT [fk_Catalogos]
GO
ALTER TABLE [dbo].[Proceso_Adopcion]  WITH CHECK ADD  CONSTRAINT [fk_Encargados] FOREIGN KEY([Encargado_DNI])
REFERENCES [dbo].[Encargado] ([DNI])
GO
ALTER TABLE [dbo].[Proceso_Adopcion] CHECK CONSTRAINT [fk_Encargados]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [fk_Animal] FOREIGN KEY([id_Animal])
REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [fk_Animal]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [fk_Medicamento2] FOREIGN KEY([id_medicamento])
REFERENCES [dbo].[Medicamentos] ([id_medicamento])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [fk_Medicamento2]
GO
ALTER TABLE [dbo].[Receta]  WITH CHECK ADD  CONSTRAINT [fk_Veterinario2] FOREIGN KEY([id_Veterianrio])
REFERENCES [dbo].[Veterinario] ([id])
GO
ALTER TABLE [dbo].[Receta] CHECK CONSTRAINT [fk_Veterinario2]
GO
USE [master]
GO
ALTER DATABASE [PetSavvy] SET  READ_WRITE 
GO


-----------------------------Datos de gastos---------------------------
INSERT INTO Gastos VALUES(15,'Pasaje','2023-05-12')
INSERT INTO Gastos VALUES(16,'Alimentos','2023-05-13')
INSERT INTO Gastos VALUES(17,'Otros','2023-05-14')
INSERT INTO Gastos VALUES(18,'Construccion','2023-05-15')
INSERT INTO Gastos VALUES(19,'Comida','2023-05-16')
INSERT INTO Gastos VALUES(20,'Pasaje','2023-05-17')
INSERT INTO Gastos VALUES(21,'Alimentos','2023-05-18')
INSERT INTO Gastos VALUES(22,'Medicina','2023-05-19')
INSERT INTO Gastos VALUES(23,'Comida','2023-05-20')
INSERT INTO Gastos VALUES(24,'Pasaje','2023-05-21')
INSERT INTO Gastos VALUES(25,'Alimentos','2023-05-22')
INSERT INTO Gastos VALUES(26,'Medicina','2023-05-23')
INSERT INTO Gastos VALUES(27,'Comida','2023-05-24')
INSERT INTO Gastos VALUES(28,'Pasaje','2023-05-25')
INSERT INTO Gastos VALUES(29,'Alimentos','2023-05-26')
INSERT INTO Gastos VALUES(30,'Mantenimiento del albergue','2023/05/23')
INSERT INTO Gastos VALUES(31,'Comida','2022/12/13')
INSERT INTO Gastos VALUES(32,'Otros','2022/11/15')
INSERT INTO Gastos VALUES(33,'Reposicion de accesorios','2023/04/10')
INSERT INTO Gastos VALUES(34,'Cambio de iluminacion del albergue','2023/05/30')
INSERT INTO Gastos VALUES(35,'Reparacion de equipos','2023/04/16')
INSERT INTO Gastos VALUES(36,'Evento de conoce a los animales en el albergue','2023/03/15')
INSERT INTO Gastos VALUES(37,'Comida','2023/02/13')
INSERT INTO Gastos VALUES(38,'Publicidad','2023/05/18')
INSERT INTO Gastos VALUES(39,'Pasaje','2023/05/21')
INSERT INTO Gastos VALUES(40,'Compra de camas para los animales del refugio','2023/05/29')
INSERT INTO Gastos VALUES(41,'Medicina para los cachorros recién nacidos','2023/05/20')
INSERT INTO Gastos VALUES(42,'Comida','2023/05/13')
INSERT INTO Gastos VALUES(43,'Pasaje','2023/05/25')
INSERT INTO Gastos VALUES(44,'Compra de juguetes para los animales del refugio','2023/05/30')


-----------------------------Datos para veterinarios---------------------------
INSERT INTO Veterinario VALUES(15,'Hugo','GARCIA','569845')
INSERT INTO Veterinario VALUES(16,'Mateo','RODRIGUEZ','126459')
INSERT INTO Veterinario VALUES(17,'Martín','GONZALEZ','235980')
INSERT INTO Veterinario VALUES(18,'Lucas','FERNANDEZ','953067')
INSERT INTO Veterinario VALUES(19,'Leo','LOPEZ','351268')
INSERT INTO Veterinario VALUES(20,'Lucía.','MARTINEZ','264820')
INSERT INTO Veterinario VALUES(21,'María.','SANCHEZ','605020')
INSERT INTO Veterinario VALUES(22,'Paula.','PEREZ','805401')
INSERT INTO Veterinario VALUES(23,'Daniela.','GOMEZ','332065')
INSERT INTO Veterinario VALUES(24,'Sara.','MARTIN','669080')
INSERT INTO Veterinario VALUES(25,'Carla.','JIMENEZ','240548')
INSERT INTO Veterinario VALUES(26,'Martina.','HERNANDEZ','558094')
INSERT INTO Veterinario VALUES(27,'Mario','RUIZ','998050')
INSERT INTO Veterinario VALUES(28,'Diego','DIAZ','550492')
INSERT INTO Veterinario VALUES(29,'David','MORENO','5784732')
INSERT INTO Veterinario VALUES(30,'Carmen','Campos','5016487');
INSERT INTO Veterinario VALUES(31,'Jose','Carbajal','876523');
INSERT INTO Veterinario VALUES(32,'Jorge','Ramos','654213');
INSERT INTO Veterinario VALUES(33,'Renzo','Nuñez','976454');
INSERT INTO Veterinario VALUES(34,'Narumi','Quiroz','254632');
INSERT INTO Veterinario VALUES(35,'Rodrigo','Rodriguez','754129');
INSERT INTO Veterinario VALUES(36,'Zafiro','Alva','741215');
INSERT INTO Veterinario VALUES(37,'Claudia','Ortega','853674');
INSERT INTO Veterinario VALUES(38,'Alexander','Huertas','193752');
INSERT INTO Veterinario VALUES(39,'Miguel','Pahuara','946821');
INSERT INTO Veterinario VALUES(40,'Yuriko','Torres','657823');
INSERT INTO Veterinario VALUES(41,'Henry','Chavez','865413');
INSERT INTO Veterinario VALUES(42,'Cristian','Espinoza','658754');
INSERT INTO Veterinario VALUES(43,'Camila','Lazaro','875321');
INSERT INTO Veterinario VALUES(44,'Luis','Orihuela','645248');


-----------------------------Datos de albergue---------------------------
INSERT INTO Albergue VALUES(15,'The Hostel Inn','Jr 28 De Julio 148',15)	
INSERT INTO Albergue VALUES(16,'Cozy Home','Los Cedros 209,',16)	
INSERT INTO Albergue VALUES(17,'El Escape','Av. 28 de Julio 878',17)	
INSERT INTO Albergue VALUES(18,'DG Nómadas','Jr. Ucayali N° 388 ',18)	
INSERT INTO Albergue VALUES(19,'Comfy We','Jr. Camaná 616 ',19)	
INSERT INTO Albergue VALUES(20,'Weekend Inn','AV De La Poesia 160',20)	
INSERT INTO Albergue VALUES(21,'Nature Corner','JR Carabaya',21)	
INSERT INTO Albergue VALUES(22,'4 Friends','AV Arenales 1302',22)	
INSERT INTO Albergue VALUES(23,'Young & Fun','Av. Abancay Cuadra 5',23)	
INSERT INTO Albergue VALUES(24,'El Mochilero','JR Lima 378',24)	
INSERT INTO Albergue VALUES(25,'Arca del cielo','AV De La Poesia 160',25)	
INSERT INTO Albergue VALUES(26,'Petfinder','JR Carabaya',26)	
INSERT INTO Albergue VALUES(27,'No Kill Advocacy ','AV Arenales 1302',27)	
INSERT INTO Albergue VALUES(28,'Costero de mascota','Av. Abancay Cuadra 5',28)	
INSERT INTO Albergue VALUES(29,'Alley Cat','JR Lima 378',29)
INSERT INTO Albergue VALUES(30,'Patitas Unidas','Jr Cuellar 654',30);	
INSERT INTO Albergue VALUES(31,'Animals Waiting','Av. Los Nogales 865',31);	
INSERT INTO Albergue VALUES(32,'Delicia Refugio','Calle Comercio 648',32);	
INSERT INTO Albergue VALUES(33,'Aww Paws','Av. Colonial, Urbanización las colmenas 683',33);	
INSERT INTO Albergue VALUES(34,'Patitas de nieve','Urb. 20 de Agosto N° 112',34);	
INSERT INTO Albergue VALUES(35,'Maullidos puros','Calle la pizzas 985',35);	
INSERT INTO Albergue VALUES(36,'Patitas dulces','Resindecial El Remanso 854',36);	
INSERT INTO Albergue VALUES(37,'Bienestar Animal','La Rinconada 875',37);	
INSERT INTO Albergue VALUES(38,'Wonder Paws','Av. Productores 1125 5',38);	
INSERT INTO Albergue VALUES(39,'Perrito doo','Av. Luis Macagno 312, 2° piso',39);	
INSERT INTO Albergue VALUES(40,'Bebes peludos','Calle los eucaliptos 1288',40);	
INSERT INTO Albergue VALUES(41,'Patitas Fabulosas','Jr. Jose Maria Quiroga 123',41);	
INSERT INTO Albergue VALUES(42,'Animal Valley ','Av. Pachacutec 3025',42);	
INSERT INTO Albergue VALUES(43,'Peludito Manchado','Av. Mariategui 1129',43);	
INSERT INTO Albergue VALUES(44,'Amigos por siempre','Urbanización El Descanso 8812',44);	


-----------------------------Datos de catalogo---------------------------
INSERT INTO Catalogo VALUES(15);
INSERT INTO Catalogo VALUES(16);
INSERT INTO Catalogo VALUES(17);
INSERT INTO Catalogo VALUES(18);
INSERT INTO Catalogo VALUES(19);
INSERT INTO Catalogo VALUES(20);
INSERT INTO Catalogo VALUES(21);
INSERT INTO Catalogo VALUES(22);
INSERT INTO Catalogo VALUES(23);
INSERT INTO Catalogo VALUES(24);
INSERT INTO Catalogo VALUES(25);
INSERT INTO Catalogo VALUES(26);
INSERT INTO Catalogo VALUES(27);
INSERT INTO Catalogo VALUES(28);
INSERT INTO Catalogo VALUES(29);
INSERT INTO Catalogo VALUES(30);
INSERT INTO Catalogo VALUES(31);
INSERT INTO Catalogo VALUES(32);
INSERT INTO Catalogo VALUES(33);
INSERT INTO Catalogo VALUES(34);
INSERT INTO Catalogo VALUES(35);
INSERT INTO Catalogo VALUES(36);
INSERT INTO Catalogo VALUES(37);
INSERT INTO Catalogo VALUES(38);
INSERT INTO Catalogo VALUES(39);
INSERT INTO Catalogo VALUES(40);
INSERT INTO Catalogo VALUES(41);
INSERT INTO Catalogo VALUES(42);
INSERT INTO Catalogo VALUES(43);
INSERT INTO Catalogo VALUES(44);


-----------------------------Datos de encargado---------------------------
INSERT INTO Encargado VALUES('198111140','Joel','998548656',15)	
INSERT INTO Encargado VALUES('231504970','Nil','956826598',16)	
INSERT INTO Encargado VALUES('199795098','Jan','934587162',17)	
INSERT INTO Encargado VALUES('729416320','Pol','998788474',18)	
INSERT INTO Encargado VALUES('316193057','Raúl','948956998',19)	
INSERT INTO Encargado VALUES('232041550','Charlotte','999444666',20)	
INSERT INTO Encargado VALUES('211047801','Ruby','988569558',21)	
INSERT INTO Encargado VALUES('255298875','Lilly/Lily','900500122',22)	
INSERT INTO Encargado VALUES('161324032','Olivia','923650650',23)	
INSERT INTO Encargado VALUES('701952945','Chloe','960483580',24)	
INSERT INTO Encargado VALUES('199779165','Sophie','998878584',25)	
INSERT INTO Encargado VALUES('310314524','Emily','905517847',26)	
INSERT INTO Encargado VALUES('236755129','Asier','941548715',27)	
INSERT INTO Encargado VALUES('218008999','Biel','933665848',28)	
INSERT INTO Encargado VALUES('909728370','Ander','989596000',29)
INSERT INTO Encargado VALUES('785246321','Martin','985412566',30);
INSERT INTO Encargado VALUES('456321589','Abel','952632152',31);
INSERT INTO Encargado VALUES('785421635','Angelica','948563215',32);
INSERT INTO Encargado VALUES('854213654','Sayumi','987521452',33);
INSERT INTO Encargado VALUES('654215321','Nahomi','013584756',34);
INSERT INTO Encargado VALUES('785246542','Victoria','965214563',35);
INSERT INTO Encargado VALUES('701254638','Thiago','01632548756',36);
INSERT INTO Encargado VALUES('695421352','David','0118526324',37);
INSERT INTO Encargado VALUES('682153214','Elvis','985421485',38);
INSERT INTO Encargado VALUES('700215368','Pamela','9521452639',39);
INSERT INTO Encargado VALUES('665214523','Jhosef','0152639875',40);
INSERT INTO Encargado VALUES('711256398','Ruben','965824563',41);
INSERT INTO Encargado VALUES('686652365','Elena','985000632',42);
INSERT INTO Encargado VALUES('700005421','Gonzalo','980056456',43);
INSERT INTO Encargado VALUES('854152636','Zafiro','920225634',44);

-----------------------------Datos de cita---------------------------
INSERT INTO Cita VALUES(15,15,'232041550')	
INSERT INTO Cita VALUES(16,16,'211047801')	
INSERT INTO Cita VALUES(17,17,'255298875')	
INSERT INTO Cita VALUES(18,18,'161324032')	
INSERT INTO Cita VALUES(19,19,'701952945')	
INSERT INTO Cita VALUES(20,20,'199779165')	
INSERT INTO Cita VALUES(21,21,'236755129')	
INSERT INTO Cita VALUES(22,22,'218008999')	
INSERT INTO Cita VALUES(23,23,'909728370')	
INSERT INTO Cita VALUES(24,24,'198111140')	
INSERT INTO Cita VALUES(25,25,'231504970')	
INSERT INTO Cita VALUES(26,26,'199795098')	
INSERT INTO Cita VALUES(27,27,'729416320')	
INSERT INTO Cita VALUES(28,28,'316193057')	
INSERT INTO Cita VALUES(29,29,'232041550')	
INSERT INTO Cita VALUES(30,30,'785246321');
INSERT INTO Cita VALUES(31,31,'456321589');
INSERT INTO Cita VALUES(32,32,'785421635');
INSERT INTO Cita VALUES(33,33,'854213654');
INSERT INTO Cita VALUES(34,34,'654215321');
INSERT INTO Cita VALUES(35,35,'785246542');
INSERT INTO Cita VALUES(36,36,'701254638');
INSERT INTO Cita VALUES(37,37,'695421352');
INSERT INTO Cita VALUES(38,38,'682153214');
INSERT INTO Cita VALUES(39,39,'700215368');
INSERT INTO Cita VALUES(40,40,'665214523');
INSERT INTO Cita VALUES(41,41,'711256398');
INSERT INTO Cita VALUES(42,42,'686652365');
INSERT INTO Cita VALUES(43,43,'700005421');
INSERT INTO Cita VALUES(44,44,'854152636');



-----------------------------Datos de accesorios---------------------------
INSERT INTO Accesorios VALUES(15,'Collar',25)
INSERT INTO Accesorios VALUES(16,'Juguete',1)
INSERT INTO Accesorios VALUES(17,'Capa',28)
INSERT INTO Accesorios VALUES(18,'Pañuelo',11)
INSERT INTO Accesorios VALUES(19,'Cepillo',6)
INSERT INTO Accesorios VALUES(20,'Enterizo',5)
INSERT INTO Accesorios VALUES(21,'Gorro',14)
INSERT INTO Accesorios VALUES(22,'Gorro',25)
INSERT INTO Accesorios VALUES(23,'Platos',25)
INSERT INTO Accesorios VALUES(24,'Cepillo',10)
INSERT INTO Accesorios VALUES(25,'Capa',16)
INSERT INTO Accesorios VALUES(26,'Platos',14)
INSERT INTO Accesorios VALUES(27,'Collar',18)
INSERT INTO Accesorios VALUES(28,'Juguete',18)
INSERT INTO Accesorios VALUES(29,'Collar',22)
INSERT INTO Accesorios VALUES(30,'Lentes',50);
INSERT INTO Accesorios VALUES(31,'Zapatos',45);
INSERT INTO Accesorios VALUES(32,'Botas',15);
INSERT INTO Accesorios VALUES(33,'Sandalias',55);
INSERT INTO Accesorios VALUES(34,'Corta uñas',10);
INSERT INTO Accesorios VALUES(35,'Pelota',60);
INSERT INTO Accesorios VALUES(36,'Pelota',80);
INSERT INTO Accesorios VALUES(37,'cangurera para perro',40);
INSERT INTO Accesorios VALUES(38,'Mantas',10);
INSERT INTO Accesorios VALUES(39,'Perfume',15);
INSERT INTO Accesorios VALUES(40,'Botas',30);
INSERT INTO Accesorios VALUES(41,'Zapatos',60);
INSERT INTO Accesorios VALUES(42,'Lentes',40);
INSERT INTO Accesorios VALUES(43,'Arnés',11);
INSERT INTO Accesorios VALUES(44,'Capa',90);


-----------------------------Datos de proceso_adopcion---------------------------
INSERT INTO Proceso_Adopcion VALUES(15,15,'232041550')
INSERT INTO Proceso_Adopcion VALUES(16,16,'211047801')
INSERT INTO Proceso_Adopcion VALUES(17,17,'255298875')
INSERT INTO Proceso_Adopcion VALUES(18,18,'161324032')
INSERT INTO Proceso_Adopcion VALUES(19,19,'701952945')
INSERT INTO Proceso_Adopcion VALUES(20,20,'199779165')
INSERT INTO Proceso_Adopcion VALUES(21,21,'236755129')
INSERT INTO Proceso_Adopcion VALUES(22,22,'218008999')
INSERT INTO Proceso_Adopcion VALUES(23,23,'909728370')
INSERT INTO Proceso_Adopcion VALUES(24,24,'198111140')
INSERT INTO Proceso_Adopcion VALUES(25,25,'231504970')
INSERT INTO Proceso_Adopcion VALUES(26,26,'199795098')
INSERT INTO Proceso_Adopcion VALUES(27,27,'729416320')
INSERT INTO Proceso_Adopcion VALUES(28,28,'316193057')
INSERT INTO Proceso_Adopcion VALUES(29,29,'232041550')
INSERT INTO Proceso_Adopcion VALUES(30,30,'785246321');
INSERT INTO Proceso_Adopcion VALUES(31,31,'456321589');
INSERT INTO Proceso_Adopcion VALUES(32,32,'785421635');
INSERT INTO Proceso_Adopcion VALUES(33,33,'854213654');
INSERT INTO Proceso_Adopcion VALUES(34,34,'654215321');
INSERT INTO Proceso_Adopcion VALUES(35,35,'785246542');
INSERT INTO Proceso_Adopcion VALUES(36,36,'701254638');
INSERT INTO Proceso_Adopcion VALUES(37,37,'695421352');
INSERT INTO Proceso_Adopcion VALUES(38,38,'682153214');
INSERT INTO Proceso_Adopcion VALUES(39,39,'700215368');
INSERT INTO Proceso_Adopcion VALUES(40,40,'665214523');
INSERT INTO Proceso_Adopcion VALUES(41,41,'711256398');
INSERT INTO Proceso_Adopcion VALUES(42,42,'686652365');
INSERT INTO Proceso_Adopcion VALUES(43,43,'700005421');
INSERT INTO Proceso_Adopcion VALUES(44,44,'854152636');



-----------------------------Datos de adoptante---------------------------
INSERT INTO Adoptante VALUES(15,'Saanvi','493414530','999585548','Av.los andes 153',15,15)				
INSERT INTO Adoptante VALUES(16,'Angel','706353929','996365484','Calle piroxinitas23',16,16)				
INSERT INTO Adoptante VALUES(17,'Pari','286578297','987958935','Calle pedregal alto',17,17)				
INSERT INTO Adoptante VALUES(18,'Diya','28826237','977784666','Calle tupac amaru',18,18)				
INSERT INTO Adoptante VALUES(19,'Ananya','713503572','922855466','Calle los tulipanes',19,19)				
INSERT INTO Adoptante VALUES(20,'Aadhya','96558819','912255847','Av. Los alamos',20,20)				
INSERT INTO Adoptante VALUES(21,'Pihu','545492988','901251445','Av. Primavero 20',21,21)				
INSERT INTO Adoptante VALUES(22,'Khushi','220176114','901520654','Av.JavierPrado 34',22,22)				
INSERT INTO Adoptante VALUES(23,'Teo','833287071','987458465','Calle las flores 23',23,23)				
INSERT INTO Adoptante VALUES(24,'Isaac','494020105','935568152','Calle angulo 123',24,24)				
INSERT INTO Adoptante VALUES(25,'Arnau','369313778','902236566','Calle las rosas ',25,25)				
INSERT INTO Adoptante VALUES(26,'Luka','858638709','988556222','Av. Canada',26,26)				
INSERT INTO Adoptante VALUES(27,'Max','114141236','905478987','Av.aguilar 20',27,27)				
INSERT INTO Adoptante VALUES(28,'Imran','15351570','915987487','Av.cieneguilla',28,28)				
INSERT INTO Adoptante VALUES(29,'Youssef','164272557','905648517','Av.jose huerta',29,29)
INSERT INTO Adoptante VALUES(30,'Ximena','752856421','996564521','Calle los Nogales, Urb. Magnolias, Ate',30,30);
INSERT INTO Adoptante VALUES(31,'Lidia','845263215','985475698','Jr. Los Pinos 678, Huarochiri',31,31);
INSERT INTO Adoptante VALUES(32,'Roger','658654213','996633524','Av. el Sol 556, Residencial Iquitos, Comas',32,32);
INSERT INTO Adoptante VALUES(33,'Francis','668521423','951753456','Av. Industrial 154, Ate',33,33);
INSERT INTO Adoptante VALUES(34,'Jose','701529635','946285631','Av. Viña del Mar 332, Residencial Pariachi, San Juan de Lurigancho,34,34);
INSERT INTO Adoptante VALUES(35,'Eduardo','785214632','946854112','Av. Los Alamos 321, San Miguel',35,35);
INSERT INTO Adoptante VALUES(36,'Claudio','856321452','976655482','Av. Petit Thouars 3065, Lince',36,36);
INSERT INTO Adoptante VALUES(37,'Aron','756321526','985263645','Calle Santa Rosa cdr. 5, San Carlos',37,37);
INSERT INTO Adoptante VALUES(38,'Vicente','854216321','951623754','Av. Los Pinedos, Residencial Magdalena, Magdalena',38,38);
INSERT INTO Adoptante VALUES(39,'Yadira','778526315','963741456','Jr. Puno 6543, Piura',39,39);
INSERT INTO Adoptante VALUES(40,'Laura','774155226','951452185','Calle Vendaval 1514, Trujillo',40,40);
INSERT INTO Adoptante VALUES(41,'Arturo','714121512','990050024','Av. Los Ciruelos 4578, Callao',41,41);
INSERT INTO Adoptante VALUES(42,'Luis','852697431','986225065','Av. las palmeras 8888, Urb. Nogales, Surco',42,42);
INSERT INTO Adoptante VALUES(43,'Alexa','701528632','976542185','Calle Cusco 154, Cercado',43,43);
INSERT INTO Adoptante VALUES(44,'Miguel','698856324','963524869','Av. Los Olivos 457, Ancon',44,44);




----------------------------- Datos de animal---------------------------
INSERT INTO Animal VALUES(15,3,'Akita',10,'Blanco','Amigable',15,15)				
INSERT INTO Animal VALUES(16,5,'Mestizo',60,'Marron','Timido',16,16)				
INSERT INTO Animal VALUES(17,10,'Alaskan Husky',50,'Negro','Jugueton',17,17)				
INSERT INTO Animal VALUES(18,9,'Boxer',60,'Marron','Curioso',18,18)				
INSERT INTO Animal VALUES(19,3,'Boyero de Appenzell',50,'Negro','Timido',19,19)				
INSERT INTO Animal VALUES(20,7,'Mestizo',40,'Blanco','Jugueton',20,20)				
INSERT INTO Animal VALUES(21,1,'Spaniel de Campo',20,'Marron','Amigable',21,21)				
INSERT INTO Animal VALUES(22,1,'Spaniel Francés',30,'Marron','Travieso',22,22)				
INSERT INTO Animal VALUES(23,10,'Schnauzer estándar',65,'Gris','Agresivo',23,23)				
INSERT INTO Animal VALUES(24,5,'Pastor Áleman',85,'Marron','Inquito',24,24)				
INSERT INTO Animal VALUES(25,4,'Mestizo',15,'Gris','Timido',25,25)				
INSERT INTO Animal VALUES(26,4,'Bulldog inglés',62,'Negro','Amigable',26,26)				
INSERT INTO Animal VALUES(27,3,'Boxer',84,'Marron','Jugueton',27,27)				
INSERT INTO Animal VALUES(28,9,'Spaniel de Campo',24,'Gris','Agresivo',28,28)				
INSERT INTO Animal VALUES(29,5,'Schnauzer estándar',36,'Gris','Inquito',29,29)				
INSERT INTO Animal VALUES(30,2,'Galgo',90,'Blanco','Juguetón',NULL,30);
INSERT INTO Animal VALUES(31,8,'Galgo',50,'Negro','Amigable',NULL,30);
INSERT INTO Animal VALUES(32,5,'Podenco',60,'Blanco Oscuro','Tímido',NULL,32);
INSERT INTO Animal VALUES(33,8,'Mestizo',35,'Marrón con Negro','Juguetón',NULL,32);
INSERT INTO Animal VALUES(34,7,'Schnauzer',50,'Gris','Juguetón',NULL,32);
INSERT INTO Animal VALUES(35,7,'Schnauzer',40,'Girs con blanco','Leal y amigable',NULL,35);
INSERT INTO Animal VALUES(36,11,'Podenco',50,'Crema','Sociable',NULL,38);
INSERT INTO Animal VALUES(37,3,'Husky Siberiano',80,'Marrón claro con manchas blancas','Juguetón y carismático',NULL,40);
INSERT INTO Animal VALUES(38,4,'Husky Siberiano',90,'Blanco','Curioso y Amigable',NULL,40);
INSERT INTO Animal VALUES(39,10,'Pug',38,'Crema','Energético y Curioso',NULL,30);
INSERT INTO Animal VALUES(40,5,'Dalmata',42,'Blanco con negro','Tranquilo',NULL,32);
INSERT INTO Animal VALUES(41,5,'Husky Siberiano',28,'Blanco con plomo','Divertido',NULL,33);
INSERT INTO Animal VALUES(42,6,'Jack Rusell',48,'Blanco con manchas marrón claro','Cariñoso',NULL,33);
INSERT INTO Animal VALUES(43,8,'Chihuahua',33,'Crema','Agresivo y territorial',NULL,33);
INSERT INTO Animal VALUES(44,8,'Pomeranian',37,'Crema','Enojón',NULL,35);
				


-----------------------------Datos de medicamentos---------------------------
INSERT INTO Medicamentos VALUES(15,'Cetericina','2023-05-10','2024-05-10')
INSERT INTO Medicamentos VALUES(16,'Doxitel 100','2023-05-10','2024-05-10')
INSERT INTO Medicamentos VALUES(17,'Doxitel 200','2023-05-10','2024-05-10')
INSERT INTO Medicamentos VALUES(18,'Prednovet','2022-05-10','2023-05-10')
INSERT INTO Medicamentos VALUES(19,'Hepatiopet','2022-06-25','2023-06-25')
INSERT INTO Medicamentos VALUES(20,'Gastropet','2023-06-26','2024-06-26')
INSERT INTO Medicamentos VALUES(21,'Meloxivet ','2023-06-27','2024-06-27')
INSERT INTO Medicamentos VALUES(22,'Ketovet','2023-06-28','2024-06-28')
INSERT INTO Medicamentos VALUES(23,'Doxitel 100','2023-11-30','2024-11-30')
INSERT INTO Medicamentos VALUES(24,'Hepatiopet','2023-11-30','2024-11-30')
INSERT INTO Medicamentos VALUES(25,'Prednovet','2023-11-30','2024-11-30')
INSERT INTO Medicamentos VALUES(26,'Gastropet','2023-11-30','2024-11-30')
INSERT INTO Medicamentos VALUES(27,'Doxitel 100','2023-12-05','2024-12-05')
INSERT INTO Medicamentos VALUES(28,'Prednovet','2024-12-06','2025-12-06')
INSERT INTO Medicamentos VALUES(29,'Prednovet','2024-12-07','2025-12-07')
INSERT INTO Medicamentos VALUES(30,'Hepatiopet','2023/05/01','2024/05/01');
INSERT INTO Medicamentos VALUES(31,'Cefazolina','2023/02/11','2024/02/11');
INSERT INTO Medicamentos VALUES(32,'Doxicilina','2023/02/15','2024/02/15');
INSERT INTO Medicamentos VALUES(33,'Metronidazol','2023/02/10','2024/02/10');
INSERT INTO Medicamentos VALUES(34,'Tilosina','2023/02/15','2024/02/15');
INSERT INTO Medicamentos VALUES(35,'Eritromicina','2022/08/05','2023/08/05');
INSERT INTO Medicamentos VALUES(36,'Ampicilina','2022/11/06','2023/11/06');
INSERT INTO Medicamentos VALUES(37,'Bencilpenicilina','2022/08/05','2023/08/08');
INSERT INTO Medicamentos VALUES(38,'Meloxicam','2023/03/12','2024/03/12');
INSERT INTO Medicamentos VALUES(39,'Enrofloxacino','2023/05/09','2024/05/09');
INSERT INTO Medicamentos VALUES(40,'Marbofloxacino','2022/10/10','2023/10/10');
INSERT INTO Medicamentos VALUES(41,'Meloxivet ','2023/02/11','2024/02/11');
INSERT INTO Medicamentos VALUES(42,'Pradofloxacino','2023/01/12','2024/01/12');
INSERT INTO Medicamentos VALUES(43,'Gastropet','2023/02/13','2024/02/13');
INSERT INTO Medicamentos VALUES(44,'Dipirona','2023/02/14','2024/02/14');


-----------------------------Datos de alimentos---------------------------
INSERT INTO Alimentos VALUES(15,'Catshow',2)
INSERT INTO Alimentos VALUES(16,'Ricocan',3)
INSERT INTO Alimentos VALUES(17,'Daggo',3)
INSERT INTO Alimentos VALUES(18,'ProPlan',3)
INSERT INTO Alimentos VALUES(19,'VetLife',2)
INSERT INTO Alimentos VALUES(20,'Ricocat',1)
INSERT INTO Alimentos VALUES(21,'Felix',1)
INSERT INTO Alimentos VALUES(22,'Catshow',2)
INSERT INTO Alimentos VALUES(23,'Felix',2)
INSERT INTO Alimentos VALUES(24,'Daggo',2)
INSERT INTO Alimentos VALUES(25,'ProPlan',1)
INSERT INTO Alimentos VALUES(26,'ProPlan',1)
INSERT INTO Alimentos VALUES(27,'Ricocan',2)
INSERT INTO Alimentos VALUES(28,'Ricocan',3)
INSERT INTO Alimentos VALUES(29,'Ricocat',3)
INSERT INTO Alimentos VALUES(30,'Proplan',6);
INSERT INTO Alimentos VALUES(31,'Vet Life',6);
INSERT INTO Alimentos VALUES(32,'Cambo',6);
INSERT INTO Alimentos VALUES(33,'Equilibrio',19);
INSERT INTO Alimentos VALUES(34,'Royal Canin',14);
INSERT INTO Alimentos VALUES(35,'Mimaskot',23);
INSERT INTO Alimentos VALUES(36,'Pure Life',30);
INSERT INTO Alimentos VALUES(37,'Purina One',29);
INSERT INTO Alimentos VALUES(38,'Bravery',4);
INSERT INTO Alimentos VALUES(39,'Hill's',30);
INSERT INTO Alimentos VALUES(40,'Earthborn',27);
INSERT INTO Alimentos VALUES(41,'Brit Care',24);
INSERT INTO Alimentos VALUES(42,'Taste Of The Wild',24);
INSERT INTO Alimentos VALUES(43,'Super Can',15);
INSERT INTO Alimentos VALUES(44,'Nutram',26);


-----------------------------Datos de almacen---------------------------
INSERT INTO Almacen VALUES(15,18,17,25,29,15)			
INSERT INTO Almacen VALUES(16,26,29,16,26,16)			
INSERT INTO Almacen VALUES(17,15,24,18,23,17)			
INSERT INTO Almacen VALUES(18,20,16,19,21,18)			
INSERT INTO Almacen VALUES(19,21,25,22,20,19)			
INSERT INTO Almacen VALUES(20,22,18,15,15,20)			
INSERT INTO Almacen VALUES(21,16,27,17,18,21)			
INSERT INTO Almacen VALUES(22,17,19,26,17,22)			
INSERT INTO Almacen VALUES(23,25,20,28,27,23)			
INSERT INTO Almacen VALUES(24,19,23,29,24,24)			
INSERT INTO Almacen VALUES(25,28,24,23,25,25)			
INSERT INTO Almacen VALUES(26,29,23,16,28,26)			
INSERT INTO Almacen VALUES(27,27,28,27,25,27)			
INSERT INTO Almacen VALUES(28,26,15,20,19,28)			
INSERT INTO Almacen VALUES(29,23,22,21,16,29)			
INSERT INTO Almacen VALUES(30,33,33,8,22,21);
INSERT INTO Almacen VALUES(31,41,37,12,31,40);
INSERT INTO Almacen VALUES(32,42,31,151,42,35);
INSERT INTO Almacen VALUES(33,35,40,35,36,38);
INSERT INTO Almacen VALUES(34,44,42,24,14,41);
INSERT INTO Almacen VALUES(35,37,44,28,21,25);
INSERT INTO Almacen VALUES(36,36,44,40,16,16);
INSERT INTO Almacen VALUES(37,39,33,17,7,8);
INSERT INTO Almacen VALUES(38,40,32,28,18,5);
INSERT INTO Almacen VALUES(39,37,42,9,25,19);
INSERT INTO Almacen VALUES(40,10,37,15,14,29);
INSERT INTO Almacen VALUES(41,38,31,18,18,31);
INSERT INTO Almacen VALUES(42,34,41,10,29,35);
INSERT INTO Almacen VALUES(43,32,44,23,30,38);
INSERT INTO Almacen VALUES(44,30,37,5,36,43);


-----------------------------Datos de receta---------------------------
INSERT INTO Receta VALUES(15,25,17,15)			
INSERT INTO Receta VALUES(16,16,29,16)			
INSERT INTO Receta VALUES(17,18,24,17)			
INSERT INTO Receta VALUES(18,19,16,18)			
INSERT INTO Receta VALUES(19,22,25,19)			
INSERT INTO Receta VALUES(20,15,18,20)			
INSERT INTO Receta VALUES(21,17,27,21)			
INSERT INTO Receta VALUES(22,26,19,22)			
INSERT INTO Receta VALUES(23,28,20,23)			
INSERT INTO Receta VALUES(24,29,23,24)			
INSERT INTO Receta VALUES(25,23,24,25)			
INSERT INTO Receta VALUES(26,16,23,26)			
INSERT INTO Receta VALUES(27,27,28,27)			
INSERT INTO Receta VALUES(28,20,15,28)			
INSERT INTO Receta VALUES(29,21,22,29)			
INSERT INTO Receta VALUES(30,33,41,41);
INSERT INTO Receta VALUES(31,38,35,35);
INSERT INTO Receta VALUES(32,25,18,18);
INSERT INTO Receta VALUES(33,32,38,38);
INSERT INTO Receta VALUES(34,NULL,NULL,NULL);
INSERT INTO Receta VALUES(35,NULL,NULL,NULL);
INSERT INTO Receta VALUES(36,36,16,26);
INSERT INTO Receta VALUES(37,NULL,NULL,NULL);
INSERT INTO Receta VALUES(38,28,28,18);
INSERT INTO Receta VALUES(39,19,39,29);
INSERT INTO Receta VALUES(40,30,15,19);
INSERT INTO Receta VALUES(41,33,15,13);
INSERT INTO Receta VALUES(42,42,25,15);
INSERT INTO Receta VALUES(43,39,33,23);
INSERT INTO Receta VALUES(44,44,34,34);


