use TalleresYCursosWeb;

--Creamos una vista de cursos con los datos mas importantes de los cursos/talleres
create view Cursos_view with encryption as 
	select nombre as 'Curso/Taller', actividades, dias as 'Cantidad de Dias' , cantHoras as 'Horas Totales' , horarios from cursosTalleres

select * from Cursos_view

--creamos una vista de todos los alumnos inscriptos a talleres, mostrando todos sus datos
create view inscriptos_view with encryption as
	select ins.codinscripcion as 'Nº Inscripcion', 
		   al.legajo as 'Nº Legajo',
		   al.nomyape as 'Nombre Alumno',
		   al.edad as 'Edad',
		   prov.descripcion as 'Provincia',
		   pa.descripcion as 'país',
		   cur.nombre as 'Curso',
		   ins.fechainscrp as 'Fecha Inscripcion'
	from inscripciones ins join alumnos al on ins.legajo=al.legajo
	join provincia prov on al.codprovincia=prov.codprovincia and al.codpais=prov.codpais
	join pais pa on pa.codpais=prov.codpais
	join cursosTalleres cur on ins.codcurso = cur.codcurso

--creamos una vista que muestra la cantidad de inscriptos por curso
create view cantInscrp_view with encryption as 
	select cur.nombre, count(cur.nombre) as cantidadCursos 
	from inscripciones ins 
	join cursosTalleres cur on ins.codCurso=cur.codCurso group by cur.nombre
--creamos vista que muestra todos los alumnos
create view alumnos_view with encryption as 
	select al.nomyape as 'Nombre',
			al.legajo as 'Nº Legajo',
			al.dnialumno as 'DNI',
			al.direccion as 'direccion',
			al.telefono as 'Nº Telefono',
			al.correo as 'email',
			al.sexo as 'sexo',
			car.nombre as 'carrera',
			prov.descripcion as 'Provincia',
			pa.descripcion as 'pais'
	from alumnos al 
	join carreras car on al.codcarrera=car.codcarrera
	join provincia prov on al.codprovincia=prov.codprovincia and al.codpais=prov.codpais
	join pais pa on prov.codpais=pa.codpais



select * from cantInscrp_view
select * from inscriptos_view
select * from Cursos_view
select * from alumnos_view