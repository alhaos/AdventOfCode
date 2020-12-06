param(
    $inputFileName = "D:\repository\AdventOfCode\day1\input.txt"
)
[int[]]$array = @()
$results = @()

Get-Content $inputFileName | ForEach-Object {
    $array +=, $_
}

foreach ($i in $array){
    foreach ($j in $array){
        foreach ($k in $array){
            if (($i + $j + $k) -eq 2020)
            {
                $results +=, ($i * $j * $k)
            }
        }
    }
}

return ($results | Select-Object -Unique)