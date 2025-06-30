#comandos nmap mas utilizados por mi

#para poder ver los puertos que estan abiertos
nmap -p <rango_puerto> <endpoint_IP>
#ej. nmap -p 0-1000 192.17.0.81
#revisara entre el rango 0-1000 en el host 192.17.0.81 cuales estan abiertos

#para poder ver que servicio existe, en que puerto funciona y su version
nmap -sV <endpoint_IP>

#identificar SO
nmap -O <endpoint_IP>

#escaneo mas agresivo, podriamos ver mas detalles de puertos y servicios, asi como datos del SO, podriamos utilizarlo para detectar 
#vulnerabildades
nmap -A <endpoint_IP>

#escaneo de puertos UDP
nmap -sU -p <rango_puerto> <endpoint_IP>

#escaneo de puertos TCP
nmap -sT <endpoint_IP>

#si quisieramos probar la deteccion de escaneo podriamos ajustar el "Timing Template", que va desde el 0-5 siendo 0 ultra lento y sigiloso
#mientras que 5 es lo mas rapido y detectable
nmap -T<0-5> <endpoint_IP>
#ej. si quisieramos realizar un escaneo sin ser detectado, nmap -T0 192.17.0.81, si no habria problemas de ser detectado
#nmap -T5 192.17.0.81

#escanea todos los puertos
nmap -p- <endpoint_IP>

#podemos extender la utilidad de nmap ejecutando scripts que la misma herramienta trae consigo
#estos scripts estan en /usr/share/nmap/scripts
nmap --script <nombre_script> <endpointIP>
#podemos encontrar scripts para diferentes tareas, ej., Detectar vulnerabilidades, enumerar servicios o usuarios, verificar configuraciones
#inseguras, realizar fuerza bruta u obtener informacion extra sobre servicios
#ej. ~# nmap --script smb-os-discovery 192.17.0.81
#esto anterior ejecutara un script que intentara descubrir el SO y nombre del host a traves del servicio SMB
#Nmap organiza los scripts en categorías
#default      Se ejecutan con -sC
#safe	        No afectan al objetivo
#auth	        Autenticación (por ejemplo, SMB, HTTP)
#vuln	        Detección de vulnerabilidades
#brute	      Fuerza bruta de contraseñas
#discovery	  Enumeración de usuarios, hosts, etc.
#exploit	    Intenta explotar vulnerabilidades
#malware	    Detecta posibles infecciones
#dos	        Pruebas de denegación de servicio (¡riesgoso!)
#+ ejemplos:
#            nmap --script vuln 192.17.0.81             #escanea vulnerabilidades comunes
#            nmap --script smb-enum-users 192.17.0.81   #enumera usuarios SMB
#            nmap --script http-brute 192.17.0.81       #fuerza login HTTP basico
#            nmap --script dns-recursion 192.17.0.81    #busca servidores DNS mal configurados
#se pueden combinar scripts, ej., nmap --script "smb*,dns*" 192.17.0.81
#o ejecutar una categoria completa, ej., nmap --script vuln 192.17.0.81

#tambien se pueden escanear puertos especificos y en un solo script
nmap -p <puerto1>,<puerto2>,<puerto3> <endpoint_IP>









