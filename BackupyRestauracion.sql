use TalleresyCursosWeb
select * FROM Alumnos
go
-- Backup Completo 
Backup database TalleresyCursosWeb
to disk = 'D:\Data\BackupSTYC.bak'
with name='BackupCompleto', init

-- Informaci�n de los Backups dentro del archivo .bak
Restore headeronly
from disk='D:\Data\BackupSTYC.bak'
use master 
drop database TalleresyCursosWeb

------Restore de backup completo y de los del log

Restore database TalleresyCursosWeb from disk = 'D:\Data\BackupSTYC.bak'
with file=1, recovery
use TalleresyCursosWeb
select * FROM Alumnos
