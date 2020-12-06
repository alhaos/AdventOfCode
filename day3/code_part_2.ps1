function displayRep {
    param(
        $rigthStepsCount,
        $BottomStepsCount,
        $fileName = "D:\library\AdventOfCode\day3\input.txt "
    )
    Write-Host -ForegroundColor Yellow "Start", $rigthStepsCount, $BottomStepsCount
    $rowList = Get-Content $fileName
    $rowWidth = $rowList[0].Length
    (0..($rowList.Count-1)).ForEach{
        if ($_ % $BottomStepsCount -eq 0){
            $column = (($_*$rigthStepsCount)/$BottomStepsCount % $rowWidth) 
            Write-Host -ForegroundColor DarkGreen $rowList[$_].Substring(0, $column) -NoNewline
            Write-Host -ForegroundColor DarkRed $rowList[$_].Substring($column, 1) -NoNewline
            Write-Host -ForegroundColor DarkGreen $rowList[$_].Substring($column +1) 
            if ($rowList[$_].Substring($column, 1) -eq "#"){$true}
        }
        else {
            Write-Host -ForegroundColor DarkGreen $rowList[$_]
        }
    } | Measure-Object -Sum | ForEach-Object{$_.sum}
}

(displayRep 1 1) * (displayRep 3 1) * (displayRep 5 1) * (displayRep 7 1) * (displayRep 1 2)