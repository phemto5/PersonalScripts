function Check-MatchFileInOtherLocation {
  [CmdletBinding()]
  param(
    $from, #Source
    $to, #Vaule
    $log
  )
  clear-content $log
  $i = 1
  ForEach ($file in $from) {
    $found = $false
    Write-Progress -Activity From $file -PercentComplete $(($i / $from.Length) * 100)
    foreach ($stored in $to) {
      if ($stored.contains($file)) {
        $found = $true
      }
    } 
    if ($found) {
      write-host "Found $($file) No Action " -ForegroundColor Green
    }
    else {
      Out-File -InputObject $file -FilePath $log -Append
    }
    $i++
  }
}
Export-ModuleMember -Function Check-MatchFileInOtherLocation
  
