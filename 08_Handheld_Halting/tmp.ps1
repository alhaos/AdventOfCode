param(
    $inputFileName = "D:\repository\AdventOfCode\07_Handy_Haversacks\input.txt" 
) Get-Content $inputFileName

$inputFileName | ForEach-Object{

    [regex]"[\w\s]"
}
