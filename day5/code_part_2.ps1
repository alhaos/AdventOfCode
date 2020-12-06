param(
    $inputFileName = "D:\repository\AdventOfCode\day5\input.txt" 
)

function Get-SeatNumberByTrace{
    param(
        [string]$trace 
    )
    
    $rows = 0..127
    $columns = 0..7
    
    0..6 | ForEach-Object {
        if ($trace[$_] -eq "F")
        {
            $rows = $rows[0..((128 / [math]::pow(2, $_+1))- 1)]
        }
        Else{
            $rows = $rows[(128 / [math]::pow(2, $_ + 1))..($rows.Count-1)]
        }
    }    
    
    7..9 | ForEach-Object {
        if ($trace[$_] -eq "L")
        {
            $columns = $columns[0..((8 / [math]::pow(2, $_ - 6)) - 1)]
        }
        Else{
            $columns = $columns[(8 / [math]::pow(2, $_ -6))..($columns.Count - 1)]
        }
    }    
    
    return $rows[0] * 8 + $columns[0]
}
    
    Get-Content $inputFileName | ForEach-Object {
        Get-SeatNumberByTrace $_
    } | Sort-Object | ForEach-Object {
        if ($_ -ne $aa + 1) {$_}
        $aa = $_ 
    }


    