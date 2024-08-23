$StudentName = "Kayla Bain"
$University = "University of Florida"
$TitlePage = Read-Host -Prompt "Need a title page (Y/N)"
$Title = Read-Host -Prompt "Input title of your report"
$ProfessorName = Read-Host -Prompt "Professor last name"
$ClassName = Read-Host -Prompt "Class name"
$DueDate = Read-Host -Prompt "Due date (MM/DD/YYYY)"

if ($TitlePage -eq "Y") {
    $Department = Read-Host "University department name"
    Write-Host "Generating Paper with Title Page..." -ForegroundColor DarkYellow
}
elseif ($TitlePage -eq "N") {
    Write-Host "Generating Paper..." -ForegroundColor DarkYellow
}
else {
    Write-Host "Invalid answer"
}
