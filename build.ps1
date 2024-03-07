function main() {
    # build application
    MSBuild.exe ".\ReservedCpuSets\ReservedCpuSets.sln" -p:Configuration=Release -p:Platform=x64
    # build DLL
    MSBuild.exe ".\ReservedCpuSetsDLL\ReservedCpuSets.sln" -p:Configuration=Release -p:Platform=x64

    if (Test-Path ".\build\") {
        Remove-Item -Path ".\build\" -Recurse -Force
    }

    # create folder structure
    New-Item -ItemType Directory -Path ".\build\ReservedCpuSets\"

    # create final package
    Copy-Item ".\ReservedCpuSets\ReservedCpuSets\bin\x64\Release\ReservedCpuSets.exe" ".\build\ReservedCpuSets\"
    Copy-Item ".\ReservedCpuSetsDLL\x64\Release\ReservedCpuSets.dll" ".\build\ReservedCpuSets\"

    return 0
}

$_exitCode = main
Write-Host # new line
exit $_exitCode
