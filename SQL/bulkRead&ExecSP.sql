--Este script permite dar permiso de View Definition y Execute SP a muchos usuarios en una misma DB

USE [NombreDeLaBaseDeDatos];

-- Lista de usuarios a quien otorgamos permisos
DECLARE @Usuarios TABLE (Nombre NVARCHAR(100));
INSERT INTO @Usuarios (Nombre)
VALUES
    ('Usuario1'),
    ('Usuario2'),
    ('Usuario3'),
    ('Usuario4');

-- Otorgar permisos a cada usuario
DECLARE @Usuario NVARCHAR(100);
DECLARE @SQL NVARCHAR(MAX);

-- Conceder VIEW DEFINITION y EXECUTE
DECLARE CursorUsuarios CURSOR FOR
SELECT Nombre FROM @Usuarios;

OPEN CursorUsuarios;
FETCH NEXT FROM CursorUsuarios INTO @Usuario;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @SQL = 'GRANT VIEW DEFINITION ON DATABASE::[NombreDeLaBaseDeDatos] TO [' + @Usuario + '];';
    EXEC sp_executesql @SQL;

    SET @SQL = 'GRANT EXECUTE ON SCHEMA::[dbo] TO [' + @Usuario + '];';
    EXEC sp_executesql @SQL;

    FETCH NEXT FROM CursorUsuarios INTO @Usuario;
END;

CLOSE CursorUsuarios;
DEALLOCATE CursorUsuarios;
