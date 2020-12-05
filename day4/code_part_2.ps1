param(
    $inputFileName = "D:\repository\AdventOfCode\day4\input.txt"
) 
Clear-Host

'-------------------------'
(Get-Content $inputFileName -Raw) -split "`r`n`r`n" | ForEach-Object {
    $hash = @{}
    ([Regex]"(\w{3}):(\S*)").Matches($_) | ForEach-Object {
        $key, $value = $_.Groups[1,2].Value
        $hash.Add("$key", $value)
    }
    $result = 0
    
    if($hash.Keys -contains "byr"){
        if ($hash.byr -match '\d{4}'){
            if ($hash.byr -ge 1920 -and $hash.byr -le 2002)
            {
                $result++
            }
        }
    }
    if($hash.Keys -contains "iyr"){
        if ($hash.iyr -match '\d{4}'){
            if ($hash.iyr -ge 2010 -and $hash.iyr -le 2020)
            {
                $result++
            }
        }
    }
    if($hash.Keys -contains "eyr"){
        if ($hash.eyr -match '\d{4}'){
            if ($hash.eyr -ge 2020 -and $hash.eyr -le 2030)
            {
                $result++
            }
        }
    }
    if($hash.Keys -contains "hgt"){
        if ($hash.hgt -match '\d+(cm|in)'){
            $val, $em  = (([regex]"(\d+)((cm|in))").Matches($hash.hgt)).Groups[1,2].value
            switch ($em) {
                "cm" {
                    if ($val -ge 150 -and $val -le 193){
                        $result++
                    }
                  } 
                "in" {
                    if ($val -ge 59 -and $val -le 76){
                        $result++
                    }
                }
            }
        }
    }
    if ($hash.Keys -contains "hcl"){
        if ($hash.hcl -match '#[0-9a-f]{6}'){
            $result++
        }
    }

    if ($hash.Keys -contains "ecl"){
        if ($hash.ecl -match 'amb|blu|brn|gry|grn|hzl|oth'){
            $result++
        }
    }

    if ($hash.Keys -contains "pid"){
        if ($hash.pid -match '^\d{9}$'){
            $result++
        }
    }
    if ($result -eq 7){
        $true
    }
    else{
        $false
    }
} | Measure-Object -Sum 




