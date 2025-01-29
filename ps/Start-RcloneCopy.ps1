$oneDrivePath = '~/akfmOD'
$googlePhotosPath = '~/akfmGP'

if (!(test-path $oneDrivePath)) {
    mkdir $oneDrivePath
}

if (!(test-path $googlePhotosPath)) {
    mkdir $googlePhotosPath
}

invoke-expression 'rclone mount akfmOD:/ $oneDrivePath --daemon'
invoke-expression 'rclone copy akfmGP:/media/all/ $googleDrivePath --tpslimit .2 --transfers 4 --fast-list'

Write-host " Finished " 
