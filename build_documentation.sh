cd path/to/folder/

awk '/\/\*\*/{p=1; next} /\*\*\//{p=0} p' \
	file1.sas file2.sas file3.sas file4.do file5.do \
	> data_documentation.tex

pdflatex data_documentation.tex
start data_documentation.tex
