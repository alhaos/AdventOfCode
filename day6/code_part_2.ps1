param(
    $inputFileName = "D:\repository\AdventOfCode\day6\input.txt" 
)
$i = 0 
$mainCounter = 0
(Get-Content $inputFileName -Raw) -split "`r`n`r`n" | ForEach-Object {
    Write-Host "group: $i"; $i++
    $j = 0
    $groupAnswers = $_ -split "`r`n"
    $groupAnswers | ForEach-Object{
        "  answer $j`:  $_" ; $j++
    }
    (([regex]"\w").Matches($_).Value | Group-Object -NoElement | ForEach-Object {
        if ($_.Count -eq $groupAnswers.Count){
            Write-Host -ForegroundColor DarkGreen -NoNewline ("{0}:{1} " -f $_.name, $_.Count)
            $mainCounter++
        }
        else {
            Write-Host -NoNewline ("{0}:{1} " -f $_.Name, $_.Count)
        }
    }) 
    Write-Host ""
}
$mainCounter