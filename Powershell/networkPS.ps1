# Obtenemos info sobre aquellas interfaces que tengan direcciones IPv4
Get-NetIPAddress -AddressFamily IPv4

# Si necesitamos mas info sobre una interfaz especifica
Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "AliasInterface"

# Obtenemos las direcciones de los DNS Servers configurados en una interfaz especifica
Get-DnsClientServerAddress -InterfaceAlias "AliasInterface" -AddressFamily IPv4

# Obtenemos las direcciones de los DNS Servers configurados en todas las interfaces
Get-DnsClientServerAddress -AddressFamily IPv4

# Configuramos los servidores DNS para una interfaz especifica
Set-DnsClientServerAddress -InterfaceAlias "AliasInterface" -ServerAddresses ("8.8.8.8", "8.8.4.4")
