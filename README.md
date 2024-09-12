This repositories contains some of my more useful scripts for different programs

# createDocument.ps1

This Powershell-script automates the tedious task of creating a pdf-file with tables and graphs.

If you're using Stata or R to create tables of regressions results or graphics,
then this script can make it easier to view the final results.

It basically reads ALL .tex-files and .png-files from two different folders,
writes the corresponding .tex-file with all the "\begin{table}..." and "\begin{figure}" statements,
compiles the .tex-file,
and then open the .pdf.

Version 18 of Stata is, in my opinion, weird about the use of "$" in .tex-files,
so the script also rewrites all "\\$" to "$", so all the .tex-file can be compiled.
This requires SED, which is included in UNIX, or git bash for windows.

# callStata.ps1 

This Powershell-script makes it easy to parallelize work in Stata.
It batch-runs the given .do-files simultaneously.

## How to use it:

Let's say that you have 5 .do-files (file1.do, file2.do, ..., file5.do),
and you want to run file1-file3 in parallel, and then file4-file-5.

In Stata you just write something like:
```
global runDoFiles shell "C:\path\to\powershell.exe" "D:\path\to\callStata.ps1"
$runDoFiles "file1" "file2" "file3"
$runDoFiles "file4" "file5"
```

# user.bind

This is my LyX-bindings. 

I have created a bunch of VIM-keybindings for LyX,
where normal mode is activated by holding down the ALT key.


# .vimrc

This is my VIM configuration file.

# build_documentation.sh

This bash-script reads the given files for comments of the form

/\*\*
Here is the text that will be extracted.
Here is more text.

etc.
\*\*/

and input it into a tex file, compile it and open it.


