USE TalleresYCursosWeb;
go

BEGIN
	BEGIN TRY
		BEGIN TRAN

		INSERT INTO Alumnos (legajo, dnialumno, nomyape, anoisncr, direccion, telefono, correo, edad, sexo, codcarrera, codprovincia, codpais) values (53748, 42847912, 'franco nicolas', 2020, 'calle 1234', '3794271946', 'nicolas@gmail.com', 23, 'M', 4, 8, 6);

		INSERT INTO pais (codpais,descripcion) values (8,'Paraguay');
		--INSERT INTO pais (codpais,descripcion) values (9,'Bolivia');
		--INSERT INTO pais (codpais,descripcion) values (10,'Brasil');
		--INSERT INTO pais (codpais,descripcion) values (11,'Chile');

		INSERT INTO provincia (codpais,codprovincia, descripcion) values (7,9, 'Asuncion');
		--INSERT INTO provincia (codpais,codprovincia, descripcion) values (8,10, 'La Paz');
		--INSERT INTO provincia (codpais,codprovincia, descripcion) values (9,11, 'Sao Pablo');
		--INSERT INTO provincia (codpais,codprovincia, descripcion) values (11,13, 'Santiago');
	

		UPDATE Alumnos SET alumnos.nomyape = 'Gomez Pedro'
		WHERE legajo = 56182

		--UPDATE Alumnos SET alumnos.nomyape = 'Medina Oscar'
		--WHERE legajo = 56182

		UPDATE cursosTalleres SET cursosTalleres.horarios = 'de 7 a 10'
		WHERE codCurso = 4
		
		--UPDATE cursosTalleres SET cursosTalleres.actividades = 'curso basico sobre Python'
		--WHERE codCurso = 4


		--insercion

		INSERT INTO Inscripciones (legajo, codcurso) values (53748, 4);

		COMMIT TRAN
	END TRY
	BEGIN CATCH
		SELECT   
			ERROR_NUMBER() AS NumeroError,
			ERROR_MESSAGE() AS MensajeError;  
  
		IF @@TRANCOUNT > 0  
			ROLLBACK TRAN
	END CATCH
END