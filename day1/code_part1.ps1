[int[]]$array = @()
Get-Content input.txt | % {
    $array +=, $_
}

foreach ($i in $array){
    foreach ($j in $array){
        if (($i + $j) -eq 2020){
            $i * $j 
        }
    }
}
