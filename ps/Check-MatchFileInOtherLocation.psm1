function Check-MatchFileInOtherLocation {
  [CmdletBinding()]
  param(
    $from, #Source
    $to, #Vaule
    $log
  )
  clear-content $log

  ForEach ($file in $from) {
    $found = $false
    foreach ($stored in $to) {
      if ($stored.contains($file)) {
        $found = $true
      }
    } 
    if ($found) {
      write-host "Found $($file)" -ForegroundColor Green
    }
    else {
      Out-File -InputObject $file -FilePath $log -Append
    }
  }
}
Export-ModuleMember -Function Check-MatchFileInOtherLocation
  
