param(
    $inputFileName = "D:\repository\AdventOfCode\07_Handy_Haversacks\input.txt" 
)
$parents = @()
Get-Content $inputFileName | ForEach-Object {
    $row = $_ -split " bags contain "
    
    $row[1] -Split (", ") | ForEach-Object {
        If ((([regex]"(\d+)\s(.*)bags?\.?").Match($_)).Success) {
            $count, $color = ([regex]"(\d+)\s(.*)\sbags?\.?").Matches($_).Groups[1, 2].Value
            $parents +=, @($row[0], $color)
        }
    }
}

$global:counter = 0
$global:ttt = @()
function get-tree {
    param(
        [string[]]$colors
    )
    $foundParents = @()
    foreach ($color in $colors) {
        $parents | ForEach-Object {
            if ($_[1] -eq $color)
            {
                $foundParents +=, $_[0]
                $global:ttt +=, $_[0]

                $global:counter++
            }
        }
    }
    if ($foundParents.Count -ne 0){
        get-tree $foundParents
    }
}
get-tree "shiny gold" 

($global:ttt | Select-Object -Unique).Count