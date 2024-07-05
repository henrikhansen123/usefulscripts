# Insert main drive like D:

D:

cd "D:\path\to\output\folder"

$latexFolder = "D:\path\to\LaTeX\folder"
$graphicsFolder = "D:\path\to\Graphics\folder"
$outputFile = "D:\path\to\output\file.tex"

# Get a list of all .tex files in the LaTeX folder
$latexFiles = Get-ChildItem -Path $latexFolder -Filer *.tex
$graphicsFiles = Get-ChildItem -Path $graphicsFolder -Filter *.png

# Loop through each file and replace \$ with $ using sed
foreach ($file in $latexFiles) {
  (Get-Content $file.FullName) -replace '\\\$','$' | Set-Content $file.FullName
  Write-Host "processed $($file.Name)"
}

# Create or overwrite the output document.tex file
$null = New-Item -Path $outputFile -ItemType File -Force

# Content before the loop
$preLoopContent = @"
\documentclass{article}
\usepackage{graphicx}
\usepackage{pgffor}
\usepackage{amsmath}
\usepackage{float}
\usepackage{catchfile}
\usepackage[a4paper, total={6in, 8in}]{geometry}
\usepackage[utf8]{inputenc}
\usepackage{amssymb}
\usepackage{booktabs}
\usepackage{widetable}
\graphicspath{ {./images/} }

\geometry{
  left=1cm,
  right=1cm,
  top=2cm,
  bottom=2cm
}

\begin{document}

"@

Add-Content -Path $outputFile -Value $preLoopContent

# Iterate through each .tex file and generate the output with extra line breaks
foreach ($file in $latexFiles) {
  $inputLine = "\begin{table}[H]\centering`r`n"
  $inputLine += "\input{""$($latexFolder -replace '\\', '/')/$($file.Name)""}`r`n"
  $inputLine += "\end{table}`r`n`r`n"

  Add-Content -Path $outputFile -Value $inputLine
}

# Iterate through each .png file and generate the output with extra line breaks
foreach ($file in $latexFiles) {
  $inputLine = "\begin{figure}[H]\centering`r`n"
  $inputLine += "\includegraphics[width=\textwidth]{""$($graphicsFolder -replace '\\', '/')/$($file.Name)""}`r`n"
  $inputLine += "\end{figure}`r`n`r`n"

  Add-Content -Path $outputFile -Value $inputLine
}

$postLoopContent = @"

\end{document}
"@

Add-Content -Path $outputFile -Value $postLoopContent

pdflatex $outputFile

Start-Process -FilePath "D:\path\to\output\file.pdf"
