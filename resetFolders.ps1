cd "\path\to\output\folder"

$latexFolder = "\path\to\latex\folder"
$graphicsFolder = "\path\to\graphics\folder"

# Delete very .tex-file and .png-file
Get-ChildItem -Path $latexFolder -Filer *.tex | Remove-Item -Force
Get-ChildItem -Path $graphicFolder -Filer *.png | Remove-Item -Force
