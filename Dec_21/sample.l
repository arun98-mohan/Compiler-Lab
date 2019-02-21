%{
int charcount=0, linecount=0;
%}
%%
. charcount++;
\n {linecount++; charcount++; }
%%
int main()
{
 yylex();
 printf("%d %d",charcount,linecount);
return 0;
}

