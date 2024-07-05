$stataFolder = "D:\path\to\stata\folder"
cd $stataFolder

$processes = foreach ($file in $Args) {
  Start-Process -PassThru -FilePath "C:\path\to\stata.exe" -ArgumentList "/e do ""$stataFolder\$file.do"""
}
$processes | Wait-Process
