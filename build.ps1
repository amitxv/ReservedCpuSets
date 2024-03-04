function main() {
    # build application
    MSBuild.exe .\ReservedCpuSets\ReservedCpuSets.sln -p:Configuration=Release -p:Platform=x64
    # build DLL
    MSBuild.exe .\ReservedCpuSetsDLL\ReservedCpuSets.sln -p:Configuration=Release -p:Platform=x64

    # create folder structure
    mkdir build\ReservedCpuSets
    Move-Item .\ReservedCpuSets\ReservedCpuSets\bin\x64\Release\ReservedCpuSets.exe build\ReservedCpuSets
    Move-Item .\ReservedCpuSetsDLL\x64\Release\ReservedCpuSets.dll build\ReservedCpuSets

    return 0
}

$_exitCode = main
Write-Host # new line
exit $_exitCode
