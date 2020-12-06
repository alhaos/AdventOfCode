param(
    $inputFileName = "D:\repository\AdventOfCode\day2\input.txt"
)
$i = 0
Get-Content $inputFileName | ForEach-Object {
    $row = $_ -split ' '
    $firstIndex = [int]($row -split '-')[0]
    $secondIndex = [int]($row -split '-')[1]
    $letter = $row[1].TrimEnd(":")
    $letersArray = $row[2]
    #write-host $letersArray, $letter, $firstIndex, $letersArray[$firstIndex-1] $secondIndex, $letersArray[$secondIndex-1]
    if ($letersArray[$firstIndex-1] -eq $letter -xor $letersArray[$secondIndex-1] -eq $letter)
    {
        $i++
    }
    
}
$i