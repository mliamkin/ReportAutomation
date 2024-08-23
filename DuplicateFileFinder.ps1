$Path = "SETPATH"

Write-Host "`nDisplaying duplicate files found on your system... `n" -ForegroundColor Yellow

$Duplicates = Get-ChildItem $Path -Recurse | Get-FileHash | Group-Object -Property Hash | Where-Object { $_.Count -gt 1 }
if ($Duplicates) {
    $Duplicates | Select-Object -ExpandProperty Group | Select-Object -ExpandProperty Path | ForEach-Object {
        Write-Host "   +++| " -ForegroundColor DarkRed -NoNewline
        Write-Host $_
    }
    $RemoveAnswer = Read-Host "`nRemove all of the duplicates (Y/N)"

    if ($RemoveAnswer -eq "Y") {
        Write-Host "`nRemoving duplicates..." -ForegroundColor Magenta
        Get-ChildItem $Path -Recurse | Get-FileHash | Group-Object -Property Hash | Where-Object { $_.Count -gt 1 } | foreach {
    
            $group = $_.Group | Select-Object -ExpandProperty Path
        
            $group | Select-Object -Skip 1 | Remove-Item -Force
        
        }
        Write-Host "`nSuccessfully remove duplicates!`n" -ForegroundColor Green
    }
    else {
        Write-Host "`nNot removing any duplicates`n" -ForegroundColor Magenta
    }
}
else {
    Write-Host "No duplicates found on your system`n" -ForegroundColor Green
}