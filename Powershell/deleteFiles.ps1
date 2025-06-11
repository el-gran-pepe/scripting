# Ruta de la carpeta
$carpetaRaiz = "Ruta"

# Obtenemos la fecha actual
$fechaActual = Get-Date

# Definir la antigüedad en días
$antiguedad = 30

# Obtiene archivos en todas las subcarpetas que superen la antigüedad
$archivosAntiguos = Get-ChildItem -Path $carpetaRaiz -Recurse | Where-Object { $_.LastWriteTime -lt ($fechaActual.AddDays(-$antiguedad)) }

# Eliminar archivos antiguos
foreach ($archivo in $archivosAntiguos) {
    Write-Host "Eliminando archivo: $($archivo.FullName)"
    Remove-Item $archivo.FullName -Force
}

Write-Host "Limpieza completada."
