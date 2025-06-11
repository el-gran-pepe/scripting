Import-Module ActiveDirectory

# Obtenemos todos los grupos de seguridad cuyos nombres comiencen con lo que se guarde en $grupoNombreInicio, si quisiera que solo lo contenga agregar '*' al comienzo
$grupoLike = "<Nombre o parte>*"
$grupos = Get-ADGroup -Filter { Name -like $grupoLike } -Properties Members

# Mostrar la información de el o los grupos
foreach ($grupo in $grupos) {
    Write-Host "Nombre del Grupo: $($grupo.Name)"
    Write-Host "Miembros del Grupo:"
    
    # Obtenemos y mostramos los miembros del grupo
    $miembros = Get-ADGroupMember -Identity $grupo.DistinguishedName
    foreach ($miembro in $miembros) {
        Write-Host "  - $($miembro.Name) ($($miembro.SamAccountName))"
    }
    
    Write-Host "-----------------------------------------------------------"
}
