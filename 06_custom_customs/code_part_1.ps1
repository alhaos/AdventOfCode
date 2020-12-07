param(
    $inputFileName = "D:\repository\AdventOfCode\day6\input.txt" 
)

return ((Get-Content $inputFileName -Raw) -split "`r`n`r`n" | ForEach-Object {
    (([regex]"\w").Matches($_).Value | Select-Object -Unique).Count
} | Measure-Object -Sum).Sum