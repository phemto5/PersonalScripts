param(
    $source = "G:\My Drive\Movies"
)

$vault = $Env:OneDrive + "/Pictures"
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
    $files = Get-ChildItem $from -recurse
    foreach ($file in $files) {
        $results = Get-ChildItem $to -Recurse -Filter $file
        if (!($results)) {
            Out-File -InputObject $file -FilePath $log -Append
        }else{
            Write-Host Foud: $results[0]
        }
    }
}

Check-MatchFileInOtherLocation $source $vault $NotInOneDrive
# Check-MatchFileInOtherLocation $vault $source $NotInGoogleDrive