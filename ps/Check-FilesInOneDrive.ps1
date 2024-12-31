param(
  $source = "~/akfmgd/media/all/",
  $vault = "~/akfostermommyOneDrive/"
)

$NotInOneDrive = "NotInOneDrive.md"
if (!(Test-Path $NotInOneDrive)) {
  New-item -ItemType File $NotInOneDrive
}
function Check-MatchFileInOtherLocation {
  param(
    $from, #Source
    $to, #Vaule
    $log
  )
  Write-host "Finding All Files in $from" -foregroundcolor green
  $fromfiles = Get-ChildItem $from -recurse -name
  Write-host "Found $($fromfiles.length) Files" -foregroundcolor yellow

  Write-host "Finding All Files in $to" -foregroundcolor green
  $tofiles = Get-ChildItem $to -recurse -name
  Write-host "Found $($tofiles.length) Files" -foregroundcolor yellow

  foreach ($file in $fromfiles) {
    write-host $file -nonewline -foregroundcolor blue
    if (!($tofiles -contains $file)) {
      Out-File -InputObject $file -FilePath $log -Append
    }
    else {
      Write-Host Foud: $results[0] -ForegroundColor DarkGray -NoNewline
    }
  }
}

Check-MatchFileInOtherLocation $source $vault $NotInOneDrive
# Check-MatchFileInOtherLocation $vault $source $NotInGoogleDrive
