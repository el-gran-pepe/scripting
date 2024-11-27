# Eliminar objetos eliminados del AD opcion 1
Get-ADObject -Filter 'isDeleted -eq $True -and Name -like "*<objectName>*"' -IncludeDeletedObjects

# Eliminar objetos eliminados del AD opcion 2
Get-ADObject -Filter 'isDeleted -eq $True -and Name -like "*<objectName>*"' -IncludeDeletedObjects | Remove-ADObject

