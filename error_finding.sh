grep -Er -B 1 --include='*.log' 'r([0-9]+\)' . > Errors.txt
grep -Er -B 1 --include='*.log' 'ERROR' . >> Errors.txt
grep -Er -B 1 --include='*.log' 'WARNING' . >> Errors.txt
