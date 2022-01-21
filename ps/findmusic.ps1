param ($title)
Write-Progress -Activity "Seaching for $title"
$allStuff = Get-ChildItem \\as-r610\music -Recurse | ForEach-Object{ $_.Name}
foreach ($item in $allStuff) {
  Write-Progress -Activity "Seaching for $title" -Status $item
  if ($item.Contains($title)){
    Write-Host $item -ForegroundColor Green
  }
} 


