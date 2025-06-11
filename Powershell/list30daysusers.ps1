Get-ADUser -Filter * -Properties LastLogonDate, LockedOut, PasswordNeverExpires, CannotChangePassword, PasswordLastSet | Where {$_.LastLogonDate -and $_.LastLogonDate -le (Get-Date).AddDays(-30) -and $_.Enabled -eq $true } | ft SAMAccountName, LastLogonDate, PasswordNeverExpires, CannotChangePassword -Autosize | Out-String

#este script realiza lo siguiente:
#inicialmente obtiene de todos los usuarios dentro de nuestro AD, LastLogonDate, LockedOut, PasswordNeverExpires, CannotChangePassword, y PasswordLastSet
#luego filtra: que el LastLogonDate no sea nulo, que el mismo sea anterior a 30 dias desde la fecha de hoy y por ultimo que el usuario este habilitado
#por ultimo formatea la salida para mostrar solo las propiedades específicas (SAMAccountName, LastLogonDate, PasswordNeverExpires, CannotChangePassword) en un formato de tabla
