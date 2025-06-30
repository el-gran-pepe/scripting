REM se debera modificar el argumento "Set-Edition" por la edicion correspondiente al caso asi como el "ProductKey"
  
DISM /online /Set-Edition:ServerStandard /ProductKey:XXXXX-XXXXX-XXXXX-XXXXX-XXXXX /AcceptEula

REM si la version ya estaria en "ServerStandard", tendriamos que ejecutar lo siguiente

slmgr /ipk <ProductKey>

REM como podemos ver en que version estamos?

DISM /Online /Get-CurrentEdition

REM o tambien

slmgr.vbs /xpr
