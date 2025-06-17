#este script es utilizado para habilitar la compatilidad en sistemas nuevos, como W10 u 11, la compatibilidad con File Server antiguos 

Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

