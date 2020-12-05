param(
    $inputFileName = "D:\repository\AdventOfCode\day4\input.txt"
)
(Get-Content $inputFileName -Raw) -split "`r`n`r`n" | % {
    $_ -match "byr:" -and 
    $_ -match "iyr:" -and
    $_ -match "eyr:" -and
    $_ -match "hgt:" -and
    $_ -match "hcl:" -and
    $_ -match "ecl:" -and
    $_ -match "pid:"
} | Measure-Object -Sum



