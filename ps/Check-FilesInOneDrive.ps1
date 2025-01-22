param(
  $source = "~/akfmgd/media/all/",
  $vault = "~/akfostermommyOneDrive/"
)

Import-Module ./Check-MatchFileInOtherLocation.psm1

$NotInOneDrive = "NotInOneDrive.md"
if (!(Test-Path $NotInOneDrive)) {
  New-item -ItemType File $NotInOneDrive
}
else {
  clear-content $NotInOneDrive
}

Write-host "Finding All Files in $source" -foregroundcolor green
$fromfiles = Get-ChildItem $source -recurse -name
Write-host "Found $($fromfiles.length) Files" -foregroundcolor yellow

Write-host "Finding All Files in $vault" -foregroundcolor green
$tofiles = Get-ChildItem $vault -recurse -name
Write-host "Found $($tofiles.length) Files" -foregroundcolor yellow

Check-MatchFileInOtherLocation $fromfiles $tofiles $NotInOneDrive
# Check-MatchFileInOtherLocation $vault $source $NotInGoogleDrive
