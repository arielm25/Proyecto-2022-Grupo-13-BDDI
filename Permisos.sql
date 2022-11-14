use master;
go
use TalleresyCursosWeb;

-----LOGIN-----

CREATE LOGIN Administrador WITH PASSWORD = '1234'

----USER---- ROLES BASE DE DATOS

CREATE USER UserModerador FOR LOGIN Administrador


-----GRANT y REVOKE------
---- LENGUAJE CONTROL DE DATOS DCL----
---Asignando Accesos en particular sobre tabla usuarios----

GRANT Select
ON cursosTalleres
TO  UserModerador
WITH GRANT  OPTION

GRANT Insert
ON cursosTalleres
TO  UserModerador
WITH GRANT  OPTION


GRANT Delete, Update
ON cursosTalleres
TO  UserModerador
WITH GRANT  OPTION

GRANT Select
ON alumnos
TO  UserModerador
WITH GRANT  OPTION

GRANT Insert
ON alumnos
TO  UserModerador
WITH GRANT  OPTION


GRANT Delete, Update
ON alumnos
TO  UserModerador
WITH GRANT  OPTION

----- Quitar privilegios -----
REVOKE Select
ON cursosTalleres
FROM UserModerador
CASCADE

REVOKE Insert
ON cursosTalleres
FROM UserModerador
CASCADE

REVOKE Delete, Update
ON cursosTalleres
FROM UserModerador
CASCADE


---- CLAUSULA DENY, Para denegar accesos-------
DENY SELECT ON cursosTalleres TO UserModerador CASCADE
DENY INSERT ON cursosTalleres TO UserModerador CASCADE
DENY DELETE ON cursosTalleres TO UserModerador CASCADE
DENY UPDATE ON cursosTalleres TO UserModerador CASCADE
DENY ALTER ON cursosTalleres To  UserModerador CASCADE


---- Nuevo login 2-----

CREATE LOGIN Alumno WITH PASSWORD = '4321'

CREATE USER UserAlumno FOR LOGIN Alumno

----- Asignamos un nuevo rol, en este caso de lectura------

alter role db_datareader add member UserAlumno

GRANT Select ON  cantInscrp_view TO  UserAlumno WITH GRANT  OPTION
GRANT Select ON  Cursos_view TO  UserAlumno WITH GRANT  OPTION
GRANT Select ON alumnos_view TO UserAlumno WITH GRANT OPTION
GRANT Select ON  inscriptos_view TO  UserAlumno WITH GRANT  OPTION

DENY SELECT ON alumnos TO UserAlumno CASCADE
DENY INSERT ON alumnos TO UserAlumno CASCADE
DENY DELETE ON alumnos TO UserAlumno CASCADE
DENY UPDATE ON alumnos TO UserAlumno CASCADE
DENY ALTER ON alumnos To  UserAlumno CASCADE
--- Revocar privilegios----
REVOKE Select ON cantInscrp_view FROM UserAlumno CASCADE
REVOKE Select ON inscriptos_view FROM UserAlumno CASCADE
REVOKE Select ON Cursos_view FROM UserAlumno CASCADE
REVoKE Select ON alumnos_view FROM UserAlumno CASCADE

select * from cantInscrp_view
select * from inscriptos_view
select * from Cursos_view
select * from alumnos_view

---- Casos de prueba------
---- Select -----
SELECT * FROM Alumnos
SELECT * FROM Carreras
SELECT * FROM cursosTalleres
SELECT * FROM pais
SELECT * FROM provincia
SELECT * FROM Inscripciones

---INSERT---
insert into Alumnos (legajo, dniAlumno, nomyape, anoisncr, direccion, telefono, correo, edad, sexo, codcarrera, codprovincia, codpais) values (57046, 41807904, 'Martinez Sofia', 2019, 'sgerlack0rq', 3794855547, 'asdjewio@gmail.com', 23, 'F', 3, 1, 1);

select * from alumnos
---DELETE---
delete from Alumnos
where legajo = '57046'