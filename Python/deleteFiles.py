import os
import datetime

ubicacion = "ruta/destino"

# especificamos la antiguedad de los archivos
periodo_antiguedad = datetime.timedelta(days=15)

fecha_actual = datetime.datetime.now()

for archivo in os.listdir(ubicacion):
    ruta_archivo = os.path.join(ubicacion, archivo)
    if os.path.isfile(ruta_archivo):
        fecha_creacion = datetime.datetime.fromtimestamp(
            os.path.getctime(ruta_archivo))
        if fecha_actual - fecha_creacion > periodo_antiguedad:
            os.remove(ruta_archivo)
            print(f"Archivo {archivo} eliminado.")
