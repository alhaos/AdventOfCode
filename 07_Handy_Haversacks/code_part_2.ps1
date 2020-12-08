param(
    $inputFileName =  "D:\repository\AdventOfCode\07_Handy_Haversacks\input.txt" 
)

Get-Content $inputFileName | % {
    $t = ([regex]"^([\w\s]+) bags contain ([\w\s]+)\sbags?.$").Matches($_).Groups[1,2].Value
    "header: {0}" -f $t[0]
    $t[1] -split ", " | ForEach-Object{
        $count, $color = ([regex]"(\d+)\s([\w\s]+)\sbags?").Matches($_).Groups[1,2]
    }
}



