[int[]]$array = @()
Get-Content input.txt | % {
    $array +=, $_
}

foreach ($i in $array){
    foreach ($j in $array){
        foreach ($k in $array){
            if (($i + $j + $k) -eq 2020)
            {
                $i * $j * $k
            }
        }
    }
}
