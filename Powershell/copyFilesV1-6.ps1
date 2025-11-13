# Este scrip fue creado para copiar archivos y clasificarlos por mes
# Definimos la ruta de origen y destino
$rutaOrigen = "rutaorigen"
$rutaDestino = "rutadestino"

# Diccionario de nombres de meses en español
$mesesEspanol = @{
    1 = "ENERO"
    2 = "FEBRERO"
    3 = "MARZO"
    4 = "ABRIL"
    5 = "MAYO"
    6 = "JUNIO"
    7 = "JULIO"
    8 = "AGOSTO"
    9 = "SEPTIEMBRE"
    10 = "OCTUBRE"
    11 = "NOVIEMBRE"
    12 = "DICIEMBRE"
}

# Función para clasificar por fecha
function Organizar-PorFecha {
    param (
        [string]$origen,
        [string]$destino
    )

    # Obtenemos lista de objetos en la ruta de origen
    $contenidoOrigen = Get-ChildItem -Path $origen

    # Iterar propiedades de cada elemento
    foreach ($item in $contenidoOrigen) {
        $origenItem = Join-Path -Path $origen -ChildPath $item.Name

        # Verifica si es un directorio
        if ($item.Attributes -eq "Directory") {
            # Obtenemos la fecha de creación del directorio
            $fechaCreacion = $item.CreationTime
            # Obtenemos el nombre del mes en español
            $nombreMes = $mesesEspanol.Get_Item($fechaCreacion.Month)
            # Crea la ruta de destino basada en la fecha de creación
            $destinoFecha = Join-Path -Path $destino -ChildPath "$($fechaCreacion.Year)\$nombreMes\$($fechaCreacion.Day)"
            # Crea la carpeta de destino si no existe
            if (-not (Test-Path -Path $destinoFecha)) {
                New-Item -Path $destinoFecha -ItemType Directory -Force | Out-Null
            }
            # Copia el directorio a la carpeta de destino
            Copy-Item -Path $origenItem -Destination $destinoFecha -Recurse -ErrorAction SilentlyContinue
            Write-Output "Directorio '$origenItem' copiado exitosamente a '$destinoFecha'"
            # Verifica si el directorio existe en el destino antes de eliminarlo
            if (Test-Path -Path (Join-Path -Path $destinoFecha -ChildPath $item.Name)) {
                Remove-Item -Path $origenItem -Recurse -Force
                Write-Output "Directorio '$origenItem' eliminado del origen"
            } else {
                Write-Output "Directorio '$origenItem' no encontrado en el destino. No se eliminará del origen"
            }
        }
        # Si es un archivo, copia a la carpeta de destino según su fecha de creación
        elseif ($item.Attributes -eq "Archive") {
            $fechaCreacion = $item.CreationTime
            $nombreMes = $mesesEspanol.Get_Item($fechaCreacion.Month)
            $destinoFecha = Join-Path -Path $destino -ChildPath "$($fechaCreacion.Year)\$nombreMes\$($fechaCreacion.Day)"
            # Crea la carpeta de destino si no existe
            if (-not (Test-Path -Path $destinoFecha)) {
                New-Item -Path $destinoFecha -ItemType Directory -Force | Out-Null
            }
            Copy-Item -Path $origenItem -Destination $destinoFecha -Force
            Write-Output "Archivo '$origenItem' copiado exitosamente a '$destinoFecha'"
            # Verifica si el archivo existe en el destino antes de eliminarlo
            if (Test-Path -Path (Join-Path -Path $destinoFecha -ChildPath $item.Name)) {
                Remove-Item -Path $origenItem -Force
                Write-Output "Archivo '$origenItem' eliminado del origen"
            } else {
                Write-Output "Archivo '$origenItem' no encontrado en el destino. No se eliminará del origen"
            }
        }
    }
}

# Llamamos a la función
Organizar-PorFecha -origen $rutaOrigen -destino $rutaDestino

