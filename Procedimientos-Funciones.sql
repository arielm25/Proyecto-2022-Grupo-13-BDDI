use TalleresyCursosWeb
go
---Creamos un procedimiento almacenado para INSERTAR datos en la tabla Alumnos

create procedure insertar_alumno
	@legajo INT,
	@dnialumno INT ,
	@nomyape  VARCHAR(100) ,
	@anoisncr int ,
	@direccion VARCHAR(250),
	@telefono BIGINT ,
	@correo  VARCHAR(250) ,
	@edad INT ,
	@sexo varchar(1) ,
	@codcarrera INT ,
	@codprovincia  INT ,
	@codpais INT 
as 

IF EXISTS(Select legajo From Alumnos WHERE legajo = @legajo)
RAISERROR('YA EXISTE UN ALUMNO CON ESE LEGAJO , POR FAVOR INGRESE OTRO', 16,1)
else if EXISTS(Select dnialumno From Alumnos WHERE dnialumno = @dnialumno)
RAISERROR('YA EXISTE UN ALUMNO CON ESE DNI, POR FAVOR INGRESE DE NUEVO', 16,1)
else

insert into Alumnos VALUES (@legajo,@dnialumno,@nomyape,@anoisncr,@direccion,@telefono,@correo,@edad,@sexo,@codcarrera,@codprovincia,@codpais)

select * from Alumnos


--Insertamos a travez del procedimiento insertar alumno un registro con legajo repetido.

exec insertar_alumno 54020, 40420585, 'Ariel Maidana', 2018, 'Playa Miramar 2678', 3794796495, 'maidana52@gmail.com', 25, 'M', 1, 1, 1

--Insertamos a travez del procedimiento insertar alumno un registro CORRECTO.

exec insertar_alumno 54021, 40421583, 'Lautaro Cabral', 2018, 'San Lorenzo 2678', 3794798695, 'cabral52@gmail.com', 25, 'M', 3, 2, 1

select * from Alumnos

---Creamos un procedimiento almacenado para MODIFICAR datos de un alumno especifico en la tabla Alumno.
go
create proc modificar_alumno
	@legajo INT,
	@dnialumno INT ,
	@nomyape  VARCHAR(100) ,
	@anoisncr int ,
	@direccion VARCHAR(250),
	@telefono BIGINT ,
	@correo  VARCHAR(250) ,
	@edad INT ,
	@sexo VARCHAR(1),
	@codcarrera INT ,
	@codprovincia  INT ,
	@codpais INT 
as 
update Alumnos set legajo=@legajo,dnialumno=@dnialumno,nomyape=@nomyape,anoisncr=@anoisncr,direccion=@direccion,telefono=@telefono,correo=@correo,edad=@edad,sexo=@sexo,codcarrera=@codcarrera,codprovincia=@codprovincia,codpais=@codpais
where legajo = @legajo

---Modificamos los datos de un alumno.
select * from Alumnos

exec modificar_alumno  54020, 40421583, 'Ariel Maidana', 2017, 'San Juan 2678', 37947987895, 'cabral1478@gmail.com', 25, 'M', 1, 8, 6

select * from Alumnos

go

---Creamos un procedimiento almacenado para BUSCAR datos de un alumno especifico en la tabla Alumno

create proc buscar_alumno
@numeros int
as 
select legajo as Legajo, dnialumno as DNI,nomyape as NombreApellido,anoisncr as AñoInscripcion,direccion as Direccion,telefono as Telefono,correo as Correo,edad as Edad,sexo as Sexo,codcarrera as CodigoCarrera,codprovincia as CodigoProvincia,codpais as CodigoPais
from Alumnos
WHERE  legajo   LIKE @numeros

---Realizamos una busqueda de un registro mediante su legajo.
exec buscar_alumno 54020

go
---Creamos una funcion que recibe por parametro un codigo de carrera y retorna la cantidad de alumnos registrados de dicho carrera
create function cantidadDeAlumnosPorCarrera (@codcarrera as int)
returns int
as
begin

declare @cantAlumnos int

select @cantAlumnos = COUNT(*) FROM Alumnos WHERE codcarrera= @codcarrera

return @cantAlumnos
end

go

select nombre as Carrera , dbo.cantidadDeAlumnosPorCarrera(1)  as Cantidad from Carreras where codcarrera = 1

select * from Alumnos where codcarrera = 1


go
---Creamos una funcion que recibe por parametro un codigo de pais y retorna la cantidad de alumnos registrados de dicho pais
 
create function cantidadDeAlumnosPorPais (@codpais int) returns int
as
begin

declare @cantAlumnos int

select @cantAlumnos = COUNT(*) FROM Alumnos WHERE codpais= @codpais

return @cantAlumnos
end

go

select descripcion as Pais , dbo.cantidadDeAlumnosPorPais(1)  as Cantidad from Pais where codpais = 1

select * from Alumnos where codpais = 1




