param(
    $inputFileName = "D:\repository\AdventOfCode\day4\input.txt"
) 
Clear-Host
(Get-Content $inputFileName -Raw) -split "`r`n`r`n" | % {
    $hash = @{}
    ([Regex]"(\w{3}):(\S*)").Matches($_) | % {
        $key, $value = $_.Groups[1,2].Value
        $hash.Add("$key", $value)
    }
    $result = 0
    write-host "---"
    if($hash.Keys -contains "byr"){
        if ($hash.byr -match '\d{4}'){
            if ($hash.byr -gt 1920 -and $hash.byr -lt 2002)
            {
                $result++
                write-host "byr", $hash.byr
            }
        }
    }
    if($hash.Keys -contains "iyr"){
        if ($hash.iyr -match '\d{4}'){
            if ($hash.iyr -gt 2010 -and $hash.iyr -lt 2020)
            {
                $result++
                write-host "iyr", $hash.iyr
            }
        }
    }
    if($hash.Keys -contains "eyr"){
        if ($hash.eyr -match '\d{4}'){
            if ($hash.eyr -gt 2020 -and $hash.eyr -lt 2030)
            {
                write-host "eyr", $hash.eyr
                $result++
            }
        }
    }
    if($hash.Keys -contains "hgt"){
        if ($hash.hgt -match '\d+(cm|in)'){
            $val, $em  = (([regex]"(\d+)((cm|in))").Matches($hash.hgt)).Groups[1,2].value
            switch ($em) {
                "cm" {
                    if ($val -gt 150 -and $val -lt 193){
                        write-host "hgt", $hash.hgt
                        $result++
                    }
                  }
                "in" {
                    if ($val -gt 59 -and $val -lt 76){
                        write-host "hgt", $hash.hgt
                        $result++
                    }
                }
            }
        }
    }
    if ($hash.Keys -contains "hcl"){
        if ($hash.hcl -match '#[0-9a-f]{6}'){
            write-host "hcl", $hash.hcl
            $result++
        }
    }

    if ($hash.Keys -contains "ecl"){
        if ($hash.ecl -match 'amb|blu|brn|gry|grn|hzl|oth'){
            write-host "ecl", $hash.ecl
            $result++
        }
    }

    if ($hash.Keys -contains "pid"){
        if ($hash.pid -match '\d{9}'){
            write-host "pid", $hash.pid
            $result++
        }
    }
    if ($result -eq 7){
        $true
    }
    write-host "result", $result
} | Measure-Object -Sum 




