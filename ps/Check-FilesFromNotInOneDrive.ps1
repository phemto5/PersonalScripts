param(
    $tovault = "~/akfostermommyOneDrive/Pictures"
)
Import-Module ./Check-MatchFileInOtherLocation.psm1
$NotInOneDrive = "NotInOneDrive-again.md"
if (!(Test-Path $NotInOneDrive)) {
    New-item -ItemType File $NotInOneDrive
}
$fromfiles = Get-Content ./NotInOneDrive.md
Write-host "Finding All Files in: $tovault" -foregroundcolor green
$tofiles = Get-ChildItem $tovault -recurse -name
Write-host "Found $($tofiles.length) Files" -foregroundcolor yellow

Check-MatchFileInOtherLocation $fromfiles $tofiles $NotInOneDrive
