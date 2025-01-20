USE DB_NAME;  
GO  

-- Trunca el log cambiando el recovery mode de la DB a SIMPLE.  
ALTER DATABASE DB_NAME
SET RECOVERY SIMPLE;  
GO
  
-- Shrink el log de la DB a 1 MB.  
DBCC SHRINKFILE (DB_Log_Name, 1);
-- Para conocer el 'DB_Log_Name' ==> SELECT * FROM sys.database_files dentro de la DB
GO  
  
-- Volvemos a parametrizar el recovery mode a FULL  
ALTER DATABASE DB_NAME  
SET RECOVERY FULL;  
GO
