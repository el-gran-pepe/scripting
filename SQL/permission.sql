#otorgar permisos para visualizar SP
USE 'Database'
GRANT VIEW DEFINITION TO [User]

#otorgar permisos de SQLAgent para ver los Jobs
USE msdb;
EXEC sp_addrolemember 'SQLAgentReaderRole', 'Usuario'
#roles: SQLAgentUserRole (solo ve los jobs que genero el propio usuario)| SQLAgentReaderRole (ve todos los ) | SQLAgentOperatorRole
