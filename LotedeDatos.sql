/*--------------------------- LOTE DE DATOS ---------------------------------------*/

USE TalleresYCursosWeb;

insert into pais(codpais,descripcion) values (1,'Argentina');
insert into pais(codpais,descripcion) values (2,'Japan');
insert into pais(codpais,descripcion) values (3,'Brazil');
insert into pais(codpais,descripcion) values (4,'China');
insert into pais(codpais,descripcion) values (5,'Canada');
insert into pais(codpais,descripcion) values (6,'Uruguay');

insert into provincia (codpais,codprovincia, descripcion) values (1,1, 'Corrientes');
insert into provincia (codpais,codprovincia, descripcion) values (1,2, 'Buenos Aires');
insert into provincia (codpais,codprovincia, descripcion) values (1,3, 'Santa Fe');
insert into provincia (codpais,codprovincia, descripcion) values (2,4, 'Tokio');
insert into Provincia (codpais,codprovincia, descripcion) values (3,5, 'Rio de Janeiro');
insert into Provincia (codpais,codprovincia, descripcion) values (4,6, 'Honk Kong');
insert into Provincia (codpais,codprovincia, descripcion) values (5,7, 'Ottawa');
insert into provincia (codpais,codprovincia, descripcion) values (6,8, 'Montevideo');

insert into carreras(nombre) values ('Licenciatura en Sistemas');
insert into carreras(nombre) values ('Ingeneria en Sistemas');
insert into carreras(nombre) values ('Odontologia');
insert into carreras(nombre) values ('Kinesiologia');
insert into carreras(nombre) values ('Abogacia');
insert into carreras(nombre) values ('Medicina');

insert into Alumnos(legajo,dnialumno,nomyape,anoisncr,direccion,telefono,correo,edad,sexo,codcarrera,codprovincia,codpais) values (54020,40420585,'Ariel Maidana',2018,'Playa Miramar 2678','3794796495','maidana52@gmail.com',25,'M',1,1,1);
insert into Alumnos(legajo,dnialumno,nomyape,anoisncr,direccion,telefono,correo,edad,sexo,codcarrera,codprovincia,codpais) values (54030,40420575,'Sofia Martinez',2018,'Playa Miramar 199','3794796595','martinez@gmail.com',25,'F',1,2,1);
insert into Alumnos(legajo,dnialumno,nomyape,anoisncr,direccion,telefono,correo,edad,sexo,codcarrera,codprovincia,codpais) values (54040,40420595,'Santiago Luna',2018,'Belgrano 963','3794797495','luna52@gmail.com',25,'M',2,3,1);
insert into Alumnos(legajo,dnialumno,nomyape,anoisncr,direccion,telefono,correo,edad,sexo,codcarrera,codprovincia,codpais) values (54060,40420655,'Franco Medrano',2018,'San Juan 44','3794799495','franco52@gmail.com',25,'M',2,4,2);
insert into Alumnos(legajo,dnialumno,nomyape,anoisncr,direccion,telefono,correo,edad,sexo,codcarrera,codprovincia,codpais) values (54080,40420125,'Jaqueline Ojeda',2018,'Colombia 2678','3794296495','ojeda52@gmail.com',25,'F',3,5,3);
 
insert into cursosTalleres(nombre,actividades,cantHoras,dias,horarios) values ('Impresion 3D','Aprender a imprimir en 3D',16,8,'de 16 a 18');
insert into cursosTalleres(nombre,actividades,cantHoras,dias,horarios) values ('Mantenimiento de computadora','Aprender a realizar mantenimiento de las computadoras',15,8,'de 14 a 16');
insert into cursosTalleres(nombre,actividades,cantHoras,dias,horarios) values ('Introduccion a robotica','Conceptos basicos de la programacion',20,8,'de 20 a 22');
insert into cursosTalleres(nombre,actividades,cantHoras,dias,horarios) values ('Phyton','Aprender a programar en phyton',20,8,'de 8 a 10');
insert into cursosTalleres(nombre,actividades,cantHoras,dias,horarios) values ('Diseño 3D','Aprender a diseñar en 3D',16,8,'17 a 19');

insert into Inscripciones(legajo,codcurso,fechainscrp) values (54020,1,'2019/5/4');
insert into Inscripciones(legajo,codcurso,fechainscrp) values (54030,2,'2019/5/4');
insert into Inscripciones(legajo,codcurso,fechainscrp) values (54020,3,'2019/5/4');
insert into Inscripciones(legajo,codcurso,fechainscrp) values (54040,3,'2019/5/4');
insert into Inscripciones(legajo,codcurso,fechainscrp) values (54060,4,'2019/5/4');


SELECT * FROM pais
SELECT * FROM carreras
SELECT * FROM cursosTalleres
SELECT * FROM Inscripciones
SELECT * FROM Alumnos
SELECT * FROM Provincia
