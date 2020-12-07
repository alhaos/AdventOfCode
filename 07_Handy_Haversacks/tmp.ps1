param(
    $inputFileName = "D:\repository\AdventOfCode\07_Handy_Haversacks\input.txt" 
)

$bagsContent = Get-Content $inputFileName | ForEach-Object {
    $row = $_ -split " bags contain "
    @{bagColor = $row[0];
    bagContent = $row[1] -Split (", ") | ForEach-Object {
            If ((([regex]"(\d+)\s(.*)bags?\.?").Match($_)).Success){
                $count, $color = ([regex]"(\d+)\s(.*)\sbags?\.?").Matches($_).Groups[1,2].Value
                @{
                    count = $count
                    color = $color
                }
            }
        }
    }
}

function Get-Аttachment{
    param(
        [String]$color
    )
    $foundBags = @()
    ForEach($bag in $bagsContent) {
        $bag.bagContent | ForEach-Object {
            if ($_.Color = $color){
                $foundBags +=, $bag.bagColor
            }
        }
    }
    $foundBags | Select-Object -Unique
}

Пet-Аttachment "shiny gold"