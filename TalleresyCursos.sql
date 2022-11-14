create database TalleresYCursosWeb
go
use TalleresYCursosWeb
create table pais (
					codpais int primary key not null,
					descripcion varchar(50) not null)
			go

create table provincia (
						codprovincia int not null,
						codpais int not null,
						descripcion varchar(50) not null,
						constraint PK_provincia primary key (codprovincia, codpais),
						constraint FK_provincia_pais foreign key (codpais) references pais(codpais))
			go

create table carreras (
						codcarrera int identity(1,1) primary key not null,
						nombre varchar(250) not null)
			go

create table cursosTalleres (
								codCurso int primary key identity(1,1) not null,
								nombre varchar(250) not null,
								actividades varchar(250) not null,
								cantHoras int,
								dias int,
								horarios varchar(250))
			go

create table alumnos (
						legajo int primary key not null,
						dnialumno int not null,
						nomyape varchar(100) not null,
						anoisncr int not null,
						direccion varchar(250) not null,
						telefono bigint not null,
						correo varchar(250) not null,
						edad int not null,
						sexo varchar(1) not null,
						codcarrera int not null,
						codprovincia int not null,
						codpais int not null,
						constraint CK_sexo check (sexo in ('F', 'M')),
						constraint FK_alumno_pcia foreign key (codprovincia, codpais) references provincia(codprovincia, codpais),
						constraint FK_alumno_carrera foreign key (codcarrera) references carreras(codcarrera))
			go

create table inscripciones (
							codinscripcion int identity primary key not null,
							legajo int not null,
							codcurso int not null,
							constraint FK_inscripcion_alumno foreign key (legajo) references alumnos(legajo),
							constraint FK_inscripcion_curso foreign key (codcurso) references cursosTalleres(codcurso))
			go

alter table inscripciones add fechainscrp datetime not null

ALTER TABLE provincia
ADD CONSTRAINT unique_provincia UNIQUE(codprovincia);

alter table pais 
add constraint unique_pais Unique(codpais);

alter table alumnos 
add constraint unique_alumnos unique(dnialumno, telefono, correo)