%{
int keyword_count=0, identifier_count=0,numbers_count=0,delimiter_count=0,assignments_count=0,operators_count=0,i;
%}
%%
(int|void|define|main|printf|scanf|float)(" ")?("(")? {printf("KeyWord: %s\n",yytext); keyword_count++; if(yytext[yyleng-1]=='(') printf("Special Char: (\n"); printf("Capitalizing %c",yytext[0]-32); for(i=1;i<yyleng;i++) printf("%c",yytext[i]); printf("\n");}
%[a-z] { }
([a-z][a-z0-9_A-Z]*"(") {printf("Function Name: %s\n",yytext); if(yytext[yyleng-1]=='(') printf("Special Character: (\n");}
([a-z][a-z0-9_A-Z]*)(" ")("(") {printf("Function Name: %s\n",yytext); if(yytext[yyleng-1]=='(') printf("Special Char: (\n");}
(\\[a-z]) { }
[a-z][a-z0-9_A-Z]* {printf("Identifier: %s\n",yytext); identifier_count++;}
[0-9]* {printf("Number: %s\n",yytext); numbers_count++; }
\n {printf("Delimiter: Newline\n"); delimiter_count++;}
[ ] {printf("Delimiter: Whitespace\n"); delimiter_count++;}
\t {printf("Delimiter: Tab\n"); delimiter_count++;}
= {printf("Assignment: =\n"); assignments_count++;}
["+""-""*""/"] {printf("Operator: %s\n",yytext); operators_count++;}
. { }
%%
int main()
{
 yylex();
printf("Number of Keywords: %d\nNumber of Identifiers: %d\nNumber of Numbers: %d\nNumber of Delimiters: %d\nNumber of Assignments: %d\nNumber of operators: %d\n",keyword_count,identifier_count,numbers_count,delimiter_count,assignments_count,operators_count);
 return 0;
}

