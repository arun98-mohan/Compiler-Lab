echo "Running Bash Script"
lex "$1"
echo "Running lex.yy.c -ll"
gcc lex.yy.c -ll
echo "Running the ./a.out file with input file $2"
./a.out < "$2"
