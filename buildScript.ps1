﻿Write-Output "Removing old builds"
Remove-Item -Recurse .\build\libs\*

Write-Output "Building..."
.\gradlew build

echo "Updating mcmod.info"
$name = Get-ChildItem -Name .\build\libs
Write-Output "File name: " $name

Move-Item .\build\libs\$name .\build\libs\coherence.zip
.\7z\7za.exe d .\build\libs\coherence.zip mcmod.info
.\7z\7za.exe a .\build\libs\coherence.zip mcmod.info
Move-Item .\build\libs\coherence.zip .\build\libs\$name