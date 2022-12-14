USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 15/9/2022 14:59:01 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 15/9/2022 14:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](50) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 15/9/2022 14:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 15/9/2022 14:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [text] NOT NULL,
	[Foto] [varchar](100) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puntajes]    Script Date: 15/9/2022 14:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntajes](
	[IdPuntaje] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Puntos] [int] NULL,
	[FechaHora] [datetime] NULL,
	[Tiempo] [int] NULL,
 CONSTRAINT [PK_Puntajes] PRIMARY KEY CLUSTERED 
(
	[IdPuntaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 15/9/2022 14:59:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](50) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](50) NULL,
	[ContadorSeleccionada] [int] NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (1, N'Mitos', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (2, N'Datos Científicos', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (3, N'Famosos', NULL)
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre], [Foto]) VALUES (4, N'Prevención', NULL)
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultades] ON 

INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Baja')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Media')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Alta')
SET IDENTITY_INSERT [dbo].[Dificultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'Según estudios realizados por el instituto Favaloro, ¿cuánto tiempo tarda generalmente en curarse una ETS? ', N'https://www.zanzu.de/fileadmin/zanzu.de/content/206_hiv_behandeling_dokter_voorschrift.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (2, 4, 1, N' ¿Por qué medios NO se puede transmitir una ETS?', N'https://www.reproduccionasistida.org/wp-content//contagio-ETS.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (3, 1, 2, N'¿Cuántas veces puedo contraer una misma ETS?', N'http://imagenes.catholic.net/imagenes_db/f7e1d5_ets.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (4, 1, 2, N'¿A qué edad dejamos de contraer ETS?', N'https://www.nes-mag.com/wp-content/uploads/2018/08/edad.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (5, 1, 3, N'¿Cuántas veces me tengo que bañar a la semana para evitar contraer una ETS?', N'https://media.gq.com.mx/photos/5e4bf1019577110008067dc6/16:9/w_2560%2Cc_limit/ban%25CC%2583o.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (6, 1, 3, N'Las ETS son fruto de la promiscuidad.', N'https://www.psico.mx/site/article/57647/47567/shutterstock-1614412939_ai1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (7, 2, 1, N'La clamidiasis, la gonorrea y la sífilis son infecciones bacterianas', N'https://www.podologoenjerez.com/wp-content/uploads/2019/03/bacteria-1024x768.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (8, 2, 1, N' ¿Cuánta gente,en promedio, contrae alguna ets por año?', N'https://www.medwave.cl/medios/2007/febrero/sogia/PeredoFig4.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (9, 2, 2, N'La tricomoniasis es la ETS curable más común en el mundo.', N'https://medlineplus.gov/images/Trichomoniasis.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (10, 2, 2, N'¿Cómo se tratan las ETS bacterianas y parasitarias?', N'https://lasaludquequieres.cl/wp-content/uploads/2020/02/GettyImages-685024709.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (11, 2, 3, N'Algunas ITS pueden provocar otras ¿Por ejemplo?', N'https://www.thewellproject.org/sites/default/files/its-2.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (12, 2, 3, N'¿Cuántas muertes se estima que provocó la hepatitis en 2019?', N'https://img.europapress.es/fotoweb/fotonoticia_20220728120454_420.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (13, 3, 1, N'¿Qué ETS tenía Freddie Mercury?', N'https://media.revistavanityfair.es/photos/60e85a8f9bf55ca1055acb9d/master/pass/14521.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (14, 3, 2, N'¿Quién de estos famosos tuvo/tiene VIH?', N'https://images.ole.com.ar/2022/09/02/CVu09oD1P_2000x1500__1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (15, 3, 3, N'¿Qué clase de Hepatitis contrajo Pamela Anderson?', N'https://www.clarin.com/img/2017/01/18/pamela-anderson-como-la-recordada___B1hFJIp8l_340x340__1.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (16, 3, 3, N'Jim Carrey fue acusado de haberle pasado 3 enfermedades a su exnovia. Elige la incorrecta', N'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/Q3XTMVLMMZAZNH7ZWX76QWYPCU.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (17, 3, 1, N'¿Es verdad que David Beckham contagió de herpes a su esposa?', N'https://img.a.transfermarkt.technology/portrait/big/3139-1459504284.jpg?lm=1')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (18, 3, 2, N'¿De qué manera Arthur Ashe se contagió de VIH?', N'https://media.filmelier.com/tit/hNoVKK/thumb/norbit_udBqSto.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (19, 1, 1, N'Las personas que mantienen relaciones homosexuales masculinas son más propensas a contraer una ETS?', N'https://www.lavanguardia.com/files/content_image_mobile_filter/uploads/2018/09/25/5fa4508cd828c.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (20, 4, 2, N'¿Cuál/es de estas opciones es/son manera/s de prevenir el contagio de una ETS?', N'https://hospitalprivado.com.ar/converter//uploads/its_page_0.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (22, 4, 3, N'¿Cuál es el porcentaje de protección ante las ETS que provee el Condón?', N'https://stopvih.org/wp_2022/wp-content/uploads/2013/11/condon-masculino-en-la-mano.jpg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (23, 4, 1, N'Solo se puede contraer una ETS teniendo Sexo', N'https://www.lavanguardia.com/files/og_thumbnail/uploads/2021/08/25/61263c9169c36.jpeg')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (24, 4, 2, N'¿Cuál de estos es un medio por el cual se puede contraer una ETS? ', N'https://www.reproduccionasistida.org/wp-content//contagio-ETS.png')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado], [Foto]) VALUES (25, 4, 3, N'Exponer un preservativo al sol puede hacer que se arruine', N'https://www.caracteristicas.co/wp-content/uploads/2018/11/Sol-1-e1582904895390-800x416.jpg')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Puntajes] ON 

INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (17, N'Nachito kurman', 1000, CAST(N'2022-09-14T11:59:16.727' AS DateTime), 4)
INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (18, N'Messi', 500, CAST(N'2022-09-14T12:01:04.470' AS DateTime), 4)
INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (19, N'Thomas Korni', 500, CAST(N'2022-09-14T12:01:31.603' AS DateTime), 11)
INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (20, N'ededed', 0, CAST(N'2022-09-15T13:48:54.100' AS DateTime), 52)
INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (21, N'd', 0, CAST(N'2022-09-15T13:49:04.593' AS DateTime), 4)
INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (22, N'e', 500, CAST(N'2022-09-15T13:49:18.067' AS DateTime), 4)
INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (23, N'e', 500, CAST(N'2022-09-15T13:49:55.290' AS DateTime), 4)
INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (24, N'e', 500, CAST(N'2022-09-15T13:49:56.123' AS DateTime), 4)
INSERT [dbo].[Puntajes] ([IdPuntaje], [UserName], [Puntos], [FechaHora], [Tiempo]) VALUES (25, N'Julian', 5500, CAST(N'2022-09-15T13:57:04.550' AS DateTime), 418)
SET IDENTITY_INSERT [dbo].[Puntajes] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (1, 1, 1, N'2 años
', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (2, 1, 2, N'Depende de si es un virus o no', 1, NULL, 5)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (7, 1, 3, N'Son incurables', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (8, 1, 4, N'De 3 a 5 años.', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (10, 2, 1, N'Sexo anal', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (11, 2, 2, N'Sexo oral.', 0, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (13, 2, 3, N'Sangre', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (14, 2, 4, N'Contacto de piel', 1, NULL, 3)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (15, 3, 1, N'Ilimitadas', 1, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (37, 3, 2, N'Máximo dos', 0, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (39, 3, 3, N'Tres', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (40, 3, 4, N'No existen las ETS', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (41, 4, 1, N'Nunca. Se pueden contraer durante toda la vida.', 1, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (42, 4, 2, N'Después de los 60 años.', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (43, 4, 3, N'Después de los 80 años', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (44, 4, 4, N'Depende de la facha', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (45, 5, 1, N'Una vez por día', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (46, 5, 2, N'Dos veces por día', 0, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (47, 5, 3, N'La higiene no será una manera de prevenir las ETS', 1, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (48, 5, 4, N'No importa, todos morimos al final del camino', 1, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (51, 6, 1, N'Falso, las parejas estables no están libres de ETS', 1, NULL, 4)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (52, 6, 2, N'De los cuernos y del SIDA nadie se puede salvar ', 1, NULL, 3)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (53, 6, 3, N'Verdadero', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (54, 6, 4, N'Son consecuentemente proporcionales', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (56, 7, 1, N'Verdadero', 1, NULL, 6)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (57, 7, 2, N'Falso', 0, NULL, 3)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (58, 8, 1, N'376 Millones', 1, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (59, 8, 2, N'204 Millones', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (61, 8, 3, N'527 Millones', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (63, 8, 4, N'2 personas', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (64, 9, 1, N'Verdadero', 1, NULL, 5)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (65, 9, 2, N'Falso', 0, NULL, 5)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (66, 10, 1, N'Marihuana', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (67, 10, 2, N'Té de manzanilla', 0, NULL, 4)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (68, 10, 3, N'Pautas de antibióticos', 1, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (69, 10, 4, N'Inyecciones ', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (71, 11, 1, N'La Sífilis puede provocar el VIH', 1, NULL, 5)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (72, 11, 2, N'La Clamidia Puede provocar Hepatitis', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (73, 11, 3, N'El Herpes puede Provocar HIV
', 1, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (74, 11, 4, N'La gonorrea puede provocar la catarata del niágara', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (76, 12, 1, N'700.000', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (77, 12, 2, N'930.000', 0, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (78, 12, 3, N'403.000', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (79, 12, 4, N'820.000', 1, NULL, 5)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (81, 13, 1, N'Clamidia', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (82, 13, 2, N'Sida ', 1, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (83, 13, 3, N'Herpes', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (84, 13, 4, N'Hepatitis ', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (85, 14, 1, N'Magic Johnson', 1, NULL, 9)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (86, 14, 2, N'Ozuna', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (88, 14, 3, N'Peter Crouch', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (89, 14, 4, N'Juan Roman Riquelme', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (90, 15, 1, N'Hepatitis B', 0, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (91, 15, 2, N'Hepatitis A', 0, NULL, 4)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (92, 15, 3, N'Hepatitis T', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (93, 15, 4, N'Hepatitis C', 1, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (94, 16, 1, N'Herpes 1', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (95, 16, 2, N'Herpes 2', 0, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (96, 16, 3, N'Gonorrea', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (97, 16, 4, N'Clamidia', 1, NULL, 4)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (98, 17, 1, N'Verdadero', 1, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (99, 17, 2, N'Falso', 0, NULL, 6)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (101, 18, 1, N'Transfusión de sangre', 1, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (102, 18, 2, N'Mediante sexo', 0, NULL, 6)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (103, 18, 3, N'Contacto de piel', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (104, 18, 4, N'Saliba', 0, NULL, 3)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (105, 19, 1, N'Verdadero ', 1, NULL, 4)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (106, 19, 2, N'Falso', 0, NULL, 8)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (107, 20, 1, N'Usar Condón', 1, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (108, 20, 2, N'Tomar Pastillas de vitamina C', 0, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (109, 20, 3, N'No hay', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (110, 20, 4, N'No tener Sexo', 1, NULL, 21)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (111, 22, 1, N'75%', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (112, 22, 2, N'80%', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (114, 22, 3, N'9/12/2018%', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (116, 22, 4, N'90%', 1, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (117, 23, 1, N'Falso', 1, NULL, 3)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (118, 23, 2, N'Verdadero', 0, NULL, 18)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (119, 24, 1, N'Uso de drogas inyectadas', 1, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (120, 24, 2, N'Tomar Sol', 0, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (121, 24, 3, N'Convivir con alguien que tiene una ETS', 0, NULL, 0)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (123, 24, 4, N'Jugar al blackjack dormido', 0, NULL, 1)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (125, 25, 1, N'Verdadero', 1, NULL, 2)
INSERT [dbo].[Respuestas] ([IdRespuesta], [IdPregunta], [Opcion], [Contenido], [Correcta], [Foto], [ContadorSeleccionada]) VALUES (126, 25, 2, N'Falso', 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
