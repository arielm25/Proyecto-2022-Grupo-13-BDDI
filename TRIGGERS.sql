USE TalleresYCursosWeb
GO
--CREAMOS UNA NUEVA TABLA SIN CONEXION A NINGUNA OTRA TABLA DE LA BASE DE DATOS, 
--SERVIRA PARA REALIZAR UNA AUDITORIA SOBRE LA TABLA PRINCIPAL
CREATE TABLE [dbo].[AuditoriaAlumno](
[cod_AU] [int] IDENTITY(1,1) NOT NULL,
[usuario_AU] [varchar] (50) NOT NULL,
[fecha_hora_AU] [datetime] NOT NULL,
[accion] [varchar] (20) NOT NULL,
[legajo] [int] NOT NULL,
[dnialumno] [int] NOT NULL,
[nomyape] [varchar] (100) NOT NULL,
[anoisncr] [int] NOT NULL,
[direccion] [varchar] (250) NOT NULL,
[telefono] [bigint] NOT NULL,
[correo] [varchar] (250) NOT NULL,
[edad] [int] NOT NULL,
[sexo] [varchar] (1) NOT NULL,
[carrera] [varchar] (250) NOT NULL,
[provincia] [varchar] (50) NOT NULL,
[pais] [varchar] (50) NOT NULL,
CONSTRAINT [PK_auditoria_Cod] PRIMARY KEY ([cod_AU])
)
GO

--TRIGGER PARA AUDITAR LA INSERCION DE DATOS EN LA TABLA MUSICA
CREATE TRIGGER dbo.DIS_AuditarInsercionesAlumnos
	ON [dbo].[Alumnos]
	FOR INSERT
AS
BEGIN
	SET NOCOUNT ON
	--Declaracion de Varibales Locales a utilizar que se recuperan mediantes tabla local
	DECLARE @dnialumno int
	DECLARE @nomyape varchar(100)
	DECLARE @anoisncr int
	DECLARE @direccion varchar(250)
	DECLARE @telefono bigint
	DECLARE @correo varchar(250)
	DECLARE @edad int
	DECLARE @sexo varchar (1)

	--ASIGNACION DE DATOS A LAS VARIABLES MEDIANTE TABLA LOCAL
	SELECT @dnialumno = inserted.dnialumno FROM inserted
	SELECT @nomyape = inserted.nomyape FROM inserted
	SELECT @anoisncr = inserted.anoisncr FROM inserted
	SELECT @direccion = inserted.direccion FROM inserted
	SELECT @telefono = inserted.telefono FROM inserted
	SELECT @correo = inserted.correo FROM inserted
	SELECT @edad = inserted.edad FROM inserted
	SELECT @sexo = inserted.sexo FROM inserted

	--Declaracion de Varibales Locales a utilizar 
	--(IDs se recuperan mediante Tabla Local, Dato relacionado al ID mediante consultas a las tablas correspondientes de la informacion)
	DECLARE @codcarrera int
	DECLARE @carrera varchar(250)
	DECLARE @codprovincia int
	DECLARE @provincia varchar(50)
	DECLARE @codpais int
	DECLARE @pais varchar(50)

	--ASIGNACION DE DATOS A LAS VARIABLES MEDIANTE TABLA LOCAL Y TABLA EXTERNA CORRESPONDIENTE

	--Carrera
	SELECT @codcarrera = inserted.codcarrera FROM inserted
		
	SELECT @carrera = car.nombre
	FROM carreras car
	WHERE car.codcarrera = @codcarrera
		
	--Provincia
	SELECT @codprovincia = inserted.codprovincia FROM inserted
		
	SELECT @provincia = prov.descripcion
	FROM provincia prov
	WHERE prov.codprovincia = @codprovincia

	--Pais
	SELECT @codpais = inserted.codpais FROM inserted
	
	SELECT @pais = p.descripcion
	FROM pais p
	WHERE p.codpais = @codpais
		
	--ALMACENANDO LA INFORMACION EN LA TABLA DE AUDITORIA
	INSERT AuditoriaAlumno
	SELECT  SYSTEM_USER,
			GETDATE(),
			'INSERCION',
			legajo,
			@dnialumno,
			@nomyape,
			@anoisncr,
			@direccion,
			@telefono,
			@correo,
			@edad,
			@sexo,
			@carrera,
			@provincia,
			@pais
	FROM inserted
END
GO

--TRIGGER PARA AUDITAR LA ELIMINACION DE DATOS EN LA TABLA MUSICA
CREATE TRIGGER dbo.DIS_AuditarEliminacionesAlumno
	ON [dbo].[Alumnos]
	FOR DELETE
AS
BEGIN
	SET NOCOUNT ON
	--Declaracion de Varibales Locales a utilizar que se recuperan mediantes tabla local
	DECLARE @dnialumno int
	DECLARE @nomyape varchar(100)
	DECLARE @anoisncr int
	DECLARE @direccion varchar(250)
	DECLARE @telefono bigint
	DECLARE @correo varchar(250)
	DECLARE @edad int
	DECLARE @sexo varchar (1)

	--ASIGNACION DE DATOS A LAS VARIABLES MEDIANTE TABLA LOCAL
	SELECT @dnialumno = deleted.dnialumno FROM deleted
	SELECT @nomyape = deleted.nomyape FROM deleted
	SELECT @anoisncr = deleted.anoisncr FROM deleted
	SELECT @direccion = deleted.direccion FROM deleted
	SELECT @telefono = deleted.telefono FROM deleted
	SELECT @correo = deleted.correo FROM deleted
	SELECT @edad = deleted.edad FROM deleted
	SELECT @sexo = deleted.sexo FROM deleted


	--Declaracion de Varibales Locales a utilizar 
	--(IDs se recuperan mediante Tabla Local, Dato relacionado al ID mediante consultas a las tablas correspondientes de la informacion)
	DECLARE @codcarrera int
	DECLARE @carrera varchar (250)
	DECLARE @codprovincia int
	DECLARE @provincia varchar(50)
	DECLARE @codpais int
	DECLARE @pais varchar(50)

	--ASIGNACION DE DATOS A LAS VARIABLES MEDIANTE TABLA LOCAL Y TABLAS EXTERNAS CORRESPONDIENTES

	--Carrera
	SELECT @codcarrera = deleted.codcarrera FROM deleted
		
	SELECT @carrera = car.nombre
	FROM carreras car
	WHERE car.codcarrera = @codcarrera
		
	--Provincia
	SELECT @codprovincia = deleted.codprovincia FROM deleted
		
	SELECT @provincia = prov.descripcion
	FROM provincia prov
	WHERE prov.codprovincia = @codprovincia

	--Pais
	SELECT @codpais = deleted.codpais FROM deleted
	
	SELECT @pais = p.descripcion
	FROM pais p
	WHERE p.codpais = @codpais
		
	--ALMACENANDO LA INFORMACION EN LA TABLA DE AUDITORIA
	INSERT AuditoriaAlumno
	SELECT  SYSTEM_USER,
			GETDATE(),
			'ELIMINACION',
			legajo,
			@dnialumno,
			@nomyape,
			@anoisncr,
			@direccion,
			@telefono,
			@correo,
			@edad,
			@sexo,
			@carrera,
			@provincia,
			@pais
	FROM deleted
END


GO
--TRIGGER PARA AUDITAR LA ACTUALIZACION DE DATOS EN LA TABLA MUSICA
CREATE TRIGGER dbo.DIS_AuditarActualizacionAlumno
	ON [dbo].[Alumnos]
	FOR UPDATE
AS
BEGIN
	SET NOCOUNT ON
	--Declaracion de Varibales Locales a utilizar que se recuperan mediantes tabla local
	DECLARE @dnialumno int
	DECLARE @nomyape varchar(100)
	DECLARE @anoinscr int
	DECLARE @direccion varchar(250)
	DECLARE @telefono bigint
	DECLARE @correo varchar(250)
	DECLARE @edad int
	DECLARE @sexo varchar(1)

	--ASIGNACION DE DATOS A LAS VARIABLES MEDIANTE TABLA LOCAL
	SELECT @dnialumno = inserted.dnialumno FROM inserted
	SELECT @nomyape = inserted.nomyape FROM inserted
	SELECT @anoinscr = inserted.anoisncr FROM inserted
	SELECT @direccion = inserted.direccion FROM inserted
	SELECT @telefono = inserted.telefono FROM inserted
	SELECT @correo = inserted.correo FROM inserted
	SELECT @edad = inserted.edad FROM inserted
	SELECT @sexo = inserted.sexo FROM inserted

	--Declaracion de Varibales Locales a utilizar 
	--(IDs se recuperan mediante Tabla Local, Dato relacionado al ID mediante consultas a las tablas correspondientes de la informacion)
	DECLARE @codcarrera int
	DECLARE @carrera varchar(250)
	DECLARE @codprovincia int
	DECLARE @provincia varchar(50)
	DECLARE @codpais int
	DECLARE @pais varchar(50)

	--ASIGNACION DE DATOS A LAS VARIABLES MEDIANTE TABLA LOCAL Y TABLAS EXTERNAS CORRESPONDIENTES
	
	--Carrera
	SELECT @codcarrera = inserted.codcarrera FROM inserted

	SELECT @carrera = car.nombre
	FROM carreras car
	WHERE car.codcarrera = @codcarrera
		
	--Provincia
	SELECT @codprovincia = inserted.codprovincia FROM inserted
	SELECT @codpais = inserted.codpais FROM inserted
		
	SELECT @provincia = prov.descripcion
	FROM provincia prov
	WHERE prov.codprovincia = @codprovincia

	--Pais
	SELECT @codpais = inserted.codpais FROM inserted
	
	SELECT @pais = p.descripcion
	FROM pais p
	WHERE p.codpais = @codpais
		

	INSERT AuditoriaAlumno
	SELECT  SYSTEM_USER,
			GETDATE(),
			'ACTUALIZACION',
			legajo,
			@dnialumno,
			@nomyape,
			@anoinscr,
			@direccion,
			@telefono,
			@correo,
			@edad,
			@sexo,
			@carrera,
			@provincia,
			@pais
	FROM inserted
END
GO

--PRUEBAS DE FUNCIONAMIENTO DE LA TABLA DE AUDITORIA:

	--PRUEBA DE INSERCION
SELECT * FROM Alumnos
SELECT * FROM AuditoriaAlumno

INSERT INTO alumnos (legajo, dnialumno, nomyape, anoisncr, direccion, telefono, correo, edad, sexo, codcarrera, codprovincia, codpais) values (54076, 41807904, 'Martinez Sofia', 2019, 'asdfghjkloiuytre', 3794071911, 'martinezsofia@gmail.com', 23, 'F',1 , 1, 1);

SELECT * FROM Alumnos
SELECT * FROM AuditoriaAlumno

	--PRUEBA DE ELIMINACION:
SELECT * FROM Alumnos
SELECT * FROM AuditoriaAlumno

DELETE FROM Alumnos WHERE legajo = 54076

SELECT * FROM Alumnos
SELECT * FROM AuditoriaAlumno

	--PRUEBA DE ACTUALIZACION (PRIMERO INSERTAREMOS UN NUEVO ALUMNO PARA REALIZAR LA PRUEBA):
SELECT * FROM Alumnos
SELECT * FROM AuditoriaAlumno

INSERT INTO alumnos (legajo, dnialumno, nomyape, anoisncr, direccion, telefono, correo, edad, sexo, codcarrera, codprovincia, codpais) values (54076, 41807904, 'Martinez Sofia', 2019, 'asdfghjkloiuytre', 3794071911, 'martinezsofia@gmail.com', 23, 'F',1 , 1, 1);
UPDATE Alumnos SET codcarrera = 2 WHERE nomyape = 'Martinez Sofia'

SELECT * FROM Alumnos
SELECT * FROM AuditoriaAlumno
