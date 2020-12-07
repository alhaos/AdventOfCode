$puzzleInput = Get-Content D:\library\AdventOfCode\day3\input.txt
$mapWidth = $puzzleInput[0].Length 

function makeGood {
    param(
        $stapsRight,
        $stepBottom
    )
    write-host "strart"
    return (0..($puzzleInput.Count - 1)) | ForEach-Object {
        $column = (($_ * $stapsRight) % $mapWidth) / $stepBottom
        if ($_ % $stepBottom -eq 0) {
            write-host -ForegroundColor DarkGreen $puzzleInput[$_].Substring(0, $column) -NoNewline
            $pointChar = $puzzleInput[$_].Substring($column, 1)
            if ($pointChar -eq "#") {
                write-host -ForegroundColor Red $pointChar -NoNewline
                write-host -ForegroundColor DarkGreen $puzzleInput[$_].Substring($column + 1) -NoNewline
                write-host -ForegroundColor DarkGreen " <--"
                $true
            }
            else {
                write-host -ForegroundColor DarkRed $pointChar -NoNewline
                write-host -ForegroundColor DarkGreen $puzzleInput[$_].Substring($column + 1)
            }               
        }
        else {
            write-host -ForegroundColor DarkGreen $puzzleInput[$_]
        }
    } | Measure-Object -Sum | ForEach-Object { $_.Sum }
}

(makeGood 3 1)